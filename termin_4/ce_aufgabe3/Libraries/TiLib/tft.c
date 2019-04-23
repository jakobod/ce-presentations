/* 
 * File:   tft.c
 * Author: Alfred Lohmann
 *         HAW-Hamburg
 *         Labor f�r technische Informatik
 *         Berliner Tor  7
 *         D-20099 Hamburg
 * Version: 1.0
 * Created on 12. Juli 2013, 08:10
 * 
 * 12.11.2013: Heitmann
 * Glitches on I2c lines removed.
 * Checksum is now appended to display telegrams.
 */
#include <stdlib.h>
#include <string.h>
#include "stm32f4xx_gpio.h"
#include "stm32f4xx_i2c.h"
#include "stm32f4xx_rcc.h"
#include "tft.h"


//Display benoetigt vor JEDEM zu lesenden Byte eine bestimmte Zeit, die hiermit gesteuert wird
#define WAIT_FOR_READ 5555

	
#define I2C_MASTER
#define I2C_SPEED 100000
#define I2C_DUTYCYCLE  I2C_DutyCycle_2
#define SLAVE_ADDRESS_WRITE 0xDE
#define SLAVE_ADDRESS_READ 0xDF
 
/* USER_TIMEOUT value for waiting loops. This timeout is just a guarantee that the
   application will not remain stuck if the I2C communication is corrupted. 
   You may modify this timeout value depending on CPU frequency and application
   conditions (interrupts routines, number of data to transfer, speed, CPU
   frequency...). */ 
#define USER_TIMEOUT                  ((uint32_t)0x64) /* Waiting 1s */  
  
/* Master Mode Selected */
#define MASTER_MODE_TRANSMITTER       0x01
#define MASTER_MODE_RECEIVER          0x00 

/* I2Cx Communication boards Interface */
#define I2Cx                          I2C2
#define I2Cx_CLK                      RCC_APB1Periph_I2C2
  
#define I2Cx_SDA_GPIO_CLK             RCC_AHB1Periph_GPIOH
#define I2Cx_SDA_PIN                  GPIO_Pin_5                
#define I2Cx_SDA_GPIO_PORT            GPIOH                       
#define I2Cx_SDA_SOURCE               GPIO_PinSource5
#define I2Cx_SDA_AF                   GPIO_AF_I2C2
  
#define I2Cx_SCL_GPIO_CLK             RCC_AHB1Periph_GPIOH
#define I2Cx_SCL_PIN                  GPIO_Pin_4                
#define I2Cx_SCL_GPIO_PORT            GPIOH                    
#define I2Cx_SCL_SOURCE               GPIO_PinSource4
#define I2Cx_SCL_AF                   GPIO_AF_I2C2



#define TFT_BUFFER_SIZE 259     // max. len of data supported by TFT
// 256 byte of data + DC!, len, bcc

#define TFT_RESPONSE_WAIT 500	

/* Private variables ---------------------------------------------------------*/
static unsigned char TFT_send_buffer[TFT_BUFFER_SIZE];

/**
 * @brief  Delay Function.
 * @param  nCount:specifies the Delay time length.
 * @retval None
 */
static void tft_delay(__IO uint32_t nCount) {
    while (nCount--) {
    }
}


/**
 * @brief  Enables the I2C Clock and configures the different GPIO ports.
 * @param  None
 * @retval None
 */
