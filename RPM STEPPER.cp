#line 1 "D:/Other Data/Mian Hard Drive/Partition no 2/Embedded firmware and Electronic +wilcom design/Program/CHAIN MACHINE OS FILES/V1.6/RPM STEPPER.c"

const char WELCOM[] ="WELCOM";
const char TXT_0[] ="PRESS START BUTON";
const char TXT_1[] ="RELAY OFF";
const char TXT_2[] ="MOTORS OFF";
const char TXT_3[] ="MOTORS ON ";
const char TXT_4[] ="RELAY ON ";
const char TXT_5[] ="CONNECT TO PC";
const char TXT_6[] ="PRESS SAVE or";
const char TXT_7[] ="PRESS START";
const char TXT_8[] ="START MACHINE";

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
const char del[] ="del";
const char save[] ="save";
const char next[] ="next";
const char Analysis_OKAY[] ="Analysis OKAY";
const char Analysis_Start_msg[] ="Analysis Start";
const char colour[] ="colour_change";
const char E_Menu[] ="Edit_Menu";
#line 80 "D:/Other Data/Mian Hard Drive/Partition no 2/Embedded firmware and Electronic +wilcom design/Program/CHAIN MACHINE OS FILES/V1.6/RPM STEPPER.c"
sbit LCD_RS at LATJ2_bit;
sbit LCD_EN at LATJ3_bit;
sbit LCD_D7 at LATJ7_bit;
sbit LCD_D6 at LATJ6_bit;
sbit LCD_D5 at LATJ5_bit;
sbit LCD_D4 at LATJ4_bit;


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

 sbit SN_1 at PORTE.B5;
 sbit SN_2 at PORTE.B4;
 sbit SN_3 at PORTE.B3;
 sbit SN_4 at PORTE.B2;
 sbit SN_5 at PORTE.B6;

 sbit SN_1_DIR at TRISE.B5;
 sbit SN_2_DIR at TRISE.B4;
 sbit SN_3_DIR at TRISE.B3;
 sbit SN_4_DIR at TRISE.B2;
 sbit SN_5_DIR at TRISE.B6;

 sbit t_pin at portE.B7;
 sbit t_pin_DIR at TRISE.B7;

 sbit t_pin_2 at portc.B1;
 sbit t_pin_DIR_2 at TRISc.B1;

 sbit Main_SENSOR at PORTB.B0;
 sbit Main_SENSOR_DIR at TRISB.B0;
 sbit Main_SENSOR_2 at portc.b0;
 sbit Main_SENSOR_DIR_2 at TRISC.B0;


sbit rd_pin at portg.b3;
sbit wr_pin at portg.b4;

sbit rd_pin_dir at trisg.b3;
sbit wr_pin_dir at trisg.b4;


sbit ale_pin at PORTG.B0;
sbit ale_pin_dir at trisg.b0;

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
 char msg[64];
 char start_machine_flage='N';

 unsigned char function_id_back_start;
 char loop_id='R';
 char current_speed=30,speed_riser=0;
 char back_lash_flag_x=0,back_lash_flag_y=0,old_back_lash_2flag_y=0,old_back_lash_flag_x=0;
 char back_lash_x;
 char back_lash_y;
 char break_flag=1;
 char end_of_jump='S',break_flag_internal='O';
 char colour_function;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/built_in.h"
#line 1 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/ex_function.c"
const char e0[] ="OK_PRESS";
const char TXT_15[] ="OK";
const char TXT_16[] ="        ";
const char zero[] ="zero";

char * CopyConst2Ram(char * dest, const char * src){
 char * d ;
 d = dest;
 for(;*dest++ = *src++;);

 return d;
}

void LCD_OK_DIS()
{
 LCD_OUT(2,21,CopyConst2Ram(MSG,TXT_16));
 lcd_out(2,21,CopyConst2Ram(MSG,TXT_15));
 delay_ms(500);
 LCD_OUT(2,21,CopyConst2Ram(MSG,TXT_16));
}

void en_on()
{
 en_MAIN=1;
 main_motor=1;
}
void en_off()
{
 en_MAIN =0;
 main_motor=0;
}
void relay_off()
{
 relay_pin=0;
}
void relay_on()
{
 relay_pin=1;
 DELAY_MS(10);
}

void cls()
{
 Lcd_Cmd(_LCD_CLEAR);
}


char right_button()
{
 if (Button(&PORTB, 6, 1, 0)==255)
 {
 return 0;
 }
 else
 return 1;
}
char left_button()
{
 if (Button(&PORTB, 7, 1, 0)==255)
 {
 return 0;
 }
 else
 return 1;
}
char down_button()
{
 if (Button(&PORTB, 5, 1, 0)==255)
 {
 return 0;
 }
 else
 return 1;
}

char up_button()
{
 if (Button(&PORTB, 4, 1, 0)==255)
 {
 return 0;
 }
 else
 return 1;
}
char CENTOR_button()
{
 if (Button(&PORTJ, 0, 1, 0)==255)
 {
 return 0;
 }
 else
 return 1;
}
char save_button()
{
 if (Button(&PORTJ, 1, 1, 0)==255)
 {
 return 0;
 }
 else
 return 1;
}
char back_button()
{
 if (Button(&PORTB, 1, 1, 0)==255)
 {
 return 0;
 }
 else
 return 1;
}
char OK_button()
{
 lcd_out(2,21,CopyConst2Ram(MSG,e0));
 if (Button(&PORTB, 3, 1, 0)==255)
 {
 LCD_OK_DIS();
 return 0;
 }
 else
 return 1;
}
char OK_button_1()
{
 if (Button(&PORTB, 3, 1, 0)==255)
 {
 return 0;
 }
 else
 return 1;
}
char start_button()
{
 if (Button(&PORTB, 2, 1, 0)==255)
 {
 return 0;
 }
 else
 return 1;
}

void thread_free()
{
 unsigned int thread_counter=0;
 thread_free_dir=0;
 for (thread_counter=0;thread_counter<25;thread_counter++)
 {
 delay_ms(1);
 thread_free_clk=1;
 delay_ms(1);
 thread_free_clk=0;
 }
}
void thread_tight()
{
 unsigned int thread_counter=0;
 thread_free_dir=1;
 for (thread_counter=0;thread_counter<25;thread_counter++)
 {
 delay_ms(1);
 thread_free_clk=1;
 delay_ms(1);
 thread_free_clk=0;
 }
}

void break_on()
{
 static int b_counter=0;
 b_dir=0;
 b_clk=0;
 for(b_counter=0;b_counter<175;b_counter++)
 {
 b_clk=~b_clk;
 delay_us( 300 );
 }
 thread_free();
}

void break_off()
{
 unsigned int b_counter=0;
 thread_tight();
 b_dir=1;
 b_clk=0;
 for(b_counter=0;b_counter<175;b_counter++)
 {
 b_clk=~b_clk;
 delay_us( 300 );
 }
}

void thread_pick()
 {
 break_off();
 delay_us(1);
 break_on();
 }


const char character[] = {8,4,2,31,2,4,8,0};
void CustomChar(char pos_row, char pos_char) {
 char i;
 Lcd_Cmd(64);
 for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
 Lcd_Cmd(_LCD_RETURN_HOME);
 Lcd_Chr(pos_row, pos_char, 0);
}

void display_mesg(char position_of_cursor)
 {
 if (position_of_cursor==1)
 {
 current_msg=1;
 }
 else if (position_of_cursor==2)
 {
 current_msg=2;
 }
 else if (position_of_cursor==3)
 {
 current_msg=3;
 }
 else if (position_of_cursor==4)
 {
 current_msg=4;
 }
 cls();
 if (position_of_cursor==3)
 {
 CustomChar(1,21);
 }
 else if (position_of_cursor==4)
 {
 CustomChar(2,21);
 }
 else CustomChar(position_of_cursor,1);
 LCD_OUT(1,2,CopyConst2Ram(MSG,panel_setting));
 LCD_OUT(2,2,CopyConst2Ram(MSG,SAVING_DESIGN));
 LCD_OUT(1,22,CopyConst2Ram(MSG,MEMORY));
 LCD_OUT(2,22,CopyConst2Ram(MSG,INFO));
 }

