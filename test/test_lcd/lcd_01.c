#include <htc.h>
#define _XTAL_FREQ 20000000
__CONFIG(0x1F7A);
#define RS RC0
#define RW RC1
#define EN RC2

void lcd_cmd(unsigned char cmd)
{
	RS = 0;
	RW = 0;
	EN = 1;
	PORTB = cmd;
	__delay_ms(25);
	EN = 0;
}
void lcd_data(unsigned char data)
{

	RS = 1;
	RW = 0;
	PORTB = data;
	EN = 1;
	__delay_ms(100);
	EN = 0;
	__delay_ms(15);
}


int main()
{
	char x[] = { 'l','i','n','u','x'};
	unsigned char CurvyObject[8] = { 0x01,0x02,0x04,0x08,0x10,0x11,0x1f,0x00 };   // Curvy Object
	TRISB = 0;
	TRISC = 0;
	
	lcd_cmd(0x38); //init 5x8 - 2 line RET HOME
    //lcd_cmd(0x0F); // disp on, en_cur, en_blink
    lcd_cmd(0x0C); // disp on, en_cur, en_blink
    lcd_cmd(0x01); //clear Display
    lcd_cmd(0x02); //Ret to Home
    lcd_cmd(0x06); // cur++
	lcd_cmd(0x80); //set DDRAM
	
//	lcd_cmd(0x40); //set CGRAM
//	lcd_cmd(0x40+(1*8)); //set CGRAM 
		
	for(int i=0; i<=9; i++)
	{
		
	  lcd_data(i+0x30);
	  //lcd_data(itoa(i));
	  //__delay_ms(50);
	  lcd_cmd(0x80);
	  //lcd_cmd(0x01);
	}  
	  //lcd_data(CurvyObject[i]);
		  __delay_ms(500);  
//	 lcd_cmd(0x81);
//	 lcd_data(0);
//	 
//	 lcd_cmd(0x8D);
//	 lcd_data(0);
	 
 	
	while(1);
	


}