void TFT_Init(void){
    GPIO_InitTypeDef GPIO_InitStructure;
    I2C_InitTypeDef I2C_InitStructure;

    /* RCC Configuration */
    /*I2C Peripheral clock enable */
    RCC_APB1PeriphClockCmd(I2Cx_CLK, ENABLE);

    /*SDA GPIO clock enable */
    RCC_AHB1PeriphClockCmd(I2Cx_SDA_GPIO_CLK, ENABLE);

    /*SCL GPIO clock enable */
    RCC_AHB1PeriphClockCmd(I2Cx_SCL_GPIO_CLK, ENABLE);

    /* Reset I2Cx IP */
    RCC_APB1PeriphResetCmd(I2Cx_CLK, ENABLE);

    /* Release reset signal of I2Cx IP */
    RCC_APB1PeriphResetCmd(I2Cx_CLK, DISABLE);

    /* GPIO Configuration */
    /* Connect PXx to I2C_SCL */
    GPIO_PinAFConfig(I2Cx_SCL_GPIO_PORT, I2Cx_SCL_SOURCE, I2Cx_SCL_AF);

    /* Connect PXx to I2C_SDA */
    GPIO_PinAFConfig(I2Cx_SDA_GPIO_PORT, I2Cx_SDA_SOURCE, I2Cx_SDA_AF);

    /*Configure I2C SCL pin */
    GPIO_InitStructure.GPIO_Pin = I2Cx_SCL_PIN;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_100MHz;
    GPIO_InitStructure.GPIO_OType = GPIO_OType_OD;
    GPIO_InitStructure.GPIO_PuPd = GPIO_PuPd_NOPULL;
    GPIO_Init(I2Cx_SCL_GPIO_PORT, &GPIO_InitStructure);

    /*Configure I2C SDA pin */
    GPIO_InitStructure.GPIO_Pin = I2Cx_SDA_PIN;
    GPIO_Init(I2Cx_SDA_GPIO_PORT, &GPIO_InitStructure);

    /* I2C Struct Initialize */
    I2C_InitStructure.I2C_Mode = I2C_Mode_I2C;
    I2C_InitStructure.I2C_DutyCycle = I2C_DUTYCYCLE;
    I2C_InitStructure.I2C_OwnAddress1 = 0xA0;
    I2C_InitStructure.I2C_Ack = I2C_Ack_Enable;
    I2C_InitStructure.I2C_ClockSpeed = I2C_SPEED;
    // 7bit-lange Adresse statt 10bit
    I2C_InitStructure.I2C_AcknowledgedAddress = I2C_AcknowledgedAddress_7bit;
    /* I2C Initialize */
    I2C_Init(I2Cx, &I2C_InitStructure);


    /* I2C ENABLE */
    I2C_Cmd(I2Cx, ENABLE);
    
    

    TFT_terminal_on();
    TFT_cls();    
}


/**
 * @brief  Outputs a data to TFT using SMALL PROTOCOL
 * @param  len .. number of characet to send
 *         data . data to send
 * @retval count of tries to send data
 */
int TFT_send_data(int n, char* data) {
    int i = 0;
    int len = 0;
    unsigned char bcc = 0;
    unsigned char ch = 0; 

    // initialize send buffer with start character 
    TFT_send_buffer[i] = DC1;
    bcc = bcc + TFT_send_buffer[i];
    i++;
    // string lenght to send buffer
    TFT_send_buffer[i] = n;
    bcc = bcc + TFT_send_buffer[i];
    i++;

    // copy string to send buffer  
    do {
        TFT_send_buffer[i] = *data;
        bcc = bcc + TFT_send_buffer[i];
        i++;
        n--;
        data++;
    } while (n > 0);

    // put checksum to send buffer   
    TFT_send_buffer[i] = bcc;

    len = i + 1;
    // now send buffer	

    /* Generate the Start condition */
    I2C_GenerateSTART(I2Cx, ENABLE);
    while (!I2C_CheckEvent(I2Cx, I2C_EVENT_MASTER_MODE_SELECT)) {
    }

    /* Send I2Cx slave Address for write */
    I2C_Send7bitAddress(I2Cx, SLAVE_ADDRESS_WRITE, I2C_Direction_Transmitter);
    while (!I2C_CheckEvent(I2Cx, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)) {
    }

    /* Send buf+checksum	*/
    for (i = 0; i < len; i++) {
        I2C_SendData(I2Cx, TFT_send_buffer[i]);
        while (!I2C_CheckEvent(I2Cx, I2C_EVENT_MASTER_BYTE_TRANSMITTED)) {
        }
    }

    /* Send I2Cx STOP Condition */
    I2C_GenerateSTOP(I2Cx, ENABLE);
    tft_delay(WAIT_FOR_READ);

    /* Send I2Cx START condition */
    I2C_GenerateSTART(I2Cx, ENABLE);
    while (!I2C_CheckEvent(I2Cx, I2C_EVENT_MASTER_MODE_SELECT)) {
    }

    /* Send I2Cx slave Address for read */
    I2C_Send7bitAddress(I2Cx, SLAVE_ADDRESS_READ, I2C_Direction_Receiver);
    while (!I2C_CheckEvent(I2Cx, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED)) {
    }

    /*ch = */I2C_ReceiveData(I2Cx); // should be SLAVE_ADDRESS_READ
    while (!I2C_CheckEvent(I2Cx, I2C_EVENT_MASTER_BYTE_RECEIVED));

    ch = I2C_ReceiveData(I2Cx); // should be ACK
    while (!I2C_CheckEvent(I2Cx, I2C_EVENT_MASTER_BYTE_RECEIVED));

    /* Send I2Cx STOP Condition */
    I2C_GenerateSTOP(I2Cx, ENABLE);
    tft_delay(WAIT_FOR_READ);


    return ch;
}

