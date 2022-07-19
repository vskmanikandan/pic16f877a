
//***********************************************
//Property off: www.microcontroller-project.com *
//Written by  : Usman Ali Butt                  *
//Date        : 19/5/2015                       *
//***********************************************

#include <htc.h>
#define _XTAL_FREQ 20000000
__CONFIG(0x1F7A);

//#define en RD7
//#define rs RD6
//#define rw RD5

#define rs RC0
#define rw RC1
#define en RC2

void delay(unsigned int time)  //Time delay function
{
unsigned int i,j;
for(i=0;i< time;i++)
for(j=0;j< 30;j++);
}

         //Function for sending values to the command register of LCD
void lcdcmd(unsigned char value)  
{
	rs = 0;
	rw = 0;
	en = 1;
	PORTB = value;
	__delay_ms(25);
	en = 0;

}
             //Function for sending values to the data register of LCD
void display(unsigned char value)  
{
	rs = 1;
	rw = 0;
	PORTB = value;
	en = 1;
	__delay_ms(100);
	en = 0;
	__delay_ms(10);


}
             //function to initialize the registers and pins of LCD
             //always use with every lcd of hitachi
void lcdint(void)         
{
TRISB=0x00;    //Port 1 is used as output port             
TRISC=0;      //Lcd Controlling pins

delay(150);
display(0x30);
delay(45);
display(0x30);
delay(30);
display(0x30);
delay(65);
lcdcmd(0x38);
delay(50);
lcdcmd(0x0C);
delay(50);
lcdcmd(0x01);
delay(50);
lcdcmd(0x06);
delay(50);
lcdcmd(0x80);
delay(50);
}


