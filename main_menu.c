const char m01[]  ="FRAM SETING MODE";
const char m02[]  ="SAVING START";
const char m03[]  ="MEMORY";
const char m04[]  ="Name ";
const char m05[]  ="NO FOUND";
//-----------------------------------------------------------------------------
void display_m01()
{
 CLS();
 LCD_OUT(1,1,CopyConst2Ram(MSG,M01));
 LCD_OUT(2,40-4,CopyConst2Ram(MSG,back));
}
//------------------------------------------------------------------------------
void display_m02()
{
 cls();
 LCD_OUT(1,1,CopyConst2Ram(MSG,M02));
}
//------------------------------------------------------------------------------
void display_m03()
{
 cls();
 LCD_OUT(1,1,CopyConst2Ram(MSG,M03));
}
//******************************************************************************
//------------------------------------------------------------------------------
//   frame_position();
//------------------------------------------------------------------------------
void frame_position()
{
  while(1)
   {
      if (left_pin==0 || right_pin==0)
      {
        if(left_pin==0)
        {
          X_Dir_P();       //+VE 0
          CLK_X=~CLK_X;
          DELAY_uS(free_Frame_pos);
        }
        else if(right_pin==0)
        {
         X_Dir_N();        //-VE  1
         CLK_X=~CLK_X;
         DELAY_uS(free_Frame_pos);
        }
      }
      if(up_pin==0 || down_pin==0)
      {
        if(down_pin==0)
        {
          Y_Dir_P();       //+VE
          CLK_Y=~CLK_Y;
          DELAY_uS(free_Frame_pos);
        }
        else if(up_pin==0)
        {
         Y_Dir_N();        //-VE
         CLK_Y=~CLK_Y;
         DELAY_uS(free_Frame_pos);
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
//------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------
//   chaking_designed()
//------------------------------------------------------------------------------
void chaking_designed()
{
 if (READ_DATA(5)=='C')
 {
  lcd_out(2,1,CopyConst2Ram(MSG,M04));
  lcd_chr_cp(READ_DATA(11));

  Lo(WADD)=READ_DATA(31);
  Hi(WADD)=READ_DATA(32);
  longtostr(wadd,text11);
//  shorttostr(READ_DATA(31),text11);
  LCD_OUT(1,17,text11);
  START_MACHINE_WITH_DESIGN();
 }
 else 
 {
  lcd_out(2,1,CopyConst2Ram(MSG,M05));
  while(back_button()==1);
 }
}
//******************************************************************************
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
//------------------------------------------------------------------------------
// MENU SELECTIONS
//------------------------------------------------------------------------------
    current_msg=errow_show();
//------------------------------------------------------------------------------
// start at desier positions     free motion
//------------------------------------------------------------------------------
  
  if (OK_button_1()==0)
  {
   while(OK_button_1()==0);
   if (current_msg==1)
    {
      PWM1_Set_Duty(MAIN_MOTOR_LO_SPPED);
      DISPLAY_M01();
      relay_on();
      en_on();
      break_on();
      frame_position();
      en_off();
      display_mesg(current_msg);
      PWM1_Set_Duty(MAIN_MOTOR_LO_SPPED);
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
//------------------------------------------------------------------------------
//   chaking_stich_length();
//------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------
//   ANALYSIS_START();
//------------------------------------------------------------------------------
char ANALYSIS_START()
{
  unsigned int counter=0,stop=0,trim=0,clour=0;
  unsigned long stich=0;
  char array_1[7];
//------------------------------------------------------------------------------
/*
 wadd=0x0;
 wdata=255;
  for(wadd=0;wadd<65536;wadd++)
 {
  writ_data(wadd,wdata);
//  inttostr(wadd,text11);
//  lcd_out(1,1,text11);
  if (wadd==65535)
  {
   break;
  }
 }

//------------------------------------------------------------- Read test Start
  for(wadd=0;wadd<65536;wadd++)
 {
  wdata=0;
  wdata=read_data(wadd);
//  lcd_chr(2,1,wdata);
  if (wdata==255)
  {
//   inttostr(wadd,text11);
//   lcd_out(1,1,text11);
  }
  else
  {
   lcd_out(1,1,"error");
   break;
  }
  if (wadd==65535)
  {
   cls();
   lcd_out(1,1,"read_test_complite");
   break;
  }
 }
// while(1);
 while(ok_button()==1);
 */
//------------------------------------------------------------------------------
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
//______________________________________________________________________MOSS
 else if(COUNTER==138 || COUNTER==170 || COUNTER==202 || COUNTER==234)
  {
  stich+=1;
  chaking_stich_length();
  COUNTER=read_data(++wadd);
  }
 //______________________________________________________________________CHAN
 else if(COUNTER==137 || COUNTER==169 || COUNTER==201 || COUNTER==233)
  {
  stich+=1;
  chaking_stich_length();
  COUNTER=read_data(++wadd);
  }
//_________________Stop
 else if(COUNTER==136 || COUNTER==168 || COUNTER==200 || COUNTER==232)
  {
   stop+=1;
   stich+=1;
   chaking_stich_length();
   COUNTER=read_data(++wadd);
  }
 //__________________TRIM
 else if(COUNTER==231 || COUNTER==230)
  {
    Trim+=1;
    stich+=1;
    chaking_stich_length();
    COUNTER=read_data(++wadd);
  }
//__________________CLOUR
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
//------------------------------------------------------------------------------
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
//__________________END_DESIGNED
 else if (COUNTER==248){
//    stich+=1;
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

//------------------------------------------------------------------------------
// display_edit();
//------------------------------------------------------------------------------
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
//-----------------------------------------------------------------------------
// char edit_menu()
//------------------------------------------------------------------------------
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