/**
 * @brief  Read data from TFT
 * @param  n .. buffer size
 *         *buffer .. pointer to buffer 
 * @retval number of data read
 */
int TFT_get_data(int n, char *buffer) {
    int i = 0;
    unsigned char buf[4];
    //static unsigned char ch = 0;
    unsigned char len = 0, len_saved = 0;

    buf[0] = DC2;
    buf[1] = 1;
    buf[2] = 'S';
    buf[3] = buf[0] + buf[1] + buf[2];

    /* Generate the Start condition */
    I2C_GenerateSTART(I2Cx, ENABLE);
    while (!I2C_CheckEvent(I2Cx, I2C_EVENT_MASTER_MODE_SELECT)) {
    }

    /* Send I2Cx slave Address for write */
    I2C_Send7bitAddress(I2Cx, SLAVE_ADDRESS_WRITE, I2C_Direction_Transmitter);
    while (!I2C_CheckEvent(I2Cx, I2C_EVENT_MASTER_TRANSMITTER_MODE_SELECTED)) {
    }

    for (i = 0; i < sizeof (buf); i++) // Send buf+checksum
    {
        I2C_SendData(I2Cx, buf[i]);
        while (!I2C_CheckEvent(I2Cx, I2C_EVENT_MASTER_BYTE_TRANSMITTED)) {
        }
    }

    /* Send I2Cx STOP Condition */
    I2C_GenerateSTOP(I2Cx, ENABLE);
    tft_delay(WAIT_FOR_READ);

    /* Send I2Cx START condition */
    I2C_GenerateSTART(I2Cx, ENABLE);
    while (!I2C_CheckEvent(I2Cx, I2C_EVENT_MASTER_MODE_SELECT)) {
    }

    /* Send I2Cx slave Address for read */
    I2C_Send7bitAddress(I2Cx, SLAVE_ADDRESS_READ, I2C_Direction_Receiver);
    while (!I2C_CheckEvent(I2Cx, I2C_EVENT_MASTER_RECEIVER_MODE_SELECTED)) {
    }

    // wait for acknowledge
    /*ch = */I2C_ReceiveData(I2Cx); // should be SLAVE_ADDRESS_READ
    while (!I2C_CheckEvent(I2Cx, I2C_EVENT_MASTER_BYTE_RECEIVED)) {
    }
    /*ch = */I2C_ReceiveData(I2Cx); // should be ACK
    while (!I2C_CheckEvent(I2Cx, I2C_EVENT_MASTER_BYTE_RECEIVED)) {
    }

    /*ch = */I2C_ReceiveData(I2Cx); // should be DC1
    while (!I2C_CheckEvent(I2Cx, I2C_EVENT_MASTER_BYTE_RECEIVED)) {
    }

    len = I2C_ReceiveData(I2Cx); // should be length
    while (!I2C_CheckEvent(I2Cx, I2C_EVENT_MASTER_BYTE_RECEIVED)) {
    }

    if ((len > 0) && (len < 0xFF)) {
        len_saved = len;
        while (len-- > 0) {
            *buffer = I2C_ReceiveData(I2Cx);
            while (!I2C_CheckEvent(I2Cx, I2C_EVENT_MASTER_BYTE_RECEIVED)) {
            }
            buffer++;
        }
    }

    /*ch = */I2C_ReceiveData(I2Cx); // should be bcc
    while (!I2C_CheckEvent(I2Cx, I2C_EVENT_MASTER_BYTE_RECEIVED)) {
    }

    /* Send I2Cx STOP Condition */
    I2C_GenerateSTOP(I2Cx, ENABLE);
    tft_delay(WAIT_FOR_READ);

    return len_saved;
}


