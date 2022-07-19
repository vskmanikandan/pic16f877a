#include <htc.h>
#define _XTAL_FREQ 20000000
#define RS RD5
#define RW RD6
#define EN RD7

void lcd_cmd(unsigned char cmd);
void lcd_disp(unsigned char data);

void uart_init(void);
void lcd_init();

void lcd_cmd(unsigned char cmd)
{
  RS = 0;
  RW = 0;
  EN = 1;
  PORTB = cmd;
  __delay_ms(50);
  EN = 0;
  __delay_ms(50);
}

void lcd_disp(unsigned char data)
{
	RS = 1;
	RW = 0;
	EN = 1;
	PORTB = data;
	__delay_ms(50);
	EN = 0;
	__delay_ms(50);
}


void uart_init()
{
	TRISC6	= 0;    // LOW  26 PIN RC7/RX/DT 
	TRISC7	= 1;    // HIGH 25 PIN RC6/TX/CK
	TXSTA	= 0X20; // b5 TXEN = 1, b1 TRMT: TSR bit 1 = TSR empty
	RCSTA	= 0X90; // b7 SPEN = 1, b4 CREN = 1
	SPBRG	= 31;   // SPBRG Serial port Baud Rate Gen Reg. (Add 99h) 
	TXIF	= 0;
	RCIF	= 0;
}

void lcd_init()
{
	TRISB=0x00;    //Port-B is used as output port             
	TRISD5=0;      //Port-D pin#5 as output pin
	TRISD6=0;      //Port-D pin#6 as output pin
	TRISD7=0;      //Port-D pin#7 as output pin
	__delay_ms(50);
	lcd_cmd(0x38); //init 5x8 - 2 line RET HOME
    lcd_cmd(0x0F); // disp on, en_cur, en_blink
    lcd_cmd(0x0C); // disp on, en_cur, en_blink
    lcd_cmd(0x02); //Ret to Home
    lcd_cmd(0x06); // cur++
	lcd_cmd(0x80); //set DDRAM
	__delay_ms(50);
	lcd_cmd(0x01); //clear Display
}

void main()
{
	unsigned char RData;
	lcd_init();
	uart_init();
	//lcd_disp('');
	while(1)
		{
			while(RCIF==0);  //Poll if RCIF is Empty
			RData=RCREG;     //Copy data from RCREG register to RData char variable.
			lcd_disp(RData);  //Diaplay receive data on lcd.
			
		}	
}