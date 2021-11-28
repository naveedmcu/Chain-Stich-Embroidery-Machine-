//#define state_life
const char WELCOM[] ="WELCOM";
const char TXT_0[]  ="PRESS START BUTON";
const char TXT_1[]  ="RELAY OFF";
const char TXT_2[]  ="MOTORS OFF";
const char TXT_3[]  ="MOTORS ON ";
const char TXT_4[]  ="RELAY ON ";
const char TXT_5[]  ="CONNECT TO PC";
const char TXT_6[]  ="PRESS SAVE or";
const char TXT_7[]  ="PRESS START";
const char TXT_8[]  ="START MACHINE";

const char TXT_10[] ="SAVING START";
const char TXT_11[] ="PRESS OK ON PC";
const char TXT_12[] ="DATA RECEVED";
const char TXT_13[] ="CREAT FILE";
const char TXT_14[] ="FILE FOUNDED";

const char TXT_17[] ="NAME=";
const char TXT_18[] ="Delet File";
const char TXT_19[] ="CANCEL TO DEL";
const char TXT_20[] ="STOP MACHINE";
const char TXT_21[] ="START MACHINE";
const char press_menu[] ="PRESS MENU";
const char panel_setting[] ="PANEL_SETTING";
const char SAVING_DESIGN[] ="SAVING_DESIGN";
const char MEMORY[] ="MEMORY";
const char INFO[] = "INFORMATION";
const char start[] = "start";
const char back[] = "back";
const char del[]  ="del";
const char save[]  ="save";
const char next[]  ="next";
const char Analysis_OKAY[]  ="Analysis OKAY";
const char Analysis_Start_msg[]  ="Analysis Start";
const char colour[]  ="colour_change";
const char E_Menu[]  ="Edit_Menu";

#define Timer_0 0    //x
#define Timer_1 1    //y
#define Timer_3 3    //z

#define l_data portd
#define h_data porth

#define l_data_dir trisd
#define h_data_dir trish

#define ale_en 0
#define ale_dis 1

#define wr_en 0
#define wr_dis 1

#define rd_en 0
#define rd_dis 1
/*#define RPM_0 150    // x
#define RPM_1 15     // y*/
/*const  steps_0=1000;  //x
 const  steps_1=100;  //y*/
#define Max_Speed         120.0    // y x// 120.0=7-24-13   //80 old 80 7-3-13
//---------------------------------------
#define max_speed_z_motor 340.0 //360    //z  old value is pass 375 date april 04 2010 this is a RPM value (old value 300) (6-2-2012 value is 290.0
#define delays            280   //300  // old z value is pass 428 date april 04 2010   IN WORKING (old value 240 )//---------------------------------------

#define STEP_Z_MOTOR      100      // FREE MOVING

#define break_motor_delay_on 300      // delay value full delay not half clk=~clk
#define break_motor_delay_off 300
#define stich_counting 4
#define back_lash 1
#define MAIN_MOTOR_LO_SPPED 50
#define MAIN_MOTOR_HI_SPPED 5
#define free_Frame_pos 600


#define baud_rate 9600

// Lcd pinout settings
sbit LCD_RS at LATJ2_bit;
sbit LCD_EN at LATJ3_bit;
sbit LCD_D7 at LATJ7_bit;
sbit LCD_D6 at LATJ6_bit;
sbit LCD_D5 at LATJ5_bit;
sbit LCD_D4 at LATJ4_bit;

// Pin direction
sbit LCD_RS_Direction at TRISJ2_bit;
sbit LCD_EN_Direction at TRISJ3_bit;
sbit LCD_D7_Direction at TRISJ7_bit;
sbit LCD_D6_Direction at TRISJ6_bit;
sbit LCD_D5_Direction at TRISJ5_bit;
sbit LCD_D4_Direction at TRISJ4_bit;

 sbit dir_y at LATF.B0;
 sbit clk_y at LATF.B1;

 sbit Dir_x at LATF.B2;
 sbit clk_x at LATF.B3;

 sbit Dir_Z at LATF.B4;
 sbit clk_Z at LATF.B5;

 sbit B_Dir at LATF.B6;
 sbit B_clk at LATF.B7;

 sbit en_MAIN at LATE.B0;

 sbit relay_pin at LATE.B1;

 sbit LEFT_PIN at PORTB.B7;
 sbit RIGHT_pin at PORTB.B6;
 sbit DOWN_pin at PORTB.B5;
 sbit UP_pin at PORTB.B4;
 sbit center_pin at PORTJ.B0;

 sbit MENU_pin at PORTB.B3;
 sbit START_pin at PORTB.B2;
 sbit BACK_pin at PORTB.B1;
 sbit save_pin at PORTJ.B1;

 sbit SN_1  at PORTE.B5;
 sbit SN_2  at PORTE.B4;
 sbit SN_3  at PORTE.B3;
 sbit SN_4  at PORTE.B2;
 sbit SN_5  at PORTE.B6;

 sbit SN_1_DIR  at TRISE.B5;
 sbit SN_2_DIR  at TRISE.B4;
 sbit SN_3_DIR  at TRISE.B3;
 sbit SN_4_DIR  at TRISE.B2;
 sbit SN_5_DIR  at TRISE.B6;
 
 sbit t_pin at portE.B7;            // thread pin 1
 sbit t_pin_DIR at TRISE.B7;

 sbit t_pin_2 at portc.B1;          // thread pin2
 sbit t_pin_DIR_2 at TRISc.B1;

 sbit Main_SENSOR at PORTB.B0;
 sbit Main_SENSOR_DIR at TRISB.B0;
 sbit Main_SENSOR_2 at portc.b0;
 sbit Main_SENSOR_DIR_2 at TRISC.B0;