/**
 * @brief  Close TFT connection
 * @param  none
 * @retval none
 */
void TFT_release(void) {

    return;
}

/**
 * @brief  Turns ASCII-Terminal on
 * @param  none
 * @retval none
 */
void TFT_terminal_on(void) {
    char cmd[3];

    cmd[0] = ESC;
    cmd[1] = 'T';
    cmd[2] = 'E';

    TFT_send_data(3, cmd);
}

/**
 * @brief  Turns ASCII-Terminal off
 * @param  none
 * @retval none
 */
void TFT_terminal_off(void) {
    char cmd[3];

    cmd[0] = ESC;
    cmd[1] = 'T';
    cmd[2] = 'A';

    TFT_send_data(3, cmd);
}

/**
 * @brief  Turns ASCII-Terminal cursor on
 * @param  none
 * @retval none
 */
void TFT_cursor_on(void) {
    char cmd[4];

    cmd[0] = ESC;
    cmd[1] = 'T';
    cmd[2] = 'C';
    cmd[3] = 1;

    TFT_send_data(4, cmd);
}

/**
 * @brief  Turns ASCII-Terminal cursor off
 * @param  none
 * @retval none
 */
void TFT_cursor_off(void) {
    char cmd[4];

    cmd[0] = ESC;
    cmd[1] = 'T';
    cmd[2] = 'C';
    cmd[3] = 0;

    TFT_send_data(4, cmd);
}

/**
 * @brief  Position cursor
 * @param  x .. character position 1 ...
 *         y .. line 1 ...
 * @retval none
 */
void TFT_gotoxy(int x, int y) {
    char cmd[5];

    cmd[0] = ESC;
    cmd[1] = 'T';
    cmd[2] = 'P';
    cmd[3] = x;
    cmd[4] = y;

    TFT_send_data(5, cmd);

}

/**
 * @brief  Sets TFT brightness 
 * @param  bright .. 0 .. 100
 * @retval none
 */
void TFT_set_brightness(int bright) {
    char cmd[5];

    cmd[0] = ESC;
    cmd[1] = 'Y';
    cmd[2] = 'H';
    cmd[3] = bright;

    TFT_send_data(4, cmd);

}

/**
 * @brief  Turns buzzer on 
 * @param  duration .. in 1/10 sec, 1 means unlimites
 * @retval none
 */

void TFT_buzzer_on(int duration) {
    char cmd[4];

    cmd[0] = ESC;
    cmd[1] = 'Y';
    cmd[2] = 'S';
    cmd[3] = duration;

    TFT_send_data(4, cmd);

}

/**
 * @brief  Turns buzzer off
 * @param  none
 * @retval none
 */
void TFT_buzzer_off(void) {
    char cmd[4];

    cmd[0] = ESC;
    cmd[1] = 'Y';
    cmd[2] = 'S';
    cmd[3] = 0;

    TFT_send_data(4, cmd);

}

/**
 * @brief  Clears ASCII-Terminal
 * @param  none
 * @retval none
 */
void TFT_cls(void) {
    TFT_putc(12); // clears screen, cursor 1,1
}

/**
 * @brief  Position cursor to a next line
 * @param  none
 * @retval none
 */
void TFT_newline(void) {
    TFT_putc(10); // cursor to next line
}

/**
 * @brief  Position cursor to beginning of line
 * @param  none
 * @retval none
 */
void TFT_carriage_return(void) {
    TFT_putc(13); // cursor to beginn of line
}