void main()
{
int i;
lcdint();

while(1){
	lcdcmd(0x01);
//	i=0;
	//char line1[]={"Mrdu Characters!"};
//	while(line1[i]!='\0')
//	{
//		display(line1[i]);
//		i++;
//	}
//	delay(100);

	lcdcmd(0x40);   //CG-RAM first address
	display(0x02);display(0x04);display(0x04);display(0x04);display(0x04);display(0x04);display(0x08);
	lcdcmd(0x40+8); //CG-RAM second address
	display(0x00);display(0x00);display(0x00);display(0x11);display(0x0E);display(0X00);display(0X04);
	lcdcmd(0x40+16);  
	display(0x00);display(0x00);display(0X11);display(0X0E);display(0x00);display(0X0A);display(0X04);
	lcdcmd(0x40+24);  
	display(0x00);display(0x0A);display(0x00);display(0x11);display(0x0E);display(0x00);display(0x00);
	lcdcmd(0x40+32);  
	display(0x04);display(0x06);display(0x06);display(0x00);display(0x11);display(0x0E);display(0x00);
	lcdcmd(0x40+40);  
	display(0x00);display(0x0A);display(0x04);display(0x11);display(0x0E);display(0x00);display(0x00);
	lcdcmd(0x40+48);  
	display(0x1F);display(0x12);display(0x14);display(0x08);display(0x14);display(0x11);display(0x04);
	lcdcmd(0x40+56);
	display(0x1F);display(0x12);display(0x14);display(0x08);display(0x16);display(0x15);display(0x04);

__delay_ms(500);  
	lcdcmd(0x80);//Jump to secod line of 16x2 lcd 
	display(0);                   //Display first character on lcd.
	lcdcmd(0x81);//Jump to second line third Matrix
	display(1);                   //Display Second Character on lcd.
	lcdcmd(0xC4);//Jump to second line fifth Matrix.
	display(2);                   //Display third character on lcd.
	lcdcmd(0xC6);
	display(3);
	lcdcmd(0xC8);
	display(4);
	lcdcmd(0xCA);
	display(5);
	lcdcmd(0xCC);
	display(6);
	lcdcmd(0xCE);
	display(7);


/*delay(100000);  //Wait for some time
delay(100000);
 
lcdcmd(0x40);
display(0x1F);display(0x12);display(0x14);display(0x08);display(0x10);display(0x12);display(0x1E);
lcdcmd(0x40+8);
display(0x04);display(0x1F);display(0x12);display(0x08);display(0x10);display(0x12);display(0x1E);
lcdcmd(0x40+16);
display(0x00);display(0x06);display(0x09);display(0x11);display(0x01);display(0x12);display(0x0c);
lcdcmd(0x40+24);
display(0x08);display(0x06);display(0x09);display(0x11);display(0x01);display(0x12);display(0x0c);
lcdcmd(0x40+32);
display(0x00);display(0x08);display(0x04);display(0x02);display(0x02);display(0x04);display(0x08);
lcdcmd(0x40+40);
display(0x04);display(0x08);display(0x04);display(0x02);display(0x02);display(0x04);display(0x08);
lcdcmd(0x40+48);
display(0x15);display(0x1F);display(0x08);display(0x07);display(0x11);display(0x0E);display(0x00);
lcdcmd(0x40+56);
display(0x04);display(0x0A);display(0x15);display(0x1F);display(0x08);
display(0x07);display(0x11);display(0x0E);

delay(5000);  
lcdcmd(0xC0);
display(0);
lcdcmd(0xC2);
display(1);
lcdcmd(0xC4);
display(2);
lcdcmd(0xC6);
display(3);
lcdcmd(0xC8);
display(4);
lcdcmd(0xCA);
display(5);
lcdcmd(0xCC);
display(6);
lcdcmd(0xCE);
display(7);

delay(100000);
delay(100000);

lcdcmd(0x40);
display(0x00);display(0x07);display(0x05);display(0x17);display(0x14);display(0x14);display(0x08);
lcdcmd(0x40+8);
display(0x02);display(0x07);display(0x05);display(0x17);display(0x14);display(0x14);display(0x08);
lcdcmd(0x40+16);
display(0x10);display(0x10);display(0x11);display(0x13);display(0x15);display(0x19);display(0x1E);
lcdcmd(0x40+24);
display(0x10);display(0x10);display(0x15);display(0x13);display(0x15);display(0x19);display(0x1E);
lcdcmd(0x40+32);
display(0x04);display(0x08);display(0x04);display(0x08);display(0x10);display(0x11),display(0x0E);
lcdcmd(0x40+40);
display(0x08);display(0x04);display(0x08);display(0x04);display(0x08);display(0x11);display(0x0E);
lcdcmd(0x40+48);
display(0x00);display(0x02);display(0x05);display(0x0A);display(0x04);display(0x11);display(0x0E);
lcdcmd(0x40+56);
display(0x00);display(0x00);display(0x01);display(0x02);display(0x04);display(0x11);display(0x0E);

delay(5000);  
lcdcmd(0xC0);
display(0);
lcdcmd(0xC2);
display(1);
lcdcmd(0xC4);
display(2);
lcdcmd(0xC6);
display(3);
lcdcmd(0xC8);
display(4);
lcdcmd(0xCA);
display(5);
lcdcmd(0xCC);
display(6);
lcdcmd(0xCE);
display(7);

delay(100000);
delay(100000);

lcdcmd(0x40);
display(0x01);display(0x01);display(0x01);display(0x01);display(0x11);display(0x11);display(0x0E);
lcdcmd(0x40+8);
display(0x1F);display(0x15);display(0x17);display(0x10);display(0x10);display(0x10);display(0x10);
lcdcmd(0x40+16);
display(0x11);display(0x11);display(0x15);display(0x11);display(0x0A);display(0x00);display(0x00);
lcdcmd(0x40+24);
display(0x04);display(0x0A);display(0x15);display(0x15);display(0x08);display(0x10);display(0x00);
lcdcmd(0x40+32);
display(0x02);display(0x05);display(0x04);display(0x03);display(0x11);display(0x11);display(0x0E);
lcdcmd(0x40+40);
display(0x00);display(0x00);display(0x01);display(0x1F);display(0x10);display(0x1F);display(0x00);

delay(5000);  
lcdcmd(0xC0);
display(' ');
lcdcmd(0xC2);
display(0);
lcdcmd(0xC4);
display(1);
lcdcmd(0xC6);
display(2);
lcdcmd(0xC8);
display(3);
lcdcmd(0xCA);
display(4);
lcdcmd(0xCC);
display(5);
lcdcmd(0xCE);
display(' ');
delay(10000);
delay(10000);*/
}
}