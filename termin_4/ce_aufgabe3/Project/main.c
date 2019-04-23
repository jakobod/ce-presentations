/*#############################################################################
 *###
 *###   Demo for CE related to lab exercise "DAC-Ansteuerung mit ISR"
 *###   ===========
 *#############################################################################
 *
 * VCS: git@bitbucket.org/schaefers/CE-Demo-Curve.git
 *
 * Developed on/for:
 *    TI CE Board (SS15 (resp. SS14))  with
 *      Silica Xynergy-M4 Board  with
 *      STM32F417
 *    using
 *      CEPtemplate (SS15 (resp. 2014/05/08))
 *      Keil µVision V5.11.1.0
 *
 * Code belongs to TI4 CE; Informatik; HAW-Hamburg; Berliner Tor 7; D-20099 Hamburg
 * Code was based on demo examples from Silke Behn, Heiner Heitmann & Bernd Schwarz
 * Code was "mixed up" by Michael Schäfers and was originally designed for Digilent Nexys2 Board
 * Code was adapted/ported to Silica Xynergy Board by Yannic Wilkening
 * Code was "pimped up" by Michael Schäfers (e.g. adding comments and references to documentation)
 *
 *-----------------------------------------------------------------------------
 * Description:
 * ============
 * Code is an example for interaction of interrupts, timer and DAC.
 * Waveform with 7.5ms period (~133.3Hz) has to be send out over DAC.
 * Frequency of the (individual waveform) samples shall be 48KHz.
 *
 * The task/main loop has to compute signals and to store them in a fifo buffer.
 *     As metapher for the signal computation the task has to read out an appropriate sample ...
 *     of a signal table containing 1013 waveform samples (taken in equidistant time steps).
 * Timer8 has to signal via IRQ that it is time to send the next sample to DAC (with 48KHz frequency ;-)
 * The (this way) triggered ISR has to hand over the sample (from fifo) to DAC.
 *
 * LED7 on the CEP board is connected to GPIO I.7 of µC and used to mark that NO fifo underflow has occured
 * LED6 on the CEP board is connected to GPIO I.6 of µC and used to mark an Error resulting out of a fifo underflow
 * LED5 on the CEP board is connected to GPIO I.5 of µC and used to mark a spurious interrupt
 *
 * S8 toggle timer (either start or stop)
 * S7 acknowledges error detection by clearing LED6&5 and setting LED7
 * S6 clear LED7&6&5 (to controll that they are working)
 * S5 set LED7&6&5 (to controll that they are working)
 * S4 trap computation by busy waiting that S4 is released  producing fifo underflow this way
 *
 *-----------------------------------------------------------------------------
 */

#include <stdint.h>
#include <stm32f4xx.h>
#include <stm32f4xx_rcc.h>
#include <stm32f4xx_gpio.h>
#include "CE_Lib.h"
#include "tft.h"

// comment line if you do NOT want additional test support functionality
#define TEST_SUPPORT_ENABLE

// comment line if you do NOT want to use TFT display
#define TFT_ENABLE

