/*
*----------------------------------------------------------------------------
 * Name:    	Usart.c
 * Purpose: 	USART usage for STM32
 * Note(s):  	Alfred Lohmann
 *        	  HAW-Hamburg
 *          	Labor für technische Informatik
 *          	Berliner Tor  7
 *          	D-20099 Hamburg
 * 						version V1.0
 *         		adapted to the HAW TI-Bord
 * Date:   		18.07.2013
 *----------------------------------------------------------------------------
 */
 #ifndef __USART_H
 #define __USART_H

 void USART_Device_Init (void);
 void USART_Buffer_Init (void);
 int USART_SendChar (int c);
 int USART_GetKey (void);
 
 #endif 
 /************************ (C) COPYRIGHT STMicroelectronics *****END OF FILE****/