//*****************************************************************************
sbit rd_pin at portg.b3;
sbit wr_pin at portg.b4;

sbit rd_pin_dir at trisg.b3;
sbit wr_pin_dir at trisg.b4;


sbit ale_pin at PORTG.B0;
sbit ale_pin_dir at trisg.b0;
//pwm c2
sbit main_motor at portc.b5;
sbit main_motor_dir at trisc.b5;

sbit thread_free_clk at portc.b7;
sbit thread_free_clk_direction at trisc.b7;
sbit thread_free_dir at portc.b6;
sbit thread_free_dir_direction at trisc.b6;

 float TIME_ONE_CYCLE,TIME_HALF_CYCLE,PPT,RPM;
 float X_RPM;
 float y_RPM;
 float Z_RPM;
 float Z_DEGREE=0.0,OLD_Z_Degree=0.0;
 float RAD;
 long stich_dis=0;
 char reminder_1,reminder_2,reminder_3,reminder_4,start_now=0;
 unsigned int XX=0,YY=0,ZZ=0,LODER_VALUES=0,DIVID=0,i=0;
 unsigned int X_Distance=0,Y_Distance=0,degree=0;
 unsigned char dir=0;
 unsigned char function,old_function;
 unsigned char Timer0_H,Timer0_L,Timer1_H,Timer1_L,Timer3_L,Timer3_H,Timer_H,Timer_L;
 unsigned char monitor_1=0;
 unsigned char extra_6=0;
 unsigned char x_complite=0,y_complite=0,z_complite=0;
 unsigned char Main_shaft_ACK=0;
 unsigned short wdata;
 unsigned int wadd;
 char text11[12];
 char current_msg=1;
 char msg[64]; //declare array for txt swap area
 char start_machine_flage='N';

 unsigned char function_id_back_start;
 char loop_id='R';
 char current_speed=30,speed_riser=0;
 char back_lash_flag_x=0,back_lash_flag_y=0,old_back_lash_2flag_y=0,old_back_lash_flag_x=0;
 char back_lash_x;
 char back_lash_y;
 char break_flag=1;
 char end_of_jump='S',break_flag_internal='O';  // 'S'= START 'F'OFF 'O'=ON
 char colour_function;
 
//******************************************************************************
//******************************************************************************
 #include "built_in.h"
 #include "ex_function.c"
 #include "inter0 and timer0.c"
 #include "Timer1.c"
 #include "Timer3.c"
 #include "Other Function.c"
 #include "EXT_INTO.c"

  #include "back_machine.c"
 #include "main_menu.c"
 #include "machine_start_fun.c"
//******************************************************************************
//******************************************************************************
void main()
{
 char daa=0;
 initial_main();
 RELAY_ON();
 EN_On();
 break_on();
/*
 while(1)
 {
  thread_free();
  delay_ms(1000);
  thread_tight();
  delay_ms(1000);
 }
 */
/*
 while(1)
 {
  dir_y=0;
  for(i=0;i<50;i++)
  {
   delay_ms(250);
   clk_y=0;
   delay_ms(250);
   clk_y=1;
  }
  dir_y=1;
  for(i=0;i<50;i++)
  {
   delay_ms(250);
   clk_y=0;
   delay_ms(250);
   clk_y=1;
  }
 }
 */
 
 
 delay_ms(500);
 RELAY_OFF();
 EN_OFF();
 CLS();

 //*********
/*
 RELAY_On();
 EN_On();
 while(1)
 {
 break_on();
 delay_ms(500);
 break_off();
 delay_ms(500);
 }
 */
 //*********

 LCD_OUT(1,5,CopyConst2Ram(MSG,WELCOM));
 DELAY_MS(2000);
 CLS();
 LCD_OUT(1,1,CopyConst2Ram(MSG,TXT_1));
 LCD_OUT(2,1,CopyConst2Ram(MSG,TXT_2));
 LCD_OUT(1,21,CopyConst2Ram(MSG,press_menu));
 delay_ms(500);

 daa=Uart2_read();
 daa=Uart2_read();

 UART2_WRITE('O');
 for (i=0;i<1000;i++)
 {
  if(UART2_Data_Ready())
    {
     daa=Uart2_read();
     if (daa=='O')
     lcd_ouT(1,1,"Connection OK");
     else
     lcd_ouT(1,1,"Connection Fail");
     break;
    }
 }
     delay_ms(5000);
     cls();

 display_mesg(1);


 
 while(1)
  {
   menu_main_1();
   if (start_machine_flage=='Y')
    {
      start_machine_flage='N';
      cls();
      lcd_ouT(1,1,CopyConst2Ram(MSG,Analysis_Start_msg));
      if (ANALYSIS_START()=='K')
        {
         cls();
         lcd_out(1,1,CopyConst2Ram(MSG,Analysis_OKAY));
          while(1)
          {
            LCD_OUT(2,17,CopyConst2Ram(MSG,start));
            LCD_OUT(2,32-4,CopyConst2Ram(MSG,back));
             if (start_button()==0)
            {
             relay_on();
             en_on();
             delay_ms(10);
             Sn_4_reached();
             cls();
             delay_ms(1);
             PWM1_Set_Duty(MAIN_MOTOR_LO_SPPED);
             machine_started();  // machine started
             display_mesg(1);
             PWM1_Set_Duty(255);
             Disable_intR();
             OLD_FUNCTION=224;
             OLD_Z_Degree=270.0;
             break;

            }
            else if (back_button()==0)
            {
             cls();
             display_mesg(1);
             break;
            }
          }
       }
      else
      {
       cls();
       lcd_out(1,1,"BAD SECTOER");
       while(ok_button()==1);
       cls();
       display_mesg(1);
      }
    }
  }
}
//******************************************************************************

