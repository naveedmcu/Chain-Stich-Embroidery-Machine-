const char TXT_9[]  ="STICH SAVE";
const char TXT_22[]  ="CONNECTED..";
unsigned char f_r='F' ,back_start ='S';
unsigned char f_r_main='F';
//------------------------------------------------------------------------------

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
//   if (Timer_Name!=3)
//   {
     PPT=(RPM*400.0/60.0);
//   }
//   else  PPT=(RPM*800.0/60.0);
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
//******************************************************************************
void Get_RPM()
{
  X_distance*=2;
  Y_distance*=2;
   if (X_distance==0)
  {
   Y_RPM=Max_Speed;
   X_RPM=0.0;
  }
  else if(Y_distance==0)
  {
   X_RPM=Max_Speed;
   Y_RPM=0.0;
  }
  else if (Y_Distance==X_distance)
  {
   Y_RPM=Max_Speed;
   X_RPM=Max_Speed;
  }
  else if (X_Distance > y_distance)
  {
   X_RPM=Max_Speed;
   Y_RPM=(Max_Speed*y_distance)/X_Distance;
  }
  else if (Y_Distance > X_distance)
  {
   Y_RPM=Max_Speed;
   X_RPM=(Max_Speed*X_distance)/Y_Distance;
  }
  if (degree!=0)
  {
   Z_RPM=max_speed_z_motor;
  }
  else Z_RPM=0.0;
}
//******************************************************************************
//------------------------------------------------------------------------------
void X_Dir_P()
 {
//  DELAY_US(2);
  if (f_r == 'F')
  {
   Dir_X=1;
  }
  else if (f_r == 'R')
  {
   Dir_X=0;
  }
//  DELAY_US(2);
 }
//------------------------------------------------------------------------------
void X_Dir_N()
 {
//  DELAY_US(2);
  if (f_r == 'F')
  {
   Dir_X=0;
  }
  else if (f_r == 'R')
  {
   Dir_X=1;
  }
//  DELAY_US(2);
 }
//------------------------------------------------------------------------------
void Y_Dir_P()
 {
//  DELAY_US(2);
  if (f_r == 'F')
  {
   Dir_Y=1;
  }
  if (f_r == 'R')
  {
   Dir_Y=0;
  }
//  DELAY_US(2);
 }
//------------------------------------------------------------------------------
void Y_Dir_N()
 {
//  DELAY_US(2);
  if (f_r == 'F')
  {
   Dir_Y=0;
  }
  if (f_r == 'R')
  {
   Dir_Y=1;
  }
//  DELAY_US(2);
 }
//------------------------------------------------------------------------------
 void Z_DIR_CCW()
 {
    Dir_Z=0;
 }
//------------------------------------------------------------------------------
 void Z_DIR_CW()
 {
   Dir_Z=1;
 }
//******************************************************************************
float get_atan(float Y_Distance,float X_Distance)
{
 volatile float rad_1;
  rad_1=Y_Distance/X_Distance;
  rad_1=(atan(rad_1))*57.295779;
  return rad_1;
 }
