char menu_flag,flag_1=0;
 void machine_started()
 {
  const char start_positoin[]  ="start_positoin";
  const char thread_position[]  ="thread_position";
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

  //
  // RELAY_ON();
  // EN_ON();
  Clk_x=0;         //initialation of clk pin
  Clk_y=0;         //initialation of clk pin
  Clk_Z=0;         //initialation of clk pin
  delay_us(2);
  Dir_x=0;         //initialation of Direction of motor
  Dir_y=0;         //initialation of Direction of motor
  Dir_Z=0;         //initialation of Direction of motor

  end_of_jump='S',break_flag_internal='O'; // 'S'= START 'F'OFF 'O'=ON
  menu_flag=0;
  monitor_1=0;
  WADD=513;
  stich_dis=WADD;
  stich_dis-=513;
  stich_dis/=3.0;
  XX=0;
  YY=0;
  ZZ=0;
//  SN_4_REACHED();
  x_complite==0;y_complite==0;z_complite==0;
//  break_oN();
  do
  {
    GET_DATA();
    if (function!=248)
    {
     function_id=GET_DEGREE();  //***GET DEGREE
     function_id_back_start=function_id;
     GET_RPM();
//------------------------------------------------------------------------------
     if (function_id==0)
     {
      while(Main_SENSOR==1)
      {
       if (menu_flag==1) break;
      }
//      while(Main_SENSOR==0)
//      {
//       if (menu_flag==1) break;
//      }
      while(Main_SENSOR_2==1)
      {
       if (menu_flag==1) break;
      }
     }
     else if (function_id==2)  // funtion id 2 colours
     {
      speed_riser=0;
      PWM1_Set_Duty(MAIN_MOTOR_LO_SPPED);
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
      PWM1_Set_Duty(MAIN_MOTOR_LO_SPPED);
     }
//------------------------------------------------------------------------------
//******************************************************************************
     Main_shaft_ACK=0;
     INTCON&=~(1<<INT0IF);
     EXTINT0(1);
     Running();
//******************************************************************************
     longtostr(stich_dis,text11);
     LCD_OUT(1,1,TEXT11);
     stich_dis++;
     if (up_pin==0)
     {
      if (current_speed>MAIN_MOTOR_HI_SPPED)
      {
       current_speed--;
       PWM1_Set_Duty(current_speed);
      }
     }
     else if (down_pin==0)
     {
      if(current_speed<=MAIN_MOTOR_LO_SPPED)
      {
       current_speed++;
       PWM1_Set_Duty(current_speed);

      }
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
     Main_shaft_ACK=0;
     EXTINT0(0);
//------------------------------------------------------------------------------
     if (function_id==0)
     {
       if (t_pin==1 && t_pin_2==0)
       {
        break_on();
        PWM1_Set_Duty(MAIN_MOTOR_LO_SPPED);
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
          // cls();
          // LCD_OUT(1,1,CopyConst2Ram(MSG,thread_position));
          // SN_5_REACHED();
          // cls();
          // LCD_OUT(1,1,CopyConst2Ram(MSG,start_positoin));
          // LCD_OUT(2,32-4,CopyConst2Ram(MSG,back));
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
//------------------------------------------------------------------------------
     if (menu_flag==1)
     {
      speed_riser=0;
      PWM1_Set_Duty(MAIN_MOTOR_LO_SPPED);
      menu_flag=0;
      while(ok_button_1()==0);
//      while(start_button()==0)
//      {
       edit_menu();
//      }
      if (function_id_back_start==0 && back_start=='S')
      {
       break_oFF();
      }
     }
//------------------------------------------------------------------------------
     if (menu_pin==0)
     {
      menu_flag=1;
      break_on();
     }
    }
//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    if (speed_riser<stich_counting)
    {
     speed_riser++;
    }
    else
    {
     PWM1_Set_Duty(current_speed);
    }
  } while(function!=248);
   speed_riser=0;
   PWM1_Set_Duty(MAIN_MOTOR_LO_SPPED);
   Timer0_OFF();
   Timer1_OFF();
   Timer3_OFF();
   EXTINT0(0);
   break_on();
   EN_OFF();
   while(ok_button());
 }