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