/**
 * @brief  Selects font to be used
 * @param  font .. font number
 * @retval none
 */
void TFT_set_font(int font) {

    char cmd[6];
    cmd[0] = ESC;
    cmd[1] = 'Z';
    cmd[2] = 'F';
    cmd[3] = font;

    TFT_send_data(4, cmd);
}

/**
 * @brief  Selects font color to be used
 * @param  clr .. color 1 .. 32
 * @retval none
 */
void TFT_set_font_color(int clr) {

    char cmd[6];
    cmd[0] = ESC;
    cmd[1] = 'F';
    cmd[2] = 'T';
    cmd[3] = clr;
    cmd[4] = 1;

    TFT_send_data(5, cmd);
}

/**
 * @brief  Defines ASCII window
 * @param  font .. font number
 *         x_start ... start character position 
 *         y_start ... start line 
 *         num_x ..... width number of character
 *         num_y ..... width number of lines
 * @retval none
 */
void TFT_set_window(int font, int x_start, int y_start, int num_x, int num_y) {
    char cmd[9];

    cmd[0] = ESC;
    cmd[1] = 'T';
    cmd[2] = 'W';
    cmd[3] = font; // font 8*8
    cmd[4] = x_start;
    cmd[5] = y_start;
    cmd[6] = num_x;
    cmd[7] = num_y;

    TFT_send_data(8, cmd);
}

/**
 * @brief  Defines color used by GRAPHIC
 * @param  clr ... color 1 .. 32
 * @retval none
 */
void TFT_set_graphic_color(int clr) {

    char cmd[6];
    cmd[0] = ESC;
    cmd[1] = 'F';
    cmd[2] = 'D';
    cmd[3] = clr;
    cmd[4] = 1;

    TFT_send_data(5, cmd);
}

/**
 * @brief  Defines color used by GRAPHIC
 * @param  clr ... color 1 .. 32
 * @retval none
 */
void TFT_set_pixel_color(int clr) {

    char cmd[6];
    cmd[0] = ESC;
    cmd[1] = 'F';
    cmd[2] = 'G';
    cmd[3] = clr;
    cmd[4] = 1;

    TFT_send_data(5, cmd);
}

/**
 * @brief  Clears GRAPHIC
 * @param  none
 * @retval none
 */

void TFT_graphic_cls(void) {

    char cmd[6];
    cmd[0] = ESC;
    cmd[1] = 'D';
    cmd[2] = 'L';

    TFT_send_data(3, cmd);
}

/**
 * @brief  Defines color used by GRAPHIC TEXT
 * @param  clr ... color 1 .. 32
 * @retval none
 */
void TFT_set_graphic_text_color(int clr) {

    char cmd[6];
    cmd[0] = ESC;
    cmd[1] = 'F';
    cmd[2] = 'Z';
    cmd[3] = clr;
    cmd[4] = 1;

    TFT_send_data(5, cmd);
}

/**
 * @brief  Defines font used by GRAPHIC TEXT
 * @param  clr ... font
 * @retval none
 */
void TFT_set_graphic_text_font(int font) {

    char cmd[6];
    cmd[0] = ESC;
    cmd[1] = 'Z';
    cmd[2] = 'F';
    cmd[3] = font;

    TFT_send_data(4, cmd);
}

/**
 * @brief  Output GRAPHIC TEXT string
 * @param  x ........ x position
 *         y ........ y position
 *         position .. left, centered or right
 * @retval none
 */
void TFT_graphic_puts(int x, int y, int position, char *s) {
    char cmd[TFT_BUFFER_SIZE + 3];
    int i = 0;

    cmd[i++] = ESC;
    cmd[i++] = 'Z';

    if (position == TEXT_LEFT)
        cmd[i++] = 'L';
    else if (position == TEXT_CENTERED)
        cmd[i++] = 'C';
    else
        cmd[i++] = 'R';

    cmd[i++] = x & 0x00ff; // high byte of position
    cmd[i++] = (x >> 8) & 0x0ff; // low byte
    cmd[i++] = y & 0x00ff; // high byte of position
    cmd[i++] = (y >> 8) & 0x0ff; // low byte

    while (((cmd[i] = *s) != 0) && (i < TFT_BUFFER_SIZE)) {
        i++;
        s++;

    };
    cmd[i] = 0;
    i++;
    TFT_send_data(i, cmd);

}