//------------------------------------------------------------------------------
char  function_chk(char function_id)
{
// static char end_of_jump='S',break_flag_internal='O';  // 'S'= START 'F'OFF 'O'=ON
//------------------------------------------------------------------------------
 if (function_id==0 && end_of_jump=='S')       // stich data
 {
  if (break_flag_internal=='O')         // 'O'= ON
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
//------------------------------------------------------------------------------
 else if (function_id==1  )           // jump data
 {
  if (break_flag_internal=='F')
  {
   break_flag_internal='O';
   if ( back_start=='S')
   {
    break_on();
   }
  }
  end_of_jump='J';   //'J' JUMP
  return function_id;
 }
//------------------------------------------------------------------------------
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
//------------------------------------------------------------------------------
// char GET_DEGREE();
//------------------------------------------------------------------------------

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
  //____________________________//
  else  if (function==160||function==161||function==168||function==169||function==170)
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
  //____________________________//
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
  //____________________________//
  else  if (function==192||function==193||function==200||function==201||function==202)
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

//*/*******/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/

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
//______________________________________________________________________________
 else if (function==160||function==161||function==168||function==169||function==170)
 {
     if  (old_function==224||old_function==225||old_function==232||old_function==233||old_function==234)
     {
          old_function=function;
          rad=180.0-Z_Degree;
          OLD_Z_Degree=Z_Degree;
          Z_Degree=rad;
          rad=Z_Degree;
          degree=rad;
          dir=0x32;   //1------CCW  ,2=CW   ,0=NO Dirction,
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
          dir=0x21;   //1------CCW  ,2=CW   ,0=NO Dirction,
          Z_DIR_CCW();
     }
}
//______________________________________________________________________________
 else if (function==224||function==225||function==232||function==233||function==234)
 {
    if  (old_function==192||old_function==193||old_function==200||old_function==201||old_function==202)
    {
          old_function=function;
          OLD_Z_Degree=Z_Degree;
          Z_Degree=270.0-Z_Degree;
          rad=Z_Degree;
          degree=rad;
          dir=0x42;   //1------CCW  ,2=CW   ,0=NO Dirction,
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
          dir=0x31;   //1------CCW  ,2=CW   ,0=NO Dirction,
          Z_DIR_CCW();
     }
 }
//______________________________________________________________________________
 else if(function==192||function==193||function==200||function==201||function==202)
 {
   if  (old_function==128||old_function==129||old_function==136||old_function==137||old_function==138)
   {
    old_function=function;
    OLD_Z_Degree=Z_Degree;
    Z_Degree=360.0-Z_Degree;
    rad=Z_Degree;
    degree=rad;
    dir=0x12;   //1------CCW  ,2=CW   ,0=NO Dirction,
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
        Z_Degree=360.0-Z_Degree;////////////
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
        dir=0x41;   //1------CCW  ,2=CW   ,0=NO Dirction,
        Z_DIR_CCW();
   }
 }
  function_id =function_chk(function_id);
  return function_id;
}

//*************************************************************************************************************************
//                    END
//******************************************************************************
void writ_data(unsigned long  wadd, unsigned char wdata)
{
  rd_pin=rd_dis;
  ua1234
  8288
  rt2_write(Lo(wadd));
}
//*************************************************************************************************************************

unsigned short read_data(unsigned long wadd)
{
  unsigned char rdata;
  l_data_dir=0;
  rd_pin=rd_dis;
  wr_pin=wr_dis;

  l_data=Lo(wadd);
  h_data=Hi(wadd);
  ale_pin=1;
  ale_pin=0;

  l_data_dir=255;
  rd_pin=rd_en;
  rdata=portd;
  rd_pin=rd_dis;
  return rdata;
}

//******************************************************************************

void GET_DATA()
 {
  char function_name=0;
  
 if (f_r =='F')       ///------------------------------ FORWORD FUNCTION
 {
  if (read_data(WADD)!=248)
  {
    function=read_data(WADD);
    function_name = function & 0xF0;

//    UART2_Write(STOR[BLOCK]);
    if (function_name==0x80|| function_name==0xA0|| function_name==0xC0|| function_name==0xE0)
    {
      if (function_name==0x80)
      {
//        X_Dir_P();
//        Y_Dir_P();
        X_Dir_N();
        Y_Dir_N();
      }
      else if (function_name==0xA0)
      {
//        X_Dir_N();
//        Y_Dir_P();
        X_Dir_P();
        Y_Dir_N();
      }
     else  if (function_name==0xC0)
      {
//        X_Dir_P();
//        Y_Dir_N();
        X_Dir_N();
        Y_Dir_P();
      }
      else if (function_name==0xE0)
      {
//        X_Dir_N();
//        Y_Dir_N();
        X_Dir_P();
        Y_Dir_P();
      }
//      if (f_r=='F')
//      {

       WADD++;
       Y_distance=read_data(WADD);
//      }//      UART2_Write(STOR[BLOCK]);
//      if (f_r=='F')
//      {

       WADD++;
       X_distance=read_data(WADD);
//      UART2_Write(STOR[BLOCK]);
//      }
       WADD++;
    }
  }

  else
  {
   function=read_data(WADD);
//   UART2_Write(STOR[BLOCK]);
  }
 }
///------------------------------ REVERSE FUNCTION
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
  //    UART2_Write(STOR[BLOCK]);
      if (function_name==0x80|| function_name==0xA0|| function_name==0xC0|| function_name==0xE0)
      {
        if (function_name==0x80)
        {
  //        X_Dir_P();
  //        Y_Dir_P();
          X_Dir_N();
          Y_Dir_N();
        }
        else if (function_name==0xA0)
        {
  //        X_Dir_N();
  //        Y_Dir_P();
          X_Dir_P();
          Y_Dir_N();
        }
       else  if (function_name==0xC0)
        {
  //        X_Dir_P();
  //        Y_Dir_N();
          X_Dir_N();
          Y_Dir_P();
        }
        else if (function_name==0xE0)
        {
  //        X_Dir_N();
  //        Y_Dir_N();
          X_Dir_P();
          Y_Dir_P();
        }
     }
    }
   }
  else
  {
   function=read_data(WADD);
//   UART2_Write(STOR[BLOCK]);
  }
 }
