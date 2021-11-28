const char e0[]     ="OK_PRESS";
const char TXT_15[] ="OK";
const char TXT_16[] ="        ";
const char zero[] ="zero";
//******************************************************************************
char * CopyConst2Ram(char * dest, const char * src){
  char * d ;
  d = dest;
  for(;*dest++ = *src++;);
//    *dest++ = *src++;
  return d;
}
//******************************************************************************
void LCD_OK_DIS()
{
 LCD_OUT(2,21,CopyConst2Ram(MSG,TXT_16));
 lcd_out(2,21,CopyConst2Ram(MSG,TXT_15));
 delay_ms(500);
 LCD_OUT(2,21,CopyConst2Ram(MSG,TXT_16));
}
//******************************************************************************
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
 Lcd_Cmd(_LCD_CLEAR);               // Clear display
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
//******************************************************************************
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
//******************************************************************************
void break_on()
{
 static int b_counter=0;
 b_dir=0;
 b_clk=0;
 for(b_counter=0;b_counter<175;b_counter++)
 {
  b_clk=~b_clk;
  delay_us(break_motor_delay_on);
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
  delay_us(break_motor_delay_off);
 }
}
//******************************************************************************
void thread_pick()
 {
  break_off();
  delay_us(1);
  break_on();
 }

//------------------------------------------------------------------------------
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
/*
   CustomChar(1,1);
   CustomChar(2,1);
   CustomChar(1,17);
   CustomChar(2,17);
while(1);
*/
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