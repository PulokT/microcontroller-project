#include <mega32.h>
#include <delay.h>
interrupt [EXT_INT0] void ext_int0_isr(void)
{
    while((UCSRA&0x20)==0);
    UDR=1; 
    UCSRA|=0x20;
    while((UCSRA&0x40)==0);
    UCSRA|=0x40;
    delay_ms(100);        
}
interrupt [EXT_INT1] void ext_int1_isr(void)
{
    while((UCSRA&0x20)==0);
    UDR=2; 
    UCSRA|=0x20;
    while((UCSRA&0x40)==0);
    UCSRA|=0x40;
    delay_ms(100);        
}
void main(void)
{
    UCSRA=(0<<RXC) | (0<<TXC) | (0<<UDRE) | (0<<FE) | (0<<DOR) | (0<<UPE) | (0<<U2X) | (0<<MPCM);
    UCSRB=(0<<RXCIE) | (0<<TXCIE) | (0<<UDRIE) | (0<<RXEN) | (1<<TXEN) | (0<<UCSZ2) | (0<<RXB8) | (0<<TXB8);
    UCSRC=(1<<URSEL) | (0<<UMSEL) | (0<<UPM1) | (0<<UPM0) | (0<<USBS) | (1<<UCSZ1) | (1<<UCSZ0) | (0<<UCPOL);
    UBRRH=0x00;
    UBRRL=0x67;
    GICR |= (1<<INT0)| (1<<INT1);
    MCUCR |= (1<<ISC01) | (1<<ISC00)| (1<<ISC11) | (1<<ISC10);
    #asm("sei")
while (1);
}