///------------------------------ REVERSE FUNCTION
 /*
  else
 {

   WADD--;
   X_distance=read_data(WADD);


   WADD--;
   Y_distance=read_data(WADD);

   WADD--;
  if (read_data(WADD)!=248)
  {
    function=read_data(WADD);
    function_name = function & 0xF0;
//    UART2_Write(STOR[BLOCK]);
    if (function_name==0x80|| function_name==0xA0|| function_name==0xC0|| function_name==0xE0)
    {
      if (function_name==0x80)
      {
//        X_Dir_P();
//        Y_Dir_P();
        X_Dir_N();
        Y_Dir_N();
      }
      else if (function_name==0xA0)
      {
//        X_Dir_N();
//        Y_Dir_P();
        X_Dir_P();
        Y_Dir_N();
      }
     else  if (function_name==0xC0)
      {
//        X_Dir_P();
//        Y_Dir_N();
        X_Dir_N();
        Y_Dir_P();
      }
      else if (function_name==0xE0)
      {
//        X_Dir_N();
//        Y_Dir_N();
        X_Dir_P();
        Y_Dir_P();
      }
   }
  }
  else
  {
   function=read_data(WADD);
//   UART2_Write(STOR[BLOCK]);
  }
 }
 */
}
//******************************************************************************
void Saving_data()
{
   unsigned char storing_data;
   unsigned int  uncount=0;
   char _data_[4];
   WADD=513;
   
   storing_data = UART2_Read();
   storing_data = UART2_Read();
   cls();
   lcd_out(2,32-4,CopyConst2Ram(MSG,back));
   lcd_out(1,1,CopyConst2Ram(MSG,TXT_11)); //press okay on pc
  
  for(;;)
  {
    if(UART2_Data_Ready())
    {
     storing_data = UART2_Read();
     #ifdef state_life
     uncount++;
     if (uncount > 30000)
      {
      if (storing_data != 248)
      {
       storing_data = 0;
      }
     }
     #endif
    // writ_data(WADD,storing_data);
     
     if (storing_data==248)
     {
      UART2_Write(storing_data);
//      wadd=0;
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
     
     Lo(wadd)=_data_[0];
     Hi(wadd)=_data_[1];
     Higher(wadd)=_data_[2];
     Highest(wadd)=_data_[3];

/*if (back_BUTTON()==0)
    {
     break;
    }*/
}

//------------------------------------------------------------------------------

//******************************************************************************
// saving
//******************************************************************************
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
       LCD_OUT(1,1,CopyConst2Ram(MSG,TXT_22));     //SAVE START
       DELAY_MS(1000);
       break;
      }
     }
    }
    
    //WADD=513;
    //writ_data(21,Lo(WADD));
    //writ_data(22,Hi(WADD));
    CLS();
    LCD_OUT(1,1,CopyConst2Ram(MSG,TXT_10));     //SAVE START