void move_errow_down(char y)
 {
 LCD_OUT(1,1," ");
 LCD_OUT(2,1," ");
 LCD_OUT(1,21," ");
 LCD_OUT(2,21," ");
#line 257 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/ex_function.c"
 if (y==3)
 {
 CustomChar(1,21);
 }
 else if (y==4)
 {
 CustomChar(2,21);
 }
 else
 CustomChar(Y,1);
 }

void back_display()
{
 LCD_OUT(2,40-4,CopyConst2Ram(MSG,back));
}
void Edit_Menu_dis()
{
 LCD_OUT(2,21,CopyConst2Ram(MSG,E_Menu));
}
#line 1 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/inter0 and timer0.c"

void disable_intr();
void Enable_intr();

void INT0_EDG(char x);
void EXT0INT(char x);

void TIMER0_EN(char x);
void timer0onOFF(char x);
void timer0_Intit();


void INT0_EDG(char x) {
 if (x==0) {
 INTCON2.INTEDG0=0;
 }
 if (x==1) {
 INTCON2.INTEDG0=1;
 }
}

void Enable_intr(){
 INTCON|=(1<<GIEH)|(1<<GIEL);
}

void disable_intr(){
 INTCON&=~(1<<GIEH)|(1<<GIEL);
}

void EXT0INT(char x){
 if (x==1){
 INTCON|=(1<<INT0IE);
 }
 if (x==0){
 INTCON&=~(1<<INT0IE);
 }
}

void TIMER0_EN(char x)
{
 if (x==0){
 INTCON&=~(1<<TMR0IE);
 }
 if (x==1){
 INTCON|=(1<<TMR0IE);
 }
}
#line 58 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/inter0 and timer0.c"
void Timer0_ON(){
 T0CON|=(1<<TMR0ON);
}

void Timer0_Off(){
 T0CON&=~(1<<TMR0ON);
}

void timer0_Intit() {

 T0CON.TMR0ON = 0;
 T0CON.T08BIT = 0;
 T0CON.T0CS = 0;
 T0CON.T0SE = 0;
 T0CON.PSA = 1;
 T0CON.T0PS2 = 0;
 T0CON.T0PS1 = 0;
 T0CON.T0PS0 = 0;
 TMR0H = Timer0_h;
 TMR0L = Timer0_l;
}
#line 1 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/timer1.c"
void Timer1_init();
void Timer1_ON();
void Timer1_OFF();
void TIMER1_CLEAR_FLAG();
void Timer1_Enable();
void Timer1_Disable();

void Timer1_init()
{


 PIR1.TMR1IF=0;
 PIE1.TMR1IE=0;
 T1CON.RD16=1;
 IPR1.TMR1IP=1;
 T1CON.T1CKPS1 = 0;
 T1CON.T1CKPS0 = 0;
 T1CON.T1OSCEN = 0;
 T1CON.T1SYNC = 1;
 T1CON.TMR1CS = 0;
 T1CON.TMR1ON = 0;
 TMR1H = 0xF7;
 TMR1L = 0xE0;

}

void Timer1_ON()
{
 T1CON.TMR1ON = 1;
}
void Timer1_OFF()
{
 T1CON.TMR1ON = 0;
}

void Timer1_Enable()
{
 PIE1.TMR1IE=1;
}
void Timer1_Disable()
{
 PIE1.TMR1IE=0;
}

void TIMER1_CLEAR_FLAG()
{
 PIR1.TMR1IF=0;
}
#line 1 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/timer3.c"
void timer3_init();
void timer3_on();
void timer3_off();
void timer3_enable();
void timer3_DISABLE();
void Timer3_flag_clear();

void timer3_on(){
 T3CON.TMR3ON = 1;
}
void timer3_off(){
 T3CON.TMR3ON = 0;
}

void timer3_enable(){
 PIE2.TMR3IE=1;
}
void timer3_DISABLE(){
 PIE2.TMR3IE=0;
}

void Timer3_flag_clear(){
 PIR2.TMR3IF=0;
}

void timer3_init(){


IPR2.TMR3IP=1;
T3CON.RD16=1;
PIR2.TMR3IF=0;

T3CON.T3CKPS1 = 0;
T3CON.T3CKPS0 = 0;
T3CON.T3SYNC = 0;
T3CON.TMR3CS = 0;
T3CON.TMR3ON = 0;
TMR3H = 0x0;
TMR3L = 0x0;
}
#line 1 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/other function.c"
const char TXT_9[] ="STICH SAVE";
const char TXT_22[] ="CONNECTED..";
unsigned char f_r='F' ,back_start ='S';
unsigned char f_r_main='F';


void RPM_set(unsigned char Timer_Name)
 {
 if (Timer_Name==0)
 {
 rpm=X_RPM;
 }
 else if (Timer_Name==1)
 {
 rpm=Y_RPM;
 }
 else if (Timer_Name==3){
 rpm=Z_RPM;
 }
 if (RPM!=0.0)
 {


 PPT=(RPM*400.0/60.0);


 TIME_ONE_CYCLE=1.0/PPT;
 TIME_HALF_CYCLE=TIME_ONE_CYCLE/2.0;
 TIME_HALF_CYCLE*=1000000.0;
 TIME_HALF_CYCLE/=0.1;
 LODER_VALUES=TIME_HALF_CYCLE;
 LODER_VALUES-=3;
 LODER_VALUES=65536-LODER_VALUES;
 DIVID=LODER_VALUES;

 reminder_1= DIVID % 16;
 DIVID=DIVID/16;
 reminder_2= DIVID % 16;
 DIVID/=16;
 reminder_3= DIVID % 16;
 DIVID/=16;
 reminder_4= DIVID % 16;

 reminder_2 <<=4;
 reminder_4 <<=4;

 Timer_H=reminder_4 | reminder_3;
 Timer_L=reminder_2 | reminder_1;

 if (Timer_Name==0)
 {
 Timer0_L=Timer_L;
 Timer0_H=Timer_H;
 TMR0H =Timer0_H;
 TMR0L =Timer0_L;
 }
 else if (Timer_Name==1)
 {
 Timer1_L=Timer_L;
 Timer1_H=Timer_H;
 TMR1H =Timer1_H;
 TMR1L =Timer1_L;
 }
 else if (Timer_Name==3)
 {
 Timer3_L=Timer_L;
 Timer3_H=Timer_H;
 TMR3H =Timer3_H;
 TMR3L =Timer3_L;
 }
 }
}

void Get_RPM()
{
 X_distance*=2;
 Y_distance*=2;
 if (X_distance==0)
 {
 Y_RPM= 120.0 ;
 X_RPM=0.0;
 }
 else if(Y_distance==0)
 {
 X_RPM= 120.0 ;
 Y_RPM=0.0;
 }
 else if (Y_Distance==X_distance)
 {
 Y_RPM= 120.0 ;
 X_RPM= 120.0 ;
 }
 else if (X_Distance > y_distance)
 {
 X_RPM= 120.0 ;
 Y_RPM=( 120.0 *y_distance)/X_Distance;
 }
 else if (Y_Distance > X_distance)
 {
 Y_RPM= 120.0 ;
 X_RPM=( 120.0 *X_distance)/Y_Distance;
 }
 if (degree!=0)
 {
 Z_RPM= 340.0 ;
 }
 else Z_RPM=0.0;
}


void X_Dir_P()
 {

 if (f_r == 'F')
 {
 Dir_X=1;
 }
 else if (f_r == 'R')
 {
 Dir_X=0;
 }

 }

void X_Dir_N()
 {

 if (f_r == 'F')
 {
 Dir_X=0;
 }
 else if (f_r == 'R')
 {
 Dir_X=1;
 }

 }

void Y_Dir_P()
 {

 if (f_r == 'F')
 {
 Dir_Y=1;
 }
 if (f_r == 'R')
 {
 Dir_Y=0;
 }

 }

void Y_Dir_N()
 {

 if (f_r == 'F')
 {
 Dir_Y=0;
 }
 if (f_r == 'R')
 {
 Dir_Y=1;
 }

 }

 void Z_DIR_CCW()
 {
 Dir_Z=0;
 }

 void Z_DIR_CW()
 {
 Dir_Z=1;
 }

float get_atan(float Y_Distance,float X_Distance)
{
 volatile float rad_1;
 rad_1=Y_Distance/X_Distance;
 rad_1=(atan(rad_1))*57.295779;
 return rad_1;
 }

