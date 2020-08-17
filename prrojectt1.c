/*****************************************************
This program was produced by the
CodeWizardAVR V2.05.0 Evaluation
Automatic Program Generator
© Copyright 1998-2010 Pavel Haiduc, HP InfoTech s.r.l.
http://www.hpinfotech.com

Project : 
Version : 
Date    : 11/28/2018
Author  : Freeware, for evaluation and non-commercial use only
Company : 
Comments: 


Chip type               : ATmega32
Program type            : Application
AVR Core Clock frequency: 16.000000 MHz
Memory model            : Small
External RAM size       : 0
Data Stack size         : 512
*****************************************************/

#include <mega32.h>
#include <stdlib.h>
#include <delay.h>

// Alphanumeric LCD Module functions
#include <alcd.h>
int move = 0;
float adc_data;
float max_v = 3.99;
float min_v = 2.00;
char disp[16];

void main(void)
{
// Declare your local variables here

// Input/Output Ports initialization
// Port A initialization
// Func7=In Func6=In Func5=In Func4=In Func3=In Func2=In Func1=In Func0=In 
// State7=T State6=T State5=T State4=T State3=T State2=T State1=T State0=T 
PORTA=0x00;
DDRA=0x00;

// Port B initialization
// Func7=In Func6=In Func5=In Func4=In Func3=In Func2=In Func1=In Func0=In 
// State7=T State6=T State5=T State4=T State3=T State2=T State1=T State0=T 
PORTB=0x00;
DDRB=0x00;

// ADC initialization
// ADC Clock frequency: 1000.000 kHz
// ADC Voltage Reference: AREF pin
ADMUX=0b00000000;
ADCSRA=(1<<ADEN)|(0<<ADSC)|(0<<ADATE)|(0<<ADIF)|(0<<ADIE)|(1<<ADPS2)|(1<<ADPS1)|(1<<ADPS0);

#asm("sei")
PORTD=0x00;
DDRD=0x30;

TCCR1A=(1<<COM1A1) | (0<<COM1A0) | (1<<COM1B1) | (0<<COM1B0) | (1<<WGM11) | (0<<WGM10);
TCCR1B=(0<<ICNC1) | (0<<ICES1) | (1<<WGM13) | (1<<WGM12) | (0<<CS12) | (1<<CS11) | (0<<CS10);
ICR1H=0x9C; 
ICR1L=0x40;


// Alphanumeric LCD initialization
// Connections specified in the
// Project|Configure|C Compiler|Libraries|Alphanumeric LCD menu:
// RS - PORTB Bit 0
// RD - PORTB Bit 1
// EN - PORTB Bit 2
// D4 - PORTB Bit 4
// D5 - PORTB Bit 5
// D6 - PORTB Bit 6
// D7 - PORTB Bit 7
// Characters/line: 16
lcd_init(16);
OCR1A=2000;
OCR1B=2000;
while (1)
      { 
        delay_us(10);
        if (OCR1A==4000){
            OCR1A=2000;
            OCR1B=OCR1B+200;
        }
        if (OCR1B==4000){
            OCR1B=2000;
        }
        if(move==0)
        {
        OCR1A=OCR1A+20;
        }
        ADCSRA |= (1<<ADSC);
        while((ADCSRA&(1<<ADIF))==0); 
        adc_data=ADCW/204.8;
        if(adc_data>=max_v){
            max_v=adc_data;
            move=1;
            delay_ms(100);
        }
        else if(adc_data>min_v && adc_data<max_v)
        {
            move=0;
        }
        ftoa(adc_data,2,disp);
        lcd_gotoxy(0,0);
        lcd_puts(disp);
        delay_ms(300);
      }
}