/**
 * @brief  Output GRAPHIC TEXT string to an aread
 * @param  x ........ x position upper left corner
 *         y ........ y position upper left corner
 *         x2 ....... x position lower left corner
 *         y2 ....... y position lower left corner
 *         position .. position in area
 * @retval none
 */
void TFT_graphic_puts_area(int x, int y, int x2, int y2, int position, char *s) {
    char cmd[TFT_BUFFER_SIZE + 3];
    int i = 0;

    cmd[i++] = ESC;
    cmd[i++] = 'Z';
    cmd[i++] = 'B'; //

    cmd[i++] = x & 0x00ff; // high byte of position
    cmd[i++] = (x >> 8) & 0x0ff; // low byte
    cmd[i++] = y & 0x00ff; // high byte of position
    cmd[i++] = (y >> 8) & 0x0ff; // low byte

    cmd[i++] = x2 & 0x00ff; // high byte of position
    cmd[i++] = (x2 >> 8) & 0x0ff; // low byte
    cmd[i++] = y2 & 0x00ff; // high byte of position
    cmd[i++] = (y2 >> 8) & 0x0ff; // low byte

    cmd[i++] = position;

    while (((cmd[i] = *s) != 0) && (i < TFT_BUFFER_SIZE)) {
        i++;
        s++;

    };
    cmd[i] = 0;
    i++;
    TFT_send_data(i, cmd);

}

/**
 * @brief  Sets a point on graphic display
 * @param  x ........ x position
 *         y ........ y position
 * @retval none
 */
void TFT_graphic_set_point(int x, int y) {
    char cmd[TFT_BUFFER_SIZE + 3];
    int i = 0;

    cmd[i++] = ESC;
    cmd[i++] = 'G';
    cmd[i++] = 'P';

    cmd[i++] = x & 0x00ff; // high byte of position
    cmd[i++] = (x >> 8) & 0x0ff; // low byte
    cmd[i++] = y & 0x00ff; // high byte of position
    cmd[i++] = (y >> 8) & 0x0ff; // low byte
    i++;
    TFT_send_data(i, cmd);

}

/**
 * @brief  Output one charater to ASCII-Terminal
 * @param  c .. charater to output
 * @retval none
 */
void TFT_putc(char c) {

    char s[3];
    s[0] = c;
    s[1] = '~';
    s[2] = 0;
    TFT_send_data(1, s);

}

/**
 * @brief  Output one stringto ASCII-Terminal
 * @param  *s .. ascii string
 * @retval none
 */
void TFT_puts(char *s) {

    TFT_send_data(strlen(s), s);
}

/**
 * @brief  Defines a bargraph
 * @param   
 * @retval none
 */
void TFT_bargraph_define(int nr, int bar_direction,
        int x1, int y1, int x2, int y2,
        int start_value, int end_value, int type) {

    char cmd[20];
    int i = 0;

    cmd[i++] = ESC;
    cmd[i++] = 'B';

    if (bar_direction == BARGRAPH_RIGHT)
        cmd[i++] = 'R';
    else if (bar_direction == BARGRAPH_LEFT)
        cmd[i++] = 'L';
    else if (bar_direction == BARGRAPH_TOP)
        cmd[i++] = 'O';
    else
        cmd[i++] = 'U';

    cmd[i++] = nr;
    cmd[i++] = x1 & 0x00ff; // high byte of position
    cmd[i++] = (x1 >> 8) & 0x0ff; // low byte
    cmd[i++] = y1 & 0x00ff; // high byte of position
    cmd[i++] = (y1 >> 8) & 0x0ff; // low byte
    cmd[i++] = x2 & 0x00ff; // high byte of position
    cmd[i++] = (x2 >> 8) & 0x0ff; // low byte
    cmd[i++] = y2 & 0x00ff; // high byte of position
    cmd[i++] = (y2 >> 8) & 0x0ff; // low byte
    cmd[i++] = start_value;
    cmd[i++] = end_value;
    cmd[i++] = type;

    TFT_send_data(i, cmd);

}

