void timer3_init();
void timer3_on();
void timer3_off();
void timer3_enable();
void timer3_DISABLE();
void Timer3_flag_clear();

void timer3_on(){
 T3CON.TMR3ON  = 1;// bit 0 enables timer
}
void timer3_off(){
 T3CON.TMR3ON  = 0;// bit 0 enables timer
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
// Timer3 Registers:
// Prescaler=1:1; TMR3 Preset=0; Freq=610.35156Hz; Period=1,638,400 ns
IPR2.TMR3IP=1;
T3CON.RD16=1;
PIR2.TMR3IF=0;

T3CON.T3CKPS1 = 0;// bits 5-4  Prescaler Rate Select bits
T3CON.T3CKPS0 = 0;//
T3CON.T3SYNC  = 0;// bit 2 Timer3 External Clock Input Synchronization Control bit: 1=Do not synchronize external clock input
T3CON.TMR3CS  = 0;// bit 1 Timer3 Clock Source Select bit:0=Internal clock (FOSC/4)
T3CON.TMR3ON  = 0;// bit 0 enables timer
TMR3H = 0x0;       // preset for timer3 MSB register
TMR3L = 0x0;       // preset for timer3 LSB register
}