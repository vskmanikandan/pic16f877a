#include "Includes.h"



void WriteCommandToLCD(unsigned char Command)  
{
	LCD_RS = 0;				  // It is a command
	LCD_Data_Bus = Command;	  // Write value on data bus
	
	LCD_E = 1;                // Give a pulse on E pin
	__delay_us(E_Delay);      // so that LCD can latch the
	LCD_E = 0;                // data from data bus
	__delay_us(E_Delay); 	
}

void WriteDataToLCD(char LCDChar)  
{
	LCD_RS = 1;				  // It is data
	LCD_Data_Bus = LCDChar;	  // Write value on data bus
	
	LCD_E = 1;                // Give a pulse on E pin
	__delay_us(E_Delay);      // so that LCD can latch the
	LCD_E = 0;                // data from data bus
	__delay_us(E_Delay); 
}


void InitLCD(void)
{ 
	// Firstly make all pins output
	LCD_E  		 	 = 0;   // E  = 0
	LCD_RS  	 	 = 0;   // RS = 0
	LCD_Data_Bus 	 = 0;  	// Data bus = 0
	LCD_E_Dir    	 = 0;   // Make Output
	LCD_RS_Dir    	 = 0;   // Make Output
	LCD_Data_Bus_Dir = 0;   // Make Output

  ///////////////// Reset process from datasheet //////////////
   __delay_ms(40);
	WriteCommandToLCD(0x30);  

   __delay_ms(6);
	WriteCommandToLCD(0x30);  

   __delay_us(300);
	WriteCommandToLCD(0x30);

   __delay_ms(2);
  /////////////// Reset Process End ////////////////
	WriteCommandToLCD(0x38);    //function set
	WriteCommandToLCD(0x0c);    //display on,cursor off,blink off
	WriteCommandToLCD(0x01);    //clear display
	WriteCommandToLCD(0x06);    //entry mode, set increment
	
  /* ---------- Build Custom Characters -----------------*/
   LCDBuildChar(0, CurvyObject); /* Build Character at position 0 */ 
   LCDBuildChar(1, SquareBox);   /* Build Character at position 1 */ 
}



void ClearLCDScreen(void)       // Clear the Screen and return cursor to zero position
{
	WriteCommandToLCD(0x01);    // Clear the screen
	__delay_ms(2);              // Delay for cursor to return at zero position
}



/********************************************************** 
Function Name: LCDBuildChar
Input:
     loc: location where you want to store  0,1,2,....7          
     p: Pointer to pattern data
Usage:
     LCDBuildChar(1,pattern);
 ********************************************************* */

void LCDBuildChar(unsigned char loc, unsigned char *p)
{
     unsigned char i;
	 
     if(loc<8)                                 //If valid address
	 {
         WriteCommandToLCD(0x40+(loc*8));      //Write to CGRAM
         for(i=0;i<8;i++)
            WriteDataToLCD(p[i]);              //Write the character pattern to CGRAM
     }
	 WriteCommandToLCD(0x80);                  //shift back to DDRAM location 0
}