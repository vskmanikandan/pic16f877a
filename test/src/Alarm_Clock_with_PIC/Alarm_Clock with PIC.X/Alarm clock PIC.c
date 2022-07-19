/*
 * Program: Alarm Clock Using PIC   
 * Author: B.Aswinth Raj
 * More info: www.circuitdigest.com 
 * Created on 11 May, 2018, 3:02 PM
 */
#pragma config FOSC = HS        // Oscillator Selection bits (HS oscillator)
#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled)
#pragma config PWRTE = ON       // Power-up Timer Enable bit (PWRT enabled)
#pragma config BOREN = ON       // Brown-out Reset Enable bit (BOR enabled)
#pragma config LVP = OFF        // Low-Voltage (Single-Supply) In-Circuit Serial Programming Enable bit (RB3 is digital I/O, HV on MCLR must be used for programming)
#pragma config CPD = OFF        // Data EEPROM Memory Code Protection bit (Data EEPROM code protection off)
#pragma config WRT = OFF        // Flash Program Memory Write Enable bits (Write protection off; all program memory may be written to by EECON control)
#pragma config CP = OFF         // Flash Program Memory Code Protection bit (Code protection off)

#define _XTAL_FREQ 20000000 //We are running on 20MHz crystal 

//Define the LCD pins
#define RS RD2 //Reset pin of LCD
#define EN RD3 //Enable pin of LCD
#define D4 RD4 //Data bit 0 of LCD
#define D5 RD5 //Data bit 1 of LCD
#define D6 RD6 //Data bit 2 of LCD
#define D7 RD7 //Data bit 3 of LCD

//Define Buttons
#define MB RB1 //The middle button 
#define LB RB0 //Left button 
#define RB RB2 //Right button 
#define UB RB3 //Upper Button 
#define BB RB4 //Bottom button 

//Define Buzz
#define BUZZ RD1 //Buzzer is connected to RD1

/*Set the current value of date and time below*/
int sec = 00;
int min = 55;
int hour = 10;
int date = 06;
int month = 05;
int year = 18;
/*Time and Date Set*/

/*Vars for Alarm clock*/
char set_alarm = 0;
char trigger_alarm = 0;
char pos = 8;
char jump = 0;

char alarm_h0 = 0;
char alarm_h1 = 0;
char alarm_m0 = 0;
char alarm_m1 = 0;
int alarm_val[4] = {0, 0, 0, 0};
/*End of var declaration*/

#include <xc.h>
#include "lcd.h" //Header for using LCD module
#include "PIC16F877a_I2C.h" // Header for using I2C protocal
#include "PIC16F877a_DS3231.h" //Header for using DS3231 RTC module

int main() {

    TRISD = 0x00; //Make Port D pins as outptu for LCD interfacing 
    TRISB = 0xFF; //Switchs are declared as input pins
    OPTION_REG = 0b00000000; //Enable pull up Resistor on port B for switchs
    BUZZ = 0; //Turn of buzzer

    Lcd_Start(); // Initialize LCD module

    I2C_Initialize(100); //Initialize I2C Master with 100KHz clock

    //Remove the below line once time and date is set for the first time.
    Set_Time_Date(); //set time and date on the RTC module 

    //Give an intro message on the LCD
         Lcd_Clear();
         Lcd_Set_Cursor(1,1);
         Lcd_Print_String("Alarm Clock");
         Lcd_Set_Cursor(2,1);
         Lcd_Print_String(" -Circuit Digest");
         __delay_ms(1500); 

    while (1) {

        Update_Current_Date_Time(); //Read the current date and time from RTC module

        //Split the into char to display on lcd
        char sec_0 = sec % 10;
        char sec_1 = (sec / 10);
        char min_0 = min % 10;
        char min_1 = min / 10;
        char hour_0 = hour % 10;
        char hour_1 = hour / 10;


        //Display the Current Time on the LCD screen
        Lcd_Clear();
        Lcd_Set_Cursor(1, 1);
        Lcd_Print_String("TIME: ");
        Lcd_Print_Char(hour_1 + '0');
        Lcd_Print_Char(hour_0 + '0');
        Lcd_Print_Char(':');
        Lcd_Print_Char(min_1 + '0');
        Lcd_Print_Char(min_0 + '0');
        Lcd_Print_Char(':');
        Lcd_Print_Char(sec_1 + '0');
        Lcd_Print_Char(sec_0 + '0');



        //Display the Date on the LCD screen
        Lcd_Set_Cursor(2, 1);
        Lcd_Print_String("Alarm: ");
        Lcd_Print_Char(alarm_val[0] + '0');
        Lcd_Print_Char(alarm_val[1] + '0');
        Lcd_Print_Char(':');
        Lcd_Print_Char(alarm_val[2] + '0');
        Lcd_Print_Char(alarm_val[3] + '0');

        __delay_ms(50);


        //Use middle button to check if alarm has to be set 
        if (MB == 0 && set_alarm == 0) { //If middle button is pressed and alarm is not turned on 
            while (!MB); //Wait till button is released
            set_alarm = 1; //start setting alarm value 
        }
        if (MB == 0 && set_alarm == 1) { //If middle button is pressed and alarm is not turned off 
            while (!MB); //Wait till button is released
            set_alarm = 0; //stop setting alarm value 
        }


        //If alarm has to be navigate through each digit
        if (set_alarm == 1) {
            if (LB == 0) { //If left button is pressed
                while (!LB); //Wait till button is released
                pos--; //Then move the cursor to left
            }
            if (RB == 0) { //If right button is pressed 
                while (!RB); //Wait till button is released
                pos++; //Move cursor to right
            }

            if (pos >= 10) //eliminate ":" symbol if cursor reaches there
            {
                jump = 1; //Jump over the ":" symbol 
            } else
                jump = 0; //get back to normal movement


            if (UB == 0) { //If upper button is pressed
                while (!UB); //Wait till button is released
                alarm_val[(pos - 8)]++; //Increase that particular char value 
            }
            if (BB == 0) { //If lower button is pressed
                while (!UB); //Wait till button is released
                alarm_val[(pos - 8)]--; //Decrease that particular char value 
            }

            Lcd_Set_Cursor(2, pos + jump);
            Lcd_Print_Char(95); //Display "_" to indicate cursor position
        }

        //IF alarm is set Check if the set value is equal to current value 
        if (set_alarm == 0 && alarm_val[0] == hour_1 && alarm_val[1] == hour_0 && alarm_val[2] == min_1 && alarm_val[3] == min_0)
            trigger_alarm = 1; //Turn on trigger if value match

        
        if (trigger_alarm) { //If alarm is triggered 
            //Beep the buzzer
            BUZZ = 1; 
            __delay_ms(500);
            BUZZ = 0;
            __delay_ms(500);
        }

        __delay_ms(200);//Update interval 

    }

    return 0;
}