char function_chk(char function_id)
{


 if (function_id==0 && end_of_jump=='S')
 {
 if (break_flag_internal=='O')
 {
 break_flag_internal='F';
 if (back_start=='S')
 {
 break_off();
 }
 }
 end_of_jump='S';
 return function_id;
 }

 else if (function_id==1 )
 {
 if (break_flag_internal=='F')
 {
 break_flag_internal='O';
 if ( back_start=='S')
 {
 break_on();
 }
 }
 end_of_jump='J';
 return function_id;
 }

 else if(function_id==0 && end_of_jump=='J')
 {
 end_of_jump='S';
 return 1;
 }
 else if (function_id==0X0B||function_id==0X0C|| function_id==0X0D ||
 function_id==0X0E|| function_id==0X0F)
 {
 break_on();
 break_flag_internal='O';
 return 2;
 }
}




char GET_DEGREE()
{
 static char function_id=0;

 function_id=function & 0x0F;

 if (function==128||function==129||function==136||function==137||function==138)
 {
 if (X_Distance==0)
 {
 Z_Degree=90.0;
 }
 else if (Y_Distance==0)
 {
 Z_Degree=0.0;
 }
 else
 {
 Z_Degree=get_atan(Y_Distance,X_Distance);
 }
 }

 else if (function==160||function==161||function==168||function==169||function==170)
 {
 if (X_Distance==0)
 {
 Z_Degree=90.0;
 }
 else if (Y_Distance==0)
 {
 Z_Degree=180.0;
 }
 else
 {
 rad=get_atan(Y_Distance,X_Distance);
 Z_Degree=180.0-rad;
 }
 }

 else if (function==224||function==225||function==232||function==233||function==234)
 {
 if (X_Distance==0)
 {
 Z_Degree=270.0;
 }
 else if (Y_Distance==0)
 {
 Z_Degree=180.0;
 }
 else
 {
 rad=get_atan(Y_Distance,X_Distance);
 Z_Degree=rad+180.0;
 }
 }

 else if (function==192||function==193||function==200||function==201||function==202)
 {
 if (X_Distance==0)
 {
 Z_Degree=270.0;
 }
 else if (Y_Distance==0)
 {
 Z_Degree=360.0;
 }
 else
 {
 rad=get_atan(Y_Distance,X_Distance);
 Z_Degree=360.0-rad;
 }
 }



 if (function==128 ||function==129||function==136||function==137||function==138)
 {
 if (old_function==224||old_function==225||old_function==232||old_function==233||old_function==234)
 {
 old_function=function;
 rad=OLD_Z_Degree-Z_Degree;
 OLD_Z_Degree=Z_Degree;
 if (rad<=180.0)
 {
 rad=90.0-Z_Degree;
 Z_Degree=rad;
 rad=Z_Degree;
 degree=rad;
 dir=0x22;
 Z_DIR_CW();
 }
 else if (rad>180.0)
 {
 rad=Z_Degree;
 rad=floor(Z_Degree);
 degree=rad;
 dir=0x11;
 Z_DIR_CCW();
 }
 rad=Z_Degree;
 degree=rad;
 }
 else if (old_function==192||old_function==193||old_function==200||old_function==201||old_function==202)
 {
 old_function=function;
 OLD_Z_Degree=Z_Degree;
 rad=floor(Z_Degree);
 degree=rad;
 dir=0x11;
 Z_DIR_CCW();
 }
 else if (old_function==160||old_function==161||old_function==168||old_function==169||old_function==170)
 {
 old_function=function;
 rad=90.0-Z_Degree;
 OLD_Z_Degree=Z_Degree;
 Z_Degree=rad;
 rad=Z_Degree;
 degree=rad;
 dir=0x22;
 Z_DIR_CW();
 }
 else if (old_function==128||old_function==129||old_function==136||old_function==137||old_function==138)
 {
 old_function=function;
 if (OLD_Z_Degree>=Z_Degree)
 {
 rad=OLD_Z_Degree-Z_Degree;
 OLD_Z_Degree=Z_Degree;
 dir=0X02;
 Z_DIR_CW();
 }
 else if(OLD_Z_Degree<Z_Degree)
 {
 rad=Z_Degree-OLD_Z_Degree;
 OLD_Z_Degree=Z_Degree;
 dir=0X01;
 Z_DIR_CCW();
 }
 Z_Degree=rad;
 rad=Z_Degree;
 degree=rad;
 }
 }

 else if (function==160||function==161||function==168||function==169||function==170)
 {
 if (old_function==224||old_function==225||old_function==232||old_function==233||old_function==234)
 {
 old_function=function;
 rad=180.0-Z_Degree;
 OLD_Z_Degree=Z_Degree;
 Z_Degree=rad;
 rad=Z_Degree;
 degree=rad;
 dir=0x32;
 Z_DIR_CW();
 }
 else if (old_function==192||old_function==193||old_function==200||old_function==201||old_function==202)
 {
 old_function=function;
 rad=OLD_Z_Degree-Z_Degree;
 OLD_Z_Degree=Z_Degree;
 if (rad<=180.0)
 {
 Z_Degree=180.0-Z_Degree;
 dir=0x32;
 Z_DIR_CW();
 }
 else if (rad>180.0)
 {
 Z_Degree=Z_Degree-90.0;
 dir=0x21;
 Z_DIR_CCW();
 }
 rad=Z_Degree;
 degree=rad;
 }
 else if (old_function==160||old_function==161||old_function==168||old_function==169||old_function==170)
 {
 old_function=function;
 if (OLD_Z_Degree>=Z_Degree)
 {
 rad=OLD_Z_Degree-Z_Degree;
 dir=0x02;
 Z_DIR_CW();
 }
 else if(OLD_Z_Degree<Z_Degree)
 {
 rad=Z_Degree-OLD_Z_Degree;
 dir=0x01;
 Z_DIR_CCW();
 }
 OLD_Z_Degree=Z_Degree;
 Z_Degree=rad;
 rad=Z_Degree;
 degree=rad;
 }
 else if (old_function==128||old_function==129||old_function==136||old_function==137||old_function==138)
 {
 old_function=function;
 OLD_Z_Degree=Z_Degree;
 Z_Degree=Z_Degree-90.0;
 rad=Z_Degree;
 degree=rad;
 dir=0x21;
 Z_DIR_CCW();
 }
}

 else if (function==224||function==225||function==232||function==233||function==234)
 {
 if (old_function==192||old_function==193||old_function==200||old_function==201||old_function==202)
 {
 old_function=function;
 OLD_Z_Degree=Z_Degree;
 Z_Degree=270.0-Z_Degree;
 rad=Z_Degree;
 degree=rad;
 dir=0x42;
 Z_DIR_CW();
 }

 else if (old_function==128||old_function==129||old_function==136||old_function==137||old_function==138)
 {
 old_function=function;
 rad=Z_Degree-OLD_Z_Degree;
 OLD_Z_Degree=Z_Degree;
 if (rad<=180.0)
 {
 Z_Degree=Z_Degree-180.0;
 dir=0x31;
 Z_DIR_CCW();
 }
 else if (rad>180.0)
 {
 Z_Degree=270.0-Z_Degree;
 dir=0x42;
 Z_DIR_CW();
 }
 rad=Z_Degree;
 degree=rad;
 }

 else if (old_function==224||old_function==225||old_function==232||old_function==233||old_function==234)
 {
 old_function=function;
 if (OLD_Z_Degree>=Z_Degree)
 {
 rad=OLD_Z_Degree-Z_Degree;
 dir=0x02;
 Z_DIR_CW();
 }
 else if(OLD_Z_Degree<Z_Degree)
 {
 rad=Z_Degree-OLD_Z_Degree;
 dir=0x01;
 Z_DIR_CCW();
 }
 OLD_Z_Degree=Z_Degree;
 Z_Degree=rad;
 rad=Z_Degree;
 degree=rad;
 }

 else if (old_function==160||old_function==161||old_function==168||old_function==169||old_function==170)
 {
 old_function=function;
 OLD_Z_Degree=Z_Degree;
 Z_Degree=Z_Degree-180.0;
 rad=Z_Degree;
 degree=rad;
 dir=0x31;
 Z_DIR_CCW();
 }
 }

 else if(function==192||function==193||function==200||function==201||function==202)
 {
 if (old_function==128||old_function==129||old_function==136||old_function==137||old_function==138)
 {
 old_function=function;
 OLD_Z_Degree=Z_Degree;
 Z_Degree=360.0-Z_Degree;
 rad=Z_Degree;
 degree=rad;
 dir=0x12;
 Z_DIR_CW();
 }
 else if (old_function==160||old_function==161||old_function==168||old_function==169||old_function==170)
 {
 old_function=function;
 rad=Z_Degree-OLD_Z_Degree;
 OLD_Z_Degree=Z_Degree;
 if (rad<=180.0)
 {
 Z_Degree=Z_Degree-270.0;
 dir=0x41;
 Z_DIR_CCW();
 }
 else if (rad>180.0)
 {
 Z_Degree=360.0-Z_Degree;
 dir=0x12;
 Z_DIR_CW();
 }
 rad=Z_Degree;
 degree=rad;
 }
 else if (old_function==192||old_function==193||old_function==200||old_function==201||old_function==202)
 {
 old_function=function;
 if (OLD_Z_Degree>=Z_Degree)
 {
 rad=OLD_Z_Degree-Z_Degree;
 OLD_Z_Degree=Z_Degree;
 dir=0x02;
 Z_DIR_CW();
 }
 else if(OLD_Z_Degree<Z_Degree)
 {
 rad=Z_Degree-OLD_Z_Degree;
 OLD_Z_Degree=Z_Degree;
 dir=0x01;
 Z_DIR_CCW();
 }
 Z_Degree=rad;
 rad=Z_Degree;
 degree=rad;
 }
 else if (old_function==224||old_function==225||old_function==232||old_function==233||old_function==234)
 {
 old_function=function;
 rad=Z_Degree-270.0;
 OLD_Z_Degree=Z_Degree;
 Z_Degree=rad;
 rad=Z_Degree;
 degree=rad;
 dir=0x41;
 Z_DIR_CCW();
 }
 }
 function_id =function_chk(function_id);
 return function_id;
}




