/* 
 * File:   main.c
 * Author: Wish
 *
 * Created on 09 October 2017, 16:45
 */

#include <stdio.h>
#include <stdlib.h>
#include "uart.h"
#define FAN PORTBbits.RB0
#define LIGHT PORTBbits.RB1
/*
 * 
 */
int main(int argc, char** argv)
{

    unsigned char z;
    TRISBbits.RB0=0;
    TRISBbits.RB1=0;
    
    uart_init();
    while(1)
    {
        z=uart_rx();
        if(z=='a')
        {
            FAN=1;
        }
          if(z=='b')
        {
            FAN=0;
        }
        if(z=='c')
        {
            LIGHT=1;
        }
         if(z=='d')
        {
            LIGHT=0;
        }


    }
    return (EXIT_SUCCESS);
}

