#include <htc.h>
#define _XTAL_FREQ 20000000
__CONFIG(0x1F7A);

unsigned char uart_rx(void);
void uart_init(void);
void uart_init()
{
	TRISC6	= 1;    // LOW  26 PIN RC7/RX/DT 
	TRISC7	= 0;    // HIGH 25 PIN RC6/TX/CK
	TXSTA	= 0X00; // TX Status & Contl Reg. (Add 98h)
	RCSTA	= 0X00; // RX Status & Contl Reg. (Add 18h)
	SPBRG	= 31;   // SPBRG Serial port Baud Rate Gen Reg. (Add 99h) 
	TXEN	= 1;    // Transmit Enable bit
	SPEN	= 1;    // SP Enable bit; 1 = configures RC7/RX/DT and RC6/TX/CK pins as serial port pins; 0 = Serial port disabled
	TXIF	= 0;
	RCIF	= 0;

}

void uart_tx(unsigned char val)
{
	TXREG	= val;  // Transmit Buffer
	while(TXIF == 0); // Transmit Buffer TXIF = 0;
	TXIF = 0;	
}

void main()
{
	uart_init();
	uart_tx('S');
	__delay_ms(100);
	uart_tx('L');
	__delay_ms(100);
	uart_tx(' ');
	__delay_ms(100);
	uart_tx('D');
	__delay_ms(100);
	uart_tx('P');
	__delay_ms(100);
	uart_tx('I');
	__delay_ms(100);
	
	while(1);
}