void writ_data(unsigned long wadd, unsigned char wdata)
{
 rd_pin= 1 ;
 uart2_write( ((char *)&wadd)[0] );
}


unsigned short read_data(unsigned long wadd)
{
 unsigned char rdata;
  trisd =0;
 rd_pin= 1 ;
 wr_pin= 1 ;

  portd = ((char *)&wadd)[0] ;
  porth = ((char *)&wadd)[1] ;
 ale_pin=1;
 ale_pin=0;

  trisd =255;
 rd_pin= 0 ;
 rdata=portd;
 rd_pin= 1 ;
 return rdata;
}



void GET_DATA()
 {
 char function_name=0;

 if (f_r =='F')
 {
 if (read_data(WADD)!=248)
 {
 function=read_data(WADD);
 function_name = function & 0xF0;


 if (function_name==0x80|| function_name==0xA0|| function_name==0xC0|| function_name==0xE0)
 {
 if (function_name==0x80)
 {


 X_Dir_N();
 Y_Dir_N();
 }
 else if (function_name==0xA0)
 {


 X_Dir_P();
 Y_Dir_N();
 }
 else if (function_name==0xC0)
 {


 X_Dir_N();
 Y_Dir_P();
 }
 else if (function_name==0xE0)
 {


 X_Dir_P();
 Y_Dir_P();
 }



 WADD++;
 Y_distance=read_data(WADD);




 WADD++;
 X_distance=read_data(WADD);


 WADD++;
 }
 }

 else
 {
 function=read_data(WADD);

 }
 }

 else if (f_r=='R')
 {
 if (WADD != 513 )
 {
 if (f_r=='R')
 {

 WADD--;
 X_distance=read_data(WADD);
 }
 if (f_r=='R')
 {

 WADD--;
 Y_distance=read_data(WADD);
 }

 WADD--;
 if (read_data(WADD)!=248)
 {
 function=read_data(WADD);
 function_name = function & 0xF0;

 if (function_name==0x80|| function_name==0xA0|| function_name==0xC0|| function_name==0xE0)
 {
 if (function_name==0x80)
 {


 X_Dir_N();
 Y_Dir_N();
 }
 else if (function_name==0xA0)
 {


 X_Dir_P();
 Y_Dir_N();
 }
 else if (function_name==0xC0)
 {


 X_Dir_N();
 Y_Dir_P();
 }
 else if (function_name==0xE0)
 {


 X_Dir_P();
 Y_Dir_P();
 }
 }
 }
 }
 else
 {
 function=read_data(WADD);

 }
 }
#line 796 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/other function.c"
}

void Saving_data()
{
 unsigned char storing_data;
 unsigned int uncount=0;
 char _data_[4];
 WADD=513;

 storing_data = UART2_Read();
 storing_data = UART2_Read();
 cls();
 lcd_out(2,32-4,CopyConst2Ram(MSG,back));
 lcd_out(1,1,CopyConst2Ram(MSG,TXT_11));

 for(;;)
 {
 if(UART2_Data_Ready())
 {
 storing_data = UART2_Read();
#line 828 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/other function.c"
 if (storing_data==248)
 {
 UART2_Write(storing_data);

 CLS();
 LCD_OUT(1,1,CopyConst2Ram(MSG,TXT_12));
 DELAY_MS(1000);
 break;
 }
 }
 }
 while(1)
 {
 if(UART2_Data_Ready())
 {
 _data_[0] = UART2_Read();
 break;
 }
 }

 while(1)
 {
 if(UART2_Data_Ready())
 {
 _data_[1] = UART2_Read();
 break;
 }
 }

 while(1)
 {
 if(UART2_Data_Ready())
 {
 _data_[2] = UART2_Read();
 break;
 }
 }

 while(1)
 {
 if(UART2_Data_Ready())
 {
 _data_[3] = UART2_Read();
 break;
 }
 }

 while(1)
 {
 if(UART2_Data_Ready())
 {
 storing_data = UART2_Read();
 if (storing_data == 'C')
 break;
 }
 }

  ((char *)&wadd)[0] =_data_[0];
  ((char *)&wadd)[1] =_data_[1];
  ((char *)&wadd)[2] =_data_[2];
  ((char *)&wadd)[3] =_data_[3];
#line 894 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/other function.c"
}






void saving_main()
 {
 char _data_;
 if (READ_DATA(5)!='C')
 {
 make_file:
 CLS();
 LCD_OUT(1,1,CopyConst2Ram(MSG,TXT_13));
 while(ok_button()==1);
 writ_data(5,'C');
 writ_data(11,'1');
 writ_data(12,'Y');
 UART2_Write('W');
 while(1)
 {
 if(UART2_Data_Ready())
 {
 _data_ = UART2_Read();
 if (_data_ == 'W')
 {
 cls();
 LCD_OUT(1,1,CopyConst2Ram(MSG,TXT_22));
 DELAY_MS(1000);
 break;
 }
 }
 }




 CLS();
 LCD_OUT(1,1,CopyConst2Ram(MSG,TXT_10));

 Saving_data();
 WADD-=513;
 WADD/=3.0;
 writ_data(31, ((char *)&WADD)[0] );
 writ_data(32, ((char *)&WADD)[1] );
 cls();
 INTtostr(wadd,text11);
 LCD_OUT(1,1,TEXT11);
 lcd_out_CP(CopyConst2Ram(MSG,TXT_9));
 while(ok_button()==1);
 }
 else
 {
 CLS();
 LCD_OUT(1,1,CopyConst2Ram(MSG,TXT_14));
 LCD_OUT(2,1,CopyConst2Ram(MSG,TXT_17));
 lcd_chr_CP(READ_DATA(11));
 LCD_OUT(1,17,CopyConst2Ram(MSG,TXT_19));

 LCD_OUT(2,32-3,CopyConst2Ram(MSG,del));
 while(ok_button()==1)
 {
 if (back_button()==0)
 {
 writ_data(5,'D');
 LCD_OUT(2,17,CopyConst2Ram(MSG,TXT_18));
 goto make_file ;
 }
 }
 CLS();
 }
 }


void SN_1_CHK()
{
 for(i=0;i< 100 ;i++)
 {
 CLK_Z=0;
 DELAY_uS(  280 );
 CLK_Z=1;
 DELAY_uS(  280 );
 }
 if (SN_1==0)
 {
 UART2_Write_Text("SN_1 OK");
 UART2_Write(10);
 UART2_Write(13);
 }
 else
 {
 UART2_Write_Text("SN_1 FAIL");lcd_out(2,1,"1");
 UART2_Write(10);
 UART2_Write(13);
 while(right_button()==1);
 }
 }

