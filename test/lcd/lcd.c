#include<htc.h>

#define _XTAL_FREQ 20000000
#define RS RC0
#define RW RC1
#define EN RC2

void lcd_cmd(unsigned char cmd)
{
  RS = 0;
  RW = 0;
  EN = 1;
  PORTD = cmd;
  __delay_ms(50);
  EN = 0;
}

void lcd_data(unsigned char data)
{
	RS = 1;
	RW = 0;
	EN = 1;
	PORTD = data;
	__delay_ms(50);
	EN = 0;
}


int main()
{
	TRISC = 0;
	TRISD = 0;
	lcd_cmd(0x38);
	lcd_cmd(0x01);
	lcd_cmd(0x02);
	lcd_cmd(0x0F);
	//lcd_cmd(0x06);
//	lcd_cmd(0x80);
	for(int i = 0; i<10; i++)
	{
		lcd_data('B');
		__delay_ms(50);
	}
	while(1);
}