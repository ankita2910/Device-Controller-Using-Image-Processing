#include <stdio.h>
#include <stdlib.h>
#include "config.h"
/*
 *
 */
void pwm(int x)
{

    TRISAbits.RA0=0;
    TRISCbits.RC1=0;                     //RC1 AS O/P
    T2CON=0X00;                          //NO PRESCALER,POSTSCALER SELECTED
    CCP2CON=0X1f;                       //PWM MODE WITN 0.25 ADJUST
    PR2=99;
   // TMR2=0X00;
    CCPR2L=x;
    T2CONbits.TMR2ON=1;                  // TIMER 2 START
   
       PIR2bits.CCP2IF=0;
       while(PIR2bits.CCP2IF==0);  //WAIT HERE UNTIL FLAG IS NOT SET
       PORTAbits.RA0=1;
       PIR2bits.CCP2IF=0;
       T2CONbits.TMR2ON=0;
      // while(1);
    

}