void SN_2_CHK()
 {
 for(i=0;i< 100 ;i++)
 {
 CLK_Z=0;
 DELAY_uS(  280 );
 CLK_Z=1;
 DELAY_uS(  280 );
 }
 if (SN_2==0)
 {
 UART2_Write_Text("SN_2 OK");
 UART2_Write(10);
 UART2_Write(13);
 }
 else
 {
 UART2_Write_Text("SN_2 FAIL");lcd_out(2,1,"2");
 UART2_Write(10);
 UART2_Write(13);
 while(up_button()==1);
 }
 }

 void SN_3_CHK()
 {
 for(i=0;i< 100 ;i++)
 {
 CLK_Z=0;
 DELAY_uS(  280 );
 CLK_Z=1;
 DELAY_uS(  280 );
 }
 if (SN_3==0)
 {
 UART2_Write_Text("SN_3 OK");
 UART2_Write(10);
 UART2_Write(13);
 }
 else
 {
 UART2_Write_Text("SN_3 FAIL");lcd_out(2,1,"3");
 UART2_Write(10);
 UART2_Write(13);
 while(left_button()==1);
 }
 }

 void SN_4_CHK()
 {
 for(i=0;i< 100 ;i++)
 {
 CLK_Z=0;
 DELAY_uS(  280 );
 CLK_Z=1;
 DELAY_uS(  280 );
 }
 if (SN_4==0)
 {
 UART2_Write_Text("SN_4 OK");
 UART2_Write(10);
 UART2_Write(13);
 }
 else
 {
 UART2_Write_Text("SN_4 FAIL");
 lcd_out(2,1,"4");
 UART2_Write(10);
 UART2_Write(13);
 while(down_button()==1);
 }
 }


void CHK_ALL_90_DEGREE()
 {
 UART2_Init( 9600 );
 UART2_Write(10);
 UART2_Write(13);
 Z_DIR_CCW();
 EN_MAIN=1;
 delay_ms(500);
 while (1)
 {
 CLK_Z=0;
 DELAY_uS(  280 );
 CLK_Z=1;
 DELAY_uS(  280 );
 if (SN_1==0)
 {
 UART2_Write_Text("SN_1 OK");
 UART2_Write(10);
 UART2_Write(13);
 break;
 }
 }
 SN_2_CHK();
 SN_3_CHK();
 SN_4_CHK();
 SN_1_CHK();
 SN_2_CHK();
 SN_3_CHK();
 SN_4_CHK();
 lcd_out(2,1," ");
 Z_DIR_CW();
 SN_3_CHK();
 SN_2_CHK();
 SN_1_CHK();
 SN_4_CHK();
 lcd_out(2,1," ");
 for (extra_6=0;extra_6<3;extra_6++)
 {
 CLK_Z=1;
 DELAY_uS( 280 );
 CLK_Z=0;
 DELAY_uS( 280 );
 }
 while(ok_button()==1);
}

 void SN_1_REACHED()
 {
 char pre_direction=0;
 if (f_r_main == 'F')
 {
 pre_direction=Dir_Z;
 while(SN_1==1)
 {
 CLK_Z=1;
 DELAY_uS( 280 );
 CLK_Z=0;
 DELAY_uS( 280 );
 if (SN_2==1)
 {
 Dir_Z=~Dir_Z;
 while(SN_1==1)
 {
 CLK_Z=1;
 DELAY_uS( 280 );
 CLK_Z=0;
 DELAY_uS( 280 );
 }
 }
 else if (SN_4==1)
 {
 Dir_Z=~Dir_Z;
 while(SN_1==1)
 {
 CLK_Z=1;
 DELAY_uS( 280 );
 CLK_Z=0;
 DELAY_uS( 280 );
 }
 }

 }
 Dir_Z=pre_direction;
#line 1159 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/other function.c"
 }

 else if (f_r_main == 'R')
 {

 while(SN_3 ==1)
 {
 CLK_Z=1;
 DELAY_uS( 280 );
 CLK_Z=0;
 DELAY_uS( 280 );
 }
#line 1179 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/other function.c"
 }

 }

 void SN_2_REACHED()
 {
int pre_direction;
 if (f_r_main == 'F')
 {
 pre_direction=Dir_Z;
 while(SN_2==1)
 {
 CLK_Z=1;
 DELAY_uS( 280 );
 CLK_Z=0;
 DELAY_uS( 280 );
 if (SN_1==1)
 {
 Dir_Z=~Dir_Z;
 while(SN_2==1)
 {
 CLK_Z=1;
 DELAY_uS( 280 );
 CLK_Z=0;
 DELAY_uS( 280 );
 }
 }
 else if (SN_3==1)
 {
 Dir_Z=~Dir_Z;
 while(SN_2==1)
 {
 CLK_Z=1;
 DELAY_uS( 280 );
 CLK_Z=0;
 DELAY_uS( 280 );
 }
 }
 }
 Dir_Z=pre_direction;
#line 1227 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/other function.c"
 }

 else if (f_r_main == 'R')
 {

 while(SN_4 ==1)
 {
 CLK_Z=1;
 DELAY_uS( 280 );
 CLK_Z=0;
 DELAY_uS( 280 );
 }
#line 1247 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/other function.c"
 }

 }

 void SN_3_REACHED()
 {
int pre_direction;
 if (f_r_main == 'F')
 {
 pre_direction=Dir_Z;
 while(SN_3==1)
 {
 CLK_Z=1;
 DELAY_uS( 280 );
 CLK_Z=0;
 DELAY_uS( 280 );
 if (SN_2==1)
 {
 Dir_Z=~Dir_Z;
 while(SN_3==1)
 {
 CLK_Z=1;
 DELAY_uS( 280 );
 CLK_Z=0;
 DELAY_uS( 280 );
 }
 }
 else if (SN_4==1)
 {
 Dir_Z=~Dir_Z;
 while(SN_3==1)
 {
 CLK_Z=1;
 DELAY_uS( 280 );
 CLK_Z=0;
 DELAY_uS( 280 );
 }
 }
 }
 Dir_Z=pre_direction;
#line 1295 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/other function.c"
 }

 else if (f_r_main == 'R')
 {

 while(SN_1==1)
 {
 CLK_Z=1;
 DELAY_uS( 280 );
 CLK_Z=0;
 DELAY_uS( 280 );
 }
#line 1315 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/other function.c"
 }

 }

 void SN_4_REACHED()
 {
int pre_direction;
 if (f_r_main =='F')
 {
 pre_direction=Dir_Z;
 while(SN_4==1)
 {
 CLK_Z=1;
 DELAY_uS( 280 );
 CLK_Z=0;
 DELAY_uS( 280 );

 if (SN_1==1)
 {
 Dir_Z=~Dir_Z;
 while(SN_4==1)
 {
 CLK_Z=1;
 DELAY_uS( 280 );
 CLK_Z=0;
 DELAY_uS( 280 );
 }
 }
 else if (SN_3==1)
 {
 Dir_Z=~Dir_Z;
 while(SN_4==1)
 {
 CLK_Z=1;
 DELAY_uS( 280 );
 CLK_Z=0;
 DELAY_uS( 280 );
 }
 }

 }
 Dir_Z=pre_direction;
#line 1365 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/other function.c"
 }

 else if (f_r_main =='R')
 {

 while(SN_2==1)
 {
 CLK_Z=1;
 DELAY_uS( 280 );
 CLK_Z=0;
 DELAY_uS( 280 );
 }
#line 1385 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/other function.c"
 }
 }

void SN_5_REACHED()
{
 char direction_save=0;
 int clock_save=0;
 back_display();
 direction_save=Dir_Z;
 Z_DIR_CCW();
 if (SN_5==1)
 {
 while(SN_5==1)
 {
 clock_save++;
 CLK_Z=1;
 DELAY_uS( 280 );
 CLK_Z=0;
 DELAY_uS( 280 );
 }
 }
 while(ok_button()==0);
 while(ok_button()==1);
 while(ok_button()==0);

 Z_DIR_CW();
 for(;clock_save>0;clock_save--)
 {
 CLK_Z=1;
 DELAY_uS( 280 );
 CLK_Z=0;
 DELAY_uS( 280 );
 }


 Dir_Z=direction_save;
 }