/**
 * @brief  Sends a new values to bargraph
 * @param  nr ..... bargraph id (as set TFT_bargraph_define) 
 *         value .. range start_value to end_values
 * @retval none
 */
void TFT_bargraph_value(int nr, int value) {
    char cmd[5];

    cmd[0] = ESC;
    cmd[1] = 'B';
    cmd[2] = 'A';
    cmd[3] = nr;
    cmd[4] = value;

    TFT_send_data(5, cmd);
}

// only valid for bargraph type 0..3

void TFT_bargraph_fill_pattern(int pattern) {

    char cmd[4];

    cmd[0] = ESC;
    cmd[1] = 'B';
    cmd[2] = 'M';
    cmd[3] = pattern;

    TFT_send_data(4, cmd);
}

// only valid for bargraph type 4..7

void TFT_bargraph_frame(int frame) {

    char cmd[4];

    cmd[0] = ESC;
    cmd[1] = 'B';
    cmd[2] = 'E';
    cmd[3] = frame;

    TFT_send_data(4, cmd);
}

/**
 * @brief  Defines a bargraph color
 * @param  fg ..... foreground color
 *         bg ..... background color
 *         frame .. frame type used
 * @retval none
 */
void TFT_bargraph_color(int fg, int bg, int frame) {

    char cmd[6];

    cmd[0] = ESC;
    cmd[1] = 'F';
    cmd[2] = 'B';
    cmd[3] = fg;
    cmd[4] = bg;
    cmd[5] = frame;

    TFT_send_data(6, cmd);
}

/**
 * @brief  Defines a GRAPHIC LINE color
 * @param  fg ..... foreground color
 *         bg ..... background color
 * @retval none
 */
void TFT_line_color(int fg, int bg) {

    char cmd[5];

    cmd[0] = ESC;
    cmd[1] = 'F';
    cmd[2] = 'G';
    cmd[3] = fg;
    cmd[4] = bg;


    TFT_send_data(5, cmd);
}

/**
 * @brief  Draw a GRAPHIC LINE
 * @param  x1 ... start position x
 *         y1 ... start position y
 *         x2 ... end position x
 *         y2 ... end position y
 * @retval none
 */
void TFT_draw_line(int x1, int y1, int x2, int y2) {

    char cmd[12];
    int i = 0;

    cmd[i++] = ESC;
    cmd[i++] = 'G';
    cmd[i++] = 'D';
    cmd[i++] = x1 & 0x00ff; // high byte of position
    cmd[i++] = (x1 >> 8) & 0x0ff; // low byte
    cmd[i++] = y1 & 0x00ff; // high byte of position
    cmd[i++] = (y1 >> 8) & 0x0ff; // low byte
    cmd[i++] = x2 & 0x00ff; // high byte of position
    cmd[i++] = (x2 >> 8) & 0x0ff; // low byte
    cmd[i++] = y2 & 0x00ff; // high byte of position
    cmd[i++] = (y2 >> 8) & 0x0ff; // low byty

    TFT_send_data(i, cmd);

    return;
}

/**
 * @brief  Draw a GRAPHIC rectangle
 * @param  x1 ....... x position upper left corner
 *         y1 ....... y position upper left corner
 *         x2 ....... x position lower left corner
 *         y2 ....... y position lower left corner
 * @retval none
 */
void TFT_draw_rectangle(int x1, int y1, int x2, int y2) {

    char cmd[12];
    int i = 0;

    cmd[i++] = ESC;
    cmd[i++] = 'G';
    cmd[i++] = 'R';
    cmd[i++] = x1 & 0x00ff; // high byte of position
    cmd[i++] = (x1 >> 8) & 0x0ff; // low byte
    cmd[i++] = y1 & 0x00ff; // high byte of position
    cmd[i++] = (y1 >> 8) & 0x0ff; // low byte
    cmd[i++] = x2 & 0x00ff; // high byte of position
    cmd[i++] = (x2 >> 8) & 0x0ff; // low byte
    cmd[i++] = y2 & 0x00ff; // high byte of position
    cmd[i++] = (y2 >> 8) & 0x0ff; // low byty

    TFT_send_data(i, cmd);

    return;
}