void interrupt ()   iv 0x000008
{
//********************************** Timer 0 initial ***************************
  static char monitor_2 =0;
 if (INTCON & (1<<TMR0IE)){
    if(INTCON & (1<<TMR0IF))
    {
      INTCON&=~(1<<TMR0IF);
      if (XX==0)
      {
       T0CON&=~(1<<TMR0ON); // timer0 off
       x_complite=1;
      }
      if (clk_X==1)
      {
        clk_x=0;
      }
      else
      {
       clk_x=1;
       XX--;
      }
      TMR0H = Timer0_H;    // preset for Timer0 MSB register
      TMR0L = Timer0_L;    // preset for Timer0 LSB register
    }
  }
//************************************ Timer1 initial **************************
  if (PIE1.TMR1IE==1)
  {
    if (PIR1.TMR1IF==1)
    {
      PIR1.TMR1IF=0;
      if (YY==0)
        {
          T1CON.TMR1ON=0; // off timer 1
          y_complite=1;
        }
      if (clk_Y==1)
      {
        clk_Y=0;
      }
      else
      {
       clk_Y=1;
       YY--;
      }
      TMR1H = Timer1_H;    // preset for Timer0 MSB register
      TMR1L = Timer1_L;    // preset for Timer0 LSB register
    }
  }
//*************************************** Timer 3 initial **********************
/*
  if (PIE2.TMR3IE==1)
  {
   if (PIR2.TMR3IF==1)
     {
      PIR2.TMR3IF=0;

      if (ZZ==0)
      {
       T3CON.TMR3ON=0;     //off timer
       Z_complite=1;
      }
      if (clk_z==1)
      {
       clk_z=0;
      }
      else
        {
         ZZ--;
         clk_z=1;
         if (monitor_1==1)
         {
          monitor_2=1;
         }
         if (SN_1==1 && SN_2==1 && SN_3==1  && SN_4==1 && monitor_1==0)
         {
          monitor_1=1;
         }
        else if (monitor_2==1)
         {
          if (SN_1==0 || SN_2==0 || SN_3==0  || SN_4==0)
          {
           monitor_2=0;
           monitor_1=0;
           ZZ=0;
          }
         }
       }
      TMR3H = Timer3_H;       // preset for timer3 MSB register
      TMR3L = Timer3_L;       // preset for timer3 LSB register
     }
  }
*/
  if (PIE2.TMR3IE==1)
  {
   if (PIR2.TMR3IF==1)
     {
      PIR2.TMR3IF=0;

      if (ZZ==0)
      {
       T3CON.TMR3ON=0;     //off timer
       Z_complite=1;
      }
      if (clk_z==1)
      {
       clk_z=0;
      }
      else
        {
         clk_z=1;
         ZZ--;
         if (SN_1==1 && SN_2==1 && SN_3==1  && SN_4==1 && monitor_1==0)
         {
          monitor_1=1;
         }
        else if (monitor_1==1)
         {
          if (SN_1==0 || SN_2==0 || SN_3==0  || SN_4==0)
          {
           monitor_1=0;
           ZZ=0;
          }
         }
       }
      TMR3H = Timer3_H;       // preset for timer3 MSB register
      TMR3L = Timer3_L;       // preset for timer3 LSB register
     }
  }

//______________________________________________________________________INT0 ISR
 if (INTCON & (1<<INT0IE))
 {
  if (INTCON & (1<<INT0IF))
  {
   INTCON&=~(1<<INT0IF);
   Main_shaft_ACK=255;
   portb.b7=~portb.b7;
//   INTCON&=~(1<<INT0IE);
  }
 }
}