void SET_POSITION()
 {
 unsigned char Dir_SET_POSITION;
 Dir_SET_POSITION=dir;

 Dir_SET_POSITION =Dir_SET_POSITION >> 4;
 if (Dir_SET_POSITION==1)
 {
 SN_1_REACHED();
 }
 else if (Dir_SET_POSITION==2)
 {
 SN_2_REACHED();
 }
 else if (Dir_SET_POSITION==3)
 {
 SN_3_REACHED();
 }
 else if (Dir_SET_POSITION==4)
 {
 SN_4_REACHED();
 }
 }
 void indecator(unsigned char RUPT)
{
 unsigned char ind,ru;
 ru=rupt;

 for(ind=0;ind<ru;ind++)
 {
 delay_ms(300);
 portb.b7=0;
 delay_ms(300);
 portb.b7=1;
 }
}




void Running()
{
#line 1491 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/other function.c"
 XX=X_distance;
 YY=Y_distance;
 ZZ=Degree/0.9;
 x_complite=0;y_complite=0;z_complite=0;
 monitor_1=0;
 RPM_SET( 0 );
 RPM_SET( 1 );
 if (X_RPM!=0.0)
 {
 Timer0_ON();
 }
 else x_complite=1;

 if (Y_RPM!=0.0)
 {
 Timer1_ON();
 }
 else y_complite=1;

 SET_POSITION();
 RPM_SET( 3 );
 if (Z_RPM!=0.0)
 {
 Timer3_ON();
 }
 else z_complite=1;
}



 void initial_main()
 {
 ADCON1=0X0F;
 MEMCON=0XFF;
 TRISA=0;
 TRISB=255;
 TRISC=0;
 TRISD=0;
 TRISE=0;
 trise.b7=1;

 TRISF=0;
 TRISG=0;
 TRISH=0;
 TRISJ=0;
 TRISJ.B1=1;
 TRISJ.B0=1;

 PORTA=0;
 PORTB=0;
 PORTC=0;
 PORTD=0;
 PORTE=0;
 PORTF=0;
 PORTG=255;
 PORTH=0;
 PORTJ=0;
 PORTJ.B1=1;

 LATA=0;
 LATB=255;
 LATC=0;
 LATD=0;
 LATE=0;
 LATF=0;
 LATG=255;
 LATH=0;
 LATJ=0;


 rd_pin_dir=0;
 wr_pin_dir=0;
 ale_pin_dir=0;
  trisd =255;
  trish =0;

 rd_pin=1;
 wr_pin=1;
  portd =0;
  porth =0;

 Main_SENSOR_DIR_2=1;


 thread_free_clk=0;
 thread_free_clk_direction=0;
 thread_free_dir=0;
 thread_free_dir_direction=0;

 main_motor=0;
 main_motor_dir=0;

 PWM1_Start();
 PWM1_Init(4000);
 PWM1_Set_Duty(255);


 SN_1=1;
 SN_2=1;
 SN_3=1;
 SN_4=1;
 SN_5=1;

 SN_1_DIR=1;
 SN_2_DIR=1;
 SN_3_DIR=1;
 SN_4_DIR=1;
 SN_5_DIR=1;


 t_pin_DIR=1;
 t_pin_DIR_2=1;

 Main_SENSOR_DIR=1;
 Main_SENSOR=1;
 UART2_Init( 9600 );
 delay_ms(200);
 UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle);
 UART2_WRITE_TEXT("HELO WORLD");
 Lcd_Init();
 delay_ms(200);
 LCD_CMD(_LCD_CURSOR_OFF);
 LCD_CMD(_LCD_UNDERLINE_ON);
 LCD_CMD(_LCD_CURSOR_OFF);
 delay_ms(40);


 Disable_intR();
 OLD_FUNCTION=224;
 OLD_Z_Degree=270.0;
 }
#line 1 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/ext_into.c"
void EXTINT0(char x)
{
 if (x==1){
 INTCON|=(1<<INT0IE);
 }
 if (x==0){
 INTCON&=~(1<<INT0IE);
 }
}

void INT0EDG(char x){
 if (x==0){
 INTCON2&=~(1<<INTEDG0);
 }
 if (x==1){
 INTCON2|=(1<<INTEDG0);
 }
}
#line 1 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/back_machine.c"
unsigned char back_design_exit;

void degree_180(char f_r_id)
{

 if (f_r_id=='R' && loop_id=='R')
 {
 loop_id='F';
 for(i=0;i<200;i++)
 {
 CLK_Z=1;
 DELAY_uS( 280 );
 CLK_Z=0;
 DELAY_uS( 280 );
 }
 }
 if (f_r_id=='F' && loop_id=='F')
 {
 loop_id='R';

 for(i=0;i<200;i++)
 {
 CLK_Z=1;
 DELAY_uS( 280 );
 CLK_Z=0;
 DELAY_uS( 280 );
 }
 }
}


void back_design()
{
 while(1)
 {
 if (UP_button()==0)
 {
 f_r='F';
 f_r_main='F';
 back_design_exit='F';
 delay_ms(10);
 break;
 }
 else if (down_button()==0)
 {
 f_r='R';
 f_r_main='R';
 back_design_exit='R';
 delay_ms(10);
 break;
 }
 else if (back_button()==0)
 {
 f_r='F';
 f_r_main='F';
 back_design_exit='B';
 break;
 }
 }
}

 void machine_started_back()
 {
 static char exit_loop=0,function_id=0;
 do
 {
 back_design();
 exit_loop=back_design_exit;
 degree_180(f_r);

 GET_DATA();
 if (function!=248)
 {
 function_id=GET_DEGREE();
 GET_RPM();


 EXTINT0(1);
 Running();
 longtostr(stich_dis,text11);
 LCD_OUT(1,1,TEXT11);
 if (f_r == 'F')
 {
 stich_dis++;
 }
 else if (f_r == 'R')
 {
 stich_dis--;
 }
 if (stich_dis<=0)
 {
 function=248;
 }
 while(x_complite==0);
 while(y_complite==0);
#line 110 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/back_machine.c"
 while(z_complite==0);

 EXTINT0(0);

 }
 if(exit_loop=='B')
 {
 function_id_back_start=function_id;
 break;
 }
 } while(function!=248);
 }




 void required_stich()
 {
 back_start=66;
 machine_started_back();
 cls();
 lcd_out(1,1,"function test");
 while(ok_button()==1);
 back_start='S';
#line 169 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/back_machine.c"
 }
#line 1 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/main_menu.c"
const char m01[] ="FRAM SETING MODE";
const char m02[] ="SAVING START";
const char m03[] ="MEMORY";
const char m04[] ="Name ";
const char m05[] ="NO FOUND";

void display_m01()
{
 CLS();
 LCD_OUT(1,1,CopyConst2Ram(MSG,M01));
 LCD_OUT(2,40-4,CopyConst2Ram(MSG,back));
}

void display_m02()
{
 cls();
 LCD_OUT(1,1,CopyConst2Ram(MSG,M02));
}

void display_m03()
{
 cls();
 LCD_OUT(1,1,CopyConst2Ram(MSG,M03));
}




void frame_position()
{
 while(1)
 {
 if (left_pin==0 || right_pin==0)
 {
 if(left_pin==0)
 {
 X_Dir_P();
 CLK_X=~CLK_X;
 DELAY_uS( 600 );
 }
 else if(right_pin==0)
 {
 X_Dir_N();
 CLK_X=~CLK_X;
 DELAY_uS( 600 );
 }
 }
 if(up_pin==0 || down_pin==0)
 {
 if(down_pin==0)
 {
 Y_Dir_P();
 CLK_Y=~CLK_Y;
 DELAY_uS( 600 );
 }
 else if(up_pin==0)
 {
 Y_Dir_N();
 CLK_Y=~CLK_Y;
 DELAY_uS( 600 );
 }
 }
 if (centor_button()==0)
 {
 CHK_ALL_90_DEGREE();
 SN_5_REACHED();
 }
 if(back_button()==0)
 {
 while(back_button()==0);
 cls();
 break;
 }
 }
}

