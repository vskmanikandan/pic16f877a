/*  Name     : main.c
 *  Purpose  : Main file for using making digital clock with PIC16F877 using LCD display.
 *  Author   : M.Saeed Yasin
 *  Date     : 24-11-12
 *  Website  : saeedsolutions.blogspot.com
 *  Revision : None
 */
#include "Includes.h"

// Configuration word for PIC16F877
__CONFIG( FOSC_HS & WDTE_OFF & PWRTE_ON & CP_OFF & BOREN_ON 
		& LVP_OFF & CPD_OFF & WRT_ON & DEBUG_OFF);

// Main Function
void main(void)
{
	InitLCD();						// Initialize LCD in 4bit mode
	Init1msecTimerInterrupt();		// Start 1 msec timer

	while(1)
	{
		if( msCounter == 0 )        // msCounter becomes zero after exact one sec
		{
			// Displays time in HH:MM:SS format
			DisplayTimeToLCD(hrCounter, minCounter, secCounter);   
		}

		UpdateTimeCounters();       // Update sec, min, hours counters
  	}
}

