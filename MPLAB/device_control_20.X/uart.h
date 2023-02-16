#include <stdio.h>
#include <stdlib.h>
#include "pwm.h"
unsigned char uart_rx (void);
void uart_tx (unsigned char t);
void delay(int);
void uart_init(void)
{
   TXSTA=0x20;
   SPBRG=15;
   RCSTA=0x90;
}
unsigned char uart_rx (void)
{
    unsigned char z;
    while(!PIR1bits.RCIF);
    z=RCREG;
    PIR1bits.RCIF=0;
    return(z);
}
void uart_tx (unsigned char t)
{
       TXREG=t;
        while(!PIR1bits.TXIF);
       PIR1bits.TXIF=0;

 }
void delay(int t)
{
    int i;
    for(i=0;i<=t;i++)
    {
      __delay_ms(50);
    }
}