void START_MACHINE_WITH_DESIGN()
{
 lcd_out(2,21,CopyConst2Ram(MSG,back));
 lcd_out(2,40-4,CopyConst2Ram(MSG,next));
 while(1)
 {
 if (save_button()==0)
 {
 start_machine_flage='Y';
 break;
 }
 else if (back_button()==0)
 {
 start_machine_flage='N';
 break;
 }
 }
}



void chaking_designed()
{
 if (READ_DATA(5)=='C')
 {
 lcd_out(2,1,CopyConst2Ram(MSG,M04));
 lcd_chr_cp(READ_DATA(11));

  ((char *)&WADD)[0] =READ_DATA(31);
  ((char *)&WADD)[1] =READ_DATA(32);
 longtostr(wadd,text11);

 LCD_OUT(1,17,text11);
 START_MACHINE_WITH_DESIGN();
 }
 else
 {
 lcd_out(2,1,CopyConst2Ram(MSG,M05));
 while(back_button()==1);
 }
}

char errow_show()
{
 if (down_button()==0)
 {
 if (current_msg==4)
 {
 current_msg=0;
 }
 current_msg++;
 move_errow_down(current_msg);
 while(down_button()==0);
 }
 if (up_button()==0)
 {
 if (current_msg==1)
 {
 current_msg=5;
 }
 current_msg--;
 move_errow_down(current_msg);
 while(up_button()==0);
 }
 return current_msg;
}

void menu_main_1()
{



 current_msg=errow_show();




 if (OK_button_1()==0)
 {
 while(OK_button_1()==0);
 if (current_msg==1)
 {
 PWM1_Set_Duty( 50 );
 DISPLAY_M01();
 relay_on();
 en_on();
 break_on();
 frame_position();
 en_off();
 display_mesg(current_msg);
 PWM1_Set_Duty( 50 );
 }
 if (current_msg==2)
 {
 display_m02();
 SAVING_MAIN();
 display_mesg(current_msg);
 }
 if (current_msg==3)
 {
 display_m03();
 chaking_designed();
 display_mesg(current_msg);
 }
 }
}



void chaking_stich_length()
{
 char counter=0;
 COUNTER=read_data(++wadd);
 if (COUNTER>75)
 {
 cls();
 lcd_out(1,1,"StichLongy");
 }
 COUNTER=read_data(++wadd);
 if (COUNTER>75)
 {
 cls();
 lcd_out(1,1,"StichLongy");
 }
}



char ANALYSIS_START()
{
 unsigned int counter=0,stop=0,trim=0,clour=0;
 unsigned long stich=0;
 char array_1[7];
#line 252 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/main_menu.c"
 wadd=512;
 COUNTER=read_data(++wadd);
 for(;;)
 {
 if(COUNTER==128 || COUNTER==160 || COUNTER==224 || COUNTER==192)
 {
 stich+=1;
 chaking_stich_length();
 COUNTER=read_data(++wadd);
 }

 else if(COUNTER==129 || COUNTER==161 || COUNTER==225 || COUNTER==193)
 {
 stich+=1;
 chaking_stich_length();
 COUNTER=read_data(++wadd);
 }

 else if(COUNTER==138 || COUNTER==170 || COUNTER==202 || COUNTER==234)
 {
 stich+=1;
 chaking_stich_length();
 COUNTER=read_data(++wadd);
 }

 else if(COUNTER==137 || COUNTER==169 || COUNTER==201 || COUNTER==233)
 {
 stich+=1;
 chaking_stich_length();
 COUNTER=read_data(++wadd);
 }

 else if(COUNTER==136 || COUNTER==168 || COUNTER==200 || COUNTER==232)
 {
 stop+=1;
 stich+=1;
 chaking_stich_length();
 COUNTER=read_data(++wadd);
 }

 else if(COUNTER==231 || COUNTER==230)
 {
 Trim+=1;
 stich+=1;
 chaking_stich_length();
 COUNTER=read_data(++wadd);
 }

 else if (COUNTER==139||COUNTER==171||COUNTER==203||COUNTER==235||
 COUNTER==140||COUNTER==172||COUNTER==204||COUNTER==236||
 COUNTER==141||COUNTER==173||COUNTER==205||COUNTER==237||
 COUNTER==142||COUNTER==174||COUNTER==206||COUNTER==238||
 COUNTER==143||COUNTER==175||COUNTER==207||COUNTER==239||
 COUNTER==144||COUNTER==176||COUNTER==208||COUNTER==240||
 COUNTER==145||COUNTER==177||COUNTER==209||COUNTER==241||
 COUNTER==146||COUNTER==178||COUNTER==210||COUNTER==242||
 COUNTER==147||COUNTER==179||COUNTER==211||COUNTER==243||
 COUNTER==148||COUNTER==180||COUNTER==212||COUNTER==244||
 COUNTER==149||COUNTER==181||COUNTER==213||COUNTER==245||
 COUNTER==150||COUNTER==182||COUNTER==214||COUNTER==246||
 COUNTER==151||COUNTER==183||COUNTER==215||COUNTER==247)
 {
 colour_function =COUNTER & 0xf0;
 if (colour_function==0x90 || colour_function==0xB0 || colour_function==0xD0 ||
 colour_function==0xF0)
 {
 cls();
 colour_function=counter;
 inttostr(colour_function,text11);
 lcd_out(1,1,text11);
 delay_ms(500);
 while(ok_button()==1);
 }
 clour+=1;
 stich+=1;
 chaking_stich_length();
 COUNTER=read_data(++wadd);
 }

 else if (COUNTER==132||COUNTER==164||COUNTER==196||COUNTER==228 ||
 COUNTER==130||COUNTER==162||COUNTER==194||COUNTER==226)
 {
 CLS();
 inttostr(counter,text11);
 lcd_out(1,1,text11);
 delay_ms(500);
 while(ok_button()==1);
 stich+=1;
 chaking_stich_length();
 COUNTER=read_data(++wadd);
 }

 else if (COUNTER==248){

 cls();
 longtostr(stich,text11);
 LCD_OUT(1,4,TEXT11);
 LCD_OUT(1,1,"Stich:");
 longtostr(stop,text11);
 sprintf(text11,"%1u",stop);
 LCD_OUT(2,6,TEXT11);
 LCD_OUT(2,1,"Stop:");
 longtostr(trim,text11);
 sprintf(text11,"%1u",trim);
 LCD_OUT(2,13,TEXT11);
 LCD_OUT(2,8,"Trim:");
 longtostr(clour,text11);
 LCD_OUT(1,21,TEXT11);
 LCD_OUT(1,17,"Clours:");
 while(ok_button()==1);
 return 'K';
 }

 else
 {
 CLS();
 INTtostr(COUNTER,array_1);
 lcd_out(1,9,array_1);
 lcd_out(1,1,"FUNCTION");

 INTtostr(stich,array_1);
 lcd_out(2,7,array_1);
 LCD_OUT(2,1,"STICH#");

 INTtostr(wadd,array_1);
 lcd_out(1,18,array_1);
 LCD_OUT(1,17,"C");
 while(ok_button()==1);
 CLS();
 return 'B';
 }
 }
}

 const char z_motor_setting[] = "z_motor_setting";
 const char rever_forward[] = "rever_forward";
 const char cancel[] = "cancel";
 const char ARE_U_SURE[] = "ARE_U_SURE";
 const char YES[] = "YES";
 const char NO[] = "NO";




void display_edit(char position_of_cursor)
{
 cls();
 if (position_of_cursor==1)
 {
 current_msg=1;
 }
 else if (position_of_cursor==2)
 {
 current_msg=2;
 }
 else if (position_of_cursor==3)
 {
 current_msg=3;
 }
 else if (position_of_cursor==4)
 {
 current_msg=4;
 }
 cls();
 if (position_of_cursor==3)
 {
 CustomChar(1,17);
 }
 else if (position_of_cursor==4)
 {
 CustomChar(2,17);
 }
 else CustomChar(position_of_cursor,1);
 LCD_OUT(1,2,CopyConst2Ram(MSG,panel_setting));
 LCD_OUT(2,2,CopyConst2Ram(MSG,z_motor_setting));
 LCD_OUT(1,18,CopyConst2Ram(MSG,rever_forward));
 LCD_OUT(2,18,CopyConst2Ram(MSG,cancel));
}



