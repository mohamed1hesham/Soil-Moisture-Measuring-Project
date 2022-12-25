#define motor portb.b0
#define button portb.b1
int ThevalueOfTheSensor;
void main() {
trisb.b0=0;
trisb.b1=1;
trisd=0;
portd=0;
ADC_Init();
PWM1_Init(1000);
PWM1_Start();
PWM2_Init(1000);
PWM2_Start();
while(1){
 while(button==1){
 ThevalueOfTheSensor=ADC_Read(3) ;
 if(ThevalueOfTheSensor >=600){
     motor=1;
     PWM1_Set_Duty(0);
     PWM2_Set_Duty(0);
     portd.b0=0;
     delay_ms(10);
     PWM1_Set_Duty(0);
     PWM2_Set_Duty(0);
     portd.b1=0;
     delay_ms(10(;
     PWM1_Set_Duty(0);
     PWM2_Set_Duty(0);
     portd.b2=0;
     delay_ms(10);
 }else if(ThevalueOfTheSensor >=500 && ThevalueOfTheSensor <600){
     motor=1;
     PWM1_Set_Duty(0);
     PWM2_Set_Duty(0);
     portd.b0=0;
     delay_ms(10);
     PWM1_Set_Duty(0);
     PWM2_Set_Duty(0);
     portd.b1=0;
     delay_ms(10);
     PWM1_Set_Duty(255);
     PWM2_Set_Duty(255);
     portd.b2=1;
     delay_ms(10);
 }
 else{
    motor=0;
   PWM1_Set_Duty(255);
     PWM2_Set_Duty(255);
     portd.b0=1;
     delay_ms(10);
     PWM1_Set_Duty(0);
     PWM2_Set_Duty(0);
     portd.b1=0;
     delay_ms(10);
     PWM1_Set_Duty(0);
     PWM2_Set_Duty(0);
     portd.b2=0;
     delay_ms(10);
 }}}  }