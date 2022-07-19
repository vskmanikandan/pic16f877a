/*  Name     : main.c
 *  Purpose  : Main file for displaying custom characters on LCD with PIC16F877A.
 *  Author   : M.Saeed Yasin
 *  Date     : 21-01-16
 *  Website  : saeedsolutions.blogspot.com
 *  Revision : None
 */
#include "Includes.h"

// Configuration word for PIC16F877A
__CONFIG( FOSC_HS & WDTE_OFF & PWRTE_ON & CP_OFF & BOREN_ON
         & LVP_OFF & CPD_OFF & WRT_OFF & DEBUG_OFF);

// Main Function
void main(void)
{
	InitLCD();			    // Initialize LCD in 8bit mode
	
	WriteDataToLCD(0x00);   // Write Curvy Object on LCD
	WriteDataToLCD(' ');    // Space
	WriteDataToLCD(0x01);   // Write Square Box on LCD
		
	while(1)
	{
	}
}

