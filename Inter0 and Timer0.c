//********************************** Proto Type Area ***************************
void disable_intr();
void Enable_intr();

void INT0_EDG(char x);
void EXT0INT(char x);

void TIMER0_EN(char x);
void timer0onOFF(char x);
void timer0_Intit();
//********************************** End of Proto Type Area ********************

void INT0_EDG(char x) {
 if (x==0) {          // Zero for low edge select
   INTCON2.INTEDG0=0;
  }
 if (x==1) {          // One for high edge select
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

/*void timer0onOFF(char x){
     if (x==1){
     T0CON|=(1<<TMR0ON);
     }
     if (x==0){
     T0CON&=~(1<<TMR0ON);
  }
}*/

void Timer0_ON(){
 T0CON|=(1<<TMR0ON);
}

void Timer0_Off(){
 T0CON&=~(1<<TMR0ON);
}

void timer0_Intit() {
  // Timer0 Registers:// 16-Bit Mode; Prescaler=1:1; TMRH Preset=DC; TMRL Preset=00; Freq=2,400.00Hz; Period=416.67 µs
  T0CON.TMR0ON = 0;// Timer0 On/Off Control bit:1=Enables Timer0 / 0=Stops Timer0
  T0CON.T08BIT = 0;// Timer0 8-bit/16-bit Control bit: 1=8-bit timer/counter / 0=16-bit timer/counter
  T0CON.T0CS   = 0;// TMR0 Clock Source Select bit: 0=Internal Clock (CLKO) / 1=Transition on T0CKI pin
  T0CON.T0SE   = 0;// TMR0 Source Edge Select bit: 0=low/high / 1=high/low
  T0CON.PSA    = 1;// Prescaler Assignment bit: 0=Prescaler is assigned; 1=NOT assigned/bypassed
  T0CON.T0PS2  = 0;// bits 2-0  PS2:PS0: Prescaler Select bits
  T0CON.T0PS1  = 0;
  T0CON.T0PS0  = 0;
  TMR0H = Timer0_h;    // preset for Timer0 MSB register
  TMR0L = Timer0_l;    // preset for Timer0 LSB register
}