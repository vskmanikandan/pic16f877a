#include <htc.h>
#define _XTAL_FREQ 20000000
__CONFIG(0x1F7A);
void main()
{
	TRISD0 = 1; // RD0 AS INPUT PIN (SWITCH)
	TRISB0 = 0; // RB0 AS OUTPUT PIN (LED)
	RB0 = 0;	// LED OFF STATE
	while(1)
	{
		if(RD0 == 0) //IF SWITCH IS PRESSED
		{
			__delay_ms(100);
			if(RD0 == 0) // IF SWITCH IS STILL PRESSED
			{
				RB0 = 1; // LED ON
				__delay_ms(100);
				RB0 = 0; // LED OFF
			}
		}
	}
}	