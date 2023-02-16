#include <stdio.h>
#include <stdlib.h>
#include "pwm.h"
unsigned char uart_rx (void);
void uart_init(void)
{
   TXSTA=0x20;
   SPBRG=31;
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