void edit_menu()
{
 char direction_save;
 display_edit(1);
 while(start_button()==0);
 do
 {
 current_msg=errow_show();
 if (ok_button_1()==0)
 {
 if (current_msg==1)
 {
 cls();
 DISPLAY_M01();
 frame_position();
 display_edit(current_msg);
 }
 if (current_msg==2)
 {
 cls();
 LCD_OUT(2,2,CopyConst2Ram(MSG,z_motor_setting));
 SN_5_REACHED();

 display_edit(current_msg);
 }
 if (current_msg==3)
 {
 cls();
 LCD_OUT(1,2,CopyConst2Ram(MSG,rever_forward));
 required_stich();
 display_edit(current_msg);
 }
 if (current_msg==4)
 {
 cls();
 LCD_OUT(1,2,CopyConst2Ram(MSG,ARE_U_SURE));
 LCD_OUT(2,17,CopyConst2Ram(MSG,YES));
 LCD_OUT(2,32-2,CopyConst2Ram(MSG,NO));
 while(1)
 {
 if (start_button()==0)
 {
 asm {
 reset
 }
 }
 else if (back_button()==0)
 {
 break;
 }
 }
 }
 }
 }while (back_button()==1);
 cls();
}
#line 1 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/machine_start_fun.c"
char menu_flag,flag_1=0;
 void machine_started()
 {
 const char start_positoin[] ="start_positoin";
 const char thread_position[] ="thread_position";
 static char function_id=0;
 Timer0_Intit();
 Timer1_Init();
 Timer3_Init();

 TIMER0_EN(1);
 Timer1_Enable();
 Timer3_Enable();

 EXTINT0(0);
 INT0EDG(0);
 Enable_intr();




 Clk_x=0;
 Clk_y=0;
 Clk_Z=0;
 delay_us(2);
 Dir_x=0;
 Dir_y=0;
 Dir_Z=0;

 end_of_jump='S',break_flag_internal='O';
 menu_flag=0;
 monitor_1=0;
 WADD=513;
 stich_dis=WADD;
 stich_dis-=513;
 stich_dis/=3.0;
 XX=0;
 YY=0;
 ZZ=0;

 x_complite==0;y_complite==0;z_complite==0;

 do
 {
 GET_DATA();
 if (function!=248)
 {
 function_id=GET_DEGREE();
 function_id_back_start=function_id;
 GET_RPM();

 if (function_id==0)
 {
 while(Main_SENSOR==1)
 {
 if (menu_flag==1) break;
 }




 while(Main_SENSOR_2==1)
 {
 if (menu_flag==1) break;
 }
 }
 else if (function_id==2)
 {
 speed_riser=0;
 PWM1_Set_Duty( 50 );
 cls();
 LCD_OUT(1,1,CopyConst2Ram(MSG,thread_position));
 LCD_OUT(2,1,CopyConst2Ram(MSG,colour));
 SN_5_REACHED();
 cls();
 back_display();
 Edit_Menu_dis();
 while(1)
 {
 if (ok_button_1()==0)
 {
 while(ok_button_1()==0);
 edit_menu();
 }
 else if (back_button()==0)
 {
 break;
 }
 }
 cls();
 if (function_id_back_start==0 && back_start=='S')
 {
 break_oFF();
 }
 }
 else
 {
 speed_riser=0;
 PWM1_Set_Duty( 50 );
 }


 Main_shaft_ACK=0;
 INTCON&=~(1<<INT0IF);
 EXTINT0(1);
 Running();

 longtostr(stich_dis,text11);
 LCD_OUT(1,1,TEXT11);
 stich_dis++;
 if (up_pin==0)
 {
 if (current_speed> 5 )
 {
 current_speed--;
 PWM1_Set_Duty(current_speed);
 }
 }
 else if (down_pin==0)
 {
 if(current_speed<= 50 )
 {
 current_speed++;
 PWM1_Set_Duty(current_speed);

 }
 }
 while(x_complite==0);
 while(y_complite==0);
#line 144 "d:/other data/mian hard drive/partition no 2/embedded firmware and electronic +wilcom design/program/chain machine os files/v1.6/machine_start_fun.c"
 while(z_complite==0);
 Main_shaft_ACK=0;
 EXTINT0(0);

 if (function_id==0)
 {
 if (t_pin==1 && t_pin_2==0)
 {
 break_on();
 PWM1_Set_Duty( 50 );
 speed_riser=0;
 cls();
 LCD_OUT(1,1,CopyConst2Ram(MSG,thread_position));
 SN_5_REACHED();
 cls();
 LCD_OUT(1,1,CopyConst2Ram(MSG,start_positoin));
 LCD_OUT(2,32-4,CopyConst2Ram(MSG,back));
 function_id_back_start=0; back_start='S';
 while(1)
 {
 if (ok_button()==0)
 {
 edit_menu();






 }
 if (back_button()==0)
 {
 break;
 }
 }
 CLS();
 if (function_id_back_start==0 && back_start=='S')
 {
 break_oFF();
 }
 }
 }

 if (menu_flag==1)
 {
 speed_riser=0;
 PWM1_Set_Duty( 50 );
 menu_flag=0;
 while(ok_button_1()==0);


 edit_menu();

 if (function_id_back_start==0 && back_start=='S')
 {
 break_oFF();
 }
 }

 if (menu_pin==0)
 {
 menu_flag=1;
 break_on();
 }
 }

 if (speed_riser< 4 )
 {
 speed_riser++;
 }
 else
 {
 PWM1_Set_Duty(current_speed);
 }
 } while(function!=248);
 speed_riser=0;
 PWM1_Set_Duty( 50 );
 Timer0_OFF();
 Timer1_OFF();
 Timer3_OFF();
 EXTINT0(0);
 break_on();
 EN_OFF();
 while(ok_button());
 }
#line 213 "D:/Other Data/Mian Hard Drive/Partition no 2/Embedded firmware and Electronic +wilcom design/Program/CHAIN MACHINE OS FILES/V1.6/RPM STEPPER.c"
void main()
{
 char daa=0;
 initial_main();
 RELAY_ON();
 EN_On();
 break_on();
#line 252 "D:/Other Data/Mian Hard Drive/Partition no 2/Embedded firmware and Electronic +wilcom design/Program/CHAIN MACHINE OS FILES/V1.6/RPM STEPPER.c"
 delay_ms(500);
 RELAY_OFF();
 EN_OFF();
 CLS();
#line 271 "D:/Other Data/Mian Hard Drive/Partition no 2/Embedded firmware and Electronic +wilcom design/Program/CHAIN MACHINE OS FILES/V1.6/RPM STEPPER.c"
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
 PWM1_Set_Duty( 50 );
 machine_started();
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


void interrupt () iv 0x000008
{

 static char monitor_2 =0;
 if (INTCON & (1<<TMR0IE)){
 if(INTCON & (1<<TMR0IF))
 {
 INTCON&=~(1<<TMR0IF);
 if (XX==0)
 {
 T0CON&=~(1<<TMR0ON);
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
 TMR0H = Timer0_H;
 TMR0L = Timer0_L;
 }
 }

 if (PIE1.TMR1IE==1)
 {
 if (PIR1.TMR1IF==1)
 {
 PIR1.TMR1IF=0;
 if (YY==0)
 {
 T1CON.TMR1ON=0;
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
 TMR1H = Timer1_H;
 TMR1L = Timer1_L;
 }
 }
#line 451 "D:/Other Data/Mian Hard Drive/Partition no 2/Embedded firmware and Electronic +wilcom design/Program/CHAIN MACHINE OS FILES/V1.6/RPM STEPPER.c"
 if (PIE2.TMR3IE==1)
 {
 if (PIR2.TMR3IF==1)
 {
 PIR2.TMR3IF=0;

 if (ZZ==0)
 {
 T3CON.TMR3ON=0;
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
 if (SN_1==1 && SN_2==1 && SN_3==1 && SN_4==1 && monitor_1==0)
 {
 monitor_1=1;
 }
 else if (monitor_1==1)
 {
 if (SN_1==0 || SN_2==0 || SN_3==0 || SN_4==0)
 {
 monitor_1=0;
 ZZ=0;
 }
 }
 }
 TMR3H = Timer3_H;
 TMR3L = Timer3_L;
 }
 }


 if (INTCON & (1<<INT0IE))
 {
 if (INTCON & (1<<INT0IF))
 {
 INTCON&=~(1<<INT0IF);
 Main_shaft_ACK=255;
 portb.b7=~portb.b7;

 }
 }
}
