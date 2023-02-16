#include<stdio.h>
#include<stdlib.h>
#include"config.h"
/*
 *
 */
void pwm_25()
{
    TRISBbits.RB3=0;                     //RC1 AS O/P
    T2CON=0X00;                          //NO PRESCALER,POSTSCALER SELECTED
    CCP2CON=0X1f;                       //PWM MODE WITN 0.25 ADJUST
    PR2=99;
    TMR2=0X00;
    CCPR2L=25;
    T2CONbits.TMR2ON=1;// TIMER 2 START
    CCP1CON=0X00;
}
void pwm_50()
{
    TRISBbits.RB3=0;                    //RC1 AS O/P
    T2CON=0X00;                          //NO PRESCALER,POSTSCALER SELECTED
    CCP2CON=0X1f;                       //PWM MODE WITN 0.25 ADJUST
    PR2=99;
    TMR2=0X00;
    CCPR2L=50;
    T2CONbits.TMR2ON=1;// TIMER 2 START

}
void pwm_75()
{

    TRISBbits.RB3=0;                     //RC1 AS O/P
    T2CON=0X00;                          //NO PRESCALER,POSTSCALER SELECTED
    CCP2CON=0X1f;                       //PWM MODE WITN 0.25 ADJUST
    PR2=99;
    TMR2=0X00;
    CCPR2L=75;
    T2CONbits.TMR2ON=1;// TIMER 2 START

}
void pwm_on()
{

   TRISBbits.RB3=0;                   //RC1 AS O/P
    T2CON=0X00;                          //NO PRESCALER,POSTSCALER SELECTED
    CCP2CON=0X1f;                       //PWM MODE WITN 0.25 ADJUST
    PR2=99;
    TMR2=0X00;
    CCPR2L=99;
    T2CONbits.TMR2ON=1;// TIMER 2 START

}
void pwm_off()
{

   TRISBbits.RB3=0;                    //RC1 AS O/P
    T2CON=0X00;                          //NO PRESCALER,POSTSCALER SELECTED
    CCP2CON=0X1f;                       //PWM MODE WITN 0.25 ADJUST
    PR2=99;
    TMR2=0X00;
    CCPR2L=00;
    T2CONbits.TMR2ON=1;// TIMER 2 START

}