//    while(ok_button()==1);
    Saving_data();                              //SAVING DATA
    WADD-=513;
    WADD/=3.0;
    writ_data(31,Lo(WADD));
    writ_data(32,Hi(WADD));
    cls();
    INTtostr(wadd,text11);
    LCD_OUT(1,1,TEXT11);
    lcd_out_CP(CopyConst2Ram(MSG,TXT_9));      //STICH SAVED
    while(ok_button()==1);
   }
   else
   {
    CLS();
    LCD_OUT(1,1,CopyConst2Ram(MSG,TXT_14));  //FILE FOUNDED
    LCD_OUT(2,1,CopyConst2Ram(MSG,TXT_17));  //NAME OF FILE
    lcd_chr_CP(READ_DATA(11));                // 1
    LCD_OUT(1,17,CopyConst2Ram(MSG,TXT_19));  //SAVE TO DEL  // wasat data

    LCD_OUT(2,32-3,CopyConst2Ram(MSG,del));
    while(ok_button()==1)
    {
     if (back_button()==0)
     {
      writ_data(5,'D');
      LCD_OUT(2,17,CopyConst2Ram(MSG,TXT_18));  //DELET FILE
      goto make_file  ;
     }
    }
    CLS();
   }
  }

//******************************************************************************
void SN_1_CHK()
{
   for(i=0;i<STEP_Z_MOTOR;i++)
   {
    CLK_Z=0;
    DELAY_uS( delays);
    CLK_Z=1;
    DELAY_uS( delays);
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
//*****************
void SN_2_CHK()
  {
    for(i=0;i<STEP_Z_MOTOR;i++)
   {
    CLK_Z=0;
    DELAY_uS( delays);
    CLK_Z=1;
    DELAY_uS( delays);
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
//*****************
 void SN_3_CHK()
   {
   for(i=0;i<STEP_Z_MOTOR;i++)
   {
    CLK_Z=0;
    DELAY_uS( delays);
    CLK_Z=1;
    DELAY_uS( delays);
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
//*****************
 void SN_4_CHK()
   {
   for(i=0;i<STEP_Z_MOTOR;i++)
   {
    CLK_Z=0;
    DELAY_uS( delays);
    CLK_Z=1;
    DELAY_uS( delays);
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

//******************************************************************************
void CHK_ALL_90_DEGREE()
  {
   UART2_Init(baud_rate);
   UART2_Write(10);
   UART2_Write(13);
   Z_DIR_CCW();
   EN_MAIN=1;
   delay_ms(500);
   while (1)
   {
    CLK_Z=0;
    DELAY_uS( delays);
    CLK_Z=1;
    DELAY_uS( delays);
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
    DELAY_uS(delays);
   CLK_Z=0;
   DELAY_uS(delays);
  }
 while(ok_button()==1);
}
//******************************************************************************
  void SN_1_REACHED()
  {
   char pre_direction=0;
   if (f_r_main == 'F')
   {
     pre_direction=Dir_Z;
     while(SN_1==1)
     {
      CLK_Z=1;
      DELAY_uS(delays);
      CLK_Z=0;
      DELAY_uS(delays);
      if (SN_2==1)
      {
       Dir_Z=~Dir_Z;
       while(SN_1==1)
       {
        CLK_Z=1;
        DELAY_uS(delays);
        CLK_Z=0;
        DELAY_uS(delays);
       }
      }
      else if (SN_4==1)
      {
       Dir_Z=~Dir_Z;
       while(SN_1==1)
       {
        CLK_Z=1;
        DELAY_uS(delays);
        CLK_Z=0;
        DELAY_uS(delays);
       }
      }
      
     }
     Dir_Z=pre_direction;
    /*
     for (extra_6=0;extra_6<1;extra_6++)
    {
     CLK_Z=1;
      DELAY_uS(delays);
     CLK_Z=0;
      DELAY_uS(delays);
     }
      */
   }

  else if (f_r_main == 'R')
   {

     while(SN_3 ==1)
     {
     CLK_Z=1;
      DELAY_uS(delays);
     CLK_Z=0;
      DELAY_uS(delays);
     }
     /*
     for (extra_6=0;extra_6<1;extra_6++)
     {
      CLK_Z=1;
      DELAY_uS(delays);
      CLK_Z=0;
      DELAY_uS(delays);
     }*/
    }

 }

  void SN_2_REACHED()
  {
int  pre_direction;
  if (f_r_main == 'F')
  {
     pre_direction=Dir_Z;
     while(SN_2==1)
    {
     CLK_Z=1;
      DELAY_uS(delays);
     CLK_Z=0;
      DELAY_uS(delays);
      if (SN_1==1)
      {
       Dir_Z=~Dir_Z;
       while(SN_2==1)
       {
        CLK_Z=1;
        DELAY_uS(delays);
        CLK_Z=0;
        DELAY_uS(delays);
       }
      }
      else if (SN_3==1)
      {
       Dir_Z=~Dir_Z;
       while(SN_2==1)
       {
        CLK_Z=1;
        DELAY_uS(delays);
        CLK_Z=0;
        DELAY_uS(delays);
       }
      }
    }
    Dir_Z=pre_direction;
    /*
    for (extra_6=0;extra_6<1;extra_6++)
    {
     CLK_Z=1;
      DELAY_uS(delays);
     CLK_Z=0;
      DELAY_uS(delays);
    } */
   }

  else  if (f_r_main == 'R')
  {

     while(SN_4 ==1)
    {
     CLK_Z=1;
      DELAY_uS(delays);
     CLK_Z=0;
      DELAY_uS(delays);
    }
     /*
    for (extra_6=0;extra_6<1;extra_6++)
    {
     CLK_Z=1;
      DELAY_uS(delays);
     CLK_Z=0;
      DELAY_uS(delays);
    }   */
   }

 }

  void SN_3_REACHED()
  {
int  pre_direction;
  if (f_r_main == 'F')
  {
     pre_direction=Dir_Z;
     while(SN_3==1)
    {
     CLK_Z=1;
      DELAY_uS(delays);
     CLK_Z=0;
      DELAY_uS(delays);
      if (SN_2==1)
      {
       Dir_Z=~Dir_Z;
       while(SN_3==1)
       {
        CLK_Z=1;
        DELAY_uS(delays);
        CLK_Z=0;
        DELAY_uS(delays);
       }
      }
      else if (SN_4==1)
      {
       Dir_Z=~Dir_Z;
       while(SN_3==1)
       {
        CLK_Z=1;
        DELAY_uS(delays);
        CLK_Z=0;
        DELAY_uS(delays);
       }
      }
    }
    Dir_Z=pre_direction;
     /*
    for (extra_6=0;extra_6<1;extra_6++)
    {
     CLK_Z=1;
      DELAY_uS(delays);
     CLK_Z=0;
      DELAY_uS(delays);
    }   */
   }

  else if (f_r_main == 'R')
  {

     while(SN_1==1)
    {
     CLK_Z=1;
      DELAY_uS(delays);
     CLK_Z=0;
      DELAY_uS(delays);
    }
      /*
    for (extra_6=0;extra_6<1;extra_6++)
    {
     CLK_Z=1;
      DELAY_uS(delays);
     CLK_Z=0;
      DELAY_uS(delays);
    }   */
   }

 }

  void SN_4_REACHED()
  {
int  pre_direction;
  if (f_r_main =='F')
   {
     pre_direction=Dir_Z;
     while(SN_4==1)
     {
     CLK_Z=1;
      DELAY_uS(delays);
     CLK_Z=0;
      DELAY_uS(delays);

      if (SN_1==1)
      {
       Dir_Z=~Dir_Z;
       while(SN_4==1)
       {
        CLK_Z=1;
        DELAY_uS(delays);
        CLK_Z=0;
        DELAY_uS(delays);
       }
      }
      else if (SN_3==1)
      {
       Dir_Z=~Dir_Z;
       while(SN_4==1)
       {
        CLK_Z=1;
        DELAY_uS(delays);
        CLK_Z=0;
        DELAY_uS(delays);
       }
      }
    
    }
    Dir_Z=pre_direction;
    /*
    for (extra_6=0;extra_6<1;extra_6++)
    {
     CLK_Z=1;
      DELAY_uS(delays);
     CLK_Z=0;
      DELAY_uS(delays);
    }     */
   }

  else if (f_r_main =='R')
   {

     while(SN_2==1)
     {
     CLK_Z=1;
      DELAY_uS(delays);
     CLK_Z=0;
      DELAY_uS(delays);
    }
    /*
    for (extra_6=0;extra_6<1;extra_6++)
    {
     CLK_Z=1;
      DELAY_uS(delays);
     CLK_Z=0;
      DELAY_uS(delays);
    }    */
   }
 }
//------------------------------------------------------------------------------
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
      DELAY_uS(delays);
      CLK_Z=0;
      DELAY_uS(delays);
     }
    }
    while(ok_button()==0);
    while(ok_button()==1);
    while(ok_button()==0);
//    thread_pick();
    Z_DIR_CW();
    for(;clock_save>0;clock_save--)
    {
     CLK_Z=1;
     DELAY_uS(delays);
     CLK_Z=0;
     DELAY_uS(delays);
    }
  
  
  Dir_Z=direction_save;
 }
 
//******************************************************************************
void SET_POSITION()
 {
   unsigned char Dir_SET_POSITION;
   Dir_SET_POSITION=dir;
//   Dir_SET_POSITION&=0xf0;
   Dir_SET_POSITION  =Dir_SET_POSITION >> 4;
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
  // trisb.B7=0;
   for(ind=0;ind<ru;ind++)
   {
   delay_ms(300);
   portb.b7=0;
   delay_ms(300);
   portb.b7=1;
  }
}

/******************************************************************************/
//
/******************************************************************************/
void Running()
{
 /*
  back_lash_flag_x=dir_x;
  back_lash_flag_y=dir_y;
  if (back_lash_flag_x!=old_back_lash_flag_x)
  {
   old_back_lash_flag_x=back_lash_flag_x;
   back_lash_x=back_lash;
//   XX=X_distance+back_lash_x;
  }
  else
  {
   XX=X_distance;
  }
  
  if (back_lash_flag_y!=old_back_lash_flag_y)
  {
   old_back_lash_flag_y=back_lash_flag_y;
   back_lash_y=back_lash;
   YY=Y_distance + back_lash_y;
  }
  else 
  {
   YY=Y_distance;
  }
*/
  XX=X_distance;        //initialation of steps to rotat     x
  YY=Y_distance;       //initialation of steps to rotat     y
  ZZ=Degree/0.9;        //initialation of steps to rotat     z
  x_complite=0;y_complite=0;z_complite=0;
  monitor_1=0;
  RPM_SET(Timer_0);
  RPM_SET(Timer_1);
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
  RPM_SET(Timer_3);
  if (Z_RPM!=0.0) 
  {
   Timer3_ON();
  }
  else z_complite=1;
}

///*****************************************************************************

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

  //******************************************************************************
   rd_pin_dir=0;
   wr_pin_dir=0;
   ale_pin_dir=0;
   l_data_dir=255;
   h_data_dir=0;
  //******************************************************************************
   rd_pin=1;
   wr_pin=1;
  l_data=0;
   h_data=0;
   
   Main_SENSOR_DIR_2=1;
   
   //**************************************************************************
  thread_free_clk=0;
  thread_free_clk_direction=0;
  thread_free_dir=0;
  thread_free_dir_direction=0;
  //******************************************************************************
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

//--------
   t_pin_DIR=1;
   t_pin_DIR_2=1;
   
   Main_SENSOR_DIR=1;
   Main_SENSOR=1;
   UART2_Init(baud_rate);
   delay_ms(200);
   UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle); // set UART2 active
   UART2_WRITE_TEXT("HELO WORLD");
   Lcd_Init();
   delay_ms(200);
   LCD_CMD(_LCD_CURSOR_OFF);
   LCD_CMD(_LCD_UNDERLINE_ON);
   LCD_CMD(_LCD_CURSOR_OFF);
   delay_ms(40);

  //******************************************************************************
   Disable_intR();
   OLD_FUNCTION=224;
   OLD_Z_Degree=270.0;
 }