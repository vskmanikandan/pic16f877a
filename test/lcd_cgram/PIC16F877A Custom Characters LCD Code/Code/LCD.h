#ifndef __LCD_H
#define __LCD_H

// Define Pins
#define LCD_E    		RD0   	// Enable pin for LCD
#define LCD_RS  		RD1   	// RS pin for LCD
#define LCD_Data_Bus    PORTB 	// Data bus for LCD

// Define Pins direction registrers
#define LCD_E_Dir      		  TRISD0
#define LCD_RS_Dir     		  TRISD1
#define LCD_Data_Bus_Dir      TRISB

// -----------------------   Define Custom Characters ----------------------- //
unsigned char CurvyObject[8] = { 0x01,0x02,0x04,0x08,0x10,0x11,0x1f,0x00 };   // Curvy Object
unsigned char SquareBox[8]   = { 0x00,0x1f,0x11,0x11,0x11,0x1f,0x00,0x00 };   // Square Box
/*---------------------------------------------------*/

// Constants
#define E_Delay       500       


// Function Declarations
void WriteCommandToLCD(unsigned char);
void WriteDataToLCD(char);
void InitLCD(void);
void ClearLCDScreen(void);
void LCDBuildChar(unsigned char, unsigned char*);

#endif