// macro converts binary value (containing up to 8 bits resp. <=0xFF) to unsigned decimal value
#define b(n) (                                               \
    (unsigned char)(                                         \
            ( ( (0x##n##ul) & 0x00000001 )  ?  0x01  :  0 )  \
        |   ( ( (0x##n##ul) & 0x00000010 )  ?  0x02  :  0 )  \
        |   ( ( (0x##n##ul) & 0x00000100 )  ?  0x04  :  0 )  \
        |   ( ( (0x##n##ul) & 0x00001000 )  ?  0x08  :  0 )  \
        |   ( ( (0x##n##ul) & 0x00010000 )  ?  0x10  :  0 )  \
        |   ( ( (0x##n##ul) & 0x00100000 )  ?  0x20  :  0 )  \
        |   ( ( (0x##n##ul) & 0x01000000 )  ?  0x40  :  0 )  \
        |   ( ( (0x##n##ul) & 0x10000000 )  ?  0x80  :  0 )  \
    )                                                        \
)

// simplified access to switches S0 - S7
#define  S8   ( !(GPIOH->IDR & (b(1) << 15)) )
#define  S7   ( !(GPIOH->IDR & (b(1) << 12)) )
#define  S6   ( !(GPIOH->IDR & (b(1) << 10)) )
#define  S5   ( !(GPIOF->IDR & (b(1) << 8 )) )
#define  S4   ( !(GPIOF->IDR & (b(1) << 7 )) )
#define  S3   ( !(GPIOF->IDR & (b(1) << 6 )) )
#define  S2   ( !(GPIOC->IDR & (b(1) << 2 )) )
#define  S1   ( !(GPIOI->IDR & (b(1) << 9 )) )

/*
 * Achtung:
 * Die in "misc.h" definierten Token "NVIC_PriorityGroup_#" sind NICHT geeignet
 * fuer die in "core_cm3.h" definierte Funktion "NVIC_SetPriorityGrouping()".
 * "NVIC_SetPriorityGrouping()" erwartet nur das BitFeld selbst.
 * Die Token definieren jedoch das BitFeld bereits an der "richtigen Position" (also einschliesslich niederwertigerer Bits).
 *
 * Das Prefix "STM32" markiert die nachfolgend selbstdefinierten Token, die nur das BitFeld selbst definieren
 * und damit fuer "NVIC_SetPriorityGrouping()" geeignet sind.
 *
 * Cortex-M3&M4 (STM32) erwarten den PriorityGrouping-Wert im Bereich 0,..,7
 * "pre-emption priority" ist ein veralteter Name fuer "group priority".
 * 
 * Fuer weitere Informationen siehe:
 *  {> Guide: chap7.4 }
 *  {> misc.h }
 *  {> core_cm3.h und dort NVIC_SetPriorityGrouping() }
 */
#define  STM32_NVIC_PriorityGroup_0   ((uint32_t)0x7)           /*!< 0 bits for pre-emption priority 4 bits for subpriority */
#define  STM32_NVIC_PriorityGroup_1   ((uint32_t)0x6)           /*!< 1 bits for pre-emption priority 3 bits for subpriority */
#define  STM32_NVIC_PriorityGroup_2   ((uint32_t)0x5)           /*!< 2 bits for pre-emption priority 2 bits for subpriority */
#define  STM32_NVIC_PriorityGroup_3   ((uint32_t)0x4)           /*!< 3 bits for pre-emption priority 1 bits for subpriority */
#define  STM32_NVIC_PriorityGroup_4   ((uint32_t)0x3)           /*!< 4 bits for pre-emption priority 0 bits for subpriority */

//timer setup
#define  SYS_FREQ     168000000                                     // 168MHz system frequency
#define  TIMER_FREQ       44100                                     // 44,1KHz requested timer frequency

// FIFO for data handover from "task" to ISR
#define   FIFO_BUFF_SIZE   ( b(1) << 2 )                            /*!< 4 entries fifo depth resp. buffer size */
#define   FIFO_INDX_MSK   ( FIFO_BUFF_SIZE - 1 )

static volatile uint16_t fifo[ FIFO_BUFF_SIZE ] = { 0 };            // FIFO BUFFER
static volatile uint16_t fifoRdIndx = 0;                            // FIFO ReaD  INDeX
static volatile uint16_t fifoWrIndx = 0;                            // FIFO WRite INDeX

/*
 * In der ISR sollte so kurz wie moeglich sein. Zugriff auf externe Peripherie kostet Zeit.
 * In der ISR werden (u.U.) Marker gesetzt.
 * Der Main-Loop wertet die Marker aus und reagiert entsprechend.
 * In der Konsequenz ist die ISR kurz und fuer den Main-Loop kann bewusst geplant werden, wann die Zeit fuer die noetigen Dinge aufgebracht wird.
 * Dies kann das Einhalten von Echtzeitanforderungen erleichtern.
 */
static volatile int8_t   fifoUnderflow = 0;                         // "FIFO buffer UNDERFLOW was detected" state
static volatile int8_t   spuriousInterrupt = 0;                     // "spurious interrupt was detected" state

// SIGnal TABle Number Of Entries
#define   SIG_TAB_NOE   ( 360 )

static uint16_t sinusTable[SIG_TAB_NOE] = {
  1861,1882,1904,1925,1947,1969,1990,2012,2033,2055,2076,2097,2119,2140,2161,2182,2203,2223,2244,2265,2285,2305,
  2325,2345,2365,2385,2405,2424,2443,2462,2481,2500,2518,2536,2554,2572,2590,2607,2625,2641,2658,2675,2691,2707,
  2723,2738,2753,2768,2783,2797,2811,2825,2838,2852,2864,2877,2889,2901,2913,2924,2935,2946,2956,2966,2976,2985,
  2994,3003,3011,3019,3027,3034,3041,3047,3053,3059,3065,3070,3074,3079,3083,3086,3089,3092,3095,3097,3098,3100,
  3101,3101,3102,3101,3101,3100,3098,3097,3095,3092,3089,3086,3083,3079,3074,3070,3065,3059,3053,3047,3041,3034,
  3027,3019,3011,3003,2994,2985,2976,2966,2956,2946,2935,2924,2913,2901,2889,2877,2864,2852,2838,2825,2811,2797,
  2783,2768,2753,2738,2723,2707,2691,2675,2658,2641,2625,2607,2590,2572,2554,2536,2518,2500,2481,2462,2443,2424,
  2405,2385,2365,2345,2325,2305,2285,2265,2244,2223,2203,2182,2161,2140,2119,2097,2076,2055,2033,2012,1990,1969,
  1947,1925,1904,1882,1861,1840,1818,1797,1775,1753,1732,1710,1689,1667,1646,1625,1603,1582,1561,1540,1519,1499,
  1478,1457,1437,1417,1397,1377,1357,1337,1317,1298,1279,1260,1241,1222,1204,1186,1168,1150,1132,1115,1097,1081,
  1064,1047,1031,1015,999,984,969,954,939,925,911,897,884,870,858,845,833,821,809,798,787,776,766,756,746,737,728
  ,719,711,703,695,688,681,675,669,663,657,652,648,643,639,636,633,630,627,625,624,622,621,621,620,621,621,622,624,
  625,627,630,633,636,639,643,648,652,657,663,669,675,681,688,695,703,711,719,728,737,746,756,766,776,787,798,809,821,
  833,845,858,870,884,897,911,925,939,954,969,984,999,1015,1031,1047,1064,1081,1097,1115,1132,1150,1168,1186,1204,1222,
  1241,1260,1279,1298,1317,1337,1357,1377,1397,1417,1437,1457,1478,1499,1519,1540,1561,1582,1603,1625,1646,1667,1689,1710,
  1732,1753,1775,1797,1818,1840
};

static uint16_t saegezahnTable[SIG_TAB_NOE] = {
  620, 626, 633, 640, 647, 654, 661, 668, 675, 682, 689, 
  696, 702, 709, 716, 723, 730, 737, 744, 751, 758, 
  765, 772, 779, 785, 792, 799, 806, 813, 820, 827, 
  834, 841, 848, 855, 861, 868, 875, 882, 889, 896, 
  903, 910, 917, 924, 931, 938, 944, 951, 958, 965, 
  972, 979, 986, 993, 1000, 1007, 1014, 1021, 1027, 1034, 
  1041, 1048, 1055, 1062, 1069, 1076, 1083, 1090, 1097, 1103, 
  1110, 1117, 1124, 1131, 1138, 1145, 1152, 1159, 1166, 1173, 
  1180, 1186, 1193, 1200, 1207, 1214, 1221, 1228, 1235, 1242, 
  1249, 1256, 1262, 1269, 1276, 1283, 1290, 1297, 1304, 1311, 
  1318, 1325, 1332, 1339, 1345, 1352, 1359, 1366, 1373, 1380, 
  1387, 1394, 1401, 1408, 1415, 1422, 1428, 1435, 1442, 1449, 
  1456, 1463, 1470, 1477, 1484, 1491, 1498, 1504, 1511, 1518, 
  1525, 1532, 1539, 1546, 1553, 1560, 1567, 1574, 1581, 1587, 
  1594, 1601, 1608, 1615, 1622, 1629, 1636, 1643, 1650, 1657, 
  1663, 1670, 1677, 1684, 1691, 1698, 1705, 1712, 1719, 1726, 
  1733, 1740, 1746, 1753, 1760, 1767, 1774, 1781, 1788, 1795, 
  1802, 1809, 1816, 1823, 1829, 1836, 1843, 1850, 1857, 1864, 
  1871, 1878, 1885, 1892, 1899, 1905, 1912, 1919, 1926, 1933, 
  1940, 1947, 1954, 1961, 1968, 1975, 1982, 1988, 1995, 2002, 
  2009, 2016, 2023, 2030, 2037, 2044, 2051, 2058, 2065, 2071, 
  2078, 2085, 2092, 2099, 2106, 2113, 2120, 2127, 2134, 2141, 
  2147, 2154, 2161, 2168, 2175, 2182, 2189, 2196, 2203, 2210, 
  2217, 2224, 2230, 2237, 2244, 2251, 2258, 2265, 2272, 2279, 
  2286, 2293, 2300, 2306, 2313, 2320, 2327, 2334, 2341, 2348, 
  2355, 2362, 2369, 2376, 2383, 2389, 2396, 2403, 2410, 2417, 
  2424, 2431, 2438, 2445, 2452, 2459, 2466, 2472, 2479, 2486, 
  2493, 2500, 2507, 2514, 2521, 2528, 2535, 2542, 2548, 2555, 
  2562, 2569, 2576, 2583, 2590, 2597, 2604, 2611, 2618, 2625, 
  2631, 2638, 2645, 2652, 2659, 2666, 2673, 2680, 2687, 2694, 
  2701, 2707, 2714, 2721, 2728, 2735, 2742, 2749, 2756, 2763, 
  2770, 2777, 2784, 2790, 2797, 2804, 2811, 2818, 2825, 2832, 
  2839, 2846, 2853, 2860, 2867, 2873, 2880, 2887, 2894, 2901, 
  2908, 2915, 2922, 2929, 2936, 2943, 2949, 2956, 2963, 2970, 
  2977, 2984, 2991, 2998, 3005, 3012, 3019, 3026, 3032, 3039, 
  3046, 3053, 3060, 3067, 3074, 3081, 3088, 3095, 3102 
};

// AMPLITUDE DEFINES
#define LOWER 1
#define HIGHER 0

#define FREQ_440Hz (440)
#define FREQ_5000Hz (5000)
#define MEAN (1862)

const uint32_t DELTA_440Hz = ((uint32_t) (((((uint64_t)SIG_TAB_NOE) * FREQ_440Hz) << 23) / TIMER_FREQ));
const uint32_t DELTA_5000Hz = ((uint32_t) (((((uint64_t)SIG_TAB_NOE) * FREQ_5000Hz) << 23) / TIMER_FREQ));
const uint64_t LIMIT = ((uint64_t)SIG_TAB_NOE<<23);          // shift left for increased precision;  Qu9.23
const uint32_t  MAX_INDEX_440 = (LIMIT-(2*DELTA_440Hz)+1); 
const uint32_t  MAX_INDEX_5000 = (LIMIT-(2*DELTA_5000Hz)+1);
            
// mode setup 440Hz/5000Hz -> amplitude -> sinus/saw signal
uint16_t* sigTable = sinusTable;
uint32_t sigTabIndx = 0;                                 // SIGnal TABle INDeX ; initialize with start position                         ;  Qu9.23
uint32_t delta = DELTA_440Hz;
uint32_t max_indx = MAX_INDEX_440;
uint16_t fifoNextWrIndx = 0;
uint8_t amp = HIGHER;            

/**
 * ISR - the interrupt service routine
 */
void TIM1_UP_TIM10_IRQHandler(void){
  // is service actually requested?
  if( TIM1->SR & TIM_SR_UIF ){
    // clear flag marking the IRQ
    TIM1->SR = ~TIM_SR_UIF;

    // load new signal value from fifo buffer, align it and hand it over to DAC
    if ( fifoRdIndx != fifoWrIndx ){ // check for fifo underflow
      // send data to DAC
      DAC->DHR12R1 = fifo[fifoRdIndx];
      // update FIFO ReaD INDeX
      fifoRdIndx = (fifoRdIndx + 1) & FIFO_INDX_MSK;
    }else{
        // fifo is empty -> should not happen 
        fifoUnderflow = -1; // mark FIFO UNDERFLOW
    }
  }else{
    // service was NOT requested
    spuriousInterrupt = -1; // mark SPURIOUS INTERRUPT
  }
}


// function prototype(s)
void showInfoOnTFT(void);

void initializeFifo(){
  int value = 0;
  __disable_irq();
  
  // fill fifo
  sigTabIndx = 0;
  fifoRdIndx = 0;
  fifoWrIndx = 0;

  do{
    // write into fifo
    fifoWrIndx = fifoNextWrIndx;                  // update FIFO Write INDeX
    
    value = sigTable[ sigTabIndx >> 23 ];
    if(amp) {
      value -= MEAN;
      value = value >> 1;
      value += MEAN;
    }
    
    fifo[ fifoWrIndx ] = value;
    
    // update SIGNAL TABle INDeX
    if( sigTabIndx < max_indx ){                                // already at end of table?
      sigTabIndx += delta;                                    //   NO -> increment
    }else{                                                      //
      sigTabIndx = 0;                                         //   YES -> start again at beginning
    }//if                                                       //
    
    // compute next FIFO WRite INDeX
    fifoNextWrIndx = (fifoWrIndx + 1) & FIFO_INDX_MSK;          // cyclic increment
  }while( fifoNextWrIndx != fifoRdIndx );                         // stop when buffer filled
  
  __enable_irq();
}


int main( void ){
  uint8_t pinPos;                                                 // PIN POSition (when configuring GPIO)
  int value = 0;
  // initilize display, leds, buttons, uart and other stuff CE_Lib.c
  initCEP_Board();
  // show some info on the tft-display
  showInfoOnTFT();   
  
  /* clock setup
   * ===========
   *
   * switch on needed components
   *
   * Fuer alle benoetigten Komponenten wie Ports, Timer und DAC wird der CLK angeschaltet.
   * Hierfuer muss auf das RCC (Reset and Clock Control) Register konfiguriert werden.
   * AHB ::= Advanced High-performance Bus    (protocol as part of AMBA specification)
   * APB ::= Advanced Peripheral Bus          (protocol as part of AMBA specification)
   * AMBA ::= Advanced Microcontroller Bus Architecture
   *
   * "stm32f4xx.h" definiert
   *   den Pointer
   *      RCC   auf den Memory-Mapped Reset and Clock Control block
   *   die zugehoerigen Register
   *      AHB1ENR ::= AHB1 peripheral clock ENable Register
   *      AHB2ENR ::= AHB2 peripheral clock ENable Register
   */
  // enable GPIOs to use them
  RCC->AHB1ENR |= (   RCC_AHB1ENR_GPIOAEN
                    | RCC_AHB1ENR_GPIOCEN
                    | RCC_AHB1ENR_GPIOFEN
                    | RCC_AHB1ENR_GPIOHEN
                    | RCC_AHB1ENR_GPIOIEN
  );
  
  // enable DAC and timer 1
  RCC->APB1ENR |= RCC_APB1ENR_DACEN;  // enable clock for DAC                             {>RM0090 chap 6.3.13}
  RCC->APB2ENR |= RCC_APB2ENR_TIM1EN; // enable clock for timer 8                         {>RM0090 chap 6.3.14}
  
  /*
    * LED setup (actually already initialised/done by initCEP_Board()
    * =========
    *
    * LED7 ::= OK - NO fifo underflow since start                  ( connected to GPIO I.7 )
    * LED6 ::= ERROR - at least one fifo undeflow since start      ( connected to GPIO I.6 )
    * LED5 ::= false interrupt                                     ( connected to GPIO I.5 )
    *
    * "stm32f4xx.h" definiert
    *   den Pointer
    *      GPIOI   auf den Memory-Mapped "GPIO-I Block"              siehe Abschnitt: "Peripheral_declaration"
    *   die zugehoerigen Register
    *      MODER   ::= gpio port MODE Register                       siehe struct-Definiton: "GPIO_TypeDef"
    *      OSPEEDR ::= gpio port Output SPEED Register               siehe struct-Definiton: "GPIO_TypeDef"
    *      OTYPER  ::= gpio port Output TYPE Register                siehe struct-Definiton: "GPIO_TypeDef"
    *      PUPDR   ::= gpio port Pull-Up/Pull-Down Register          siehe struct-Definiton: "GPIO_TypeDef"
    * "stm32f4xx_gpio.h" definiert
    *   die zugehoerigen Bit-Definitionen
    *      GPIO_Low_Speed (frueher/veraltet: GPIO_Speed_2MHz)        siehe enum-Definiton: "GPIOSpeed_TypeDef" (GPIO Output Maximum frequency enumeration)
    *      GPIO_Mode_OUT                                             siehe enum-Definiton: "GPIOMode_TypeDef"  (GPIO Configuration Mode enumeration)
    *      GPIO_OType_PP                                             siehe enum-Definiton: "GPIOOType_TypeDef" (GPIO Output type enumeration)
    *      GPIO_PuPd_NOPULL                                          siehe enum-Definiton: "GPIOPuPd_TypeDef"  (GPIO Configuration PullUp PullDown enumeration)
    *
    * Fuer weitere Informationen siehe:
    *  {> TI2 GS }
    *  {> RM0090 chap 8.3&4 }
    */
  for( pinPos=4; pinPos<=7; pinPos++ ){
      GPIOI->OTYPER  = (GPIOI->OTYPER  & ~( b(11) << (pinPos*2))) | (GPIO_OType_PP    << (pinPos*2));             //  {>RM0090 chap 8.4.2}
      GPIOI->OSPEEDR = (GPIOI->OSPEEDR & ~( b(11) << (pinPos*2))) | (GPIO_Low_Speed   << (pinPos*2));             //  {>RM0090 chap 8.4.3}
      GPIOI->PUPDR   = (GPIOI->PUPDR   & ~( b(11) << (pinPos*2))) | (GPIO_PuPd_NOPULL << (pinPos*2));             //  {>RM0090 chap 8.4.4}
      GPIOI->MODER   = (GPIOI->MODER   & ~( b(11) << (pinPos*2))) | (GPIO_Mode_OUT    << (pinPos*2));             //  {>RM0090 chap 8.4.1}
  }
  
  //Timer setup
  TIM1->CR1 = 0;                                                  // disabled timer                   {>RM0090 chap 17.4.1)  
  TIM1->CR2 = 0;                                                  //                                  {>RM0090 chap 17.4.2}
  TIM1->PSC = 0;                                                  // NO prescaler                     {>RM0090 chap 17.4.11}
  TIM1->ARR = (SYS_FREQ / TIMER_FREQ) -1;                         // 44100Hz                          {>RM0090 chap 17.4.12}
  TIM1->DIER = TIM_DIER_UIE;                                      // enable interrupt                 {>RM0090 chap 17.4.4}
  TIM1->CR1 = TIM_CR1_ARPE;                                       // auto-reload preload enable       {>RM0090 chap 17.4.1}
  
  // NVIC ((Nested Vector) Interrupt Controller) specific settings                                    {>PM0214 chap 2.3 & 4.3.10 & 4.4.5}
  NVIC_SetPriorityGrouping( STM32_NVIC_PriorityGroup_2 );         // 2bit preEmptionPrio & 2bit subPrio
  NVIC_SetPriority( TIM1_UP_TIM10_IRQn, 4 );                      // preEmptionPrio:=1 & subPrio:=0
  NVIC_EnableIRQ( TIM1_UP_TIM10_IRQn );                           // enable IRQ
  
  /*
   * Digital Analog Converter (DAC)                                                                                   {>RM0090 chap 14}
   */
  GPIOA->MODER = (GPIOA->MODER & ~(b(11) << (GPIO_PinSource4 * 2))) | (GPIO_Mode_AN << (GPIO_PinSource4 * 2));
  DAC->CR = 0;                                                    // ControlRegister: configure / keep defaults       {>RM0090 chap 14.5.1}
  DAC->CR |= DAC_CR_EN1;                                          // ControlRegister: Enable DAC channel1             {>RM0090 chap 14.5.1}
  
  // initialize fifo with some samples before starting
  initializeFifo();
  
  // start action by starting timer
  TIM1->CR1 |= TIM_CR1_CEN;                                       // start timer                    {>RM0090 chap 17.3.4}
  // NOW read accesses on fifo are starting    
  GPIOI->BSRRL =  b(1) << 4;                                      // mark on LED that timer has started
  
  /*
   * Es folgt der Main-Loop.
   * Dier prueft der Reihe nach, ob ein Task zu erledigen ist und falls dies der Fall ist, arbeitet er den jeweiligen Task ab.
   * Die Summe der Ausfuehrungszeiten aller Tasks ist der WorstCase und bestimmt die Reaktionszeit, die zugesichert werden kann.
   */
  while(1){  
    // fill fifo if nessecary
    if( fifoNextWrIndx != fifoRdIndx ){ // is fifo full?      
      // write into fifo
      fifoWrIndx = fifoNextWrIndx;                            // update FIFO Write INDeX
      
      value = sigTable[ sigTabIndx >> 23 ];
      if(amp) {
        value -= MEAN;
        value = value >> 1;
        value += MEAN;
      }
      
      fifo[ fifoWrIndx ] = value;
      
      // update SIGNAL TABle INDeX -> cyclic increment not possible
      sigTabIndx += delta;
      if( sigTabIndx >= LIMIT ){
          sigTabIndx -= LIMIT;
      }
      
      // compute next FIFO WRite INDeX
      fifoNextWrIndx = (fifoWrIndx + 1) & FIFO_INDX_MSK;        // cyclic increment
    }

    // in case of fifo underflow  signal it
    if( fifoUnderflow ){
        GPIOI->BSRRH = b(1) << 7;                               // clear OK, since fifo underflow detected
        GPIOI->BSRRL = b(1) << 6;                               // mark ERROR (fifo underflow was detected)
    }

    // in case of spurious interrupt signal it
    if( spuriousInterrupt ){
        GPIOI->BSRRL = b(1) << 5;                               // mark ERROR (spurious interrupt was detected)
    }//if
    
    // switch S1 Stopp der Ausgabe
    if( S1 ){
        TIM1->CR1 = ~TIM_CR1_CEN;                               // stop timer
        GPIOI->BSRRH = (b(1) << 4);                             // update related LED
    }//if        
    
    // switch S2 start der Ausgabe
    if( S2 ){
        TIM1->CR1 = TIM_CR1_CEN;                                // start timer
        GPIOI->BSRRL = (b(1) << 4);                             // update related LED
    }//if
    
    // switch S3 kleinere amplitude
    if( S3 ){
        amp = LOWER;
        initializeFifo(); // reinitialize fifo after mode switch
    }//if
    
    // switch S4 größere Amplitude
    if( S4 ){
        amp = HIGHER;
        initializeFifo(); // reinitialize fifo after mode switch
    }//if
    
    // switch S5 saw signal
    if( S5 ){
        sigTable = saegezahnTable;
        initializeFifo(); // reinitialize fifo after mode switch
    }//if
    
    // switch S6 sinus table
    if( S6 ){
        sigTable = sinusTable;
        initializeFifo(); // reinitialize fifo after mode switch
    }//if
    
    // switch S7 440 Hz
    if( S7 ){
        delta = DELTA_440Hz;
        max_indx = MAX_INDEX_440;
        initializeFifo();
    }//if
    
    // switch S8 5000 Hz
    if( S8 ){
        delta = DELTA_5000Hz;
        max_indx = MAX_INDEX_5000;
        initializeFifo();
    }//if
  }//while

  // loop should never end. But for safeties sake -> disable IRQs and run into while(1);

  // disable interrupt for Timer8 IRQ
  TIM1->DIER &= ~TIM_DIER_UIE;                                    // disable IRQ ;  timer1 will NOT send out IRQs anymore       {>RM0090 chap 17.4.4}
  NVIC_DisableIRQ( TIM1_UP_TIM10_IRQn );                          // disable IRQ ;  IRQ will NOT be granted by NVIC anymore
  NVIC_ClearPendingIRQ( TIM1_UP_TIM10_IRQn );                     // clear pending IRQs ;  just in case there are any left
  
  while(1);
}//main()


/**
 * TFT info
 */
void showInfoOnTFT(void){
  uint8_t lineCntTFT;
  
  TFT_cls();
  lineCntTFT = 1;
  TFT_gotoxy( 1, lineCntTFT );
  TFT_puts( "CE-Demo:" );
  lineCntTFT++;
  TFT_gotoxy( 1, lineCntTFT );
  TFT_puts( "Sending waveform via ISR to DAC" );
  lineCntTFT++;

  // some usage:  
  TFT_gotoxy( 1, lineCntTFT );
  TFT_puts( "Switch S8: 5000Hz" );
  lineCntTFT++;
  TFT_gotoxy( 1, lineCntTFT );
  TFT_puts( "Switch S7: 440Hz" );
  lineCntTFT++;
  TFT_gotoxy( 1, lineCntTFT );
  TFT_puts( "Switch S6: Sinuskurve" );
  lineCntTFT++;
  TFT_gotoxy( 1, lineCntTFT );
  TFT_puts( "Switch S5: Saegezahnkurve" );
  lineCntTFT++;
  TFT_gotoxy( 1, lineCntTFT );
  TFT_puts( "Switch S4: Amplitude: 1.0 V" );
  lineCntTFT++;
  TFT_gotoxy( 1, lineCntTFT );
  TFT_puts( "Switch S3: Amplitude: 0.5 V" );
  lineCntTFT++;
  TFT_gotoxy( 1, lineCntTFT );
  TFT_puts( "Switch S2: Start der Ausgabe" );
  lineCntTFT++;
  TFT_gotoxy( 1, lineCntTFT );
  TFT_puts( "Switch S1: Stopp der Ausgabe" );
}