/**
 * @brief  Defines the FRAME for TOUCH area
 * @param  frame ... frame 1 .. 20
 *         angle ... angle to display 0, 90, 180,270
 * @retval none
 */
void TFT_touch_area_frame(int frame, int angle) {

    char cmd[5];

    cmd[0] = ESC;
    cmd[1] = 'A';
    cmd[2] = 'E';
    cmd[3] = frame;
    cmd[4] = angle;

    TFT_send_data(5, cmd);

    return;
}

/**
 * @brief  Selects font used in TOUCH area
 * @param  font ... font to use
 * @retval none
 */
void TFT_touch_area_font(int font) {

    char cmd[4];

    cmd[0] = ESC;
    cmd[1] = 'A';
    cmd[2] = 'F';
    cmd[3] = font;

    TFT_send_data(4, cmd);

    return;
}

/**
 * @brief  Defines a TOUCH font color
 * @param  fg ..... foreground color
 *         bg ..... background color
 * @retval none
 */
void TFT_touch_area_font_color(int fg, int bg) {

    char cmd[5];

    cmd[0] = ESC;
    cmd[1] = 'F';
    cmd[2] = 'A';
    cmd[3] = fg;
    cmd[4] = bg;

    TFT_send_data(5, cmd);

    return;
}

//#FE=Set touchborder colors: #FE n1,n2,n3,s1,s2,s3  (n1..n3=normal s1..s3=for selection (0..32);

void TFT_touch_area_color(int n1, int n2, int n3, int s1, int s2, int s3) {

    char cmd[9];

    cmd[0] = ESC;
    cmd[1] = 'F';
    cmd[2] = 'E';
    cmd[3] = n1;
    cmd[4] = n2;
    cmd[5] = n3;
    cmd[6] = s1;
    cmd[7] = s2;
    cmd[8] = s3;

    TFT_send_data(9, cmd);

    return;
}

/**
 * @brief  Defines a TOUCH area
 * @param  x1 .............. x position upper left corner
 *         y1 .............. y position upper left corner
 *         x2 .............. x position lower left corner
 *         y2 .............. y position lower left corner
 *         code_pressed .... code returned when aread is pressed
 *         code_preleased .. code returned when aread is released
 *         *s .............. pointer to text displayed in area
 * @retval none
 */
void TFT_touch_area(int x1, int y1, int x2, int y2,
        int code_pressed, int code_released, char *s) {

    static char cmd[262];
    int i = 0;

    cmd[i++] = ESC;
    cmd[i++] = 'A';
    cmd[i++] = 'T';
    cmd[i++] = x1 & 0x00ff; // high byte of position
    cmd[i++] = (x1 >> 8) & 0x0ff; // low byte
    cmd[i++] = y1 & 0x00ff; // high byte of position
    cmd[i++] = (y1 >> 8) & 0x0ff; // low byte
    cmd[i++] = x2 & 0x00ff; // high byte of position
    cmd[i++] = (x2 >> 8) & 0x0ff; // low byte
    cmd[i++] = y2 & 0x00ff; // high byte of position
    cmd[i++] = (y2 >> 8) & 0x0ff; // low byty
    cmd[i++] = code_pressed;
    cmd[i++] = code_released;

    while (*s != 0) {
        cmd[i++] = *s++;
    }

    cmd[i++] = 0;
    TFT_send_data(i, cmd);

    return;
}

/**
 * @brief  Clears TOUCH area
 * @param  none
 * @retval none
 */
void TFT_touch_area_clear(void) {

    char cmd[5];

    cmd[0] = ESC;
    cmd[1] = 'A';
    cmd[2] = 'L';
    cmd[3] = 0;
    cmd[4] = 1;

    TFT_send_data(5, cmd);

    return;
}



