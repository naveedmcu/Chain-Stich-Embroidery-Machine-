unsigned char back_design_exit;
//------------------------------------------------------------------------------
void degree_180(char f_r_id)
{

 if (f_r_id=='R' && loop_id=='R')
  {
   loop_id='F';
   for(i=0;i<200;i++)
   {
    CLK_Z=1;
    DELAY_uS(delays);
    CLK_Z=0;
    DELAY_uS(delays);
   }
 }
 if (f_r_id=='F' && loop_id=='F')
 {
   loop_id='R';

   for(i=0;i<200;i++)
   {
    CLK_Z=1;
    DELAY_uS(delays);
    CLK_Z=0;
    DELAY_uS(delays);
   }
 }
}

//------------------------------------------------------------------------------
void  back_design()
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
//------------------------------------------------------------------------------
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
     function_id=GET_DEGREE();  //***GET DEGREE
     GET_RPM();
//     Main_shaft_ACK=0;
//     INTCON&=~(1<<INT0IF);
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
/*
     if (Main_shaft_ACK==255)
     {
      EXTINT0(0);
      Timer0_OFF();
      Timer1_OFF();
      Timer3_OFF();
      en_x=0;
      en_y=0;
      en_Z=0;
      indecator(12);
      while(1);
     }
*/
     while(z_complite==0);
//     Main_shaft_ACK=0;
     EXTINT0(0);
    
    }
    if(exit_loop=='B')
   {
    function_id_back_start=function_id;
    break;
   }
  } while(function!=248);
 }
//------------------------------------------------------------------------------


//------------------------------------------------------------------------------
 void required_stich()
 {
  back_start=66;
  machine_started_back();
  cls();
  lcd_out(1,1,"function test");
  while(ok_button()==1);
  back_start='S';
  
 /*
  while(1)
  {
   if (up_button()==0)
   {
    f_r=70;
//    wadd+=3;
    machine_started_back();
   }
   else if (down_button()==0)
   {
     if (wadd==513)
     {
      f_r=70;
      LCD_OUT(1,1,CopyConst2Ram(MSG,zero));
     }
     else
     {
      f_r=82;
//      wadd-=3;
     }
     machine_started_back();
    }
//    stich_dis=(wadd-513)/3;
//    longtostr(stich_dis,text11);
//    LCD_OUT(2,1,TEXT11);
   if (back_button()==0)
   {
    f_r=70;
    back_start='S';
    break;
   }
  }
  */
 }