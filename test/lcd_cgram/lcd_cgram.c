#define _XTAL_FREQ 20000000


#define RS RD2

#define EN RD3

#define D4 RD4

#define D5 RD5

#define D6 RD6

#define D7 RD7


#include <xc.h>


#pragma config FOSC = HS        // Oscillator Selection bits (HS oscillator)

#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled)

#pragma config PWRTE = ON       // Power-up Timer Enable bit (PWRT enabled)

#pragma config BOREN = ON       // Brown-out Reset Enable bit (BOR enabled)

#pragma config LVP = OFF        // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit (RB3 is digital I/O, HV on MCLR must be used for programming)

#pragma config CPD = OFF        // Data EEPROM Memory Code Protection bit (Data EEPROM code protection off)

#pragma config WRT = OFF        // Flash Program Memory Write Enable bits (Write protection off; all program memory may be written to by EECON control)

#pragma config CP = OFF         // Flash Program Memory Code Protection bit (Code protection off)


//LCD Functions Developed by Circuit Digest.


/*******START OF LCD FUNCTIONS*********/

void Lcd_SetBit(char data_bit) //Based on the Hex value Set the Bits of the Data Lines

{

    if(data_bit& 1) 

        D4 = 1;

    else

        D4 = 0;


    if(data_bit& 2)

        D5 = 1;

    else

        D5 = 0;


    if(data_bit& 4)

        D6 = 1;

    else

        D6 = 0;


    if(data_bit& 8) 

        D7 = 1;

    else

        D7 = 0;

}


void Lcd_Cmd(char a)

{

    RS = 0;           

    Lcd_SetBit(a); //Incoming Hex value

    EN  = 1;         

        __delay_ms(4);

        EN  = 0;         

}


Lcd_Clear()

{

    Lcd_Cmd(0); //Clear the LCD

    Lcd_Cmd(1); //Move the curser to first position

}


void Lcd_Set_Cursor(char a, char b)

{

    char temp,z,y;

    if(a== 1)

    {

      temp = 0x80 + b - 1; //80H is used to move the curser

        z = temp>>4; //Lower 8-bits

        y = temp & 0x0F; //Upper 8-bits

        Lcd_Cmd(z); //Set Row

        Lcd_Cmd(y); //Set Column

    }

    else if(a== 2)

    {

        temp = 0xC0 + b - 1;

        z = temp>>4; //Lower 8-bits

        y = temp & 0x0F; //Upper 8-bits

        Lcd_Cmd(z); //Set Row

        Lcd_Cmd(y); //Set Column

    }

}


void Lcd_Start()

{

  Lcd_SetBit(0x00);

  for(int i=1065244; i<=0; i--)  NOP();  

  Lcd_Cmd(0x03);

    __delay_ms(5);

  Lcd_Cmd(0x03);

    __delay_ms(11);

  Lcd_Cmd(0x03); 

  Lcd_Cmd(0x02); //02H is used for Return home -> Clears the RAM and initializes the LCD

  Lcd_Cmd(0x02); //02H is used for Return home -> Clears the RAM and initializes the LCD

  Lcd_Cmd(0x08); //Select Row 1

  Lcd_Cmd(0x00); //Clear Row 1 Display

  Lcd_Cmd(0x0C); //Select Row 2

  Lcd_Cmd(0x00); //Clear Row 2 Display

  Lcd_Cmd(0x06);

}


void Lcd_Print_Char(char data)  //Send 8-bits through 4-bit mode

{

   char Lower_Nibble,Upper_Nibble;

   Lower_Nibble = data&0x0F;

   Upper_Nibble = data&0xF0;

   RS = 1;             // => RS = 1

   Lcd_SetBit(Upper_Nibble>>4);             //Send upper half by shifting by 4

   EN = 1;

   for(int i=2130483; i<=0; i--)  NOP(); 

   EN = 0;

   Lcd_SetBit(Lower_Nibble); //Send Lower half

   EN = 1;

   for(int i=2130483; i<=0; i--)  NOP();

   EN = 0;

}


void Lcd_Print_String(char *a)

{

    int i;

    for(i=0;a[i]!='\0';i++)

       Lcd_Print_Char(a[i]);  //Split the string using pointers and call the Char function 

}


/*******END OF LCD FUNCTIONS*********/

const unsigned short Custom_Char5x8[] = {

  0b01110,0b01110,0b00100,0b01110,0b10101,0b00100,0b01010,0b01010, // Code for CGRAM memory space 1

  0b00000,0b00000,0b01010,0b00100,0b00100,0b10001,0b01110,0b00000, // Code for CGRAM memory space 2

  0b00100,0b01110,0b11111,0b11111,0b01110,0b01110,0b01010,0b01010, // Code for CGRAM memory space 3

  0b01110,0b10001,0b10001,0b11111,0b11011,0b11011,0b11111,0b00000, // Code for CGRAM memory space 4

  0b01110,0b10000,0b10000,0b11111,0b11011,0b11011,0b11111,0b00000, // Code for CGRAM memory space 5

  0b00000,0b10001,0b01010,0b10001,0b00100,0b01110,0b10001,0b00000, // Code for CGRAM memory space 6

  0b00000,0b00000,0b01010,0b10101,0b10001,0b01110,0b00100,0b00000, // Code for CGRAM memory space 7

  0b11111,0b11111,0b10101,0b11011,0b11011,0b11111,0b10001,0b11111  // Code for CGRAM memory space 8

};


int main()

{

    unsigned int a;char i;

    TRISD = 0x00;

    Lcd_Start();

   

    //*** Load custom char into the CGROM***//////

  Lcd_Cmd(0x04);   // Set CGRAM Address

  Lcd_Cmd(0x00);   // .. set CGRAM Address

  for (i = 0; i <= 63 ; i++)

    Lcd_Print_Char(Custom_Char5x8[i]);

  Lcd_Cmd(0);      // Return to Home

  Lcd_Cmd(2);      // .. return to Home

  //*** Loading custom char complete***//////

  

    while(1)

    {

        Lcd_Clear();

        //Print all Custom characters// 

    Lcd_Set_Cursor(1,1);

    Lcd_Print_Char(0); // Display Custom Character 0

    Lcd_Print_Char(1); // Display Custom Character 1

    Lcd_Print_Char(2); // Display Custom Character 2

    Lcd_Print_Char(3); // Display Custom Character 3

    Lcd_Print_Char(4); // Display Custom Character 4

    Lcd_Print_Char(5); // Display Custom Character 5

    Lcd_Print_Char(6); // Display Custom Character 6

    Lcd_Print_Char(7); // Display Custom Character 7

    

    //Print predefined special character//

    Lcd_Set_Cursor(2,1);

    Lcd_Print_Char(0b11100000); //binary value of alpha from data-sheet

    __delay_ms(1000);

    }

    return 0;

}