/*
 * File:   main.c
 * Author: Wish
 *
 * Created on 09 October 2017, 16:45
 */

#include <stdio.h>
#include <stdlib.h>
#include "uart.h"
#define LIGHT PORTCbits.RC1
/*
 *
 */
int main(int argc, char** argv)
{

    unsigned char z;
    TRISBbits.RB0=0;
    TRISCbits.RC1=0;
    LIGHT=0;
    uart_init();
    while(1)
    {
        z=uart_rx();
        if(z=='a')
        {
          pwm_on();
        }
        if(z=='b')
        {
          pwm_25();
        }
        if(z=='c')
        {
           pwm_50();
        }
        if(z=='d')
        {
          pwm_75();
        }
        if(z=='e')
        {
           pwm_off();
        }
        if(z=='f')
        {
           LIGHT=1;
        }
        if(z=='g')
        {
           LIGHT=0;
        }


    }
    return (EXIT_SUCCESS);
}

