#include <htc.h>
#define _XTAL_FREQ 20000000
__CONFIG(0x1F7A);
#define low 0x00
void main()
{
	while(1)
	{
		unsigned char x = 128;
		unsigned char y = 1;
		unsigned char op;
		unsigned char i = 0;
		TRISB = 0x00;
		PORTB = 0x00;
		while(i<=3)
		{
			op =  (x >> i | y << i);
		 	PORTB = op;
		
			__delay_ms(500);
	
			i++;
		}
		i = 0;
		x =4 ; y = 32;
		while(i<2)
		{
			op =  (x >> i | y << i);
		 	PORTB = op;
		
			__delay_ms(500);

			i++;
		}
		
	}	
}