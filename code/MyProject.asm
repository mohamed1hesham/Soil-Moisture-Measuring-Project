
_main:

;MyProject.c,4 :: 		void main() {
;MyProject.c,5 :: 		trisb.b0=0;
	BCF        TRISB+0, 0
;MyProject.c,6 :: 		trisb.b1=1;
	BSF        TRISB+0, 1
;MyProject.c,7 :: 		trisd=0;
	CLRF       TRISD+0
;MyProject.c,8 :: 		portd=0;
	CLRF       PORTD+0
;MyProject.c,9 :: 		ADC_Init();
	CALL       _ADC_Init+0
;MyProject.c,10 :: 		PWM1_Init(1000);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM1_Init+0
;MyProject.c,11 :: 		PWM1_Start();
	CALL       _PWM1_Start+0
;MyProject.c,12 :: 		PWM2_Init(1000);
	BSF        T2CON+0, 0
	BSF        T2CON+0, 1
	MOVLW      124
	MOVWF      PR2+0
	CALL       _PWM2_Init+0
;MyProject.c,13 :: 		PWM2_Start();
	CALL       _PWM2_Start+0
;MyProject.c,14 :: 		while(1){
L_main0:
;MyProject.c,15 :: 		while(button==1){
L_main2:
	BTFSS      PORTB+0, 1
	GOTO       L_main3
;MyProject.c,16 :: 		ThevalueOfTheSensor=ADC_Read(3) ;
	MOVLW      3
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _ThevalueOfTheSensor+0
	MOVF       R0+1, 0
	MOVWF      _ThevalueOfTheSensor+1
;MyProject.c,17 :: 		if(ThevalueOfTheSensor >=600){
	MOVLW      128
	XORWF      R0+1, 0
	MOVWF      R2+0
	MOVLW      128
	XORLW      2
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main21
	MOVLW      88
	SUBWF      R0+0, 0
L__main21:
	BTFSS      STATUS+0, 0
	GOTO       L_main4
;MyProject.c,18 :: 		motor=1;
	BSF        PORTB+0, 0
;MyProject.c,19 :: 		PWM1_Set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,20 :: 		PWM2_Set_Duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;MyProject.c,21 :: 		portd.b0=0;
	BCF        PORTD+0, 0
;MyProject.c,22 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
;MyProject.c,23 :: 		PWM1_Set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,24 :: 		PWM2_Set_Duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;MyProject.c,25 :: 		portd.b1=0;
	BCF        PORTD+0, 1
;MyProject.c,26 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	NOP
;MyProject.c,27 :: 		PWM1_Set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,28 :: 		PWM2_Set_Duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;MyProject.c,29 :: 		portd.b2=0;
	BCF        PORTD+0, 2
;MyProject.c,30 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
;MyProject.c,31 :: 		}else if(ThevalueOfTheSensor >=500 && ThevalueOfTheSensor <600){
	GOTO       L_main8
L_main4:
	MOVLW      128
	XORWF      _ThevalueOfTheSensor+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      1
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main22
	MOVLW      244
	SUBWF      _ThevalueOfTheSensor+0, 0
L__main22:
	BTFSS      STATUS+0, 0
	GOTO       L_main11
	MOVLW      128
	XORWF      _ThevalueOfTheSensor+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      2
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main23
	MOVLW      88
	SUBWF      _ThevalueOfTheSensor+0, 0
L__main23:
	BTFSC      STATUS+0, 0
	GOTO       L_main11
L__main19:
;MyProject.c,32 :: 		motor=1;
	BSF        PORTB+0, 0
;MyProject.c,33 :: 		PWM1_Set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,34 :: 		PWM2_Set_Duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;MyProject.c,35 :: 		portd.b0=0;
	BCF        PORTD+0, 0
;MyProject.c,36 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main12:
	DECFSZ     R13+0, 1
	GOTO       L_main12
	DECFSZ     R12+0, 1
	GOTO       L_main12
	NOP
;MyProject.c,37 :: 		PWM1_Set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,38 :: 		PWM2_Set_Duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;MyProject.c,39 :: 		portd.b1=0;
	BCF        PORTD+0, 1
;MyProject.c,40 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	NOP
;MyProject.c,41 :: 		PWM1_Set_Duty(255);
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,42 :: 		PWM2_Set_Duty(255);
	MOVLW      255
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;MyProject.c,43 :: 		portd.b2=1;
	BSF        PORTD+0, 2
;MyProject.c,44 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	NOP
;MyProject.c,45 :: 		}
	GOTO       L_main15
L_main11:
;MyProject.c,47 :: 		motor=0;
	BCF        PORTB+0, 0
;MyProject.c,48 :: 		PWM1_Set_Duty(255);
	MOVLW      255
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,49 :: 		PWM2_Set_Duty(255);
	MOVLW      255
	MOVWF      FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;MyProject.c,50 :: 		portd.b0=1;
	BSF        PORTD+0, 0
;MyProject.c,51 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	NOP
;MyProject.c,52 :: 		PWM1_Set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,53 :: 		PWM2_Set_Duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;MyProject.c,54 :: 		portd.b1=0;
	BCF        PORTD+0, 1
;MyProject.c,55 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	NOP
;MyProject.c,56 :: 		PWM1_Set_Duty(0);
	CLRF       FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;MyProject.c,57 :: 		PWM2_Set_Duty(0);
	CLRF       FARG_PWM2_Set_Duty_new_duty+0
	CALL       _PWM2_Set_Duty+0
;MyProject.c,58 :: 		portd.b2=0;
	BCF        PORTD+0, 2
;MyProject.c,59 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main18:
	DECFSZ     R13+0, 1
	GOTO       L_main18
	DECFSZ     R12+0, 1
	GOTO       L_main18
	NOP
;MyProject.c,60 :: 		}}}  }
L_main15:
L_main8:
	GOTO       L_main2
L_main3:
	GOTO       L_main0
L_end_main:
	GOTO       $+0
; end of _main
