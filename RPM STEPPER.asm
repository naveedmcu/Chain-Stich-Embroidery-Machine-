
_CopyConst2Ram:

;ex_function.c,6 :: 		char * CopyConst2Ram(char * dest, const char * src){
;ex_function.c,8 :: 		d = dest;
	MOVF        FARG_CopyConst2Ram_dest+0, 0 
	MOVWF       R5 
	MOVF        FARG_CopyConst2Ram_dest+1, 0 
	MOVWF       R6 
;ex_function.c,9 :: 		for(;*dest++ = *src++;);
L_CopyConst2Ram0:
	MOVF        FARG_CopyConst2Ram_dest+0, 0 
	MOVWF       R3 
	MOVF        FARG_CopyConst2Ram_dest+1, 0 
	MOVWF       R4 
	INFSNZ      FARG_CopyConst2Ram_dest+0, 1 
	INCF        FARG_CopyConst2Ram_dest+1, 1 
	MOVF        FARG_CopyConst2Ram_src+0, 0 
	MOVWF       R0 
	MOVF        FARG_CopyConst2Ram_src+1, 0 
	MOVWF       R1 
	MOVF        FARG_CopyConst2Ram_src+2, 0 
	MOVWF       R2 
	MOVLW       1
	ADDWF       FARG_CopyConst2Ram_src+0, 1 
	MOVLW       0
	ADDWFC      FARG_CopyConst2Ram_src+1, 1 
	ADDWFC      FARG_CopyConst2Ram_src+2, 1 
	MOVF        R0, 0 
	MOVWF       TBLPTRL 
	MOVF        R1, 0 
	MOVWF       TBLPTRH 
	MOVF        R2, 0 
	MOVWF       TBLPTRU 
	TBLRD*+
	MOVFF       TABLAT+0, R0
	MOVFF       R3, FSR1
	MOVFF       R4, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
	MOVFF       R3, FSR0
	MOVFF       R4, FSR0H
	MOVF        POSTINC0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_CopyConst2Ram1
	GOTO        L_CopyConst2Ram0
L_CopyConst2Ram1:
;ex_function.c,11 :: 		return d;
	MOVF        R5, 0 
	MOVWF       R0 
	MOVF        R6, 0 
	MOVWF       R1 
;ex_function.c,12 :: 		}
L_end_CopyConst2Ram:
	RETURN      0
; end of _CopyConst2Ram

_LCD_OK_DIS:

;ex_function.c,14 :: 		void LCD_OK_DIS()
;ex_function.c,16 :: 		LCD_OUT(2,21,CopyConst2Ram(MSG,TXT_16));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _TXT_16+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_TXT_16+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_TXT_16+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       21
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;ex_function.c,17 :: 		lcd_out(2,21,CopyConst2Ram(MSG,TXT_15));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _TXT_15+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_TXT_15+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_TXT_15+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       21
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;ex_function.c,18 :: 		delay_ms(500);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_LCD_OK_DIS3:
	DECFSZ      R13, 1, 1
	BRA         L_LCD_OK_DIS3
	DECFSZ      R12, 1, 1
	BRA         L_LCD_OK_DIS3
	DECFSZ      R11, 1, 1
	BRA         L_LCD_OK_DIS3
	NOP
;ex_function.c,19 :: 		LCD_OUT(2,21,CopyConst2Ram(MSG,TXT_16));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _TXT_16+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_TXT_16+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_TXT_16+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       21
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;ex_function.c,20 :: 		}
L_end_LCD_OK_DIS:
	RETURN      0
; end of _LCD_OK_DIS

_en_on:

;ex_function.c,22 :: 		void en_on()
;ex_function.c,24 :: 		en_MAIN=1;
	BSF         LATE+0, 0 
;ex_function.c,25 :: 		main_motor=1;
	BSF         PORTC+0, 5 
;ex_function.c,26 :: 		}
L_end_en_on:
	RETURN      0
; end of _en_on

_en_off:

;ex_function.c,27 :: 		void en_off()
;ex_function.c,29 :: 		en_MAIN =0;
	BCF         LATE+0, 0 
;ex_function.c,30 :: 		main_motor=0;
	BCF         PORTC+0, 5 
;ex_function.c,31 :: 		}
L_end_en_off:
	RETURN      0
; end of _en_off

_relay_off:

;ex_function.c,32 :: 		void relay_off()
;ex_function.c,34 :: 		relay_pin=0;
	BCF         LATE+0, 1 
;ex_function.c,35 :: 		}
L_end_relay_off:
	RETURN      0
; end of _relay_off

_relay_on:

;ex_function.c,36 :: 		void relay_on()
;ex_function.c,38 :: 		relay_pin=1;
	BSF         LATE+0, 1 
;ex_function.c,39 :: 		DELAY_MS(10);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_relay_on4:
	DECFSZ      R13, 1, 1
	BRA         L_relay_on4
	DECFSZ      R12, 1, 1
	BRA         L_relay_on4
	NOP
	NOP
;ex_function.c,40 :: 		}
L_end_relay_on:
	RETURN      0
; end of _relay_on

_cls:

;ex_function.c,42 :: 		void cls()
;ex_function.c,44 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ex_function.c,45 :: 		}
L_end_cls:
	RETURN      0
; end of _cls

_right_button:

;ex_function.c,48 :: 		char right_button()
;ex_function.c,50 :: 		if (Button(&PORTB, 6, 1, 0)==255)
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       6
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_right_button5
;ex_function.c,52 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_right_button
;ex_function.c,53 :: 		}
L_right_button5:
;ex_function.c,55 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
;ex_function.c,56 :: 		}
L_end_right_button:
	RETURN      0
; end of _right_button

_left_button:

;ex_function.c,57 :: 		char left_button()
;ex_function.c,59 :: 		if (Button(&PORTB, 7, 1, 0)==255)
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       7
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_left_button7
;ex_function.c,61 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_left_button
;ex_function.c,62 :: 		}
L_left_button7:
;ex_function.c,64 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
;ex_function.c,65 :: 		}
L_end_left_button:
	RETURN      0
; end of _left_button

_down_button:

;ex_function.c,66 :: 		char down_button()
;ex_function.c,68 :: 		if (Button(&PORTB, 5, 1, 0)==255)
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       5
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_down_button9
;ex_function.c,70 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_down_button
;ex_function.c,71 :: 		}
L_down_button9:
;ex_function.c,73 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
;ex_function.c,74 :: 		}
L_end_down_button:
	RETURN      0
; end of _down_button

_up_button:

;ex_function.c,76 :: 		char up_button()
;ex_function.c,78 :: 		if (Button(&PORTB, 4, 1, 0)==255)
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       4
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_up_button11
;ex_function.c,80 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_up_button
;ex_function.c,81 :: 		}
L_up_button11:
;ex_function.c,83 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
;ex_function.c,84 :: 		}
L_end_up_button:
	RETURN      0
; end of _up_button

_CENTOR_button:

;ex_function.c,85 :: 		char CENTOR_button()
;ex_function.c,87 :: 		if (Button(&PORTJ, 0, 1, 0)==255)
	MOVLW       PORTJ+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTJ+0)
	MOVWF       FARG_Button_port+1 
	CLRF        FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_CENTOR_button13
;ex_function.c,89 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_CENTOR_button
;ex_function.c,90 :: 		}
L_CENTOR_button13:
;ex_function.c,92 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
;ex_function.c,93 :: 		}
L_end_CENTOR_button:
	RETURN      0
; end of _CENTOR_button

_save_button:

;ex_function.c,94 :: 		char save_button()
;ex_function.c,96 :: 		if (Button(&PORTJ, 1, 1, 0)==255)
	MOVLW       PORTJ+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTJ+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       1
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_save_button15
;ex_function.c,98 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_save_button
;ex_function.c,99 :: 		}
L_save_button15:
;ex_function.c,101 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
;ex_function.c,102 :: 		}
L_end_save_button:
	RETURN      0
; end of _save_button

_back_button:

;ex_function.c,103 :: 		char back_button()
;ex_function.c,105 :: 		if (Button(&PORTB, 1, 1, 0)==255)
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       1
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_back_button17
;ex_function.c,107 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_back_button
;ex_function.c,108 :: 		}
L_back_button17:
;ex_function.c,110 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
;ex_function.c,111 :: 		}
L_end_back_button:
	RETURN      0
; end of _back_button

_OK_button:

;ex_function.c,112 :: 		char OK_button()
;ex_function.c,114 :: 		lcd_out(2,21,CopyConst2Ram(MSG,e0));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _e0+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_e0+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_e0+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       21
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;ex_function.c,115 :: 		if (Button(&PORTB, 3, 1, 0)==255)
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       3
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_OK_button19
;ex_function.c,117 :: 		LCD_OK_DIS();
	CALL        _LCD_OK_DIS+0, 0
;ex_function.c,118 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_OK_button
;ex_function.c,119 :: 		}
L_OK_button19:
;ex_function.c,121 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
;ex_function.c,122 :: 		}
L_end_OK_button:
	RETURN      0
; end of _OK_button

_OK_button_1:

;ex_function.c,123 :: 		char OK_button_1()
;ex_function.c,125 :: 		if (Button(&PORTB, 3, 1, 0)==255)
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       3
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_OK_button_121
;ex_function.c,127 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_OK_button_1
;ex_function.c,128 :: 		}
L_OK_button_121:
;ex_function.c,130 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
;ex_function.c,131 :: 		}
L_end_OK_button_1:
	RETURN      0
; end of _OK_button_1

_start_button:

;ex_function.c,132 :: 		char start_button()
;ex_function.c,134 :: 		if (Button(&PORTB, 2, 1, 0)==255)
	MOVLW       PORTB+0
	MOVWF       FARG_Button_port+0 
	MOVLW       hi_addr(PORTB+0)
	MOVWF       FARG_Button_port+1 
	MOVLW       2
	MOVWF       FARG_Button_pin+0 
	MOVLW       1
	MOVWF       FARG_Button_time_ms+0 
	CLRF        FARG_Button_active_state+0 
	CALL        _Button+0, 0
	MOVF        R0, 0 
	XORLW       255
	BTFSS       STATUS+0, 2 
	GOTO        L_start_button23
;ex_function.c,136 :: 		return 0;
	CLRF        R0 
	GOTO        L_end_start_button
;ex_function.c,137 :: 		}
L_start_button23:
;ex_function.c,139 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
;ex_function.c,140 :: 		}
L_end_start_button:
	RETURN      0
; end of _start_button

_thread_free:

;ex_function.c,142 :: 		void thread_free()
;ex_function.c,144 :: 		unsigned int thread_counter=0;
	CLRF        thread_free_thread_counter_L0+0 
	CLRF        thread_free_thread_counter_L0+1 
;ex_function.c,145 :: 		thread_free_dir=0;
	BCF         PORTC+0, 6 
;ex_function.c,146 :: 		for (thread_counter=0;thread_counter<25;thread_counter++)
	CLRF        thread_free_thread_counter_L0+0 
	CLRF        thread_free_thread_counter_L0+1 
L_thread_free25:
	MOVLW       0
	SUBWF       thread_free_thread_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__thread_free829
	MOVLW       25
	SUBWF       thread_free_thread_counter_L0+0, 0 
L__thread_free829:
	BTFSC       STATUS+0, 0 
	GOTO        L_thread_free26
;ex_function.c,148 :: 		delay_ms(1);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_thread_free28:
	DECFSZ      R13, 1, 1
	BRA         L_thread_free28
	DECFSZ      R12, 1, 1
	BRA         L_thread_free28
	NOP
	NOP
;ex_function.c,149 :: 		thread_free_clk=1;
	BSF         PORTC+0, 7 
;ex_function.c,150 :: 		delay_ms(1);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_thread_free29:
	DECFSZ      R13, 1, 1
	BRA         L_thread_free29
	DECFSZ      R12, 1, 1
	BRA         L_thread_free29
	NOP
	NOP
;ex_function.c,151 :: 		thread_free_clk=0;
	BCF         PORTC+0, 7 
;ex_function.c,146 :: 		for (thread_counter=0;thread_counter<25;thread_counter++)
	INFSNZ      thread_free_thread_counter_L0+0, 1 
	INCF        thread_free_thread_counter_L0+1, 1 
;ex_function.c,152 :: 		}
	GOTO        L_thread_free25
L_thread_free26:
;ex_function.c,153 :: 		}
L_end_thread_free:
	RETURN      0
; end of _thread_free

_thread_tight:

;ex_function.c,154 :: 		void thread_tight()
;ex_function.c,156 :: 		unsigned int thread_counter=0;
	CLRF        thread_tight_thread_counter_L0+0 
	CLRF        thread_tight_thread_counter_L0+1 
;ex_function.c,157 :: 		thread_free_dir=1;
	BSF         PORTC+0, 6 
;ex_function.c,158 :: 		for (thread_counter=0;thread_counter<25;thread_counter++)
	CLRF        thread_tight_thread_counter_L0+0 
	CLRF        thread_tight_thread_counter_L0+1 
L_thread_tight30:
	MOVLW       0
	SUBWF       thread_tight_thread_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__thread_tight831
	MOVLW       25
	SUBWF       thread_tight_thread_counter_L0+0, 0 
L__thread_tight831:
	BTFSC       STATUS+0, 0 
	GOTO        L_thread_tight31
;ex_function.c,160 :: 		delay_ms(1);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_thread_tight33:
	DECFSZ      R13, 1, 1
	BRA         L_thread_tight33
	DECFSZ      R12, 1, 1
	BRA         L_thread_tight33
	NOP
	NOP
;ex_function.c,161 :: 		thread_free_clk=1;
	BSF         PORTC+0, 7 
;ex_function.c,162 :: 		delay_ms(1);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_thread_tight34:
	DECFSZ      R13, 1, 1
	BRA         L_thread_tight34
	DECFSZ      R12, 1, 1
	BRA         L_thread_tight34
	NOP
	NOP
;ex_function.c,163 :: 		thread_free_clk=0;
	BCF         PORTC+0, 7 
;ex_function.c,158 :: 		for (thread_counter=0;thread_counter<25;thread_counter++)
	INFSNZ      thread_tight_thread_counter_L0+0, 1 
	INCF        thread_tight_thread_counter_L0+1, 1 
;ex_function.c,164 :: 		}
	GOTO        L_thread_tight30
L_thread_tight31:
;ex_function.c,165 :: 		}
L_end_thread_tight:
	RETURN      0
; end of _thread_tight

_break_on:

;ex_function.c,167 :: 		void break_on()
;ex_function.c,170 :: 		b_dir=0;
	BCF         LATF+0, 6 
;ex_function.c,171 :: 		b_clk=0;
	BCF         LATF+0, 7 
;ex_function.c,172 :: 		for(b_counter=0;b_counter<175;b_counter++)
	CLRF        break_on_b_counter_L0+0 
	CLRF        break_on_b_counter_L0+1 
L_break_on35:
	MOVLW       128
	XORWF       break_on_b_counter_L0+1, 0 
	MOVWF       R0 
	MOVLW       128
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__break_on833
	MOVLW       175
	SUBWF       break_on_b_counter_L0+0, 0 
L__break_on833:
	BTFSC       STATUS+0, 0 
	GOTO        L_break_on36
;ex_function.c,174 :: 		b_clk=~b_clk;
	BTG         LATF+0, 7 
;ex_function.c,175 :: 		delay_us(break_motor_delay_on);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_break_on38:
	DECFSZ      R13, 1, 1
	BRA         L_break_on38
	DECFSZ      R12, 1, 1
	BRA         L_break_on38
	NOP
;ex_function.c,172 :: 		for(b_counter=0;b_counter<175;b_counter++)
	INFSNZ      break_on_b_counter_L0+0, 1 
	INCF        break_on_b_counter_L0+1, 1 
;ex_function.c,176 :: 		}
	GOTO        L_break_on35
L_break_on36:
;ex_function.c,177 :: 		thread_free();
	CALL        _thread_free+0, 0
;ex_function.c,178 :: 		}
L_end_break_on:
	RETURN      0
; end of _break_on

_break_off:

;ex_function.c,180 :: 		void break_off()
;ex_function.c,182 :: 		unsigned int b_counter=0;
	CLRF        break_off_b_counter_L0+0 
	CLRF        break_off_b_counter_L0+1 
;ex_function.c,183 :: 		thread_tight();
	CALL        _thread_tight+0, 0
;ex_function.c,184 :: 		b_dir=1;
	BSF         LATF+0, 6 
;ex_function.c,185 :: 		b_clk=0;
	BCF         LATF+0, 7 
;ex_function.c,186 :: 		for(b_counter=0;b_counter<175;b_counter++)
	CLRF        break_off_b_counter_L0+0 
	CLRF        break_off_b_counter_L0+1 
L_break_off39:
	MOVLW       0
	SUBWF       break_off_b_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__break_off835
	MOVLW       175
	SUBWF       break_off_b_counter_L0+0, 0 
L__break_off835:
	BTFSC       STATUS+0, 0 
	GOTO        L_break_off40
;ex_function.c,188 :: 		b_clk=~b_clk;
	BTG         LATF+0, 7 
;ex_function.c,189 :: 		delay_us(break_motor_delay_off);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       228
	MOVWF       R13, 0
L_break_off42:
	DECFSZ      R13, 1, 1
	BRA         L_break_off42
	DECFSZ      R12, 1, 1
	BRA         L_break_off42
	NOP
;ex_function.c,186 :: 		for(b_counter=0;b_counter<175;b_counter++)
	INFSNZ      break_off_b_counter_L0+0, 1 
	INCF        break_off_b_counter_L0+1, 1 
;ex_function.c,190 :: 		}
	GOTO        L_break_off39
L_break_off40:
;ex_function.c,191 :: 		}
L_end_break_off:
	RETURN      0
; end of _break_off

_thread_pick:

;ex_function.c,193 :: 		void thread_pick()
;ex_function.c,195 :: 		break_off();
	CALL        _break_off+0, 0
;ex_function.c,196 :: 		delay_us(1);
	MOVLW       3
	MOVWF       R13, 0
L_thread_pick43:
	DECFSZ      R13, 1, 1
	BRA         L_thread_pick43
;ex_function.c,197 :: 		break_on();
	CALL        _break_on+0, 0
;ex_function.c,198 :: 		}
L_end_thread_pick:
	RETURN      0
; end of _thread_pick

_CustomChar:

;ex_function.c,202 :: 		void CustomChar(char pos_row, char pos_char) {
;ex_function.c,204 :: 		Lcd_Cmd(64);
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ex_function.c,205 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(character[i]);
	CLRF        CustomChar_i_L0+0 
L_CustomChar44:
	MOVF        CustomChar_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_CustomChar45
	MOVLW       _character+0
	ADDWF       CustomChar_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_character+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_character+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        CustomChar_i_L0+0, 1 
	GOTO        L_CustomChar44
L_CustomChar45:
;ex_function.c,206 :: 		Lcd_Cmd(_LCD_RETURN_HOME);
	MOVLW       2
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;ex_function.c,207 :: 		Lcd_Chr(pos_row, pos_char, 0);
	MOVF        FARG_CustomChar_pos_row+0, 0 
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVF        FARG_CustomChar_pos_char+0, 0 
	MOVWF       FARG_Lcd_Chr_column+0 
	CLRF        FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;ex_function.c,208 :: 		}
L_end_CustomChar:
	RETURN      0
; end of _CustomChar

_display_mesg:

;ex_function.c,210 :: 		void display_mesg(char position_of_cursor)
;ex_function.c,212 :: 		if (position_of_cursor==1)
	MOVF        FARG_display_mesg_position_of_cursor+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_display_mesg47
;ex_function.c,214 :: 		current_msg=1;
	MOVLW       1
	MOVWF       _current_msg+0 
;ex_function.c,215 :: 		}
	GOTO        L_display_mesg48
L_display_mesg47:
;ex_function.c,216 :: 		else if (position_of_cursor==2)
	MOVF        FARG_display_mesg_position_of_cursor+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_display_mesg49
;ex_function.c,218 :: 		current_msg=2;
	MOVLW       2
	MOVWF       _current_msg+0 
;ex_function.c,219 :: 		}
	GOTO        L_display_mesg50
L_display_mesg49:
;ex_function.c,220 :: 		else if (position_of_cursor==3)
	MOVF        FARG_display_mesg_position_of_cursor+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_display_mesg51
;ex_function.c,222 :: 		current_msg=3;
	MOVLW       3
	MOVWF       _current_msg+0 
;ex_function.c,223 :: 		}
	GOTO        L_display_mesg52
L_display_mesg51:
;ex_function.c,224 :: 		else if (position_of_cursor==4)
	MOVF        FARG_display_mesg_position_of_cursor+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_display_mesg53
;ex_function.c,226 :: 		current_msg=4;
	MOVLW       4
	MOVWF       _current_msg+0 
;ex_function.c,227 :: 		}
L_display_mesg53:
L_display_mesg52:
L_display_mesg50:
L_display_mesg48:
;ex_function.c,228 :: 		cls();
	CALL        _cls+0, 0
;ex_function.c,229 :: 		if (position_of_cursor==3)
	MOVF        FARG_display_mesg_position_of_cursor+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_display_mesg54
;ex_function.c,231 :: 		CustomChar(1,21);
	MOVLW       1
	MOVWF       FARG_CustomChar_pos_row+0 
	MOVLW       21
	MOVWF       FARG_CustomChar_pos_char+0 
	CALL        _CustomChar+0, 0
;ex_function.c,232 :: 		}
	GOTO        L_display_mesg55
L_display_mesg54:
;ex_function.c,233 :: 		else if (position_of_cursor==4)
	MOVF        FARG_display_mesg_position_of_cursor+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_display_mesg56
;ex_function.c,235 :: 		CustomChar(2,21);
	MOVLW       2
	MOVWF       FARG_CustomChar_pos_row+0 
	MOVLW       21
	MOVWF       FARG_CustomChar_pos_char+0 
	CALL        _CustomChar+0, 0
;ex_function.c,236 :: 		}
	GOTO        L_display_mesg57
L_display_mesg56:
;ex_function.c,237 :: 		else CustomChar(position_of_cursor,1);
	MOVF        FARG_display_mesg_position_of_cursor+0, 0 
	MOVWF       FARG_CustomChar_pos_row+0 
	MOVLW       1
	MOVWF       FARG_CustomChar_pos_char+0 
	CALL        _CustomChar+0, 0
L_display_mesg57:
L_display_mesg55:
;ex_function.c,238 :: 		LCD_OUT(1,2,CopyConst2Ram(MSG,panel_setting));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _panel_setting+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_panel_setting+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_panel_setting+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;ex_function.c,239 :: 		LCD_OUT(2,2,CopyConst2Ram(MSG,SAVING_DESIGN));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _SAVING_DESIGN+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_SAVING_DESIGN+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_SAVING_DESIGN+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;ex_function.c,240 :: 		LCD_OUT(1,22,CopyConst2Ram(MSG,MEMORY));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _MEMORY+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_MEMORY+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_MEMORY+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       22
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;ex_function.c,241 :: 		LCD_OUT(2,22,CopyConst2Ram(MSG,INFO));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _INFO+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_INFO+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_INFO+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       22
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;ex_function.c,242 :: 		}
L_end_display_mesg:
	RETURN      0
; end of _display_mesg

_move_errow_down:

;ex_function.c,244 :: 		void move_errow_down(char y)
;ex_function.c,246 :: 		LCD_OUT(1,1," ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ex_function.c,247 :: 		LCD_OUT(2,1," ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ex_function.c,248 :: 		LCD_OUT(1,21," ");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       21
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ex_function.c,249 :: 		LCD_OUT(2,21," ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       21
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;ex_function.c,257 :: 		if (y==3)
	MOVF        FARG_move_errow_down_y+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_move_errow_down58
;ex_function.c,259 :: 		CustomChar(1,21);
	MOVLW       1
	MOVWF       FARG_CustomChar_pos_row+0 
	MOVLW       21
	MOVWF       FARG_CustomChar_pos_char+0 
	CALL        _CustomChar+0, 0
;ex_function.c,260 :: 		}
	GOTO        L_move_errow_down59
L_move_errow_down58:
;ex_function.c,261 :: 		else if (y==4)
	MOVF        FARG_move_errow_down_y+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_move_errow_down60
;ex_function.c,263 :: 		CustomChar(2,21);
	MOVLW       2
	MOVWF       FARG_CustomChar_pos_row+0 
	MOVLW       21
	MOVWF       FARG_CustomChar_pos_char+0 
	CALL        _CustomChar+0, 0
;ex_function.c,264 :: 		}
	GOTO        L_move_errow_down61
L_move_errow_down60:
;ex_function.c,266 :: 		CustomChar(Y,1);
	MOVF        FARG_move_errow_down_y+0, 0 
	MOVWF       FARG_CustomChar_pos_row+0 
	MOVLW       1
	MOVWF       FARG_CustomChar_pos_char+0 
	CALL        _CustomChar+0, 0
L_move_errow_down61:
L_move_errow_down59:
;ex_function.c,267 :: 		}
L_end_move_errow_down:
	RETURN      0
; end of _move_errow_down

_back_display:

;ex_function.c,269 :: 		void back_display()
;ex_function.c,271 :: 		LCD_OUT(2,40-4,CopyConst2Ram(MSG,back));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _back+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_back+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_back+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       36
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;ex_function.c,272 :: 		}
L_end_back_display:
	RETURN      0
; end of _back_display

_Edit_Menu_dis:

;ex_function.c,273 :: 		void Edit_Menu_dis()
;ex_function.c,275 :: 		LCD_OUT(2,21,CopyConst2Ram(MSG,E_Menu));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _E_Menu+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_E_Menu+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_E_Menu+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       21
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;ex_function.c,276 :: 		}
L_end_Edit_Menu_dis:
	RETURN      0
; end of _Edit_Menu_dis

_INT0_EDG:

;inter0 and timer0.c,13 :: 		void INT0_EDG(char x) {
;inter0 and timer0.c,14 :: 		if (x==0) {          // Zero for low edge select
	MOVF        FARG_INT0_EDG_x+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_INT0_EDG62
;inter0 and timer0.c,15 :: 		INTCON2.INTEDG0=0;
	BCF         INTCON2+0, 6 
;inter0 and timer0.c,16 :: 		}
L_INT0_EDG62:
;inter0 and timer0.c,17 :: 		if (x==1) {          // One for high edge select
	MOVF        FARG_INT0_EDG_x+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_INT0_EDG63
;inter0 and timer0.c,18 :: 		INTCON2.INTEDG0=1;
	BSF         INTCON2+0, 6 
;inter0 and timer0.c,19 :: 		}
L_INT0_EDG63:
;inter0 and timer0.c,20 :: 		}
L_end_INT0_EDG:
	RETURN      0
; end of _INT0_EDG

_Enable_intr:

;inter0 and timer0.c,22 :: 		void Enable_intr(){
;inter0 and timer0.c,23 :: 		INTCON|=(1<<GIEH)|(1<<GIEL);
	MOVLW       192
	IORWF       INTCON+0, 1 
;inter0 and timer0.c,24 :: 		}
L_end_Enable_intr:
	RETURN      0
; end of _Enable_intr

_disable_intr:

;inter0 and timer0.c,26 :: 		void disable_intr(){
;inter0 and timer0.c,27 :: 		INTCON&=~(1<<GIEH)|(1<<GIEL);
	MOVLW       127
	ANDWF       INTCON+0, 1 
;inter0 and timer0.c,28 :: 		}
L_end_disable_intr:
	RETURN      0
; end of _disable_intr

_EXT0INT:

;inter0 and timer0.c,30 :: 		void EXT0INT(char x){
;inter0 and timer0.c,31 :: 		if (x==1){
	MOVF        FARG_EXT0INT_x+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_EXT0INT64
;inter0 and timer0.c,32 :: 		INTCON|=(1<<INT0IE);
	BSF         INTCON+0, 4 
;inter0 and timer0.c,33 :: 		}
L_EXT0INT64:
;inter0 and timer0.c,34 :: 		if (x==0){
	MOVF        FARG_EXT0INT_x+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_EXT0INT65
;inter0 and timer0.c,35 :: 		INTCON&=~(1<<INT0IE);
	BCF         INTCON+0, 4 
;inter0 and timer0.c,36 :: 		}
L_EXT0INT65:
;inter0 and timer0.c,37 :: 		}
L_end_EXT0INT:
	RETURN      0
; end of _EXT0INT

_TIMER0_EN:

;inter0 and timer0.c,39 :: 		void TIMER0_EN(char x)
;inter0 and timer0.c,41 :: 		if (x==0){
	MOVF        FARG_TIMER0_EN_x+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_TIMER0_EN66
;inter0 and timer0.c,42 :: 		INTCON&=~(1<<TMR0IE);
	BCF         INTCON+0, 5 
;inter0 and timer0.c,43 :: 		}
L_TIMER0_EN66:
;inter0 and timer0.c,44 :: 		if (x==1){
	MOVF        FARG_TIMER0_EN_x+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_TIMER0_EN67
;inter0 and timer0.c,45 :: 		INTCON|=(1<<TMR0IE);
	BSF         INTCON+0, 5 
;inter0 and timer0.c,46 :: 		}
L_TIMER0_EN67:
;inter0 and timer0.c,47 :: 		}
L_end_TIMER0_EN:
	RETURN      0
; end of _TIMER0_EN

_Timer0_ON:

;inter0 and timer0.c,58 :: 		void Timer0_ON(){
;inter0 and timer0.c,59 :: 		T0CON|=(1<<TMR0ON);
	BSF         T0CON+0, 7 
;inter0 and timer0.c,60 :: 		}
L_end_Timer0_ON:
	RETURN      0
; end of _Timer0_ON

_Timer0_Off:

;inter0 and timer0.c,62 :: 		void Timer0_Off(){
;inter0 and timer0.c,63 :: 		T0CON&=~(1<<TMR0ON);
	MOVLW       127
	ANDWF       T0CON+0, 1 
;inter0 and timer0.c,64 :: 		}
L_end_Timer0_Off:
	RETURN      0
; end of _Timer0_Off

_timer0_Intit:

;inter0 and timer0.c,66 :: 		void timer0_Intit() {
;inter0 and timer0.c,68 :: 		T0CON.TMR0ON = 0;// Timer0 On/Off Control bit:1=Enables Timer0 / 0=Stops Timer0
	BCF         T0CON+0, 7 
;inter0 and timer0.c,69 :: 		T0CON.T08BIT = 0;// Timer0 8-bit/16-bit Control bit: 1=8-bit timer/counter / 0=16-bit timer/counter
	BCF         T0CON+0, 6 
;inter0 and timer0.c,70 :: 		T0CON.T0CS   = 0;// TMR0 Clock Source Select bit: 0=Internal Clock (CLKO) / 1=Transition on T0CKI pin
	BCF         T0CON+0, 5 
;inter0 and timer0.c,71 :: 		T0CON.T0SE   = 0;// TMR0 Source Edge Select bit: 0=low/high / 1=high/low
	BCF         T0CON+0, 4 
;inter0 and timer0.c,72 :: 		T0CON.PSA    = 1;// Prescaler Assignment bit: 0=Prescaler is assigned; 1=NOT assigned/bypassed
	BSF         T0CON+0, 3 
;inter0 and timer0.c,73 :: 		T0CON.T0PS2  = 0;// bits 2-0  PS2:PS0: Prescaler Select bits
	BCF         T0CON+0, 2 
;inter0 and timer0.c,74 :: 		T0CON.T0PS1  = 0;
	BCF         T0CON+0, 1 
;inter0 and timer0.c,75 :: 		T0CON.T0PS0  = 0;
	BCF         T0CON+0, 0 
;inter0 and timer0.c,76 :: 		TMR0H = Timer0_h;    // preset for Timer0 MSB register
	MOVF        _Timer0_H+0, 0 
	MOVWF       TMR0H+0 
;inter0 and timer0.c,77 :: 		TMR0L = Timer0_l;    // preset for Timer0 LSB register
	MOVF        _Timer0_L+0, 0 
	MOVWF       TMR0L+0 
;inter0 and timer0.c,78 :: 		}
L_end_timer0_Intit:
	RETURN      0
; end of _timer0_Intit

_Timer1_init:

;timer1.c,8 :: 		void Timer1_init()
;timer1.c,12 :: 		PIR1.TMR1IF=0;
	BCF         PIR1+0, 0 
;timer1.c,13 :: 		PIE1.TMR1IE=0;
	BCF         PIE1+0, 0 
;timer1.c,14 :: 		T1CON.RD16=1;
	BSF         T1CON+0, 7 
;timer1.c,15 :: 		IPR1.TMR1IP=1;
	BSF         IPR1+0, 0 
;timer1.c,16 :: 		T1CON.T1CKPS1 = 0;  // bits 5-4  Prescaler Rate Select bits
	BCF         T1CON+0, 5 
;timer1.c,17 :: 		T1CON.T1CKPS0 = 0;
	BCF         T1CON+0, 4 
;timer1.c,18 :: 		T1CON.T1OSCEN = 0;  // bit 3 Timer1 Oscillator Enable Control: bit 1=on
	BCF         T1CON+0, 3 
;timer1.c,19 :: 		T1CON.T1SYNC  = 1;  // bit 2 Timer1 External Clock Input Synchronization Control bit: 1=Do not synchronize external clock input
	BSF         T1CON+0, 2 
;timer1.c,20 :: 		T1CON.TMR1CS  = 0;  // bit 1 Timer1 Clock Source Select bit: 0=Internal clock (FOSC/4) / 1 = External clock from pin T1CKI (on the rising edge)
	BCF         T1CON+0, 1 
;timer1.c,21 :: 		T1CON.TMR1ON  = 0;  // bit 0 DISABLE timer1
	BCF         T1CON+0, 0 
;timer1.c,22 :: 		TMR1H = 0xF7;       // preset for timer1 MSB register
	MOVLW       247
	MOVWF       TMR1H+0 
;timer1.c,23 :: 		TMR1L = 0xE0;       // preset for timer1 LSB register
	MOVLW       224
	MOVWF       TMR1L+0 
;timer1.c,25 :: 		}
L_end_Timer1_init:
	RETURN      0
; end of _Timer1_init

_Timer1_ON:

;timer1.c,27 :: 		void Timer1_ON()
;timer1.c,29 :: 		T1CON.TMR1ON = 1;
	BSF         T1CON+0, 0 
;timer1.c,30 :: 		}
L_end_Timer1_ON:
	RETURN      0
; end of _Timer1_ON

_Timer1_OFF:

;timer1.c,31 :: 		void Timer1_OFF()
;timer1.c,33 :: 		T1CON.TMR1ON = 0;
	BCF         T1CON+0, 0 
;timer1.c,34 :: 		}
L_end_Timer1_OFF:
	RETURN      0
; end of _Timer1_OFF

_Timer1_Enable:

;timer1.c,36 :: 		void Timer1_Enable()
;timer1.c,38 :: 		PIE1.TMR1IE=1;
	BSF         PIE1+0, 0 
;timer1.c,39 :: 		}
L_end_Timer1_Enable:
	RETURN      0
; end of _Timer1_Enable

_Timer1_Disable:

;timer1.c,40 :: 		void Timer1_Disable()
;timer1.c,42 :: 		PIE1.TMR1IE=0;
	BCF         PIE1+0, 0 
;timer1.c,43 :: 		}
L_end_Timer1_Disable:
	RETURN      0
; end of _Timer1_Disable

_TIMER1_CLEAR_FLAG:

;timer1.c,45 :: 		void TIMER1_CLEAR_FLAG()
;timer1.c,47 :: 		PIR1.TMR1IF=0;
	BCF         PIR1+0, 0 
;timer1.c,48 :: 		}
L_end_TIMER1_CLEAR_FLAG:
	RETURN      0
; end of _TIMER1_CLEAR_FLAG

_timer3_on:

;timer3.c,8 :: 		void timer3_on(){
;timer3.c,9 :: 		T3CON.TMR3ON  = 1;// bit 0 enables timer
	BSF         T3CON+0, 0 
;timer3.c,10 :: 		}
L_end_timer3_on:
	RETURN      0
; end of _timer3_on

_timer3_off:

;timer3.c,11 :: 		void timer3_off(){
;timer3.c,12 :: 		T3CON.TMR3ON  = 0;// bit 0 enables timer
	BCF         T3CON+0, 0 
;timer3.c,13 :: 		}
L_end_timer3_off:
	RETURN      0
; end of _timer3_off

_timer3_enable:

;timer3.c,15 :: 		void timer3_enable(){
;timer3.c,16 :: 		PIE2.TMR3IE=1;
	BSF         PIE2+0, 1 
;timer3.c,17 :: 		}
L_end_timer3_enable:
	RETURN      0
; end of _timer3_enable

_timer3_DISABLE:

;timer3.c,18 :: 		void timer3_DISABLE(){
;timer3.c,19 :: 		PIE2.TMR3IE=0;
	BCF         PIE2+0, 1 
;timer3.c,20 :: 		}
L_end_timer3_DISABLE:
	RETURN      0
; end of _timer3_DISABLE

_Timer3_flag_clear:

;timer3.c,22 :: 		void Timer3_flag_clear(){
;timer3.c,23 :: 		PIR2.TMR3IF=0;
	BCF         PIR2+0, 1 
;timer3.c,24 :: 		}
L_end_Timer3_flag_clear:
	RETURN      0
; end of _Timer3_flag_clear

_timer3_init:

;timer3.c,26 :: 		void timer3_init(){
;timer3.c,29 :: 		IPR2.TMR3IP=1;
	BSF         IPR2+0, 1 
;timer3.c,30 :: 		T3CON.RD16=1;
	BSF         T3CON+0, 7 
;timer3.c,31 :: 		PIR2.TMR3IF=0;
	BCF         PIR2+0, 1 
;timer3.c,33 :: 		T3CON.T3CKPS1 = 0;// bits 5-4  Prescaler Rate Select bits
	BCF         T3CON+0, 5 
;timer3.c,34 :: 		T3CON.T3CKPS0 = 0;//
	BCF         T3CON+0, 4 
;timer3.c,35 :: 		T3CON.T3SYNC  = 0;// bit 2 Timer3 External Clock Input Synchronization Control bit: 1=Do not synchronize external clock input
	BCF         T3CON+0, 2 
;timer3.c,36 :: 		T3CON.TMR3CS  = 0;// bit 1 Timer3 Clock Source Select bit:0=Internal clock (FOSC/4)
	BCF         T3CON+0, 1 
;timer3.c,37 :: 		T3CON.TMR3ON  = 0;// bit 0 enables timer
	BCF         T3CON+0, 0 
;timer3.c,38 :: 		TMR3H = 0x0;       // preset for timer3 MSB register
	CLRF        TMR3H+0 
;timer3.c,39 :: 		TMR3L = 0x0;       // preset for timer3 LSB register
	CLRF        TMR3L+0 
;timer3.c,40 :: 		}
L_end_timer3_init:
	RETURN      0
; end of _timer3_init

_RPM_set:

;other function.c,7 :: 		void RPM_set(unsigned char Timer_Name)
;other function.c,9 :: 		if (Timer_Name==0)
	MOVF        FARG_RPM_set_Timer_Name+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_RPM_set68
;other function.c,11 :: 		rpm=X_RPM;
	MOVF        _X_RPM+0, 0 
	MOVWF       _RPM+0 
	MOVF        _X_RPM+1, 0 
	MOVWF       _RPM+1 
	MOVF        _X_RPM+2, 0 
	MOVWF       _RPM+2 
	MOVF        _X_RPM+3, 0 
	MOVWF       _RPM+3 
;other function.c,12 :: 		}
	GOTO        L_RPM_set69
L_RPM_set68:
;other function.c,13 :: 		else if (Timer_Name==1)
	MOVF        FARG_RPM_set_Timer_Name+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_RPM_set70
;other function.c,15 :: 		rpm=Y_RPM;
	MOVF        _y_RPM+0, 0 
	MOVWF       _RPM+0 
	MOVF        _y_RPM+1, 0 
	MOVWF       _RPM+1 
	MOVF        _y_RPM+2, 0 
	MOVWF       _RPM+2 
	MOVF        _y_RPM+3, 0 
	MOVWF       _RPM+3 
;other function.c,16 :: 		}
	GOTO        L_RPM_set71
L_RPM_set70:
;other function.c,17 :: 		else if (Timer_Name==3){
	MOVF        FARG_RPM_set_Timer_Name+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_RPM_set72
;other function.c,18 :: 		rpm=Z_RPM;
	MOVF        _Z_RPM+0, 0 
	MOVWF       _RPM+0 
	MOVF        _Z_RPM+1, 0 
	MOVWF       _RPM+1 
	MOVF        _Z_RPM+2, 0 
	MOVWF       _RPM+2 
	MOVF        _Z_RPM+3, 0 
	MOVWF       _RPM+3 
;other function.c,19 :: 		}
L_RPM_set72:
L_RPM_set71:
L_RPM_set69:
;other function.c,20 :: 		if (RPM!=0.0)
	MOVF        _RPM+0, 0 
	MOVWF       R0 
	MOVF        _RPM+1, 0 
	MOVWF       R1 
	MOVF        _RPM+2, 0 
	MOVWF       R2 
	MOVF        _RPM+3, 0 
	MOVWF       R3 
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	CALL        _Equals_Double+0, 0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_RPM_set73
;other function.c,24 :: 		PPT=(RPM*400.0/60.0);
	MOVF        _RPM+0, 0 
	MOVWF       R0 
	MOVF        _RPM+1, 0 
	MOVWF       R1 
	MOVF        _RPM+2, 0 
	MOVWF       R2 
	MOVF        _RPM+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       72
	MOVWF       R6 
	MOVLW       135
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       112
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _PPT+0 
	MOVF        R1, 0 
	MOVWF       _PPT+1 
	MOVF        R2, 0 
	MOVWF       _PPT+2 
	MOVF        R3, 0 
	MOVWF       _PPT+3 
;other function.c,27 :: 		TIME_ONE_CYCLE=1.0/PPT;
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       127
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _TIME_ONE_CYCLE+0 
	MOVF        R1, 0 
	MOVWF       _TIME_ONE_CYCLE+1 
	MOVF        R2, 0 
	MOVWF       _TIME_ONE_CYCLE+2 
	MOVF        R3, 0 
	MOVWF       _TIME_ONE_CYCLE+3 
;other function.c,28 :: 		TIME_HALF_CYCLE=TIME_ONE_CYCLE/2.0;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _TIME_HALF_CYCLE+0 
	MOVF        R1, 0 
	MOVWF       _TIME_HALF_CYCLE+1 
	MOVF        R2, 0 
	MOVWF       _TIME_HALF_CYCLE+2 
	MOVF        R3, 0 
	MOVWF       _TIME_HALF_CYCLE+3 
;other function.c,29 :: 		TIME_HALF_CYCLE*=1000000.0;
	MOVLW       0
	MOVWF       R4 
	MOVLW       36
	MOVWF       R5 
	MOVLW       116
	MOVWF       R6 
	MOVLW       146
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _TIME_HALF_CYCLE+0 
	MOVF        R1, 0 
	MOVWF       _TIME_HALF_CYCLE+1 
	MOVF        R2, 0 
	MOVWF       _TIME_HALF_CYCLE+2 
	MOVF        R3, 0 
	MOVWF       _TIME_HALF_CYCLE+3 
;other function.c,30 :: 		TIME_HALF_CYCLE/=0.1;
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _TIME_HALF_CYCLE+0 
	MOVF        R1, 0 
	MOVWF       _TIME_HALF_CYCLE+1 
	MOVF        R2, 0 
	MOVWF       _TIME_HALF_CYCLE+2 
	MOVF        R3, 0 
	MOVWF       _TIME_HALF_CYCLE+3 
;other function.c,31 :: 		LODER_VALUES=TIME_HALF_CYCLE;
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _LODER_VALUES+0 
	MOVF        R1, 0 
	MOVWF       _LODER_VALUES+1 
;other function.c,32 :: 		LODER_VALUES-=3;
	MOVLW       3
	SUBWF       R0, 1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVF        R0, 0 
	MOVWF       _LODER_VALUES+0 
	MOVF        R1, 0 
	MOVWF       _LODER_VALUES+1 
;other function.c,33 :: 		LODER_VALUES=65536-LODER_VALUES;
	MOVF        R0, 0 
	SUBLW       0
	MOVWF       R3 
	MOVF        R1, 0 
	MOVWF       R4 
	MOVLW       0
	SUBFWB      R4, 1 
	MOVF        R3, 0 
	MOVWF       _LODER_VALUES+0 
	MOVF        R4, 0 
	MOVWF       _LODER_VALUES+1 
;other function.c,34 :: 		DIVID=LODER_VALUES;
	MOVF        R3, 0 
	MOVWF       _DIVID+0 
	MOVF        R4, 0 
	MOVWF       _DIVID+1 
;other function.c,36 :: 		reminder_1= DIVID % 16;
	MOVLW       15
	ANDWF       R3, 0 
	MOVWF       R9 
	MOVF        R4, 0 
	MOVWF       R10 
	MOVLW       0
	ANDWF       R10, 1 
	MOVF        R9, 0 
	MOVWF       _reminder_1+0 
;other function.c,37 :: 		DIVID=DIVID/16;
	MOVLW       4
	MOVWF       R0 
	MOVF        R3, 0 
	MOVWF       R1 
	MOVF        R4, 0 
	MOVWF       R2 
	MOVF        R0, 0 
L__RPM_set863:
	BZ          L__RPM_set864
	RRCF        R2, 1 
	RRCF        R1, 1 
	BCF         R2, 7 
	ADDLW       255
	GOTO        L__RPM_set863
L__RPM_set864:
	MOVF        R1, 0 
	MOVWF       _DIVID+0 
	MOVF        R2, 0 
	MOVWF       _DIVID+1 
;other function.c,38 :: 		reminder_2= DIVID % 16;
	MOVLW       15
	ANDWF       R1, 0 
	MOVWF       R7 
	MOVF        R2, 0 
	MOVWF       R8 
	MOVLW       0
	ANDWF       R8, 1 
	MOVF        R7, 0 
	MOVWF       _reminder_2+0 
;other function.c,39 :: 		DIVID/=16;
	MOVF        R1, 0 
	MOVWF       R3 
	MOVF        R2, 0 
	MOVWF       R4 
	RRCF        R4, 1 
	RRCF        R3, 1 
	BCF         R4, 7 
	RRCF        R4, 1 
	RRCF        R3, 1 
	BCF         R4, 7 
	RRCF        R4, 1 
	RRCF        R3, 1 
	BCF         R4, 7 
	RRCF        R4, 1 
	RRCF        R3, 1 
	BCF         R4, 7 
	MOVF        R3, 0 
	MOVWF       _DIVID+0 
	MOVF        R4, 0 
	MOVWF       _DIVID+1 
;other function.c,40 :: 		reminder_3= DIVID % 16;
	MOVLW       15
	ANDWF       R3, 0 
	MOVWF       R5 
	MOVF        R4, 0 
	MOVWF       R6 
	MOVLW       0
	ANDWF       R6, 1 
	MOVF        R5, 0 
	MOVWF       _reminder_3+0 
;other function.c,41 :: 		DIVID/=16;
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R4, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	RRCF        R1, 1 
	RRCF        R0, 1 
	BCF         R1, 7 
	MOVF        R0, 0 
	MOVWF       _DIVID+0 
	MOVF        R1, 0 
	MOVWF       _DIVID+1 
;other function.c,42 :: 		reminder_4= DIVID % 16;
	MOVLW       15
	ANDWF       R0, 0 
	MOVWF       R3 
	MOVF        R1, 0 
	MOVWF       R4 
	MOVLW       0
	ANDWF       R4, 1 
	MOVF        R3, 0 
	MOVWF       _reminder_4+0 
;other function.c,44 :: 		reminder_2 <<=4;
	MOVLW       4
	MOVWF       R0 
	MOVF        R7, 0 
	MOVWF       R2 
	MOVF        R0, 0 
L__RPM_set865:
	BZ          L__RPM_set866
	RLCF        R2, 1 
	BCF         R2, 0 
	ADDLW       255
	GOTO        L__RPM_set865
L__RPM_set866:
	MOVF        R2, 0 
	MOVWF       _reminder_2+0 
;other function.c,45 :: 		reminder_4 <<=4;
	MOVLW       4
	MOVWF       R1 
	MOVF        R3, 0 
	MOVWF       R0 
	MOVF        R1, 0 
L__RPM_set867:
	BZ          L__RPM_set868
	RLCF        R0, 1 
	BCF         R0, 0 
	ADDLW       255
	GOTO        L__RPM_set867
L__RPM_set868:
	MOVF        R0, 0 
	MOVWF       _reminder_4+0 
;other function.c,47 :: 		Timer_H=reminder_4 | reminder_3;
	MOVF        R5, 0 
	IORWF       R0, 0 
	MOVWF       _Timer_H+0 
;other function.c,48 :: 		Timer_L=reminder_2 | reminder_1;
	MOVF        R9, 0 
	IORWF       R2, 0 
	MOVWF       _Timer_L+0 
;other function.c,50 :: 		if (Timer_Name==0)
	MOVF        FARG_RPM_set_Timer_Name+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_RPM_set74
;other function.c,52 :: 		Timer0_L=Timer_L;
	MOVF        _Timer_L+0, 0 
	MOVWF       _Timer0_L+0 
;other function.c,53 :: 		Timer0_H=Timer_H;
	MOVF        _Timer_H+0, 0 
	MOVWF       _Timer0_H+0 
;other function.c,54 :: 		TMR0H =Timer0_H;
	MOVF        _Timer_H+0, 0 
	MOVWF       TMR0H+0 
;other function.c,55 :: 		TMR0L =Timer0_L;
	MOVF        _Timer_L+0, 0 
	MOVWF       TMR0L+0 
;other function.c,56 :: 		}
	GOTO        L_RPM_set75
L_RPM_set74:
;other function.c,57 :: 		else if (Timer_Name==1)
	MOVF        FARG_RPM_set_Timer_Name+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_RPM_set76
;other function.c,59 :: 		Timer1_L=Timer_L;
	MOVF        _Timer_L+0, 0 
	MOVWF       _Timer1_L+0 
;other function.c,60 :: 		Timer1_H=Timer_H;
	MOVF        _Timer_H+0, 0 
	MOVWF       _Timer1_H+0 
;other function.c,61 :: 		TMR1H =Timer1_H;
	MOVF        _Timer_H+0, 0 
	MOVWF       TMR1H+0 
;other function.c,62 :: 		TMR1L =Timer1_L;
	MOVF        _Timer_L+0, 0 
	MOVWF       TMR1L+0 
;other function.c,63 :: 		}
	GOTO        L_RPM_set77
L_RPM_set76:
;other function.c,64 :: 		else if (Timer_Name==3)
	MOVF        FARG_RPM_set_Timer_Name+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_RPM_set78
;other function.c,66 :: 		Timer3_L=Timer_L;
	MOVF        _Timer_L+0, 0 
	MOVWF       _Timer3_L+0 
;other function.c,67 :: 		Timer3_H=Timer_H;
	MOVF        _Timer_H+0, 0 
	MOVWF       _Timer3_H+0 
;other function.c,68 :: 		TMR3H =Timer3_H;
	MOVF        _Timer_H+0, 0 
	MOVWF       TMR3H+0 
;other function.c,69 :: 		TMR3L =Timer3_L;
	MOVF        _Timer_L+0, 0 
	MOVWF       TMR3L+0 
;other function.c,70 :: 		}
L_RPM_set78:
L_RPM_set77:
L_RPM_set75:
;other function.c,71 :: 		}
L_RPM_set73:
;other function.c,72 :: 		}
L_end_RPM_set:
	RETURN      0
; end of _RPM_set

_Get_RPM:

;other function.c,74 :: 		void Get_RPM()
;other function.c,76 :: 		X_distance*=2;
	MOVF        _X_Distance+0, 0 
	MOVWF       R1 
	MOVF        _X_Distance+1, 0 
	MOVWF       R2 
	RLCF        R1, 1 
	BCF         R1, 0 
	RLCF        R2, 1 
	MOVF        R1, 0 
	MOVWF       _X_Distance+0 
	MOVF        R2, 0 
	MOVWF       _X_Distance+1 
;other function.c,77 :: 		Y_distance*=2;
	RLCF        _Y_Distance+0, 1 
	BCF         _Y_Distance+0, 0 
	RLCF        _Y_Distance+1, 1 
;other function.c,78 :: 		if (X_distance==0)
	MOVLW       0
	XORWF       R2, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Get_RPM870
	MOVLW       0
	XORWF       R1, 0 
L__Get_RPM870:
	BTFSS       STATUS+0, 2 
	GOTO        L_Get_RPM79
;other function.c,80 :: 		Y_RPM=Max_Speed;
	MOVLW       0
	MOVWF       _y_RPM+0 
	MOVLW       0
	MOVWF       _y_RPM+1 
	MOVLW       112
	MOVWF       _y_RPM+2 
	MOVLW       133
	MOVWF       _y_RPM+3 
;other function.c,81 :: 		X_RPM=0.0;
	CLRF        _X_RPM+0 
	CLRF        _X_RPM+1 
	CLRF        _X_RPM+2 
	CLRF        _X_RPM+3 
;other function.c,82 :: 		}
	GOTO        L_Get_RPM80
L_Get_RPM79:
;other function.c,83 :: 		else if(Y_distance==0)
	MOVLW       0
	XORWF       _Y_Distance+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Get_RPM871
	MOVLW       0
	XORWF       _Y_Distance+0, 0 
L__Get_RPM871:
	BTFSS       STATUS+0, 2 
	GOTO        L_Get_RPM81
;other function.c,85 :: 		X_RPM=Max_Speed;
	MOVLW       0
	MOVWF       _X_RPM+0 
	MOVLW       0
	MOVWF       _X_RPM+1 
	MOVLW       112
	MOVWF       _X_RPM+2 
	MOVLW       133
	MOVWF       _X_RPM+3 
;other function.c,86 :: 		Y_RPM=0.0;
	CLRF        _y_RPM+0 
	CLRF        _y_RPM+1 
	CLRF        _y_RPM+2 
	CLRF        _y_RPM+3 
;other function.c,87 :: 		}
	GOTO        L_Get_RPM82
L_Get_RPM81:
;other function.c,88 :: 		else if (Y_Distance==X_distance)
	MOVF        _Y_Distance+1, 0 
	XORWF       _X_Distance+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Get_RPM872
	MOVF        _X_Distance+0, 0 
	XORWF       _Y_Distance+0, 0 
L__Get_RPM872:
	BTFSS       STATUS+0, 2 
	GOTO        L_Get_RPM83
;other function.c,90 :: 		Y_RPM=Max_Speed;
	MOVLW       0
	MOVWF       _y_RPM+0 
	MOVLW       0
	MOVWF       _y_RPM+1 
	MOVLW       112
	MOVWF       _y_RPM+2 
	MOVLW       133
	MOVWF       _y_RPM+3 
;other function.c,91 :: 		X_RPM=Max_Speed;
	MOVLW       0
	MOVWF       _X_RPM+0 
	MOVLW       0
	MOVWF       _X_RPM+1 
	MOVLW       112
	MOVWF       _X_RPM+2 
	MOVLW       133
	MOVWF       _X_RPM+3 
;other function.c,92 :: 		}
	GOTO        L_Get_RPM84
L_Get_RPM83:
;other function.c,93 :: 		else if (X_Distance > y_distance)
	MOVF        _X_Distance+1, 0 
	SUBWF       _Y_Distance+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Get_RPM873
	MOVF        _X_Distance+0, 0 
	SUBWF       _Y_Distance+0, 0 
L__Get_RPM873:
	BTFSC       STATUS+0, 0 
	GOTO        L_Get_RPM85
;other function.c,95 :: 		X_RPM=Max_Speed;
	MOVLW       0
	MOVWF       _X_RPM+0 
	MOVLW       0
	MOVWF       _X_RPM+1 
	MOVLW       112
	MOVWF       _X_RPM+2 
	MOVLW       133
	MOVWF       _X_RPM+3 
;other function.c,96 :: 		Y_RPM=(Max_Speed*y_distance)/X_Distance;
	MOVF        _Y_Distance+0, 0 
	MOVWF       R0 
	MOVF        _Y_Distance+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       112
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__Get_RPM+0 
	MOVF        R1, 0 
	MOVWF       FLOC__Get_RPM+1 
	MOVF        R2, 0 
	MOVWF       FLOC__Get_RPM+2 
	MOVF        R3, 0 
	MOVWF       FLOC__Get_RPM+3 
	MOVF        _X_Distance+0, 0 
	MOVWF       R0 
	MOVF        _X_Distance+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        FLOC__Get_RPM+0, 0 
	MOVWF       R0 
	MOVF        FLOC__Get_RPM+1, 0 
	MOVWF       R1 
	MOVF        FLOC__Get_RPM+2, 0 
	MOVWF       R2 
	MOVF        FLOC__Get_RPM+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _y_RPM+0 
	MOVF        R1, 0 
	MOVWF       _y_RPM+1 
	MOVF        R2, 0 
	MOVWF       _y_RPM+2 
	MOVF        R3, 0 
	MOVWF       _y_RPM+3 
;other function.c,97 :: 		}
	GOTO        L_Get_RPM86
L_Get_RPM85:
;other function.c,98 :: 		else if (Y_Distance > X_distance)
	MOVF        _Y_Distance+1, 0 
	SUBWF       _X_Distance+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Get_RPM874
	MOVF        _Y_Distance+0, 0 
	SUBWF       _X_Distance+0, 0 
L__Get_RPM874:
	BTFSC       STATUS+0, 0 
	GOTO        L_Get_RPM87
;other function.c,100 :: 		Y_RPM=Max_Speed;
	MOVLW       0
	MOVWF       _y_RPM+0 
	MOVLW       0
	MOVWF       _y_RPM+1 
	MOVLW       112
	MOVWF       _y_RPM+2 
	MOVLW       133
	MOVWF       _y_RPM+3 
;other function.c,101 :: 		X_RPM=(Max_Speed*X_distance)/Y_Distance;
	MOVF        _X_Distance+0, 0 
	MOVWF       R0 
	MOVF        _X_Distance+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       112
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FLOC__Get_RPM+0 
	MOVF        R1, 0 
	MOVWF       FLOC__Get_RPM+1 
	MOVF        R2, 0 
	MOVWF       FLOC__Get_RPM+2 
	MOVF        R3, 0 
	MOVWF       FLOC__Get_RPM+3 
	MOVF        _Y_Distance+0, 0 
	MOVWF       R0 
	MOVF        _Y_Distance+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVF        FLOC__Get_RPM+0, 0 
	MOVWF       R0 
	MOVF        FLOC__Get_RPM+1, 0 
	MOVWF       R1 
	MOVF        FLOC__Get_RPM+2, 0 
	MOVWF       R2 
	MOVF        FLOC__Get_RPM+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _X_RPM+0 
	MOVF        R1, 0 
	MOVWF       _X_RPM+1 
	MOVF        R2, 0 
	MOVWF       _X_RPM+2 
	MOVF        R3, 0 
	MOVWF       _X_RPM+3 
;other function.c,102 :: 		}
L_Get_RPM87:
L_Get_RPM86:
L_Get_RPM84:
L_Get_RPM82:
L_Get_RPM80:
;other function.c,103 :: 		if (degree!=0)
	MOVLW       0
	XORWF       _degree+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__Get_RPM875
	MOVLW       0
	XORWF       _degree+0, 0 
L__Get_RPM875:
	BTFSC       STATUS+0, 2 
	GOTO        L_Get_RPM88
;other function.c,105 :: 		Z_RPM=max_speed_z_motor;
	MOVLW       0
	MOVWF       _Z_RPM+0 
	MOVLW       0
	MOVWF       _Z_RPM+1 
	MOVLW       42
	MOVWF       _Z_RPM+2 
	MOVLW       135
	MOVWF       _Z_RPM+3 
;other function.c,106 :: 		}
	GOTO        L_Get_RPM89
L_Get_RPM88:
;other function.c,107 :: 		else Z_RPM=0.0;
	CLRF        _Z_RPM+0 
	CLRF        _Z_RPM+1 
	CLRF        _Z_RPM+2 
	CLRF        _Z_RPM+3 
L_Get_RPM89:
;other function.c,108 :: 		}
L_end_Get_RPM:
	RETURN      0
; end of _Get_RPM

_X_Dir_P:

;other function.c,111 :: 		void X_Dir_P()
;other function.c,114 :: 		if (f_r == 'F')
	MOVF        _f_r+0, 0 
	XORLW       70
	BTFSS       STATUS+0, 2 
	GOTO        L_X_Dir_P90
;other function.c,116 :: 		Dir_X=1;
	BSF         LATF+0, 2 
;other function.c,117 :: 		}
	GOTO        L_X_Dir_P91
L_X_Dir_P90:
;other function.c,118 :: 		else if (f_r == 'R')
	MOVF        _f_r+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_X_Dir_P92
;other function.c,120 :: 		Dir_X=0;
	BCF         LATF+0, 2 
;other function.c,121 :: 		}
L_X_Dir_P92:
L_X_Dir_P91:
;other function.c,123 :: 		}
L_end_X_Dir_P:
	RETURN      0
; end of _X_Dir_P

_X_Dir_N:

;other function.c,125 :: 		void X_Dir_N()
;other function.c,128 :: 		if (f_r == 'F')
	MOVF        _f_r+0, 0 
	XORLW       70
	BTFSS       STATUS+0, 2 
	GOTO        L_X_Dir_N93
;other function.c,130 :: 		Dir_X=0;
	BCF         LATF+0, 2 
;other function.c,131 :: 		}
	GOTO        L_X_Dir_N94
L_X_Dir_N93:
;other function.c,132 :: 		else if (f_r == 'R')
	MOVF        _f_r+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_X_Dir_N95
;other function.c,134 :: 		Dir_X=1;
	BSF         LATF+0, 2 
;other function.c,135 :: 		}
L_X_Dir_N95:
L_X_Dir_N94:
;other function.c,137 :: 		}
L_end_X_Dir_N:
	RETURN      0
; end of _X_Dir_N

_Y_Dir_P:

;other function.c,139 :: 		void Y_Dir_P()
;other function.c,142 :: 		if (f_r == 'F')
	MOVF        _f_r+0, 0 
	XORLW       70
	BTFSS       STATUS+0, 2 
	GOTO        L_Y_Dir_P96
;other function.c,144 :: 		Dir_Y=1;
	BSF         LATF+0, 0 
;other function.c,145 :: 		}
L_Y_Dir_P96:
;other function.c,146 :: 		if (f_r == 'R')
	MOVF        _f_r+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_Y_Dir_P97
;other function.c,148 :: 		Dir_Y=0;
	BCF         LATF+0, 0 
;other function.c,149 :: 		}
L_Y_Dir_P97:
;other function.c,151 :: 		}
L_end_Y_Dir_P:
	RETURN      0
; end of _Y_Dir_P

_Y_Dir_N:

;other function.c,153 :: 		void Y_Dir_N()
;other function.c,156 :: 		if (f_r == 'F')
	MOVF        _f_r+0, 0 
	XORLW       70
	BTFSS       STATUS+0, 2 
	GOTO        L_Y_Dir_N98
;other function.c,158 :: 		Dir_Y=0;
	BCF         LATF+0, 0 
;other function.c,159 :: 		}
L_Y_Dir_N98:
;other function.c,160 :: 		if (f_r == 'R')
	MOVF        _f_r+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_Y_Dir_N99
;other function.c,162 :: 		Dir_Y=1;
	BSF         LATF+0, 0 
;other function.c,163 :: 		}
L_Y_Dir_N99:
;other function.c,165 :: 		}
L_end_Y_Dir_N:
	RETURN      0
; end of _Y_Dir_N

_Z_DIR_CCW:

;other function.c,167 :: 		void Z_DIR_CCW()
;other function.c,169 :: 		Dir_Z=0;
	BCF         LATF+0, 4 
;other function.c,170 :: 		}
L_end_Z_DIR_CCW:
	RETURN      0
; end of _Z_DIR_CCW

_Z_DIR_CW:

;other function.c,172 :: 		void Z_DIR_CW()
;other function.c,174 :: 		Dir_Z=1;
	BSF         LATF+0, 4 
;other function.c,175 :: 		}
L_end_Z_DIR_CW:
	RETURN      0
; end of _Z_DIR_CW

_get_atan:

;other function.c,177 :: 		float get_atan(float Y_Distance,float X_Distance)
;other function.c,180 :: 		rad_1=Y_Distance/X_Distance;
	MOVF        FARG_get_atan_X_Distance+0, 0 
	MOVWF       R4 
	MOVF        FARG_get_atan_X_Distance+1, 0 
	MOVWF       R5 
	MOVF        FARG_get_atan_X_Distance+2, 0 
	MOVWF       R6 
	MOVF        FARG_get_atan_X_Distance+3, 0 
	MOVWF       R7 
	MOVF        FARG_get_atan_Y_Distance+0, 0 
	MOVWF       R0 
	MOVF        FARG_get_atan_Y_Distance+1, 0 
	MOVWF       R1 
	MOVF        FARG_get_atan_Y_Distance+2, 0 
	MOVWF       R2 
	MOVF        FARG_get_atan_Y_Distance+3, 0 
	MOVWF       R3 
	CALL        _Div_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       get_atan_rad_1_L0+0 
	MOVF        R1, 0 
	MOVWF       get_atan_rad_1_L0+1 
	MOVF        R2, 0 
	MOVWF       get_atan_rad_1_L0+2 
	MOVF        R3, 0 
	MOVWF       get_atan_rad_1_L0+3 
;other function.c,181 :: 		rad_1=(atan(rad_1))*57.295779;
	MOVF        get_atan_rad_1_L0+0, 0 
	MOVWF       FARG_atan_f+0 
	MOVF        get_atan_rad_1_L0+1, 0 
	MOVWF       FARG_atan_f+1 
	MOVF        get_atan_rad_1_L0+2, 0 
	MOVWF       FARG_atan_f+2 
	MOVF        get_atan_rad_1_L0+3, 0 
	MOVWF       FARG_atan_f+3 
	CALL        _atan+0, 0
	MOVLW       225
	MOVWF       R4 
	MOVLW       46
	MOVWF       R5 
	MOVLW       101
	MOVWF       R6 
	MOVLW       132
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       get_atan_rad_1_L0+0 
	MOVF        R1, 0 
	MOVWF       get_atan_rad_1_L0+1 
	MOVF        R2, 0 
	MOVWF       get_atan_rad_1_L0+2 
	MOVF        R3, 0 
	MOVWF       get_atan_rad_1_L0+3 
;other function.c,182 :: 		return rad_1;
	MOVF        get_atan_rad_1_L0+0, 0 
	MOVWF       R0 
	MOVF        get_atan_rad_1_L0+1, 0 
	MOVWF       R1 
	MOVF        get_atan_rad_1_L0+2, 0 
	MOVWF       R2 
	MOVF        get_atan_rad_1_L0+3, 0 
	MOVWF       R3 
;other function.c,183 :: 		}
L_end_get_atan:
	RETURN      0
; end of _get_atan

_function_chk:

;other function.c,185 :: 		char  function_chk(char function_id)
;other function.c,189 :: 		if (function_id==0 && end_of_jump=='S')       // stich data
	MOVF        FARG_function_chk_function_id+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_function_chk102
	MOVF        _end_of_jump+0, 0 
	XORLW       83
	BTFSS       STATUS+0, 2 
	GOTO        L_function_chk102
L__function_chk765:
;other function.c,191 :: 		if (break_flag_internal=='O')         // 'O'= ON
	MOVF        _break_flag_internal+0, 0 
	XORLW       79
	BTFSS       STATUS+0, 2 
	GOTO        L_function_chk103
;other function.c,193 :: 		break_flag_internal='F';
	MOVLW       70
	MOVWF       _break_flag_internal+0 
;other function.c,194 :: 		if (back_start=='S')
	MOVF        _back_start+0, 0 
	XORLW       83
	BTFSS       STATUS+0, 2 
	GOTO        L_function_chk104
;other function.c,196 :: 		break_off();
	CALL        _break_off+0, 0
;other function.c,197 :: 		}
L_function_chk104:
;other function.c,198 :: 		}
L_function_chk103:
;other function.c,199 :: 		end_of_jump='S';
	MOVLW       83
	MOVWF       _end_of_jump+0 
;other function.c,200 :: 		return function_id;
	MOVF        FARG_function_chk_function_id+0, 0 
	MOVWF       R0 
	GOTO        L_end_function_chk
;other function.c,201 :: 		}
L_function_chk102:
;other function.c,203 :: 		else if (function_id==1  )           // jump data
	MOVF        FARG_function_chk_function_id+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_function_chk106
;other function.c,205 :: 		if (break_flag_internal=='F')
	MOVF        _break_flag_internal+0, 0 
	XORLW       70
	BTFSS       STATUS+0, 2 
	GOTO        L_function_chk107
;other function.c,207 :: 		break_flag_internal='O';
	MOVLW       79
	MOVWF       _break_flag_internal+0 
;other function.c,208 :: 		if ( back_start=='S')
	MOVF        _back_start+0, 0 
	XORLW       83
	BTFSS       STATUS+0, 2 
	GOTO        L_function_chk108
;other function.c,210 :: 		break_on();
	CALL        _break_on+0, 0
;other function.c,211 :: 		}
L_function_chk108:
;other function.c,212 :: 		}
L_function_chk107:
;other function.c,213 :: 		end_of_jump='J';   //'J' JUMP
	MOVLW       74
	MOVWF       _end_of_jump+0 
;other function.c,214 :: 		return function_id;
	MOVF        FARG_function_chk_function_id+0, 0 
	MOVWF       R0 
	GOTO        L_end_function_chk
;other function.c,215 :: 		}
L_function_chk106:
;other function.c,217 :: 		else if(function_id==0 && end_of_jump=='J')
	MOVF        FARG_function_chk_function_id+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_function_chk112
	MOVF        _end_of_jump+0, 0 
	XORLW       74
	BTFSS       STATUS+0, 2 
	GOTO        L_function_chk112
L__function_chk764:
;other function.c,219 :: 		end_of_jump='S';
	MOVLW       83
	MOVWF       _end_of_jump+0 
;other function.c,220 :: 		return 1;
	MOVLW       1
	MOVWF       R0 
	GOTO        L_end_function_chk
;other function.c,221 :: 		}
L_function_chk112:
;other function.c,222 :: 		else if (function_id==0X0B||function_id==0X0C|| function_id==0X0D ||
	MOVF        FARG_function_chk_function_id+0, 0 
	XORLW       11
	BTFSC       STATUS+0, 2 
	GOTO        L__function_chk763
	MOVF        FARG_function_chk_function_id+0, 0 
	XORLW       12
	BTFSC       STATUS+0, 2 
	GOTO        L__function_chk763
	MOVF        FARG_function_chk_function_id+0, 0 
	XORLW       13
	BTFSC       STATUS+0, 2 
	GOTO        L__function_chk763
;other function.c,223 :: 		function_id==0X0E|| function_id==0X0F)
	MOVF        FARG_function_chk_function_id+0, 0 
	XORLW       14
	BTFSC       STATUS+0, 2 
	GOTO        L__function_chk763
	MOVF        FARG_function_chk_function_id+0, 0 
	XORLW       15
	BTFSC       STATUS+0, 2 
	GOTO        L__function_chk763
	GOTO        L_function_chk116
L__function_chk763:
;other function.c,225 :: 		break_on();
	CALL        _break_on+0, 0
;other function.c,226 :: 		break_flag_internal='O';
	MOVLW       79
	MOVWF       _break_flag_internal+0 
;other function.c,227 :: 		return 2;
	MOVLW       2
	MOVWF       R0 
	GOTO        L_end_function_chk
;other function.c,228 :: 		}
L_function_chk116:
;other function.c,229 :: 		}
L_end_function_chk:
	RETURN      0
; end of _function_chk

_GET_DEGREE:

;other function.c,234 :: 		char GET_DEGREE()
;other function.c,238 :: 		function_id=function & 0x0F;
	MOVLW       15
	ANDWF       _function+0, 0 
	MOVWF       GET_DEGREE_function_id_L0+0 
;other function.c,240 :: 		if (function==128||function==129||function==136||function==137||function==138)
	MOVF        _function+0, 0 
	XORLW       128
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE789
	MOVF        _function+0, 0 
	XORLW       129
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE789
	MOVF        _function+0, 0 
	XORLW       136
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE789
	MOVF        _function+0, 0 
	XORLW       137
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE789
	MOVF        _function+0, 0 
	XORLW       138
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE789
	GOTO        L_GET_DEGREE119
L__GET_DEGREE789:
;other function.c,242 :: 		if (X_Distance==0)
	MOVLW       0
	XORWF       _X_Distance+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__GET_DEGREE885
	MOVLW       0
	XORWF       _X_Distance+0, 0 
L__GET_DEGREE885:
	BTFSS       STATUS+0, 2 
	GOTO        L_GET_DEGREE120
;other function.c,244 :: 		Z_Degree=90.0;
	MOVLW       0
	MOVWF       _Z_DEGREE+0 
	MOVLW       0
	MOVWF       _Z_DEGREE+1 
	MOVLW       52
	MOVWF       _Z_DEGREE+2 
	MOVLW       133
	MOVWF       _Z_DEGREE+3 
;other function.c,245 :: 		}
	GOTO        L_GET_DEGREE121
L_GET_DEGREE120:
;other function.c,246 :: 		else if (Y_Distance==0)
	MOVLW       0
	XORWF       _Y_Distance+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__GET_DEGREE886
	MOVLW       0
	XORWF       _Y_Distance+0, 0 
L__GET_DEGREE886:
	BTFSS       STATUS+0, 2 
	GOTO        L_GET_DEGREE122
;other function.c,248 :: 		Z_Degree=0.0;
	CLRF        _Z_DEGREE+0 
	CLRF        _Z_DEGREE+1 
	CLRF        _Z_DEGREE+2 
	CLRF        _Z_DEGREE+3 
;other function.c,249 :: 		}
	GOTO        L_GET_DEGREE123
L_GET_DEGREE122:
;other function.c,252 :: 		Z_Degree=get_atan(Y_Distance,X_Distance);
	MOVF        _Y_Distance+0, 0 
	MOVWF       R0 
	MOVF        _Y_Distance+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_get_atan_Y_Distance+0 
	MOVF        R1, 0 
	MOVWF       FARG_get_atan_Y_Distance+1 
	MOVF        R2, 0 
	MOVWF       FARG_get_atan_Y_Distance+2 
	MOVF        R3, 0 
	MOVWF       FARG_get_atan_Y_Distance+3 
	MOVF        _X_Distance+0, 0 
	MOVWF       R0 
	MOVF        _X_Distance+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_get_atan_X_Distance+0 
	MOVF        R1, 0 
	MOVWF       FARG_get_atan_X_Distance+1 
	MOVF        R2, 0 
	MOVWF       FARG_get_atan_X_Distance+2 
	MOVF        R3, 0 
	MOVWF       FARG_get_atan_X_Distance+3 
	CALL        _get_atan+0, 0
	MOVF        R0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        R1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        R2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        R3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,253 :: 		}
L_GET_DEGREE123:
L_GET_DEGREE121:
;other function.c,254 :: 		}
	GOTO        L_GET_DEGREE124
L_GET_DEGREE119:
;other function.c,256 :: 		else  if (function==160||function==161||function==168||function==169||function==170)
	MOVF        _function+0, 0 
	XORLW       160
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE788
	MOVF        _function+0, 0 
	XORLW       161
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE788
	MOVF        _function+0, 0 
	XORLW       168
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE788
	MOVF        _function+0, 0 
	XORLW       169
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE788
	MOVF        _function+0, 0 
	XORLW       170
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE788
	GOTO        L_GET_DEGREE127
L__GET_DEGREE788:
;other function.c,258 :: 		if (X_Distance==0)
	MOVLW       0
	XORWF       _X_Distance+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__GET_DEGREE887
	MOVLW       0
	XORWF       _X_Distance+0, 0 
L__GET_DEGREE887:
	BTFSS       STATUS+0, 2 
	GOTO        L_GET_DEGREE128
;other function.c,260 :: 		Z_Degree=90.0;
	MOVLW       0
	MOVWF       _Z_DEGREE+0 
	MOVLW       0
	MOVWF       _Z_DEGREE+1 
	MOVLW       52
	MOVWF       _Z_DEGREE+2 
	MOVLW       133
	MOVWF       _Z_DEGREE+3 
;other function.c,261 :: 		}
	GOTO        L_GET_DEGREE129
L_GET_DEGREE128:
;other function.c,262 :: 		else if (Y_Distance==0)
	MOVLW       0
	XORWF       _Y_Distance+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__GET_DEGREE888
	MOVLW       0
	XORWF       _Y_Distance+0, 0 
L__GET_DEGREE888:
	BTFSS       STATUS+0, 2 
	GOTO        L_GET_DEGREE130
;other function.c,264 :: 		Z_Degree=180.0;
	MOVLW       0
	MOVWF       _Z_DEGREE+0 
	MOVLW       0
	MOVWF       _Z_DEGREE+1 
	MOVLW       52
	MOVWF       _Z_DEGREE+2 
	MOVLW       134
	MOVWF       _Z_DEGREE+3 
;other function.c,265 :: 		}
	GOTO        L_GET_DEGREE131
L_GET_DEGREE130:
;other function.c,268 :: 		rad=get_atan(Y_Distance,X_Distance);
	MOVF        _Y_Distance+0, 0 
	MOVWF       R0 
	MOVF        _Y_Distance+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_get_atan_Y_Distance+0 
	MOVF        R1, 0 
	MOVWF       FARG_get_atan_Y_Distance+1 
	MOVF        R2, 0 
	MOVWF       FARG_get_atan_Y_Distance+2 
	MOVF        R3, 0 
	MOVWF       FARG_get_atan_Y_Distance+3 
	MOVF        _X_Distance+0, 0 
	MOVWF       R0 
	MOVF        _X_Distance+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_get_atan_X_Distance+0 
	MOVF        R1, 0 
	MOVWF       FARG_get_atan_X_Distance+1 
	MOVF        R2, 0 
	MOVWF       FARG_get_atan_X_Distance+2 
	MOVF        R3, 0 
	MOVWF       FARG_get_atan_X_Distance+3 
	CALL        _get_atan+0, 0
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,269 :: 		Z_Degree=180.0-rad;
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       52
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        R1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        R2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        R3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,270 :: 		}
L_GET_DEGREE131:
L_GET_DEGREE129:
;other function.c,271 :: 		}
	GOTO        L_GET_DEGREE132
L_GET_DEGREE127:
;other function.c,273 :: 		else if (function==224||function==225||function==232||function==233||function==234)
	MOVF        _function+0, 0 
	XORLW       224
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE787
	MOVF        _function+0, 0 
	XORLW       225
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE787
	MOVF        _function+0, 0 
	XORLW       232
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE787
	MOVF        _function+0, 0 
	XORLW       233
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE787
	MOVF        _function+0, 0 
	XORLW       234
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE787
	GOTO        L_GET_DEGREE135
L__GET_DEGREE787:
;other function.c,275 :: 		if (X_Distance==0)
	MOVLW       0
	XORWF       _X_Distance+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__GET_DEGREE889
	MOVLW       0
	XORWF       _X_Distance+0, 0 
L__GET_DEGREE889:
	BTFSS       STATUS+0, 2 
	GOTO        L_GET_DEGREE136
;other function.c,277 :: 		Z_Degree=270.0;
	MOVLW       0
	MOVWF       _Z_DEGREE+0 
	MOVLW       0
	MOVWF       _Z_DEGREE+1 
	MOVLW       7
	MOVWF       _Z_DEGREE+2 
	MOVLW       135
	MOVWF       _Z_DEGREE+3 
;other function.c,278 :: 		}
	GOTO        L_GET_DEGREE137
L_GET_DEGREE136:
;other function.c,279 :: 		else if (Y_Distance==0)
	MOVLW       0
	XORWF       _Y_Distance+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__GET_DEGREE890
	MOVLW       0
	XORWF       _Y_Distance+0, 0 
L__GET_DEGREE890:
	BTFSS       STATUS+0, 2 
	GOTO        L_GET_DEGREE138
;other function.c,281 :: 		Z_Degree=180.0;
	MOVLW       0
	MOVWF       _Z_DEGREE+0 
	MOVLW       0
	MOVWF       _Z_DEGREE+1 
	MOVLW       52
	MOVWF       _Z_DEGREE+2 
	MOVLW       134
	MOVWF       _Z_DEGREE+3 
;other function.c,282 :: 		}
	GOTO        L_GET_DEGREE139
L_GET_DEGREE138:
;other function.c,285 :: 		rad=get_atan(Y_Distance,X_Distance);
	MOVF        _Y_Distance+0, 0 
	MOVWF       R0 
	MOVF        _Y_Distance+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_get_atan_Y_Distance+0 
	MOVF        R1, 0 
	MOVWF       FARG_get_atan_Y_Distance+1 
	MOVF        R2, 0 
	MOVWF       FARG_get_atan_Y_Distance+2 
	MOVF        R3, 0 
	MOVWF       FARG_get_atan_Y_Distance+3 
	MOVF        _X_Distance+0, 0 
	MOVWF       R0 
	MOVF        _X_Distance+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_get_atan_X_Distance+0 
	MOVF        R1, 0 
	MOVWF       FARG_get_atan_X_Distance+1 
	MOVF        R2, 0 
	MOVWF       FARG_get_atan_X_Distance+2 
	MOVF        R3, 0 
	MOVWF       FARG_get_atan_X_Distance+3 
	CALL        _get_atan+0, 0
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,286 :: 		Z_Degree=rad+180.0;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       52
	MOVWF       R6 
	MOVLW       134
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        R1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        R2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        R3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,287 :: 		}
L_GET_DEGREE139:
L_GET_DEGREE137:
;other function.c,288 :: 		}
	GOTO        L_GET_DEGREE140
L_GET_DEGREE135:
;other function.c,290 :: 		else  if (function==192||function==193||function==200||function==201||function==202)
	MOVF        _function+0, 0 
	XORLW       192
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE786
	MOVF        _function+0, 0 
	XORLW       193
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE786
	MOVF        _function+0, 0 
	XORLW       200
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE786
	MOVF        _function+0, 0 
	XORLW       201
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE786
	MOVF        _function+0, 0 
	XORLW       202
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE786
	GOTO        L_GET_DEGREE143
L__GET_DEGREE786:
;other function.c,292 :: 		if (X_Distance==0)
	MOVLW       0
	XORWF       _X_Distance+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__GET_DEGREE891
	MOVLW       0
	XORWF       _X_Distance+0, 0 
L__GET_DEGREE891:
	BTFSS       STATUS+0, 2 
	GOTO        L_GET_DEGREE144
;other function.c,294 :: 		Z_Degree=270.0;
	MOVLW       0
	MOVWF       _Z_DEGREE+0 
	MOVLW       0
	MOVWF       _Z_DEGREE+1 
	MOVLW       7
	MOVWF       _Z_DEGREE+2 
	MOVLW       135
	MOVWF       _Z_DEGREE+3 
;other function.c,295 :: 		}
	GOTO        L_GET_DEGREE145
L_GET_DEGREE144:
;other function.c,296 :: 		else if (Y_Distance==0)
	MOVLW       0
	XORWF       _Y_Distance+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__GET_DEGREE892
	MOVLW       0
	XORWF       _Y_Distance+0, 0 
L__GET_DEGREE892:
	BTFSS       STATUS+0, 2 
	GOTO        L_GET_DEGREE146
;other function.c,298 :: 		Z_Degree=360.0;
	MOVLW       0
	MOVWF       _Z_DEGREE+0 
	MOVLW       0
	MOVWF       _Z_DEGREE+1 
	MOVLW       52
	MOVWF       _Z_DEGREE+2 
	MOVLW       135
	MOVWF       _Z_DEGREE+3 
;other function.c,299 :: 		}
	GOTO        L_GET_DEGREE147
L_GET_DEGREE146:
;other function.c,302 :: 		rad=get_atan(Y_Distance,X_Distance);
	MOVF        _Y_Distance+0, 0 
	MOVWF       R0 
	MOVF        _Y_Distance+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_get_atan_Y_Distance+0 
	MOVF        R1, 0 
	MOVWF       FARG_get_atan_Y_Distance+1 
	MOVF        R2, 0 
	MOVWF       FARG_get_atan_Y_Distance+2 
	MOVF        R3, 0 
	MOVWF       FARG_get_atan_Y_Distance+3 
	MOVF        _X_Distance+0, 0 
	MOVWF       R0 
	MOVF        _X_Distance+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_get_atan_X_Distance+0 
	MOVF        R1, 0 
	MOVWF       FARG_get_atan_X_Distance+1 
	MOVF        R2, 0 
	MOVWF       FARG_get_atan_X_Distance+2 
	MOVF        R3, 0 
	MOVWF       FARG_get_atan_X_Distance+3 
	CALL        _get_atan+0, 0
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,303 :: 		Z_Degree=360.0-rad;
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       52
	MOVWF       R2 
	MOVLW       135
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        R1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        R2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        R3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,304 :: 		}
L_GET_DEGREE147:
L_GET_DEGREE145:
;other function.c,305 :: 		}
L_GET_DEGREE143:
L_GET_DEGREE140:
L_GET_DEGREE132:
L_GET_DEGREE124:
;other function.c,309 :: 		if (function==128 ||function==129||function==136||function==137||function==138)
	MOVF        _function+0, 0 
	XORLW       128
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE785
	MOVF        _function+0, 0 
	XORLW       129
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE785
	MOVF        _function+0, 0 
	XORLW       136
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE785
	MOVF        _function+0, 0 
	XORLW       137
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE785
	MOVF        _function+0, 0 
	XORLW       138
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE785
	GOTO        L_GET_DEGREE150
L__GET_DEGREE785:
;other function.c,311 :: 		if (old_function==224||old_function==225||old_function==232||old_function==233||old_function==234)
	MOVF        _old_function+0, 0 
	XORLW       224
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE784
	MOVF        _old_function+0, 0 
	XORLW       225
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE784
	MOVF        _old_function+0, 0 
	XORLW       232
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE784
	MOVF        _old_function+0, 0 
	XORLW       233
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE784
	MOVF        _old_function+0, 0 
	XORLW       234
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE784
	GOTO        L_GET_DEGREE153
L__GET_DEGREE784:
;other function.c,313 :: 		old_function=function;
	MOVF        _function+0, 0 
	MOVWF       _old_function+0 
;other function.c,314 :: 		rad=OLD_Z_Degree-Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVF        _OLD_Z_Degree+0, 0 
	MOVWF       R0 
	MOVF        _OLD_Z_Degree+1, 0 
	MOVWF       R1 
	MOVF        _OLD_Z_Degree+2, 0 
	MOVWF       R2 
	MOVF        _OLD_Z_Degree+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,315 :: 		OLD_Z_Degree=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _OLD_Z_Degree+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _OLD_Z_Degree+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _OLD_Z_Degree+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _OLD_Z_Degree+3 
;other function.c,316 :: 		if (rad<=180.0)
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       52
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_GET_DEGREE154
;other function.c,318 :: 		rad=90.0-Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       52
	MOVWF       R2 
	MOVLW       133
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,319 :: 		Z_Degree=rad;
	MOVF        R0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        R1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        R2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        R3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,320 :: 		rad=Z_Degree;
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,321 :: 		degree=rad;
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _degree+0 
	MOVF        R1, 0 
	MOVWF       _degree+1 
;other function.c,322 :: 		dir=0x22;
	MOVLW       34
	MOVWF       _dir+0 
;other function.c,323 :: 		Z_DIR_CW();
	CALL        _Z_DIR_CW+0, 0
;other function.c,324 :: 		}
	GOTO        L_GET_DEGREE155
L_GET_DEGREE154:
;other function.c,325 :: 		else if (rad>180.0)
	MOVF        _RAD+0, 0 
	MOVWF       R4 
	MOVF        _RAD+1, 0 
	MOVWF       R5 
	MOVF        _RAD+2, 0 
	MOVWF       R6 
	MOVF        _RAD+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       52
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_GET_DEGREE156
;other function.c,327 :: 		rad=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _RAD+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _RAD+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _RAD+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _RAD+3 
;other function.c,328 :: 		rad=floor(Z_Degree);
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       FARG_floor_x+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       FARG_floor_x+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       FARG_floor_x+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       FARG_floor_x+3 
	CALL        _floor+0, 0
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,329 :: 		degree=rad;
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _degree+0 
	MOVF        R1, 0 
	MOVWF       _degree+1 
;other function.c,330 :: 		dir=0x11;
	MOVLW       17
	MOVWF       _dir+0 
;other function.c,331 :: 		Z_DIR_CCW();
	CALL        _Z_DIR_CCW+0, 0
;other function.c,332 :: 		}
L_GET_DEGREE156:
L_GET_DEGREE155:
;other function.c,333 :: 		rad=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _RAD+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _RAD+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _RAD+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _RAD+3 
;other function.c,334 :: 		degree=rad;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R3 
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _degree+0 
	MOVF        R1, 0 
	MOVWF       _degree+1 
;other function.c,335 :: 		}
	GOTO        L_GET_DEGREE157
L_GET_DEGREE153:
;other function.c,336 :: 		else if (old_function==192||old_function==193||old_function==200||old_function==201||old_function==202)
	MOVF        _old_function+0, 0 
	XORLW       192
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE783
	MOVF        _old_function+0, 0 
	XORLW       193
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE783
	MOVF        _old_function+0, 0 
	XORLW       200
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE783
	MOVF        _old_function+0, 0 
	XORLW       201
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE783
	MOVF        _old_function+0, 0 
	XORLW       202
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE783
	GOTO        L_GET_DEGREE160
L__GET_DEGREE783:
;other function.c,338 :: 		old_function=function;
	MOVF        _function+0, 0 
	MOVWF       _old_function+0 
;other function.c,339 :: 		OLD_Z_Degree=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _OLD_Z_Degree+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _OLD_Z_Degree+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _OLD_Z_Degree+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _OLD_Z_Degree+3 
;other function.c,340 :: 		rad=floor(Z_Degree);
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       FARG_floor_x+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       FARG_floor_x+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       FARG_floor_x+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       FARG_floor_x+3 
	CALL        _floor+0, 0
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,341 :: 		degree=rad;
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _degree+0 
	MOVF        R1, 0 
	MOVWF       _degree+1 
;other function.c,342 :: 		dir=0x11;
	MOVLW       17
	MOVWF       _dir+0 
;other function.c,343 :: 		Z_DIR_CCW();
	CALL        _Z_DIR_CCW+0, 0
;other function.c,344 :: 		}
	GOTO        L_GET_DEGREE161
L_GET_DEGREE160:
;other function.c,345 :: 		else if (old_function==160||old_function==161||old_function==168||old_function==169||old_function==170)
	MOVF        _old_function+0, 0 
	XORLW       160
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE782
	MOVF        _old_function+0, 0 
	XORLW       161
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE782
	MOVF        _old_function+0, 0 
	XORLW       168
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE782
	MOVF        _old_function+0, 0 
	XORLW       169
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE782
	MOVF        _old_function+0, 0 
	XORLW       170
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE782
	GOTO        L_GET_DEGREE164
L__GET_DEGREE782:
;other function.c,347 :: 		old_function=function;
	MOVF        _function+0, 0 
	MOVWF       _old_function+0 
;other function.c,348 :: 		rad=90.0-Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       52
	MOVWF       R2 
	MOVLW       133
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,349 :: 		OLD_Z_Degree=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _OLD_Z_Degree+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _OLD_Z_Degree+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _OLD_Z_Degree+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _OLD_Z_Degree+3 
;other function.c,350 :: 		Z_Degree=rad;
	MOVF        R0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        R1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        R2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        R3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,351 :: 		rad=Z_Degree;
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,352 :: 		degree=rad;
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _degree+0 
	MOVF        R1, 0 
	MOVWF       _degree+1 
;other function.c,353 :: 		dir=0x22;
	MOVLW       34
	MOVWF       _dir+0 
;other function.c,354 :: 		Z_DIR_CW();
	CALL        _Z_DIR_CW+0, 0
;other function.c,355 :: 		}
	GOTO        L_GET_DEGREE165
L_GET_DEGREE164:
;other function.c,356 :: 		else if (old_function==128||old_function==129||old_function==136||old_function==137||old_function==138)
	MOVF        _old_function+0, 0 
	XORLW       128
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE781
	MOVF        _old_function+0, 0 
	XORLW       129
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE781
	MOVF        _old_function+0, 0 
	XORLW       136
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE781
	MOVF        _old_function+0, 0 
	XORLW       137
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE781
	MOVF        _old_function+0, 0 
	XORLW       138
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE781
	GOTO        L_GET_DEGREE168
L__GET_DEGREE781:
;other function.c,358 :: 		old_function=function;
	MOVF        _function+0, 0 
	MOVWF       _old_function+0 
;other function.c,359 :: 		if (OLD_Z_Degree>=Z_Degree)
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVF        _OLD_Z_Degree+0, 0 
	MOVWF       R0 
	MOVF        _OLD_Z_Degree+1, 0 
	MOVWF       R1 
	MOVF        _OLD_Z_Degree+2, 0 
	MOVWF       R2 
	MOVF        _OLD_Z_Degree+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_GET_DEGREE169
;other function.c,361 :: 		rad=OLD_Z_Degree-Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVF        _OLD_Z_Degree+0, 0 
	MOVWF       R0 
	MOVF        _OLD_Z_Degree+1, 0 
	MOVWF       R1 
	MOVF        _OLD_Z_Degree+2, 0 
	MOVWF       R2 
	MOVF        _OLD_Z_Degree+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,362 :: 		OLD_Z_Degree=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _OLD_Z_Degree+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _OLD_Z_Degree+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _OLD_Z_Degree+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _OLD_Z_Degree+3 
;other function.c,363 :: 		dir=0X02;
	MOVLW       2
	MOVWF       _dir+0 
;other function.c,364 :: 		Z_DIR_CW();
	CALL        _Z_DIR_CW+0, 0
;other function.c,365 :: 		}
	GOTO        L_GET_DEGREE170
L_GET_DEGREE169:
;other function.c,366 :: 		else if(OLD_Z_Degree<Z_Degree)
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVF        _OLD_Z_Degree+0, 0 
	MOVWF       R0 
	MOVF        _OLD_Z_Degree+1, 0 
	MOVWF       R1 
	MOVF        _OLD_Z_Degree+2, 0 
	MOVWF       R2 
	MOVF        _OLD_Z_Degree+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_GET_DEGREE171
;other function.c,368 :: 		rad=Z_Degree-OLD_Z_Degree;
	MOVF        _OLD_Z_Degree+0, 0 
	MOVWF       R4 
	MOVF        _OLD_Z_Degree+1, 0 
	MOVWF       R5 
	MOVF        _OLD_Z_Degree+2, 0 
	MOVWF       R6 
	MOVF        _OLD_Z_Degree+3, 0 
	MOVWF       R7 
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,369 :: 		OLD_Z_Degree=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _OLD_Z_Degree+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _OLD_Z_Degree+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _OLD_Z_Degree+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _OLD_Z_Degree+3 
;other function.c,370 :: 		dir=0X01;
	MOVLW       1
	MOVWF       _dir+0 
;other function.c,371 :: 		Z_DIR_CCW();
	CALL        _Z_DIR_CCW+0, 0
;other function.c,372 :: 		}
L_GET_DEGREE171:
L_GET_DEGREE170:
;other function.c,373 :: 		Z_Degree=rad;
	MOVF        _RAD+0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        _RAD+1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        _RAD+2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        _RAD+3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,374 :: 		rad=Z_Degree;
;other function.c,375 :: 		degree=rad;
	MOVF        _RAD+0, 0 
	MOVWF       R0 
	MOVF        _RAD+1, 0 
	MOVWF       R1 
	MOVF        _RAD+2, 0 
	MOVWF       R2 
	MOVF        _RAD+3, 0 
	MOVWF       R3 
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _degree+0 
	MOVF        R1, 0 
	MOVWF       _degree+1 
;other function.c,376 :: 		}
L_GET_DEGREE168:
L_GET_DEGREE165:
L_GET_DEGREE161:
L_GET_DEGREE157:
;other function.c,377 :: 		}
	GOTO        L_GET_DEGREE172
L_GET_DEGREE150:
;other function.c,379 :: 		else if (function==160||function==161||function==168||function==169||function==170)
	MOVF        _function+0, 0 
	XORLW       160
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE780
	MOVF        _function+0, 0 
	XORLW       161
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE780
	MOVF        _function+0, 0 
	XORLW       168
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE780
	MOVF        _function+0, 0 
	XORLW       169
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE780
	MOVF        _function+0, 0 
	XORLW       170
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE780
	GOTO        L_GET_DEGREE175
L__GET_DEGREE780:
;other function.c,381 :: 		if  (old_function==224||old_function==225||old_function==232||old_function==233||old_function==234)
	MOVF        _old_function+0, 0 
	XORLW       224
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE779
	MOVF        _old_function+0, 0 
	XORLW       225
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE779
	MOVF        _old_function+0, 0 
	XORLW       232
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE779
	MOVF        _old_function+0, 0 
	XORLW       233
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE779
	MOVF        _old_function+0, 0 
	XORLW       234
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE779
	GOTO        L_GET_DEGREE178
L__GET_DEGREE779:
;other function.c,383 :: 		old_function=function;
	MOVF        _function+0, 0 
	MOVWF       _old_function+0 
;other function.c,384 :: 		rad=180.0-Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       52
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,385 :: 		OLD_Z_Degree=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _OLD_Z_Degree+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _OLD_Z_Degree+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _OLD_Z_Degree+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _OLD_Z_Degree+3 
;other function.c,386 :: 		Z_Degree=rad;
	MOVF        R0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        R1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        R2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        R3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,387 :: 		rad=Z_Degree;
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,388 :: 		degree=rad;
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _degree+0 
	MOVF        R1, 0 
	MOVWF       _degree+1 
;other function.c,389 :: 		dir=0x32;   //1------CCW  ,2=CW   ,0=NO Dirction,
	MOVLW       50
	MOVWF       _dir+0 
;other function.c,390 :: 		Z_DIR_CW();
	CALL        _Z_DIR_CW+0, 0
;other function.c,391 :: 		}
	GOTO        L_GET_DEGREE179
L_GET_DEGREE178:
;other function.c,392 :: 		else if (old_function==192||old_function==193||old_function==200||old_function==201||old_function==202)
	MOVF        _old_function+0, 0 
	XORLW       192
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE778
	MOVF        _old_function+0, 0 
	XORLW       193
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE778
	MOVF        _old_function+0, 0 
	XORLW       200
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE778
	MOVF        _old_function+0, 0 
	XORLW       201
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE778
	MOVF        _old_function+0, 0 
	XORLW       202
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE778
	GOTO        L_GET_DEGREE182
L__GET_DEGREE778:
;other function.c,394 :: 		old_function=function;
	MOVF        _function+0, 0 
	MOVWF       _old_function+0 
;other function.c,395 :: 		rad=OLD_Z_Degree-Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVF        _OLD_Z_Degree+0, 0 
	MOVWF       R0 
	MOVF        _OLD_Z_Degree+1, 0 
	MOVWF       R1 
	MOVF        _OLD_Z_Degree+2, 0 
	MOVWF       R2 
	MOVF        _OLD_Z_Degree+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,396 :: 		OLD_Z_Degree=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _OLD_Z_Degree+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _OLD_Z_Degree+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _OLD_Z_Degree+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _OLD_Z_Degree+3 
;other function.c,397 :: 		if (rad<=180.0)
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       52
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_GET_DEGREE183
;other function.c,399 :: 		Z_Degree=180.0-Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       52
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        R1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        R2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        R3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,400 :: 		dir=0x32;
	MOVLW       50
	MOVWF       _dir+0 
;other function.c,401 :: 		Z_DIR_CW();
	CALL        _Z_DIR_CW+0, 0
;other function.c,402 :: 		}
	GOTO        L_GET_DEGREE184
L_GET_DEGREE183:
;other function.c,403 :: 		else if (rad>180.0)
	MOVF        _RAD+0, 0 
	MOVWF       R4 
	MOVF        _RAD+1, 0 
	MOVWF       R5 
	MOVF        _RAD+2, 0 
	MOVWF       R6 
	MOVF        _RAD+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       52
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_GET_DEGREE185
;other function.c,405 :: 		Z_Degree=Z_Degree-90.0;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       52
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        R1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        R2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        R3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,406 :: 		dir=0x21;
	MOVLW       33
	MOVWF       _dir+0 
;other function.c,407 :: 		Z_DIR_CCW();
	CALL        _Z_DIR_CCW+0, 0
;other function.c,408 :: 		}
L_GET_DEGREE185:
L_GET_DEGREE184:
;other function.c,409 :: 		rad=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _RAD+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _RAD+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _RAD+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _RAD+3 
;other function.c,410 :: 		degree=rad;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R3 
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _degree+0 
	MOVF        R1, 0 
	MOVWF       _degree+1 
;other function.c,411 :: 		}
	GOTO        L_GET_DEGREE186
L_GET_DEGREE182:
;other function.c,412 :: 		else if (old_function==160||old_function==161||old_function==168||old_function==169||old_function==170)
	MOVF        _old_function+0, 0 
	XORLW       160
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE777
	MOVF        _old_function+0, 0 
	XORLW       161
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE777
	MOVF        _old_function+0, 0 
	XORLW       168
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE777
	MOVF        _old_function+0, 0 
	XORLW       169
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE777
	MOVF        _old_function+0, 0 
	XORLW       170
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE777
	GOTO        L_GET_DEGREE189
L__GET_DEGREE777:
;other function.c,414 :: 		old_function=function;
	MOVF        _function+0, 0 
	MOVWF       _old_function+0 
;other function.c,415 :: 		if (OLD_Z_Degree>=Z_Degree)
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVF        _OLD_Z_Degree+0, 0 
	MOVWF       R0 
	MOVF        _OLD_Z_Degree+1, 0 
	MOVWF       R1 
	MOVF        _OLD_Z_Degree+2, 0 
	MOVWF       R2 
	MOVF        _OLD_Z_Degree+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_GET_DEGREE190
;other function.c,417 :: 		rad=OLD_Z_Degree-Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVF        _OLD_Z_Degree+0, 0 
	MOVWF       R0 
	MOVF        _OLD_Z_Degree+1, 0 
	MOVWF       R1 
	MOVF        _OLD_Z_Degree+2, 0 
	MOVWF       R2 
	MOVF        _OLD_Z_Degree+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,418 :: 		dir=0x02;
	MOVLW       2
	MOVWF       _dir+0 
;other function.c,419 :: 		Z_DIR_CW();
	CALL        _Z_DIR_CW+0, 0
;other function.c,420 :: 		}
	GOTO        L_GET_DEGREE191
L_GET_DEGREE190:
;other function.c,421 :: 		else if(OLD_Z_Degree<Z_Degree)
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVF        _OLD_Z_Degree+0, 0 
	MOVWF       R0 
	MOVF        _OLD_Z_Degree+1, 0 
	MOVWF       R1 
	MOVF        _OLD_Z_Degree+2, 0 
	MOVWF       R2 
	MOVF        _OLD_Z_Degree+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_GET_DEGREE192
;other function.c,423 :: 		rad=Z_Degree-OLD_Z_Degree;
	MOVF        _OLD_Z_Degree+0, 0 
	MOVWF       R4 
	MOVF        _OLD_Z_Degree+1, 0 
	MOVWF       R5 
	MOVF        _OLD_Z_Degree+2, 0 
	MOVWF       R6 
	MOVF        _OLD_Z_Degree+3, 0 
	MOVWF       R7 
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,424 :: 		dir=0x01;
	MOVLW       1
	MOVWF       _dir+0 
;other function.c,425 :: 		Z_DIR_CCW();
	CALL        _Z_DIR_CCW+0, 0
;other function.c,426 :: 		}
L_GET_DEGREE192:
L_GET_DEGREE191:
;other function.c,427 :: 		OLD_Z_Degree=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _OLD_Z_Degree+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _OLD_Z_Degree+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _OLD_Z_Degree+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _OLD_Z_Degree+3 
;other function.c,428 :: 		Z_Degree=rad;
	MOVF        _RAD+0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        _RAD+1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        _RAD+2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        _RAD+3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,429 :: 		rad=Z_Degree;
;other function.c,430 :: 		degree=rad;
	MOVF        _RAD+0, 0 
	MOVWF       R0 
	MOVF        _RAD+1, 0 
	MOVWF       R1 
	MOVF        _RAD+2, 0 
	MOVWF       R2 
	MOVF        _RAD+3, 0 
	MOVWF       R3 
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _degree+0 
	MOVF        R1, 0 
	MOVWF       _degree+1 
;other function.c,431 :: 		}
	GOTO        L_GET_DEGREE193
L_GET_DEGREE189:
;other function.c,432 :: 		else if (old_function==128||old_function==129||old_function==136||old_function==137||old_function==138)
	MOVF        _old_function+0, 0 
	XORLW       128
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE776
	MOVF        _old_function+0, 0 
	XORLW       129
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE776
	MOVF        _old_function+0, 0 
	XORLW       136
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE776
	MOVF        _old_function+0, 0 
	XORLW       137
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE776
	MOVF        _old_function+0, 0 
	XORLW       138
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE776
	GOTO        L_GET_DEGREE196
L__GET_DEGREE776:
;other function.c,434 :: 		old_function=function;
	MOVF        _function+0, 0 
	MOVWF       _old_function+0 
;other function.c,435 :: 		OLD_Z_Degree=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _OLD_Z_Degree+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _OLD_Z_Degree+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _OLD_Z_Degree+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _OLD_Z_Degree+3 
;other function.c,436 :: 		Z_Degree=Z_Degree-90.0;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       52
	MOVWF       R6 
	MOVLW       133
	MOVWF       R7 
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        R1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        R2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        R3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,437 :: 		rad=Z_Degree;
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,438 :: 		degree=rad;
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _degree+0 
	MOVF        R1, 0 
	MOVWF       _degree+1 
;other function.c,439 :: 		dir=0x21;   //1------CCW  ,2=CW   ,0=NO Dirction,
	MOVLW       33
	MOVWF       _dir+0 
;other function.c,440 :: 		Z_DIR_CCW();
	CALL        _Z_DIR_CCW+0, 0
;other function.c,441 :: 		}
L_GET_DEGREE196:
L_GET_DEGREE193:
L_GET_DEGREE186:
L_GET_DEGREE179:
;other function.c,442 :: 		}
	GOTO        L_GET_DEGREE197
L_GET_DEGREE175:
;other function.c,444 :: 		else if (function==224||function==225||function==232||function==233||function==234)
	MOVF        _function+0, 0 
	XORLW       224
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE775
	MOVF        _function+0, 0 
	XORLW       225
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE775
	MOVF        _function+0, 0 
	XORLW       232
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE775
	MOVF        _function+0, 0 
	XORLW       233
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE775
	MOVF        _function+0, 0 
	XORLW       234
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE775
	GOTO        L_GET_DEGREE200
L__GET_DEGREE775:
;other function.c,446 :: 		if  (old_function==192||old_function==193||old_function==200||old_function==201||old_function==202)
	MOVF        _old_function+0, 0 
	XORLW       192
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE774
	MOVF        _old_function+0, 0 
	XORLW       193
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE774
	MOVF        _old_function+0, 0 
	XORLW       200
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE774
	MOVF        _old_function+0, 0 
	XORLW       201
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE774
	MOVF        _old_function+0, 0 
	XORLW       202
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE774
	GOTO        L_GET_DEGREE203
L__GET_DEGREE774:
;other function.c,448 :: 		old_function=function;
	MOVF        _function+0, 0 
	MOVWF       _old_function+0 
;other function.c,449 :: 		OLD_Z_Degree=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _OLD_Z_Degree+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _OLD_Z_Degree+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _OLD_Z_Degree+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _OLD_Z_Degree+3 
;other function.c,450 :: 		Z_Degree=270.0-Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       7
	MOVWF       R2 
	MOVLW       135
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        R1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        R2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        R3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,451 :: 		rad=Z_Degree;
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,452 :: 		degree=rad;
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _degree+0 
	MOVF        R1, 0 
	MOVWF       _degree+1 
;other function.c,453 :: 		dir=0x42;   //1------CCW  ,2=CW   ,0=NO Dirction,
	MOVLW       66
	MOVWF       _dir+0 
;other function.c,454 :: 		Z_DIR_CW();
	CALL        _Z_DIR_CW+0, 0
;other function.c,455 :: 		}
	GOTO        L_GET_DEGREE204
L_GET_DEGREE203:
;other function.c,457 :: 		else if (old_function==128||old_function==129||old_function==136||old_function==137||old_function==138)
	MOVF        _old_function+0, 0 
	XORLW       128
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE773
	MOVF        _old_function+0, 0 
	XORLW       129
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE773
	MOVF        _old_function+0, 0 
	XORLW       136
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE773
	MOVF        _old_function+0, 0 
	XORLW       137
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE773
	MOVF        _old_function+0, 0 
	XORLW       138
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE773
	GOTO        L_GET_DEGREE207
L__GET_DEGREE773:
;other function.c,459 :: 		old_function=function;
	MOVF        _function+0, 0 
	MOVWF       _old_function+0 
;other function.c,460 :: 		rad=Z_Degree-OLD_Z_Degree;
	MOVF        _OLD_Z_Degree+0, 0 
	MOVWF       R4 
	MOVF        _OLD_Z_Degree+1, 0 
	MOVWF       R5 
	MOVF        _OLD_Z_Degree+2, 0 
	MOVWF       R6 
	MOVF        _OLD_Z_Degree+3, 0 
	MOVWF       R7 
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,461 :: 		OLD_Z_Degree=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _OLD_Z_Degree+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _OLD_Z_Degree+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _OLD_Z_Degree+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _OLD_Z_Degree+3 
;other function.c,462 :: 		if (rad<=180.0)
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       52
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_GET_DEGREE208
;other function.c,464 :: 		Z_Degree=Z_Degree-180.0;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       52
	MOVWF       R6 
	MOVLW       134
	MOVWF       R7 
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        R1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        R2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        R3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,465 :: 		dir=0x31;
	MOVLW       49
	MOVWF       _dir+0 
;other function.c,466 :: 		Z_DIR_CCW();
	CALL        _Z_DIR_CCW+0, 0
;other function.c,467 :: 		}
	GOTO        L_GET_DEGREE209
L_GET_DEGREE208:
;other function.c,468 :: 		else if (rad>180.0)
	MOVF        _RAD+0, 0 
	MOVWF       R4 
	MOVF        _RAD+1, 0 
	MOVWF       R5 
	MOVF        _RAD+2, 0 
	MOVWF       R6 
	MOVF        _RAD+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       52
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_GET_DEGREE210
;other function.c,470 :: 		Z_Degree=270.0-Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       7
	MOVWF       R2 
	MOVLW       135
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        R1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        R2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        R3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,471 :: 		dir=0x42;
	MOVLW       66
	MOVWF       _dir+0 
;other function.c,472 :: 		Z_DIR_CW();
	CALL        _Z_DIR_CW+0, 0
;other function.c,473 :: 		}
L_GET_DEGREE210:
L_GET_DEGREE209:
;other function.c,474 :: 		rad=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _RAD+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _RAD+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _RAD+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _RAD+3 
;other function.c,475 :: 		degree=rad;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R3 
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _degree+0 
	MOVF        R1, 0 
	MOVWF       _degree+1 
;other function.c,476 :: 		}
	GOTO        L_GET_DEGREE211
L_GET_DEGREE207:
;other function.c,478 :: 		else if (old_function==224||old_function==225||old_function==232||old_function==233||old_function==234)
	MOVF        _old_function+0, 0 
	XORLW       224
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE772
	MOVF        _old_function+0, 0 
	XORLW       225
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE772
	MOVF        _old_function+0, 0 
	XORLW       232
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE772
	MOVF        _old_function+0, 0 
	XORLW       233
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE772
	MOVF        _old_function+0, 0 
	XORLW       234
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE772
	GOTO        L_GET_DEGREE214
L__GET_DEGREE772:
;other function.c,480 :: 		old_function=function;
	MOVF        _function+0, 0 
	MOVWF       _old_function+0 
;other function.c,481 :: 		if (OLD_Z_Degree>=Z_Degree)
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVF        _OLD_Z_Degree+0, 0 
	MOVWF       R0 
	MOVF        _OLD_Z_Degree+1, 0 
	MOVWF       R1 
	MOVF        _OLD_Z_Degree+2, 0 
	MOVWF       R2 
	MOVF        _OLD_Z_Degree+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_GET_DEGREE215
;other function.c,483 :: 		rad=OLD_Z_Degree-Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVF        _OLD_Z_Degree+0, 0 
	MOVWF       R0 
	MOVF        _OLD_Z_Degree+1, 0 
	MOVWF       R1 
	MOVF        _OLD_Z_Degree+2, 0 
	MOVWF       R2 
	MOVF        _OLD_Z_Degree+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,484 :: 		dir=0x02;
	MOVLW       2
	MOVWF       _dir+0 
;other function.c,485 :: 		Z_DIR_CW();
	CALL        _Z_DIR_CW+0, 0
;other function.c,486 :: 		}
	GOTO        L_GET_DEGREE216
L_GET_DEGREE215:
;other function.c,487 :: 		else if(OLD_Z_Degree<Z_Degree)
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVF        _OLD_Z_Degree+0, 0 
	MOVWF       R0 
	MOVF        _OLD_Z_Degree+1, 0 
	MOVWF       R1 
	MOVF        _OLD_Z_Degree+2, 0 
	MOVWF       R2 
	MOVF        _OLD_Z_Degree+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_GET_DEGREE217
;other function.c,489 :: 		rad=Z_Degree-OLD_Z_Degree;
	MOVF        _OLD_Z_Degree+0, 0 
	MOVWF       R4 
	MOVF        _OLD_Z_Degree+1, 0 
	MOVWF       R5 
	MOVF        _OLD_Z_Degree+2, 0 
	MOVWF       R6 
	MOVF        _OLD_Z_Degree+3, 0 
	MOVWF       R7 
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,490 :: 		dir=0x01;
	MOVLW       1
	MOVWF       _dir+0 
;other function.c,491 :: 		Z_DIR_CCW();
	CALL        _Z_DIR_CCW+0, 0
;other function.c,492 :: 		}
L_GET_DEGREE217:
L_GET_DEGREE216:
;other function.c,493 :: 		OLD_Z_Degree=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _OLD_Z_Degree+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _OLD_Z_Degree+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _OLD_Z_Degree+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _OLD_Z_Degree+3 
;other function.c,494 :: 		Z_Degree=rad;
	MOVF        _RAD+0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        _RAD+1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        _RAD+2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        _RAD+3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,495 :: 		rad=Z_Degree;
;other function.c,496 :: 		degree=rad;
	MOVF        _RAD+0, 0 
	MOVWF       R0 
	MOVF        _RAD+1, 0 
	MOVWF       R1 
	MOVF        _RAD+2, 0 
	MOVWF       R2 
	MOVF        _RAD+3, 0 
	MOVWF       R3 
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _degree+0 
	MOVF        R1, 0 
	MOVWF       _degree+1 
;other function.c,497 :: 		}
	GOTO        L_GET_DEGREE218
L_GET_DEGREE214:
;other function.c,499 :: 		else if (old_function==160||old_function==161||old_function==168||old_function==169||old_function==170)
	MOVF        _old_function+0, 0 
	XORLW       160
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE771
	MOVF        _old_function+0, 0 
	XORLW       161
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE771
	MOVF        _old_function+0, 0 
	XORLW       168
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE771
	MOVF        _old_function+0, 0 
	XORLW       169
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE771
	MOVF        _old_function+0, 0 
	XORLW       170
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE771
	GOTO        L_GET_DEGREE221
L__GET_DEGREE771:
;other function.c,501 :: 		old_function=function;
	MOVF        _function+0, 0 
	MOVWF       _old_function+0 
;other function.c,502 :: 		OLD_Z_Degree=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _OLD_Z_Degree+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _OLD_Z_Degree+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _OLD_Z_Degree+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _OLD_Z_Degree+3 
;other function.c,503 :: 		Z_Degree=Z_Degree-180.0;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       52
	MOVWF       R6 
	MOVLW       134
	MOVWF       R7 
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        R1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        R2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        R3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,504 :: 		rad=Z_Degree;
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,505 :: 		degree=rad;
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _degree+0 
	MOVF        R1, 0 
	MOVWF       _degree+1 
;other function.c,506 :: 		dir=0x31;   //1------CCW  ,2=CW   ,0=NO Dirction,
	MOVLW       49
	MOVWF       _dir+0 
;other function.c,507 :: 		Z_DIR_CCW();
	CALL        _Z_DIR_CCW+0, 0
;other function.c,508 :: 		}
L_GET_DEGREE221:
L_GET_DEGREE218:
L_GET_DEGREE211:
L_GET_DEGREE204:
;other function.c,509 :: 		}
	GOTO        L_GET_DEGREE222
L_GET_DEGREE200:
;other function.c,511 :: 		else if(function==192||function==193||function==200||function==201||function==202)
	MOVF        _function+0, 0 
	XORLW       192
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE770
	MOVF        _function+0, 0 
	XORLW       193
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE770
	MOVF        _function+0, 0 
	XORLW       200
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE770
	MOVF        _function+0, 0 
	XORLW       201
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE770
	MOVF        _function+0, 0 
	XORLW       202
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE770
	GOTO        L_GET_DEGREE225
L__GET_DEGREE770:
;other function.c,513 :: 		if  (old_function==128||old_function==129||old_function==136||old_function==137||old_function==138)
	MOVF        _old_function+0, 0 
	XORLW       128
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE769
	MOVF        _old_function+0, 0 
	XORLW       129
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE769
	MOVF        _old_function+0, 0 
	XORLW       136
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE769
	MOVF        _old_function+0, 0 
	XORLW       137
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE769
	MOVF        _old_function+0, 0 
	XORLW       138
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE769
	GOTO        L_GET_DEGREE228
L__GET_DEGREE769:
;other function.c,515 :: 		old_function=function;
	MOVF        _function+0, 0 
	MOVWF       _old_function+0 
;other function.c,516 :: 		OLD_Z_Degree=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _OLD_Z_Degree+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _OLD_Z_Degree+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _OLD_Z_Degree+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _OLD_Z_Degree+3 
;other function.c,517 :: 		Z_Degree=360.0-Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       52
	MOVWF       R2 
	MOVLW       135
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        R1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        R2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        R3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,518 :: 		rad=Z_Degree;
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,519 :: 		degree=rad;
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _degree+0 
	MOVF        R1, 0 
	MOVWF       _degree+1 
;other function.c,520 :: 		dir=0x12;   //1------CCW  ,2=CW   ,0=NO Dirction,
	MOVLW       18
	MOVWF       _dir+0 
;other function.c,521 :: 		Z_DIR_CW();
	CALL        _Z_DIR_CW+0, 0
;other function.c,522 :: 		}
	GOTO        L_GET_DEGREE229
L_GET_DEGREE228:
;other function.c,523 :: 		else if (old_function==160||old_function==161||old_function==168||old_function==169||old_function==170)
	MOVF        _old_function+0, 0 
	XORLW       160
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE768
	MOVF        _old_function+0, 0 
	XORLW       161
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE768
	MOVF        _old_function+0, 0 
	XORLW       168
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE768
	MOVF        _old_function+0, 0 
	XORLW       169
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE768
	MOVF        _old_function+0, 0 
	XORLW       170
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE768
	GOTO        L_GET_DEGREE232
L__GET_DEGREE768:
;other function.c,525 :: 		old_function=function;
	MOVF        _function+0, 0 
	MOVWF       _old_function+0 
;other function.c,526 :: 		rad=Z_Degree-OLD_Z_Degree;
	MOVF        _OLD_Z_Degree+0, 0 
	MOVWF       R4 
	MOVF        _OLD_Z_Degree+1, 0 
	MOVWF       R5 
	MOVF        _OLD_Z_Degree+2, 0 
	MOVWF       R6 
	MOVF        _OLD_Z_Degree+3, 0 
	MOVWF       R7 
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,527 :: 		OLD_Z_Degree=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _OLD_Z_Degree+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _OLD_Z_Degree+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _OLD_Z_Degree+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _OLD_Z_Degree+3 
;other function.c,528 :: 		if (rad<=180.0)
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       52
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_GET_DEGREE233
;other function.c,530 :: 		Z_Degree=Z_Degree-270.0;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       7
	MOVWF       R6 
	MOVLW       135
	MOVWF       R7 
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        R1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        R2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        R3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,531 :: 		dir=0x41;
	MOVLW       65
	MOVWF       _dir+0 
;other function.c,532 :: 		Z_DIR_CCW();
	CALL        _Z_DIR_CCW+0, 0
;other function.c,533 :: 		}
	GOTO        L_GET_DEGREE234
L_GET_DEGREE233:
;other function.c,534 :: 		else if (rad>180.0)
	MOVF        _RAD+0, 0 
	MOVWF       R4 
	MOVF        _RAD+1, 0 
	MOVWF       R5 
	MOVF        _RAD+2, 0 
	MOVWF       R6 
	MOVF        _RAD+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       52
	MOVWF       R2 
	MOVLW       134
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_GET_DEGREE235
;other function.c,536 :: 		Z_Degree=360.0-Z_Degree;////////////
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       52
	MOVWF       R2 
	MOVLW       135
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        R1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        R2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        R3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,537 :: 		dir=0x12;
	MOVLW       18
	MOVWF       _dir+0 
;other function.c,538 :: 		Z_DIR_CW();
	CALL        _Z_DIR_CW+0, 0
;other function.c,539 :: 		}
L_GET_DEGREE235:
L_GET_DEGREE234:
;other function.c,540 :: 		rad=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _RAD+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _RAD+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _RAD+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _RAD+3 
;other function.c,541 :: 		degree=rad;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R3 
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _degree+0 
	MOVF        R1, 0 
	MOVWF       _degree+1 
;other function.c,542 :: 		}
	GOTO        L_GET_DEGREE236
L_GET_DEGREE232:
;other function.c,543 :: 		else if (old_function==192||old_function==193||old_function==200||old_function==201||old_function==202)
	MOVF        _old_function+0, 0 
	XORLW       192
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE767
	MOVF        _old_function+0, 0 
	XORLW       193
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE767
	MOVF        _old_function+0, 0 
	XORLW       200
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE767
	MOVF        _old_function+0, 0 
	XORLW       201
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE767
	MOVF        _old_function+0, 0 
	XORLW       202
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE767
	GOTO        L_GET_DEGREE239
L__GET_DEGREE767:
;other function.c,545 :: 		old_function=function;
	MOVF        _function+0, 0 
	MOVWF       _old_function+0 
;other function.c,546 :: 		if (OLD_Z_Degree>=Z_Degree)
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVF        _OLD_Z_Degree+0, 0 
	MOVWF       R0 
	MOVF        _OLD_Z_Degree+1, 0 
	MOVWF       R1 
	MOVF        _OLD_Z_Degree+2, 0 
	MOVWF       R2 
	MOVF        _OLD_Z_Degree+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       0
	BTFSC       STATUS+0, 0 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_GET_DEGREE240
;other function.c,548 :: 		rad=OLD_Z_Degree-Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVF        _OLD_Z_Degree+0, 0 
	MOVWF       R0 
	MOVF        _OLD_Z_Degree+1, 0 
	MOVWF       R1 
	MOVF        _OLD_Z_Degree+2, 0 
	MOVWF       R2 
	MOVF        _OLD_Z_Degree+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,549 :: 		OLD_Z_Degree=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _OLD_Z_Degree+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _OLD_Z_Degree+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _OLD_Z_Degree+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _OLD_Z_Degree+3 
;other function.c,550 :: 		dir=0x02;
	MOVLW       2
	MOVWF       _dir+0 
;other function.c,551 :: 		Z_DIR_CW();
	CALL        _Z_DIR_CW+0, 0
;other function.c,552 :: 		}
	GOTO        L_GET_DEGREE241
L_GET_DEGREE240:
;other function.c,553 :: 		else if(OLD_Z_Degree<Z_Degree)
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R4 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R5 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R6 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R7 
	MOVF        _OLD_Z_Degree+0, 0 
	MOVWF       R0 
	MOVF        _OLD_Z_Degree+1, 0 
	MOVWF       R1 
	MOVF        _OLD_Z_Degree+2, 0 
	MOVWF       R2 
	MOVF        _OLD_Z_Degree+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_GET_DEGREE242
;other function.c,555 :: 		rad=Z_Degree-OLD_Z_Degree;
	MOVF        _OLD_Z_Degree+0, 0 
	MOVWF       R4 
	MOVF        _OLD_Z_Degree+1, 0 
	MOVWF       R5 
	MOVF        _OLD_Z_Degree+2, 0 
	MOVWF       R6 
	MOVF        _OLD_Z_Degree+3, 0 
	MOVWF       R7 
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,556 :: 		OLD_Z_Degree=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _OLD_Z_Degree+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _OLD_Z_Degree+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _OLD_Z_Degree+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _OLD_Z_Degree+3 
;other function.c,557 :: 		dir=0x01;
	MOVLW       1
	MOVWF       _dir+0 
;other function.c,558 :: 		Z_DIR_CCW();
	CALL        _Z_DIR_CCW+0, 0
;other function.c,559 :: 		}
L_GET_DEGREE242:
L_GET_DEGREE241:
;other function.c,560 :: 		Z_Degree=rad;
	MOVF        _RAD+0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        _RAD+1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        _RAD+2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        _RAD+3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,561 :: 		rad=Z_Degree;
;other function.c,562 :: 		degree=rad;
	MOVF        _RAD+0, 0 
	MOVWF       R0 
	MOVF        _RAD+1, 0 
	MOVWF       R1 
	MOVF        _RAD+2, 0 
	MOVWF       R2 
	MOVF        _RAD+3, 0 
	MOVWF       R3 
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _degree+0 
	MOVF        R1, 0 
	MOVWF       _degree+1 
;other function.c,563 :: 		}
	GOTO        L_GET_DEGREE243
L_GET_DEGREE239:
;other function.c,564 :: 		else if (old_function==224||old_function==225||old_function==232||old_function==233||old_function==234)
	MOVF        _old_function+0, 0 
	XORLW       224
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE766
	MOVF        _old_function+0, 0 
	XORLW       225
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE766
	MOVF        _old_function+0, 0 
	XORLW       232
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE766
	MOVF        _old_function+0, 0 
	XORLW       233
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE766
	MOVF        _old_function+0, 0 
	XORLW       234
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DEGREE766
	GOTO        L_GET_DEGREE246
L__GET_DEGREE766:
;other function.c,566 :: 		old_function=function;
	MOVF        _function+0, 0 
	MOVWF       _old_function+0 
;other function.c,567 :: 		rad=Z_Degree-270.0;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       7
	MOVWF       R6 
	MOVLW       135
	MOVWF       R7 
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       R0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       R1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       R2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,568 :: 		OLD_Z_Degree=Z_Degree;
	MOVF        _Z_DEGREE+0, 0 
	MOVWF       _OLD_Z_Degree+0 
	MOVF        _Z_DEGREE+1, 0 
	MOVWF       _OLD_Z_Degree+1 
	MOVF        _Z_DEGREE+2, 0 
	MOVWF       _OLD_Z_Degree+2 
	MOVF        _Z_DEGREE+3, 0 
	MOVWF       _OLD_Z_Degree+3 
;other function.c,569 :: 		Z_Degree=rad;
	MOVF        R0, 0 
	MOVWF       _Z_DEGREE+0 
	MOVF        R1, 0 
	MOVWF       _Z_DEGREE+1 
	MOVF        R2, 0 
	MOVWF       _Z_DEGREE+2 
	MOVF        R3, 0 
	MOVWF       _Z_DEGREE+3 
;other function.c,570 :: 		rad=Z_Degree;
	MOVF        R0, 0 
	MOVWF       _RAD+0 
	MOVF        R1, 0 
	MOVWF       _RAD+1 
	MOVF        R2, 0 
	MOVWF       _RAD+2 
	MOVF        R3, 0 
	MOVWF       _RAD+3 
;other function.c,571 :: 		degree=rad;
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _degree+0 
	MOVF        R1, 0 
	MOVWF       _degree+1 
;other function.c,572 :: 		dir=0x41;   //1------CCW  ,2=CW   ,0=NO Dirction,
	MOVLW       65
	MOVWF       _dir+0 
;other function.c,573 :: 		Z_DIR_CCW();
	CALL        _Z_DIR_CCW+0, 0
;other function.c,574 :: 		}
L_GET_DEGREE246:
L_GET_DEGREE243:
L_GET_DEGREE236:
L_GET_DEGREE229:
;other function.c,575 :: 		}
L_GET_DEGREE225:
L_GET_DEGREE222:
L_GET_DEGREE197:
L_GET_DEGREE172:
;other function.c,576 :: 		function_id =function_chk(function_id);
	MOVF        GET_DEGREE_function_id_L0+0, 0 
	MOVWF       FARG_function_chk_function_id+0 
	CALL        _function_chk+0, 0
	MOVF        R0, 0 
	MOVWF       GET_DEGREE_function_id_L0+0 
;other function.c,577 :: 		return function_id;
;other function.c,578 :: 		}
L_end_GET_DEGREE:
	RETURN      0
; end of _GET_DEGREE

_writ_data:

;other function.c,583 :: 		void writ_data(unsigned long  wadd, unsigned char wdata)
;other function.c,585 :: 		rd_pin=rd_dis;
	BSF         PORTG+0, 3 
;other function.c,586 :: 		uart2_write(Lo(wadd));
	MOVF        FARG_writ_data_wadd+0, 0 
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,587 :: 		}
L_end_writ_data:
	RETURN      0
; end of _writ_data

_read_data:

;other function.c,590 :: 		unsigned short read_data(unsigned long wadd)
;other function.c,593 :: 		l_data_dir=0;
	CLRF        TRISD+0 
;other function.c,594 :: 		rd_pin=rd_dis;
	BSF         PORTG+0, 3 
;other function.c,595 :: 		wr_pin=wr_dis;
	BSF         PORTG+0, 4 
;other function.c,597 :: 		l_data=Lo(wadd);
	MOVF        FARG_read_data_wadd+0, 0 
	MOVWF       PORTD+0 
;other function.c,598 :: 		h_data=Hi(wadd);
	MOVF        FARG_read_data_wadd+1, 0 
	MOVWF       PORTH+0 
;other function.c,599 :: 		ale_pin=1;
	BSF         PORTG+0, 0 
;other function.c,600 :: 		ale_pin=0;
	BCF         PORTG+0, 0 
;other function.c,602 :: 		l_data_dir=255;
	MOVLW       255
	MOVWF       TRISD+0 
;other function.c,603 :: 		rd_pin=rd_en;
	BCF         PORTG+0, 3 
;other function.c,604 :: 		rdata=portd;
	MOVF        PORTD+0, 0 
	MOVWF       R1 
;other function.c,605 :: 		rd_pin=rd_dis;
	BSF         PORTG+0, 3 
;other function.c,606 :: 		return rdata;
	MOVF        R1, 0 
	MOVWF       R0 
;other function.c,607 :: 		}
L_end_read_data:
	RETURN      0
; end of _read_data

_GET_DATA:

;other function.c,611 :: 		void GET_DATA()
;other function.c,613 :: 		char function_name=0;
	CLRF        GET_DATA_function_name_L0+0 
;other function.c,615 :: 		if (f_r =='F')       ///------------------------------ FORWORD FUNCTION
	MOVF        _f_r+0, 0 
	XORLW       70
	BTFSS       STATUS+0, 2 
	GOTO        L_GET_DATA247
;other function.c,617 :: 		if (read_data(WADD)!=248)
	MOVF        _wadd+0, 0 
	MOVWF       FARG_read_data_wadd+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_read_data_wadd+1 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	XORLW       248
	BTFSC       STATUS+0, 2 
	GOTO        L_GET_DATA248
;other function.c,619 :: 		function=read_data(WADD);
	MOVF        _wadd+0, 0 
	MOVWF       FARG_read_data_wadd+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_read_data_wadd+1 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	MOVWF       _function+0 
;other function.c,620 :: 		function_name = function & 0xF0;
	MOVLW       240
	ANDWF       R0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       GET_DATA_function_name_L0+0 
;other function.c,623 :: 		if (function_name==0x80|| function_name==0xA0|| function_name==0xC0|| function_name==0xE0)
	MOVF        R1, 0 
	XORLW       128
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DATA791
	MOVF        GET_DATA_function_name_L0+0, 0 
	XORLW       160
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DATA791
	MOVF        GET_DATA_function_name_L0+0, 0 
	XORLW       192
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DATA791
	MOVF        GET_DATA_function_name_L0+0, 0 
	XORLW       224
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DATA791
	GOTO        L_GET_DATA251
L__GET_DATA791:
;other function.c,625 :: 		if (function_name==0x80)
	MOVF        GET_DATA_function_name_L0+0, 0 
	XORLW       128
	BTFSS       STATUS+0, 2 
	GOTO        L_GET_DATA252
;other function.c,629 :: 		X_Dir_N();
	CALL        _X_Dir_N+0, 0
;other function.c,630 :: 		Y_Dir_N();
	CALL        _Y_Dir_N+0, 0
;other function.c,631 :: 		}
	GOTO        L_GET_DATA253
L_GET_DATA252:
;other function.c,632 :: 		else if (function_name==0xA0)
	MOVF        GET_DATA_function_name_L0+0, 0 
	XORLW       160
	BTFSS       STATUS+0, 2 
	GOTO        L_GET_DATA254
;other function.c,636 :: 		X_Dir_P();
	CALL        _X_Dir_P+0, 0
;other function.c,637 :: 		Y_Dir_N();
	CALL        _Y_Dir_N+0, 0
;other function.c,638 :: 		}
	GOTO        L_GET_DATA255
L_GET_DATA254:
;other function.c,639 :: 		else  if (function_name==0xC0)
	MOVF        GET_DATA_function_name_L0+0, 0 
	XORLW       192
	BTFSS       STATUS+0, 2 
	GOTO        L_GET_DATA256
;other function.c,643 :: 		X_Dir_N();
	CALL        _X_Dir_N+0, 0
;other function.c,644 :: 		Y_Dir_P();
	CALL        _Y_Dir_P+0, 0
;other function.c,645 :: 		}
	GOTO        L_GET_DATA257
L_GET_DATA256:
;other function.c,646 :: 		else if (function_name==0xE0)
	MOVF        GET_DATA_function_name_L0+0, 0 
	XORLW       224
	BTFSS       STATUS+0, 2 
	GOTO        L_GET_DATA258
;other function.c,650 :: 		X_Dir_P();
	CALL        _X_Dir_P+0, 0
;other function.c,651 :: 		Y_Dir_P();
	CALL        _Y_Dir_P+0, 0
;other function.c,652 :: 		}
L_GET_DATA258:
L_GET_DATA257:
L_GET_DATA255:
L_GET_DATA253:
;other function.c,656 :: 		WADD++;
	INFSNZ      _wadd+0, 1 
	INCF        _wadd+1, 1 
;other function.c,657 :: 		Y_distance=read_data(WADD);
	MOVF        _wadd+0, 0 
	MOVWF       FARG_read_data_wadd+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_read_data_wadd+1 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	MOVWF       _Y_Distance+0 
	MOVLW       0
	MOVWF       _Y_Distance+1 
;other function.c,662 :: 		WADD++;
	INFSNZ      _wadd+0, 1 
	INCF        _wadd+1, 1 
;other function.c,663 :: 		X_distance=read_data(WADD);
	MOVF        _wadd+0, 0 
	MOVWF       FARG_read_data_wadd+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_read_data_wadd+1 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	MOVWF       _X_Distance+0 
	MOVLW       0
	MOVWF       _X_Distance+1 
;other function.c,666 :: 		WADD++;
	INFSNZ      _wadd+0, 1 
	INCF        _wadd+1, 1 
;other function.c,667 :: 		}
L_GET_DATA251:
;other function.c,668 :: 		}
	GOTO        L_GET_DATA259
L_GET_DATA248:
;other function.c,672 :: 		function=read_data(WADD);
	MOVF        _wadd+0, 0 
	MOVWF       FARG_read_data_wadd+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_read_data_wadd+1 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	MOVWF       _function+0 
;other function.c,674 :: 		}
L_GET_DATA259:
;other function.c,675 :: 		}
	GOTO        L_GET_DATA260
L_GET_DATA247:
;other function.c,677 :: 		else if (f_r=='R')
	MOVF        _f_r+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_GET_DATA261
;other function.c,679 :: 		if (WADD != 513 )
	MOVF        _wadd+1, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L__GET_DATA896
	MOVLW       1
	XORWF       _wadd+0, 0 
L__GET_DATA896:
	BTFSC       STATUS+0, 2 
	GOTO        L_GET_DATA262
;other function.c,681 :: 		if (f_r=='R')
	MOVF        _f_r+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_GET_DATA263
;other function.c,684 :: 		WADD--;
	MOVLW       1
	SUBWF       _wadd+0, 1 
	MOVLW       0
	SUBWFB      _wadd+1, 1 
;other function.c,685 :: 		X_distance=read_data(WADD);
	MOVF        _wadd+0, 0 
	MOVWF       FARG_read_data_wadd+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_read_data_wadd+1 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	MOVWF       _X_Distance+0 
	MOVLW       0
	MOVWF       _X_Distance+1 
;other function.c,686 :: 		}
L_GET_DATA263:
;other function.c,687 :: 		if (f_r=='R')
	MOVF        _f_r+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_GET_DATA264
;other function.c,690 :: 		WADD--;
	MOVLW       1
	SUBWF       _wadd+0, 1 
	MOVLW       0
	SUBWFB      _wadd+1, 1 
;other function.c,691 :: 		Y_distance=read_data(WADD);
	MOVF        _wadd+0, 0 
	MOVWF       FARG_read_data_wadd+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_read_data_wadd+1 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	MOVWF       _Y_Distance+0 
	MOVLW       0
	MOVWF       _Y_Distance+1 
;other function.c,692 :: 		}
L_GET_DATA264:
;other function.c,694 :: 		WADD--;
	MOVLW       1
	SUBWF       _wadd+0, 1 
	MOVLW       0
	SUBWFB      _wadd+1, 1 
;other function.c,695 :: 		if (read_data(WADD)!=248)
	MOVF        _wadd+0, 0 
	MOVWF       FARG_read_data_wadd+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_read_data_wadd+1 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	XORLW       248
	BTFSC       STATUS+0, 2 
	GOTO        L_GET_DATA265
;other function.c,697 :: 		function=read_data(WADD);
	MOVF        _wadd+0, 0 
	MOVWF       FARG_read_data_wadd+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_read_data_wadd+1 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	MOVWF       _function+0 
;other function.c,698 :: 		function_name = function & 0xF0;
	MOVLW       240
	ANDWF       R0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       GET_DATA_function_name_L0+0 
;other function.c,700 :: 		if (function_name==0x80|| function_name==0xA0|| function_name==0xC0|| function_name==0xE0)
	MOVF        R1, 0 
	XORLW       128
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DATA790
	MOVF        GET_DATA_function_name_L0+0, 0 
	XORLW       160
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DATA790
	MOVF        GET_DATA_function_name_L0+0, 0 
	XORLW       192
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DATA790
	MOVF        GET_DATA_function_name_L0+0, 0 
	XORLW       224
	BTFSC       STATUS+0, 2 
	GOTO        L__GET_DATA790
	GOTO        L_GET_DATA268
L__GET_DATA790:
;other function.c,702 :: 		if (function_name==0x80)
	MOVF        GET_DATA_function_name_L0+0, 0 
	XORLW       128
	BTFSS       STATUS+0, 2 
	GOTO        L_GET_DATA269
;other function.c,706 :: 		X_Dir_N();
	CALL        _X_Dir_N+0, 0
;other function.c,707 :: 		Y_Dir_N();
	CALL        _Y_Dir_N+0, 0
;other function.c,708 :: 		}
	GOTO        L_GET_DATA270
L_GET_DATA269:
;other function.c,709 :: 		else if (function_name==0xA0)
	MOVF        GET_DATA_function_name_L0+0, 0 
	XORLW       160
	BTFSS       STATUS+0, 2 
	GOTO        L_GET_DATA271
;other function.c,713 :: 		X_Dir_P();
	CALL        _X_Dir_P+0, 0
;other function.c,714 :: 		Y_Dir_N();
	CALL        _Y_Dir_N+0, 0
;other function.c,715 :: 		}
	GOTO        L_GET_DATA272
L_GET_DATA271:
;other function.c,716 :: 		else  if (function_name==0xC0)
	MOVF        GET_DATA_function_name_L0+0, 0 
	XORLW       192
	BTFSS       STATUS+0, 2 
	GOTO        L_GET_DATA273
;other function.c,720 :: 		X_Dir_N();
	CALL        _X_Dir_N+0, 0
;other function.c,721 :: 		Y_Dir_P();
	CALL        _Y_Dir_P+0, 0
;other function.c,722 :: 		}
	GOTO        L_GET_DATA274
L_GET_DATA273:
;other function.c,723 :: 		else if (function_name==0xE0)
	MOVF        GET_DATA_function_name_L0+0, 0 
	XORLW       224
	BTFSS       STATUS+0, 2 
	GOTO        L_GET_DATA275
;other function.c,727 :: 		X_Dir_P();
	CALL        _X_Dir_P+0, 0
;other function.c,728 :: 		Y_Dir_P();
	CALL        _Y_Dir_P+0, 0
;other function.c,729 :: 		}
L_GET_DATA275:
L_GET_DATA274:
L_GET_DATA272:
L_GET_DATA270:
;other function.c,730 :: 		}
L_GET_DATA268:
;other function.c,731 :: 		}
L_GET_DATA265:
;other function.c,732 :: 		}
	GOTO        L_GET_DATA276
L_GET_DATA262:
;other function.c,735 :: 		function=read_data(WADD);
	MOVF        _wadd+0, 0 
	MOVWF       FARG_read_data_wadd+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_read_data_wadd+1 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	MOVWF       _function+0 
;other function.c,737 :: 		}
L_GET_DATA276:
;other function.c,738 :: 		}
L_GET_DATA261:
L_GET_DATA260:
;other function.c,796 :: 		}
L_end_GET_DATA:
	RETURN      0
; end of _GET_DATA

_Saving_data:

;other function.c,798 :: 		void Saving_data()
;other function.c,801 :: 		unsigned int  uncount=0;
;other function.c,803 :: 		WADD=513;
	MOVLW       1
	MOVWF       _wadd+0 
	MOVLW       2
	MOVWF       _wadd+1 
;other function.c,805 :: 		storing_data = UART2_Read();
	CALL        _UART2_Read+0, 0
	MOVF        R0, 0 
	MOVWF       Saving_data_storing_data_L0+0 
;other function.c,806 :: 		storing_data = UART2_Read();
	CALL        _UART2_Read+0, 0
	MOVF        R0, 0 
	MOVWF       Saving_data_storing_data_L0+0 
;other function.c,807 :: 		cls();
	CALL        _cls+0, 0
;other function.c,808 :: 		lcd_out(2,32-4,CopyConst2Ram(MSG,back));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _back+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_back+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_back+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       28
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;other function.c,809 :: 		lcd_out(1,1,CopyConst2Ram(MSG,TXT_11)); //press okay on pc
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _TXT_11+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_TXT_11+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_TXT_11+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;other function.c,811 :: 		for(;;)
L_Saving_data277:
;other function.c,813 :: 		if(UART2_Data_Ready())
	CALL        _UART2_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Saving_data280
;other function.c,815 :: 		storing_data = UART2_Read();
	CALL        _UART2_Read+0, 0
	MOVF        R0, 0 
	MOVWF       Saving_data_storing_data_L0+0 
;other function.c,828 :: 		if (storing_data==248)
	MOVF        R0, 0 
	XORLW       248
	BTFSS       STATUS+0, 2 
	GOTO        L_Saving_data281
;other function.c,830 :: 		UART2_Write(storing_data);
	MOVF        Saving_data_storing_data_L0+0, 0 
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,832 :: 		CLS();
	CALL        _cls+0, 0
;other function.c,833 :: 		LCD_OUT(1,1,CopyConst2Ram(MSG,TXT_12));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _TXT_12+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_TXT_12+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_TXT_12+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;other function.c,834 :: 		DELAY_MS(1000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_Saving_data282:
	DECFSZ      R13, 1, 1
	BRA         L_Saving_data282
	DECFSZ      R12, 1, 1
	BRA         L_Saving_data282
	DECFSZ      R11, 1, 1
	BRA         L_Saving_data282
	NOP
	NOP
;other function.c,835 :: 		break;
	GOTO        L_Saving_data278
;other function.c,836 :: 		}
L_Saving_data281:
;other function.c,837 :: 		}
L_Saving_data280:
;other function.c,838 :: 		}
	GOTO        L_Saving_data277
L_Saving_data278:
;other function.c,839 :: 		while(1)
L_Saving_data283:
;other function.c,841 :: 		if(UART2_Data_Ready())
	CALL        _UART2_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Saving_data285
;other function.c,843 :: 		_data_[0] = UART2_Read();
	CALL        _UART2_Read+0, 0
	MOVF        R0, 0 
	MOVWF       Saving_data__data__L0+0 
;other function.c,844 :: 		break;
	GOTO        L_Saving_data284
;other function.c,845 :: 		}
L_Saving_data285:
;other function.c,846 :: 		}
	GOTO        L_Saving_data283
L_Saving_data284:
;other function.c,848 :: 		while(1)
L_Saving_data286:
;other function.c,850 :: 		if(UART2_Data_Ready())
	CALL        _UART2_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Saving_data288
;other function.c,852 :: 		_data_[1] = UART2_Read();
	CALL        _UART2_Read+0, 0
	MOVF        R0, 0 
	MOVWF       Saving_data__data__L0+1 
;other function.c,853 :: 		break;
	GOTO        L_Saving_data287
;other function.c,854 :: 		}
L_Saving_data288:
;other function.c,855 :: 		}
	GOTO        L_Saving_data286
L_Saving_data287:
;other function.c,857 :: 		while(1)
L_Saving_data289:
;other function.c,859 :: 		if(UART2_Data_Ready())
	CALL        _UART2_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Saving_data291
;other function.c,861 :: 		_data_[2] = UART2_Read();
	CALL        _UART2_Read+0, 0
	MOVF        R0, 0 
	MOVWF       Saving_data__data__L0+2 
;other function.c,862 :: 		break;
	GOTO        L_Saving_data290
;other function.c,863 :: 		}
L_Saving_data291:
;other function.c,864 :: 		}
	GOTO        L_Saving_data289
L_Saving_data290:
;other function.c,866 :: 		while(1)
L_Saving_data292:
;other function.c,868 :: 		if(UART2_Data_Ready())
	CALL        _UART2_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Saving_data294
;other function.c,870 :: 		_data_[3] = UART2_Read();
	CALL        _UART2_Read+0, 0
	MOVF        R0, 0 
	MOVWF       Saving_data__data__L0+3 
;other function.c,871 :: 		break;
	GOTO        L_Saving_data293
;other function.c,872 :: 		}
L_Saving_data294:
;other function.c,873 :: 		}
	GOTO        L_Saving_data292
L_Saving_data293:
;other function.c,875 :: 		while(1)
L_Saving_data295:
;other function.c,877 :: 		if(UART2_Data_Ready())
	CALL        _UART2_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Saving_data297
;other function.c,879 :: 		storing_data = UART2_Read();
	CALL        _UART2_Read+0, 0
	MOVF        R0, 0 
	MOVWF       Saving_data_storing_data_L0+0 
;other function.c,880 :: 		if (storing_data == 'C')
	MOVF        R0, 0 
	XORLW       67
	BTFSS       STATUS+0, 2 
	GOTO        L_Saving_data298
;other function.c,881 :: 		break;
	GOTO        L_Saving_data296
L_Saving_data298:
;other function.c,882 :: 		}
L_Saving_data297:
;other function.c,883 :: 		}
	GOTO        L_Saving_data295
L_Saving_data296:
;other function.c,885 :: 		Lo(wadd)=_data_[0];
	MOVF        Saving_data__data__L0+0, 0 
	MOVWF       _wadd+0 
;other function.c,886 :: 		Hi(wadd)=_data_[1];
	MOVF        Saving_data__data__L0+1, 0 
	MOVWF       _wadd+1 
;other function.c,887 :: 		Higher(wadd)=_data_[2];
	MOVF        Saving_data__data__L0+2, 0 
	MOVWF       _wadd+2 
;other function.c,888 :: 		Highest(wadd)=_data_[3];
	MOVF        Saving_data__data__L0+3, 0 
	MOVWF       _wadd+3 
;other function.c,894 :: 		}
L_end_Saving_data:
	RETURN      0
; end of _Saving_data

_saving_main:

;other function.c,901 :: 		void saving_main()
;other function.c,904 :: 		if (READ_DATA(5)!='C')
	MOVLW       5
	MOVWF       FARG_read_data_wadd+0 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+1 
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	XORLW       67
	BTFSC       STATUS+0, 2 
	GOTO        L_saving_main299
;other function.c,906 :: 		make_file:
___saving_main_make_file:
;other function.c,907 :: 		CLS();
	CALL        _cls+0, 0
;other function.c,908 :: 		LCD_OUT(1,1,CopyConst2Ram(MSG,TXT_13));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _TXT_13+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_TXT_13+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_TXT_13+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;other function.c,909 :: 		while(ok_button()==1);
L_saving_main300:
	CALL        _OK_button+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_saving_main301
	GOTO        L_saving_main300
L_saving_main301:
;other function.c,910 :: 		writ_data(5,'C');
	MOVLW       5
	MOVWF       FARG_writ_data_wadd+0 
	MOVLW       0
	MOVWF       FARG_writ_data_wadd+1 
	MOVWF       FARG_writ_data_wadd+2 
	MOVWF       FARG_writ_data_wadd+3 
	MOVLW       67
	MOVWF       FARG_writ_data_wdata+0 
	CALL        _writ_data+0, 0
;other function.c,911 :: 		writ_data(11,'1');
	MOVLW       11
	MOVWF       FARG_writ_data_wadd+0 
	MOVLW       0
	MOVWF       FARG_writ_data_wadd+1 
	MOVWF       FARG_writ_data_wadd+2 
	MOVWF       FARG_writ_data_wadd+3 
	MOVLW       49
	MOVWF       FARG_writ_data_wdata+0 
	CALL        _writ_data+0, 0
;other function.c,912 :: 		writ_data(12,'Y');
	MOVLW       12
	MOVWF       FARG_writ_data_wadd+0 
	MOVLW       0
	MOVWF       FARG_writ_data_wadd+1 
	MOVWF       FARG_writ_data_wadd+2 
	MOVWF       FARG_writ_data_wadd+3 
	MOVLW       89
	MOVWF       FARG_writ_data_wdata+0 
	CALL        _writ_data+0, 0
;other function.c,913 :: 		UART2_Write('W');
	MOVLW       87
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,914 :: 		while(1)
L_saving_main302:
;other function.c,916 :: 		if(UART2_Data_Ready())
	CALL        _UART2_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_saving_main304
;other function.c,918 :: 		_data_ = UART2_Read();
	CALL        _UART2_Read+0, 0
;other function.c,919 :: 		if (_data_ == 'W')
	MOVF        R0, 0 
	XORLW       87
	BTFSS       STATUS+0, 2 
	GOTO        L_saving_main305
;other function.c,921 :: 		cls();
	CALL        _cls+0, 0
;other function.c,922 :: 		LCD_OUT(1,1,CopyConst2Ram(MSG,TXT_22));     //SAVE START
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _TXT_22+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_TXT_22+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_TXT_22+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;other function.c,923 :: 		DELAY_MS(1000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_saving_main306:
	DECFSZ      R13, 1, 1
	BRA         L_saving_main306
	DECFSZ      R12, 1, 1
	BRA         L_saving_main306
	DECFSZ      R11, 1, 1
	BRA         L_saving_main306
	NOP
	NOP
;other function.c,924 :: 		break;
	GOTO        L_saving_main303
;other function.c,925 :: 		}
L_saving_main305:
;other function.c,926 :: 		}
L_saving_main304:
;other function.c,927 :: 		}
	GOTO        L_saving_main302
L_saving_main303:
;other function.c,932 :: 		CLS();
	CALL        _cls+0, 0
;other function.c,933 :: 		LCD_OUT(1,1,CopyConst2Ram(MSG,TXT_10));     //SAVE START
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _TXT_10+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_TXT_10+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_TXT_10+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;other function.c,935 :: 		Saving_data();                              //SAVING DATA
	CALL        _Saving_data+0, 0
;other function.c,936 :: 		WADD-=513;
	MOVLW       1
	SUBWF       _wadd+0, 0 
	MOVWF       R0 
	MOVLW       2
	SUBWFB      _wadd+1, 0 
	MOVWF       R1 
	MOVF        R0, 0 
	MOVWF       _wadd+0 
	MOVF        R1, 0 
	MOVWF       _wadd+1 
;other function.c,937 :: 		WADD/=3.0;
	CALL        _word2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       64
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _wadd+0 
	MOVF        R1, 0 
	MOVWF       _wadd+1 
;other function.c,938 :: 		writ_data(31,Lo(WADD));
	MOVLW       31
	MOVWF       FARG_writ_data_wadd+0 
	MOVLW       0
	MOVWF       FARG_writ_data_wadd+1 
	MOVWF       FARG_writ_data_wadd+2 
	MOVWF       FARG_writ_data_wadd+3 
	MOVF        _wadd+0, 0 
	MOVWF       FARG_writ_data_wdata+0 
	CALL        _writ_data+0, 0
;other function.c,939 :: 		writ_data(32,Hi(WADD));
	MOVLW       32
	MOVWF       FARG_writ_data_wadd+0 
	MOVLW       0
	MOVWF       FARG_writ_data_wadd+1 
	MOVWF       FARG_writ_data_wadd+2 
	MOVWF       FARG_writ_data_wadd+3 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_writ_data_wdata+0 
	CALL        _writ_data+0, 0
;other function.c,940 :: 		cls();
	CALL        _cls+0, 0
;other function.c,941 :: 		INTtostr(wadd,text11);
	MOVF        _wadd+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _text11+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;other function.c,942 :: 		LCD_OUT(1,1,TEXT11);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _text11+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;other function.c,943 :: 		lcd_out_CP(CopyConst2Ram(MSG,TXT_9));      //STICH SAVED
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _TXT_9+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_TXT_9+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_TXT_9+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_CP_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_CP_text+1 
	CALL        _Lcd_Out_CP+0, 0
;other function.c,944 :: 		while(ok_button()==1);
L_saving_main307:
	CALL        _OK_button+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_saving_main308
	GOTO        L_saving_main307
L_saving_main308:
;other function.c,945 :: 		}
	GOTO        L_saving_main309
L_saving_main299:
;other function.c,948 :: 		CLS();
	CALL        _cls+0, 0
;other function.c,949 :: 		LCD_OUT(1,1,CopyConst2Ram(MSG,TXT_14));  //FILE FOUNDED
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _TXT_14+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_TXT_14+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_TXT_14+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;other function.c,950 :: 		LCD_OUT(2,1,CopyConst2Ram(MSG,TXT_17));  //NAME OF FILE
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _TXT_17+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_TXT_17+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_TXT_17+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;other function.c,951 :: 		lcd_chr_CP(READ_DATA(11));                // 1
	MOVLW       11
	MOVWF       FARG_read_data_wadd+0 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+1 
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;other function.c,952 :: 		LCD_OUT(1,17,CopyConst2Ram(MSG,TXT_19));  //SAVE TO DEL  // wasat data
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _TXT_19+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_TXT_19+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_TXT_19+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       17
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;other function.c,954 :: 		LCD_OUT(2,32-3,CopyConst2Ram(MSG,del));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _del+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_del+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_del+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       29
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;other function.c,955 :: 		while(ok_button()==1)
L_saving_main310:
	CALL        _OK_button+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_saving_main311
;other function.c,957 :: 		if (back_button()==0)
	CALL        _back_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_saving_main312
;other function.c,959 :: 		writ_data(5,'D');
	MOVLW       5
	MOVWF       FARG_writ_data_wadd+0 
	MOVLW       0
	MOVWF       FARG_writ_data_wadd+1 
	MOVWF       FARG_writ_data_wadd+2 
	MOVWF       FARG_writ_data_wadd+3 
	MOVLW       68
	MOVWF       FARG_writ_data_wdata+0 
	CALL        _writ_data+0, 0
;other function.c,960 :: 		LCD_OUT(2,17,CopyConst2Ram(MSG,TXT_18));  //DELET FILE
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _TXT_18+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_TXT_18+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_TXT_18+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       17
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;other function.c,961 :: 		goto make_file  ;
	GOTO        ___saving_main_make_file
;other function.c,962 :: 		}
L_saving_main312:
;other function.c,963 :: 		}
	GOTO        L_saving_main310
L_saving_main311:
;other function.c,964 :: 		CLS();
	CALL        _cls+0, 0
;other function.c,965 :: 		}
L_saving_main309:
;other function.c,966 :: 		}
L_end_saving_main:
	RETURN      0
; end of _saving_main

_SN_1_CHK:

;other function.c,969 :: 		void SN_1_CHK()
;other function.c,971 :: 		for(i=0;i<STEP_Z_MOTOR;i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_SN_1_CHK313:
	MOVLW       0
	SUBWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SN_1_CHK900
	MOVLW       100
	SUBWF       _i+0, 0 
L__SN_1_CHK900:
	BTFSC       STATUS+0, 0 
	GOTO        L_SN_1_CHK314
;other function.c,973 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,974 :: 		DELAY_uS( delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_1_CHK316:
	DECFSZ      R13, 1, 1
	BRA         L_SN_1_CHK316
	DECFSZ      R12, 1, 1
	BRA         L_SN_1_CHK316
	NOP
	NOP
;other function.c,975 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,976 :: 		DELAY_uS( delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_1_CHK317:
	DECFSZ      R13, 1, 1
	BRA         L_SN_1_CHK317
	DECFSZ      R12, 1, 1
	BRA         L_SN_1_CHK317
	NOP
	NOP
;other function.c,971 :: 		for(i=0;i<STEP_Z_MOTOR;i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;other function.c,977 :: 		}
	GOTO        L_SN_1_CHK313
L_SN_1_CHK314:
;other function.c,978 :: 		if (SN_1==0)
	BTFSC       PORTE+0, 5 
	GOTO        L_SN_1_CHK318
;other function.c,980 :: 		UART2_Write_Text("SN_1 OK");
	MOVLW       ?lstr5_RPM_32STEPPER+0
	MOVWF       FARG_UART2_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr5_RPM_32STEPPER+0)
	MOVWF       FARG_UART2_Write_Text_uart_text+1 
	CALL        _UART2_Write_Text+0, 0
;other function.c,981 :: 		UART2_Write(10);
	MOVLW       10
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,982 :: 		UART2_Write(13);
	MOVLW       13
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,983 :: 		}
	GOTO        L_SN_1_CHK319
L_SN_1_CHK318:
;other function.c,986 :: 		UART2_Write_Text("SN_1 FAIL");lcd_out(2,1,"1");
	MOVLW       ?lstr6_RPM_32STEPPER+0
	MOVWF       FARG_UART2_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr6_RPM_32STEPPER+0)
	MOVWF       FARG_UART2_Write_Text_uart_text+1 
	CALL        _UART2_Write_Text+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr7_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr7_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;other function.c,987 :: 		UART2_Write(10);
	MOVLW       10
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,988 :: 		UART2_Write(13);
	MOVLW       13
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,989 :: 		while(right_button()==1);
L_SN_1_CHK320:
	CALL        _right_button+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SN_1_CHK321
	GOTO        L_SN_1_CHK320
L_SN_1_CHK321:
;other function.c,990 :: 		}
L_SN_1_CHK319:
;other function.c,991 :: 		}
L_end_SN_1_CHK:
	RETURN      0
; end of _SN_1_CHK

_SN_2_CHK:

;other function.c,993 :: 		void SN_2_CHK()
;other function.c,995 :: 		for(i=0;i<STEP_Z_MOTOR;i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_SN_2_CHK322:
	MOVLW       0
	SUBWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SN_2_CHK902
	MOVLW       100
	SUBWF       _i+0, 0 
L__SN_2_CHK902:
	BTFSC       STATUS+0, 0 
	GOTO        L_SN_2_CHK323
;other function.c,997 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,998 :: 		DELAY_uS( delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_2_CHK325:
	DECFSZ      R13, 1, 1
	BRA         L_SN_2_CHK325
	DECFSZ      R12, 1, 1
	BRA         L_SN_2_CHK325
	NOP
	NOP
;other function.c,999 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1000 :: 		DELAY_uS( delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_2_CHK326:
	DECFSZ      R13, 1, 1
	BRA         L_SN_2_CHK326
	DECFSZ      R12, 1, 1
	BRA         L_SN_2_CHK326
	NOP
	NOP
;other function.c,995 :: 		for(i=0;i<STEP_Z_MOTOR;i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;other function.c,1001 :: 		}
	GOTO        L_SN_2_CHK322
L_SN_2_CHK323:
;other function.c,1002 :: 		if (SN_2==0)
	BTFSC       PORTE+0, 4 
	GOTO        L_SN_2_CHK327
;other function.c,1004 :: 		UART2_Write_Text("SN_2 OK");
	MOVLW       ?lstr8_RPM_32STEPPER+0
	MOVWF       FARG_UART2_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr8_RPM_32STEPPER+0)
	MOVWF       FARG_UART2_Write_Text_uart_text+1 
	CALL        _UART2_Write_Text+0, 0
;other function.c,1005 :: 		UART2_Write(10);
	MOVLW       10
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,1006 :: 		UART2_Write(13);
	MOVLW       13
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,1007 :: 		}
	GOTO        L_SN_2_CHK328
L_SN_2_CHK327:
;other function.c,1010 :: 		UART2_Write_Text("SN_2 FAIL");lcd_out(2,1,"2");
	MOVLW       ?lstr9_RPM_32STEPPER+0
	MOVWF       FARG_UART2_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr9_RPM_32STEPPER+0)
	MOVWF       FARG_UART2_Write_Text_uart_text+1 
	CALL        _UART2_Write_Text+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr10_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr10_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;other function.c,1011 :: 		UART2_Write(10);
	MOVLW       10
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,1012 :: 		UART2_Write(13);
	MOVLW       13
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,1013 :: 		while(up_button()==1);
L_SN_2_CHK329:
	CALL        _up_button+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SN_2_CHK330
	GOTO        L_SN_2_CHK329
L_SN_2_CHK330:
;other function.c,1014 :: 		}
L_SN_2_CHK328:
;other function.c,1015 :: 		}
L_end_SN_2_CHK:
	RETURN      0
; end of _SN_2_CHK

_SN_3_CHK:

;other function.c,1017 :: 		void SN_3_CHK()
;other function.c,1019 :: 		for(i=0;i<STEP_Z_MOTOR;i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_SN_3_CHK331:
	MOVLW       0
	SUBWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SN_3_CHK904
	MOVLW       100
	SUBWF       _i+0, 0 
L__SN_3_CHK904:
	BTFSC       STATUS+0, 0 
	GOTO        L_SN_3_CHK332
;other function.c,1021 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1022 :: 		DELAY_uS( delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_3_CHK334:
	DECFSZ      R13, 1, 1
	BRA         L_SN_3_CHK334
	DECFSZ      R12, 1, 1
	BRA         L_SN_3_CHK334
	NOP
	NOP
;other function.c,1023 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1024 :: 		DELAY_uS( delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_3_CHK335:
	DECFSZ      R13, 1, 1
	BRA         L_SN_3_CHK335
	DECFSZ      R12, 1, 1
	BRA         L_SN_3_CHK335
	NOP
	NOP
;other function.c,1019 :: 		for(i=0;i<STEP_Z_MOTOR;i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;other function.c,1025 :: 		}
	GOTO        L_SN_3_CHK331
L_SN_3_CHK332:
;other function.c,1026 :: 		if (SN_3==0)
	BTFSC       PORTE+0, 3 
	GOTO        L_SN_3_CHK336
;other function.c,1028 :: 		UART2_Write_Text("SN_3 OK");
	MOVLW       ?lstr11_RPM_32STEPPER+0
	MOVWF       FARG_UART2_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr11_RPM_32STEPPER+0)
	MOVWF       FARG_UART2_Write_Text_uart_text+1 
	CALL        _UART2_Write_Text+0, 0
;other function.c,1029 :: 		UART2_Write(10);
	MOVLW       10
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,1030 :: 		UART2_Write(13);
	MOVLW       13
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,1031 :: 		}
	GOTO        L_SN_3_CHK337
L_SN_3_CHK336:
;other function.c,1034 :: 		UART2_Write_Text("SN_3 FAIL");lcd_out(2,1,"3");
	MOVLW       ?lstr12_RPM_32STEPPER+0
	MOVWF       FARG_UART2_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr12_RPM_32STEPPER+0)
	MOVWF       FARG_UART2_Write_Text_uart_text+1 
	CALL        _UART2_Write_Text+0, 0
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr13_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr13_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;other function.c,1035 :: 		UART2_Write(10);
	MOVLW       10
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,1036 :: 		UART2_Write(13);
	MOVLW       13
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,1037 :: 		while(left_button()==1);
L_SN_3_CHK338:
	CALL        _left_button+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SN_3_CHK339
	GOTO        L_SN_3_CHK338
L_SN_3_CHK339:
;other function.c,1038 :: 		}
L_SN_3_CHK337:
;other function.c,1039 :: 		}
L_end_SN_3_CHK:
	RETURN      0
; end of _SN_3_CHK

_SN_4_CHK:

;other function.c,1041 :: 		void SN_4_CHK()
;other function.c,1043 :: 		for(i=0;i<STEP_Z_MOTOR;i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_SN_4_CHK340:
	MOVLW       0
	SUBWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SN_4_CHK906
	MOVLW       100
	SUBWF       _i+0, 0 
L__SN_4_CHK906:
	BTFSC       STATUS+0, 0 
	GOTO        L_SN_4_CHK341
;other function.c,1045 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1046 :: 		DELAY_uS( delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_4_CHK343:
	DECFSZ      R13, 1, 1
	BRA         L_SN_4_CHK343
	DECFSZ      R12, 1, 1
	BRA         L_SN_4_CHK343
	NOP
	NOP
;other function.c,1047 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1048 :: 		DELAY_uS( delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_4_CHK344:
	DECFSZ      R13, 1, 1
	BRA         L_SN_4_CHK344
	DECFSZ      R12, 1, 1
	BRA         L_SN_4_CHK344
	NOP
	NOP
;other function.c,1043 :: 		for(i=0;i<STEP_Z_MOTOR;i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;other function.c,1049 :: 		}
	GOTO        L_SN_4_CHK340
L_SN_4_CHK341:
;other function.c,1050 :: 		if (SN_4==0)
	BTFSC       PORTE+0, 2 
	GOTO        L_SN_4_CHK345
;other function.c,1052 :: 		UART2_Write_Text("SN_4 OK");
	MOVLW       ?lstr14_RPM_32STEPPER+0
	MOVWF       FARG_UART2_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr14_RPM_32STEPPER+0)
	MOVWF       FARG_UART2_Write_Text_uart_text+1 
	CALL        _UART2_Write_Text+0, 0
;other function.c,1053 :: 		UART2_Write(10);
	MOVLW       10
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,1054 :: 		UART2_Write(13);
	MOVLW       13
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,1055 :: 		}
	GOTO        L_SN_4_CHK346
L_SN_4_CHK345:
;other function.c,1058 :: 		UART2_Write_Text("SN_4 FAIL");
	MOVLW       ?lstr15_RPM_32STEPPER+0
	MOVWF       FARG_UART2_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr15_RPM_32STEPPER+0)
	MOVWF       FARG_UART2_Write_Text_uart_text+1 
	CALL        _UART2_Write_Text+0, 0
;other function.c,1059 :: 		lcd_out(2,1,"4");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr16_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr16_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;other function.c,1060 :: 		UART2_Write(10);
	MOVLW       10
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,1061 :: 		UART2_Write(13);
	MOVLW       13
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,1062 :: 		while(down_button()==1);
L_SN_4_CHK347:
	CALL        _down_button+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SN_4_CHK348
	GOTO        L_SN_4_CHK347
L_SN_4_CHK348:
;other function.c,1063 :: 		}
L_SN_4_CHK346:
;other function.c,1064 :: 		}
L_end_SN_4_CHK:
	RETURN      0
; end of _SN_4_CHK

_CHK_ALL_90_DEGREE:

;other function.c,1067 :: 		void CHK_ALL_90_DEGREE()
;other function.c,1069 :: 		UART2_Init(baud_rate);
	MOVLW       64
	MOVWF       SPBRG2+0 
	BCF         TXSTA2+0, 2, 0
	CALL        _UART2_Init+0, 0
;other function.c,1070 :: 		UART2_Write(10);
	MOVLW       10
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,1071 :: 		UART2_Write(13);
	MOVLW       13
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,1072 :: 		Z_DIR_CCW();
	CALL        _Z_DIR_CCW+0, 0
;other function.c,1073 :: 		EN_MAIN=1;
	BSF         LATE+0, 0 
;other function.c,1074 :: 		delay_ms(500);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_CHK_ALL_90_DEGREE349:
	DECFSZ      R13, 1, 1
	BRA         L_CHK_ALL_90_DEGREE349
	DECFSZ      R12, 1, 1
	BRA         L_CHK_ALL_90_DEGREE349
	DECFSZ      R11, 1, 1
	BRA         L_CHK_ALL_90_DEGREE349
	NOP
;other function.c,1075 :: 		while (1)
L_CHK_ALL_90_DEGREE350:
;other function.c,1077 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1078 :: 		DELAY_uS( delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_CHK_ALL_90_DEGREE352:
	DECFSZ      R13, 1, 1
	BRA         L_CHK_ALL_90_DEGREE352
	DECFSZ      R12, 1, 1
	BRA         L_CHK_ALL_90_DEGREE352
	NOP
	NOP
;other function.c,1079 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1080 :: 		DELAY_uS( delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_CHK_ALL_90_DEGREE353:
	DECFSZ      R13, 1, 1
	BRA         L_CHK_ALL_90_DEGREE353
	DECFSZ      R12, 1, 1
	BRA         L_CHK_ALL_90_DEGREE353
	NOP
	NOP
;other function.c,1081 :: 		if (SN_1==0)
	BTFSC       PORTE+0, 5 
	GOTO        L_CHK_ALL_90_DEGREE354
;other function.c,1083 :: 		UART2_Write_Text("SN_1 OK");
	MOVLW       ?lstr17_RPM_32STEPPER+0
	MOVWF       FARG_UART2_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr17_RPM_32STEPPER+0)
	MOVWF       FARG_UART2_Write_Text_uart_text+1 
	CALL        _UART2_Write_Text+0, 0
;other function.c,1084 :: 		UART2_Write(10);
	MOVLW       10
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,1085 :: 		UART2_Write(13);
	MOVLW       13
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;other function.c,1086 :: 		break;
	GOTO        L_CHK_ALL_90_DEGREE351
;other function.c,1087 :: 		}
L_CHK_ALL_90_DEGREE354:
;other function.c,1088 :: 		}
	GOTO        L_CHK_ALL_90_DEGREE350
L_CHK_ALL_90_DEGREE351:
;other function.c,1089 :: 		SN_2_CHK();
	CALL        _SN_2_CHK+0, 0
;other function.c,1090 :: 		SN_3_CHK();
	CALL        _SN_3_CHK+0, 0
;other function.c,1091 :: 		SN_4_CHK();
	CALL        _SN_4_CHK+0, 0
;other function.c,1092 :: 		SN_1_CHK();
	CALL        _SN_1_CHK+0, 0
;other function.c,1093 :: 		SN_2_CHK();
	CALL        _SN_2_CHK+0, 0
;other function.c,1094 :: 		SN_3_CHK();
	CALL        _SN_3_CHK+0, 0
;other function.c,1095 :: 		SN_4_CHK();
	CALL        _SN_4_CHK+0, 0
;other function.c,1096 :: 		lcd_out(2,1," ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr18_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr18_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;other function.c,1097 :: 		Z_DIR_CW();
	CALL        _Z_DIR_CW+0, 0
;other function.c,1098 :: 		SN_3_CHK();
	CALL        _SN_3_CHK+0, 0
;other function.c,1099 :: 		SN_2_CHK();
	CALL        _SN_2_CHK+0, 0
;other function.c,1100 :: 		SN_1_CHK();
	CALL        _SN_1_CHK+0, 0
;other function.c,1101 :: 		SN_4_CHK();
	CALL        _SN_4_CHK+0, 0
;other function.c,1102 :: 		lcd_out(2,1," ");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr19_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr19_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;other function.c,1103 :: 		for (extra_6=0;extra_6<3;extra_6++)
	CLRF        _extra_6+0 
L_CHK_ALL_90_DEGREE355:
	MOVLW       3
	SUBWF       _extra_6+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_CHK_ALL_90_DEGREE356
;other function.c,1105 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1106 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_CHK_ALL_90_DEGREE358:
	DECFSZ      R13, 1, 1
	BRA         L_CHK_ALL_90_DEGREE358
	DECFSZ      R12, 1, 1
	BRA         L_CHK_ALL_90_DEGREE358
	NOP
	NOP
;other function.c,1107 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1108 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_CHK_ALL_90_DEGREE359:
	DECFSZ      R13, 1, 1
	BRA         L_CHK_ALL_90_DEGREE359
	DECFSZ      R12, 1, 1
	BRA         L_CHK_ALL_90_DEGREE359
	NOP
	NOP
;other function.c,1103 :: 		for (extra_6=0;extra_6<3;extra_6++)
	INCF        _extra_6+0, 1 
;other function.c,1109 :: 		}
	GOTO        L_CHK_ALL_90_DEGREE355
L_CHK_ALL_90_DEGREE356:
;other function.c,1110 :: 		while(ok_button()==1);
L_CHK_ALL_90_DEGREE360:
	CALL        _OK_button+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_CHK_ALL_90_DEGREE361
	GOTO        L_CHK_ALL_90_DEGREE360
L_CHK_ALL_90_DEGREE361:
;other function.c,1111 :: 		}
L_end_CHK_ALL_90_DEGREE:
	RETURN      0
; end of _CHK_ALL_90_DEGREE

_SN_1_REACHED:

;other function.c,1113 :: 		void SN_1_REACHED()
;other function.c,1115 :: 		char pre_direction=0;
	CLRF        SN_1_REACHED_pre_direction_L0+0 
;other function.c,1116 :: 		if (f_r_main == 'F')
	MOVF        _f_r_main+0, 0 
	XORLW       70
	BTFSS       STATUS+0, 2 
	GOTO        L_SN_1_REACHED362
;other function.c,1118 :: 		pre_direction=Dir_Z;
	MOVLW       0
	BTFSC       LATF+0, 4 
	MOVLW       1
	MOVWF       SN_1_REACHED_pre_direction_L0+0 
;other function.c,1119 :: 		while(SN_1==1)
L_SN_1_REACHED363:
	BTFSS       PORTE+0, 5 
	GOTO        L_SN_1_REACHED364
;other function.c,1121 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1122 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_1_REACHED365:
	DECFSZ      R13, 1, 1
	BRA         L_SN_1_REACHED365
	DECFSZ      R12, 1, 1
	BRA         L_SN_1_REACHED365
	NOP
	NOP
;other function.c,1123 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1124 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_1_REACHED366:
	DECFSZ      R13, 1, 1
	BRA         L_SN_1_REACHED366
	DECFSZ      R12, 1, 1
	BRA         L_SN_1_REACHED366
	NOP
	NOP
;other function.c,1125 :: 		if (SN_2==1)
	BTFSS       PORTE+0, 4 
	GOTO        L_SN_1_REACHED367
;other function.c,1127 :: 		Dir_Z=~Dir_Z;
	BTG         LATF+0, 4 
;other function.c,1128 :: 		while(SN_1==1)
L_SN_1_REACHED368:
	BTFSS       PORTE+0, 5 
	GOTO        L_SN_1_REACHED369
;other function.c,1130 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1131 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_1_REACHED370:
	DECFSZ      R13, 1, 1
	BRA         L_SN_1_REACHED370
	DECFSZ      R12, 1, 1
	BRA         L_SN_1_REACHED370
	NOP
	NOP
;other function.c,1132 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1133 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_1_REACHED371:
	DECFSZ      R13, 1, 1
	BRA         L_SN_1_REACHED371
	DECFSZ      R12, 1, 1
	BRA         L_SN_1_REACHED371
	NOP
	NOP
;other function.c,1134 :: 		}
	GOTO        L_SN_1_REACHED368
L_SN_1_REACHED369:
;other function.c,1135 :: 		}
	GOTO        L_SN_1_REACHED372
L_SN_1_REACHED367:
;other function.c,1136 :: 		else if (SN_4==1)
	BTFSS       PORTE+0, 2 
	GOTO        L_SN_1_REACHED373
;other function.c,1138 :: 		Dir_Z=~Dir_Z;
	BTG         LATF+0, 4 
;other function.c,1139 :: 		while(SN_1==1)
L_SN_1_REACHED374:
	BTFSS       PORTE+0, 5 
	GOTO        L_SN_1_REACHED375
;other function.c,1141 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1142 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_1_REACHED376:
	DECFSZ      R13, 1, 1
	BRA         L_SN_1_REACHED376
	DECFSZ      R12, 1, 1
	BRA         L_SN_1_REACHED376
	NOP
	NOP
;other function.c,1143 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1144 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_1_REACHED377:
	DECFSZ      R13, 1, 1
	BRA         L_SN_1_REACHED377
	DECFSZ      R12, 1, 1
	BRA         L_SN_1_REACHED377
	NOP
	NOP
;other function.c,1145 :: 		}
	GOTO        L_SN_1_REACHED374
L_SN_1_REACHED375:
;other function.c,1146 :: 		}
L_SN_1_REACHED373:
L_SN_1_REACHED372:
;other function.c,1148 :: 		}
	GOTO        L_SN_1_REACHED363
L_SN_1_REACHED364:
;other function.c,1149 :: 		Dir_Z=pre_direction;
	BTFSC       SN_1_REACHED_pre_direction_L0+0, 0 
	GOTO        L__SN_1_REACHED909
	BCF         LATF+0, 4 
	GOTO        L__SN_1_REACHED910
L__SN_1_REACHED909:
	BSF         LATF+0, 4 
L__SN_1_REACHED910:
;other function.c,1159 :: 		}
	GOTO        L_SN_1_REACHED378
L_SN_1_REACHED362:
;other function.c,1161 :: 		else if (f_r_main == 'R')
	MOVF        _f_r_main+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_SN_1_REACHED379
;other function.c,1164 :: 		while(SN_3 ==1)
L_SN_1_REACHED380:
	BTFSS       PORTE+0, 3 
	GOTO        L_SN_1_REACHED381
;other function.c,1166 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1167 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_1_REACHED382:
	DECFSZ      R13, 1, 1
	BRA         L_SN_1_REACHED382
	DECFSZ      R12, 1, 1
	BRA         L_SN_1_REACHED382
	NOP
	NOP
;other function.c,1168 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1169 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_1_REACHED383:
	DECFSZ      R13, 1, 1
	BRA         L_SN_1_REACHED383
	DECFSZ      R12, 1, 1
	BRA         L_SN_1_REACHED383
	NOP
	NOP
;other function.c,1170 :: 		}
	GOTO        L_SN_1_REACHED380
L_SN_1_REACHED381:
;other function.c,1179 :: 		}
L_SN_1_REACHED379:
L_SN_1_REACHED378:
;other function.c,1181 :: 		}
L_end_SN_1_REACHED:
	RETURN      0
; end of _SN_1_REACHED

_SN_2_REACHED:

;other function.c,1183 :: 		void SN_2_REACHED()
;other function.c,1186 :: 		if (f_r_main == 'F')
	MOVF        _f_r_main+0, 0 
	XORLW       70
	BTFSS       STATUS+0, 2 
	GOTO        L_SN_2_REACHED384
;other function.c,1188 :: 		pre_direction=Dir_Z;
	MOVLW       0
	BTFSC       LATF+0, 4 
	MOVLW       1
	MOVWF       R1 
	CLRF        R2 
;other function.c,1189 :: 		while(SN_2==1)
L_SN_2_REACHED385:
	BTFSS       PORTE+0, 4 
	GOTO        L_SN_2_REACHED386
;other function.c,1191 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1192 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_2_REACHED387:
	DECFSZ      R13, 1, 1
	BRA         L_SN_2_REACHED387
	DECFSZ      R12, 1, 1
	BRA         L_SN_2_REACHED387
	NOP
	NOP
;other function.c,1193 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1194 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_2_REACHED388:
	DECFSZ      R13, 1, 1
	BRA         L_SN_2_REACHED388
	DECFSZ      R12, 1, 1
	BRA         L_SN_2_REACHED388
	NOP
	NOP
;other function.c,1195 :: 		if (SN_1==1)
	BTFSS       PORTE+0, 5 
	GOTO        L_SN_2_REACHED389
;other function.c,1197 :: 		Dir_Z=~Dir_Z;
	BTG         LATF+0, 4 
;other function.c,1198 :: 		while(SN_2==1)
L_SN_2_REACHED390:
	BTFSS       PORTE+0, 4 
	GOTO        L_SN_2_REACHED391
;other function.c,1200 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1201 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_2_REACHED392:
	DECFSZ      R13, 1, 1
	BRA         L_SN_2_REACHED392
	DECFSZ      R12, 1, 1
	BRA         L_SN_2_REACHED392
	NOP
	NOP
;other function.c,1202 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1203 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_2_REACHED393:
	DECFSZ      R13, 1, 1
	BRA         L_SN_2_REACHED393
	DECFSZ      R12, 1, 1
	BRA         L_SN_2_REACHED393
	NOP
	NOP
;other function.c,1204 :: 		}
	GOTO        L_SN_2_REACHED390
L_SN_2_REACHED391:
;other function.c,1205 :: 		}
	GOTO        L_SN_2_REACHED394
L_SN_2_REACHED389:
;other function.c,1206 :: 		else if (SN_3==1)
	BTFSS       PORTE+0, 3 
	GOTO        L_SN_2_REACHED395
;other function.c,1208 :: 		Dir_Z=~Dir_Z;
	BTG         LATF+0, 4 
;other function.c,1209 :: 		while(SN_2==1)
L_SN_2_REACHED396:
	BTFSS       PORTE+0, 4 
	GOTO        L_SN_2_REACHED397
;other function.c,1211 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1212 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_2_REACHED398:
	DECFSZ      R13, 1, 1
	BRA         L_SN_2_REACHED398
	DECFSZ      R12, 1, 1
	BRA         L_SN_2_REACHED398
	NOP
	NOP
;other function.c,1213 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1214 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_2_REACHED399:
	DECFSZ      R13, 1, 1
	BRA         L_SN_2_REACHED399
	DECFSZ      R12, 1, 1
	BRA         L_SN_2_REACHED399
	NOP
	NOP
;other function.c,1215 :: 		}
	GOTO        L_SN_2_REACHED396
L_SN_2_REACHED397:
;other function.c,1216 :: 		}
L_SN_2_REACHED395:
L_SN_2_REACHED394:
;other function.c,1217 :: 		}
	GOTO        L_SN_2_REACHED385
L_SN_2_REACHED386:
;other function.c,1218 :: 		Dir_Z=pre_direction;
	BTFSC       R1, 0 
	GOTO        L__SN_2_REACHED912
	BCF         LATF+0, 4 
	GOTO        L__SN_2_REACHED913
L__SN_2_REACHED912:
	BSF         LATF+0, 4 
L__SN_2_REACHED913:
;other function.c,1227 :: 		}
	GOTO        L_SN_2_REACHED400
L_SN_2_REACHED384:
;other function.c,1229 :: 		else  if (f_r_main == 'R')
	MOVF        _f_r_main+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_SN_2_REACHED401
;other function.c,1232 :: 		while(SN_4 ==1)
L_SN_2_REACHED402:
	BTFSS       PORTE+0, 2 
	GOTO        L_SN_2_REACHED403
;other function.c,1234 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1235 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_2_REACHED404:
	DECFSZ      R13, 1, 1
	BRA         L_SN_2_REACHED404
	DECFSZ      R12, 1, 1
	BRA         L_SN_2_REACHED404
	NOP
	NOP
;other function.c,1236 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1237 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_2_REACHED405:
	DECFSZ      R13, 1, 1
	BRA         L_SN_2_REACHED405
	DECFSZ      R12, 1, 1
	BRA         L_SN_2_REACHED405
	NOP
	NOP
;other function.c,1238 :: 		}
	GOTO        L_SN_2_REACHED402
L_SN_2_REACHED403:
;other function.c,1247 :: 		}
L_SN_2_REACHED401:
L_SN_2_REACHED400:
;other function.c,1249 :: 		}
L_end_SN_2_REACHED:
	RETURN      0
; end of _SN_2_REACHED

_SN_3_REACHED:

;other function.c,1251 :: 		void SN_3_REACHED()
;other function.c,1254 :: 		if (f_r_main == 'F')
	MOVF        _f_r_main+0, 0 
	XORLW       70
	BTFSS       STATUS+0, 2 
	GOTO        L_SN_3_REACHED406
;other function.c,1256 :: 		pre_direction=Dir_Z;
	MOVLW       0
	BTFSC       LATF+0, 4 
	MOVLW       1
	MOVWF       R1 
	CLRF        R2 
;other function.c,1257 :: 		while(SN_3==1)
L_SN_3_REACHED407:
	BTFSS       PORTE+0, 3 
	GOTO        L_SN_3_REACHED408
;other function.c,1259 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1260 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_3_REACHED409:
	DECFSZ      R13, 1, 1
	BRA         L_SN_3_REACHED409
	DECFSZ      R12, 1, 1
	BRA         L_SN_3_REACHED409
	NOP
	NOP
;other function.c,1261 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1262 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_3_REACHED410:
	DECFSZ      R13, 1, 1
	BRA         L_SN_3_REACHED410
	DECFSZ      R12, 1, 1
	BRA         L_SN_3_REACHED410
	NOP
	NOP
;other function.c,1263 :: 		if (SN_2==1)
	BTFSS       PORTE+0, 4 
	GOTO        L_SN_3_REACHED411
;other function.c,1265 :: 		Dir_Z=~Dir_Z;
	BTG         LATF+0, 4 
;other function.c,1266 :: 		while(SN_3==1)
L_SN_3_REACHED412:
	BTFSS       PORTE+0, 3 
	GOTO        L_SN_3_REACHED413
;other function.c,1268 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1269 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_3_REACHED414:
	DECFSZ      R13, 1, 1
	BRA         L_SN_3_REACHED414
	DECFSZ      R12, 1, 1
	BRA         L_SN_3_REACHED414
	NOP
	NOP
;other function.c,1270 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1271 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_3_REACHED415:
	DECFSZ      R13, 1, 1
	BRA         L_SN_3_REACHED415
	DECFSZ      R12, 1, 1
	BRA         L_SN_3_REACHED415
	NOP
	NOP
;other function.c,1272 :: 		}
	GOTO        L_SN_3_REACHED412
L_SN_3_REACHED413:
;other function.c,1273 :: 		}
	GOTO        L_SN_3_REACHED416
L_SN_3_REACHED411:
;other function.c,1274 :: 		else if (SN_4==1)
	BTFSS       PORTE+0, 2 
	GOTO        L_SN_3_REACHED417
;other function.c,1276 :: 		Dir_Z=~Dir_Z;
	BTG         LATF+0, 4 
;other function.c,1277 :: 		while(SN_3==1)
L_SN_3_REACHED418:
	BTFSS       PORTE+0, 3 
	GOTO        L_SN_3_REACHED419
;other function.c,1279 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1280 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_3_REACHED420:
	DECFSZ      R13, 1, 1
	BRA         L_SN_3_REACHED420
	DECFSZ      R12, 1, 1
	BRA         L_SN_3_REACHED420
	NOP
	NOP
;other function.c,1281 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1282 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_3_REACHED421:
	DECFSZ      R13, 1, 1
	BRA         L_SN_3_REACHED421
	DECFSZ      R12, 1, 1
	BRA         L_SN_3_REACHED421
	NOP
	NOP
;other function.c,1283 :: 		}
	GOTO        L_SN_3_REACHED418
L_SN_3_REACHED419:
;other function.c,1284 :: 		}
L_SN_3_REACHED417:
L_SN_3_REACHED416:
;other function.c,1285 :: 		}
	GOTO        L_SN_3_REACHED407
L_SN_3_REACHED408:
;other function.c,1286 :: 		Dir_Z=pre_direction;
	BTFSC       R1, 0 
	GOTO        L__SN_3_REACHED915
	BCF         LATF+0, 4 
	GOTO        L__SN_3_REACHED916
L__SN_3_REACHED915:
	BSF         LATF+0, 4 
L__SN_3_REACHED916:
;other function.c,1295 :: 		}
	GOTO        L_SN_3_REACHED422
L_SN_3_REACHED406:
;other function.c,1297 :: 		else if (f_r_main == 'R')
	MOVF        _f_r_main+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_SN_3_REACHED423
;other function.c,1300 :: 		while(SN_1==1)
L_SN_3_REACHED424:
	BTFSS       PORTE+0, 5 
	GOTO        L_SN_3_REACHED425
;other function.c,1302 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1303 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_3_REACHED426:
	DECFSZ      R13, 1, 1
	BRA         L_SN_3_REACHED426
	DECFSZ      R12, 1, 1
	BRA         L_SN_3_REACHED426
	NOP
	NOP
;other function.c,1304 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1305 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_3_REACHED427:
	DECFSZ      R13, 1, 1
	BRA         L_SN_3_REACHED427
	DECFSZ      R12, 1, 1
	BRA         L_SN_3_REACHED427
	NOP
	NOP
;other function.c,1306 :: 		}
	GOTO        L_SN_3_REACHED424
L_SN_3_REACHED425:
;other function.c,1315 :: 		}
L_SN_3_REACHED423:
L_SN_3_REACHED422:
;other function.c,1317 :: 		}
L_end_SN_3_REACHED:
	RETURN      0
; end of _SN_3_REACHED

_SN_4_REACHED:

;other function.c,1319 :: 		void SN_4_REACHED()
;other function.c,1322 :: 		if (f_r_main =='F')
	MOVF        _f_r_main+0, 0 
	XORLW       70
	BTFSS       STATUS+0, 2 
	GOTO        L_SN_4_REACHED428
;other function.c,1324 :: 		pre_direction=Dir_Z;
	MOVLW       0
	BTFSC       LATF+0, 4 
	MOVLW       1
	MOVWF       R1 
	CLRF        R2 
;other function.c,1325 :: 		while(SN_4==1)
L_SN_4_REACHED429:
	BTFSS       PORTE+0, 2 
	GOTO        L_SN_4_REACHED430
;other function.c,1327 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1328 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_4_REACHED431:
	DECFSZ      R13, 1, 1
	BRA         L_SN_4_REACHED431
	DECFSZ      R12, 1, 1
	BRA         L_SN_4_REACHED431
	NOP
	NOP
;other function.c,1329 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1330 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_4_REACHED432:
	DECFSZ      R13, 1, 1
	BRA         L_SN_4_REACHED432
	DECFSZ      R12, 1, 1
	BRA         L_SN_4_REACHED432
	NOP
	NOP
;other function.c,1332 :: 		if (SN_1==1)
	BTFSS       PORTE+0, 5 
	GOTO        L_SN_4_REACHED433
;other function.c,1334 :: 		Dir_Z=~Dir_Z;
	BTG         LATF+0, 4 
;other function.c,1335 :: 		while(SN_4==1)
L_SN_4_REACHED434:
	BTFSS       PORTE+0, 2 
	GOTO        L_SN_4_REACHED435
;other function.c,1337 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1338 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_4_REACHED436:
	DECFSZ      R13, 1, 1
	BRA         L_SN_4_REACHED436
	DECFSZ      R12, 1, 1
	BRA         L_SN_4_REACHED436
	NOP
	NOP
;other function.c,1339 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1340 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_4_REACHED437:
	DECFSZ      R13, 1, 1
	BRA         L_SN_4_REACHED437
	DECFSZ      R12, 1, 1
	BRA         L_SN_4_REACHED437
	NOP
	NOP
;other function.c,1341 :: 		}
	GOTO        L_SN_4_REACHED434
L_SN_4_REACHED435:
;other function.c,1342 :: 		}
	GOTO        L_SN_4_REACHED438
L_SN_4_REACHED433:
;other function.c,1343 :: 		else if (SN_3==1)
	BTFSS       PORTE+0, 3 
	GOTO        L_SN_4_REACHED439
;other function.c,1345 :: 		Dir_Z=~Dir_Z;
	BTG         LATF+0, 4 
;other function.c,1346 :: 		while(SN_4==1)
L_SN_4_REACHED440:
	BTFSS       PORTE+0, 2 
	GOTO        L_SN_4_REACHED441
;other function.c,1348 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1349 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_4_REACHED442:
	DECFSZ      R13, 1, 1
	BRA         L_SN_4_REACHED442
	DECFSZ      R12, 1, 1
	BRA         L_SN_4_REACHED442
	NOP
	NOP
;other function.c,1350 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1351 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_4_REACHED443:
	DECFSZ      R13, 1, 1
	BRA         L_SN_4_REACHED443
	DECFSZ      R12, 1, 1
	BRA         L_SN_4_REACHED443
	NOP
	NOP
;other function.c,1352 :: 		}
	GOTO        L_SN_4_REACHED440
L_SN_4_REACHED441:
;other function.c,1353 :: 		}
L_SN_4_REACHED439:
L_SN_4_REACHED438:
;other function.c,1355 :: 		}
	GOTO        L_SN_4_REACHED429
L_SN_4_REACHED430:
;other function.c,1356 :: 		Dir_Z=pre_direction;
	BTFSC       R1, 0 
	GOTO        L__SN_4_REACHED918
	BCF         LATF+0, 4 
	GOTO        L__SN_4_REACHED919
L__SN_4_REACHED918:
	BSF         LATF+0, 4 
L__SN_4_REACHED919:
;other function.c,1365 :: 		}
	GOTO        L_SN_4_REACHED444
L_SN_4_REACHED428:
;other function.c,1367 :: 		else if (f_r_main =='R')
	MOVF        _f_r_main+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_SN_4_REACHED445
;other function.c,1370 :: 		while(SN_2==1)
L_SN_4_REACHED446:
	BTFSS       PORTE+0, 4 
	GOTO        L_SN_4_REACHED447
;other function.c,1372 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1373 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_4_REACHED448:
	DECFSZ      R13, 1, 1
	BRA         L_SN_4_REACHED448
	DECFSZ      R12, 1, 1
	BRA         L_SN_4_REACHED448
	NOP
	NOP
;other function.c,1374 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1375 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_4_REACHED449:
	DECFSZ      R13, 1, 1
	BRA         L_SN_4_REACHED449
	DECFSZ      R12, 1, 1
	BRA         L_SN_4_REACHED449
	NOP
	NOP
;other function.c,1376 :: 		}
	GOTO        L_SN_4_REACHED446
L_SN_4_REACHED447:
;other function.c,1385 :: 		}
L_SN_4_REACHED445:
L_SN_4_REACHED444:
;other function.c,1386 :: 		}
L_end_SN_4_REACHED:
	RETURN      0
; end of _SN_4_REACHED

_SN_5_REACHED:

;other function.c,1388 :: 		void SN_5_REACHED()
;other function.c,1390 :: 		char direction_save=0;
	CLRF        SN_5_REACHED_direction_save_L0+0 
	CLRF        SN_5_REACHED_clock_save_L0+0 
	CLRF        SN_5_REACHED_clock_save_L0+1 
;other function.c,1392 :: 		back_display();
	CALL        _back_display+0, 0
;other function.c,1393 :: 		direction_save=Dir_Z;
	MOVLW       0
	BTFSC       LATF+0, 4 
	MOVLW       1
	MOVWF       SN_5_REACHED_direction_save_L0+0 
;other function.c,1394 :: 		Z_DIR_CCW();
	CALL        _Z_DIR_CCW+0, 0
;other function.c,1395 :: 		if (SN_5==1)
	BTFSS       PORTE+0, 6 
	GOTO        L_SN_5_REACHED450
;other function.c,1397 :: 		while(SN_5==1)
L_SN_5_REACHED451:
	BTFSS       PORTE+0, 6 
	GOTO        L_SN_5_REACHED452
;other function.c,1399 :: 		clock_save++;
	INFSNZ      SN_5_REACHED_clock_save_L0+0, 1 
	INCF        SN_5_REACHED_clock_save_L0+1, 1 
;other function.c,1400 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1401 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_5_REACHED453:
	DECFSZ      R13, 1, 1
	BRA         L_SN_5_REACHED453
	DECFSZ      R12, 1, 1
	BRA         L_SN_5_REACHED453
	NOP
	NOP
;other function.c,1402 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1403 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_5_REACHED454:
	DECFSZ      R13, 1, 1
	BRA         L_SN_5_REACHED454
	DECFSZ      R12, 1, 1
	BRA         L_SN_5_REACHED454
	NOP
	NOP
;other function.c,1404 :: 		}
	GOTO        L_SN_5_REACHED451
L_SN_5_REACHED452:
;other function.c,1405 :: 		}
L_SN_5_REACHED450:
;other function.c,1406 :: 		while(ok_button()==0);
L_SN_5_REACHED455:
	CALL        _OK_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_SN_5_REACHED456
	GOTO        L_SN_5_REACHED455
L_SN_5_REACHED456:
;other function.c,1407 :: 		while(ok_button()==1);
L_SN_5_REACHED457:
	CALL        _OK_button+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SN_5_REACHED458
	GOTO        L_SN_5_REACHED457
L_SN_5_REACHED458:
;other function.c,1408 :: 		while(ok_button()==0);
L_SN_5_REACHED459:
	CALL        _OK_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_SN_5_REACHED460
	GOTO        L_SN_5_REACHED459
L_SN_5_REACHED460:
;other function.c,1410 :: 		Z_DIR_CW();
	CALL        _Z_DIR_CW+0, 0
;other function.c,1411 :: 		for(;clock_save>0;clock_save--)
L_SN_5_REACHED461:
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       SN_5_REACHED_clock_save_L0+1, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__SN_5_REACHED921
	MOVF        SN_5_REACHED_clock_save_L0+0, 0 
	SUBLW       0
L__SN_5_REACHED921:
	BTFSC       STATUS+0, 0 
	GOTO        L_SN_5_REACHED462
;other function.c,1413 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;other function.c,1414 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_5_REACHED464:
	DECFSZ      R13, 1, 1
	BRA         L_SN_5_REACHED464
	DECFSZ      R12, 1, 1
	BRA         L_SN_5_REACHED464
	NOP
	NOP
;other function.c,1415 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;other function.c,1416 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_SN_5_REACHED465:
	DECFSZ      R13, 1, 1
	BRA         L_SN_5_REACHED465
	DECFSZ      R12, 1, 1
	BRA         L_SN_5_REACHED465
	NOP
	NOP
;other function.c,1411 :: 		for(;clock_save>0;clock_save--)
	MOVLW       1
	SUBWF       SN_5_REACHED_clock_save_L0+0, 1 
	MOVLW       0
	SUBWFB      SN_5_REACHED_clock_save_L0+1, 1 
;other function.c,1417 :: 		}
	GOTO        L_SN_5_REACHED461
L_SN_5_REACHED462:
;other function.c,1420 :: 		Dir_Z=direction_save;
	BTFSC       SN_5_REACHED_direction_save_L0+0, 0 
	GOTO        L__SN_5_REACHED922
	BCF         LATF+0, 4 
	GOTO        L__SN_5_REACHED923
L__SN_5_REACHED922:
	BSF         LATF+0, 4 
L__SN_5_REACHED923:
;other function.c,1421 :: 		}
L_end_SN_5_REACHED:
	RETURN      0
; end of _SN_5_REACHED

_SET_POSITION:

;other function.c,1424 :: 		void SET_POSITION()
;other function.c,1427 :: 		Dir_SET_POSITION=dir;
	MOVF        _dir+0, 0 
	MOVWF       SET_POSITION_Dir_SET_POSITION_L0+0 
;other function.c,1429 :: 		Dir_SET_POSITION  =Dir_SET_POSITION >> 4;
	MOVF        _dir+0, 0 
	MOVWF       R1 
	RRCF        R1, 1 
	BCF         R1, 7 
	RRCF        R1, 1 
	BCF         R1, 7 
	RRCF        R1, 1 
	BCF         R1, 7 
	RRCF        R1, 1 
	BCF         R1, 7 
	MOVF        R1, 0 
	MOVWF       SET_POSITION_Dir_SET_POSITION_L0+0 
;other function.c,1430 :: 		if (Dir_SET_POSITION==1)
	MOVF        R1, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_SET_POSITION466
;other function.c,1432 :: 		SN_1_REACHED();
	CALL        _SN_1_REACHED+0, 0
;other function.c,1433 :: 		}
	GOTO        L_SET_POSITION467
L_SET_POSITION466:
;other function.c,1434 :: 		else if (Dir_SET_POSITION==2)
	MOVF        SET_POSITION_Dir_SET_POSITION_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_SET_POSITION468
;other function.c,1436 :: 		SN_2_REACHED();
	CALL        _SN_2_REACHED+0, 0
;other function.c,1437 :: 		}
	GOTO        L_SET_POSITION469
L_SET_POSITION468:
;other function.c,1438 :: 		else if (Dir_SET_POSITION==3)
	MOVF        SET_POSITION_Dir_SET_POSITION_L0+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_SET_POSITION470
;other function.c,1440 :: 		SN_3_REACHED();
	CALL        _SN_3_REACHED+0, 0
;other function.c,1441 :: 		}
	GOTO        L_SET_POSITION471
L_SET_POSITION470:
;other function.c,1442 :: 		else if (Dir_SET_POSITION==4)
	MOVF        SET_POSITION_Dir_SET_POSITION_L0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_SET_POSITION472
;other function.c,1444 :: 		SN_4_REACHED();
	CALL        _SN_4_REACHED+0, 0
;other function.c,1445 :: 		}
L_SET_POSITION472:
L_SET_POSITION471:
L_SET_POSITION469:
L_SET_POSITION467:
;other function.c,1446 :: 		}
L_end_SET_POSITION:
	RETURN      0
; end of _SET_POSITION

_indecator:

;other function.c,1447 :: 		void indecator(unsigned char RUPT)
;other function.c,1450 :: 		ru=rupt;
	MOVF        FARG_indecator_RUPT+0, 0 
	MOVWF       R2 
;other function.c,1452 :: 		for(ind=0;ind<ru;ind++)
	CLRF        R1 
L_indecator473:
	MOVF        R2, 0 
	SUBWF       R1, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_indecator474
;other function.c,1454 :: 		delay_ms(300);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_indecator476:
	DECFSZ      R13, 1, 1
	BRA         L_indecator476
	DECFSZ      R12, 1, 1
	BRA         L_indecator476
	DECFSZ      R11, 1, 1
	BRA         L_indecator476
	NOP
	NOP
;other function.c,1455 :: 		portb.b7=0;
	BCF         PORTB+0, 7 
;other function.c,1456 :: 		delay_ms(300);
	MOVLW       16
	MOVWF       R11, 0
	MOVLW       57
	MOVWF       R12, 0
	MOVLW       13
	MOVWF       R13, 0
L_indecator477:
	DECFSZ      R13, 1, 1
	BRA         L_indecator477
	DECFSZ      R12, 1, 1
	BRA         L_indecator477
	DECFSZ      R11, 1, 1
	BRA         L_indecator477
	NOP
	NOP
;other function.c,1457 :: 		portb.b7=1;
	BSF         PORTB+0, 7 
;other function.c,1452 :: 		for(ind=0;ind<ru;ind++)
	INCF        R1, 1 
;other function.c,1458 :: 		}
	GOTO        L_indecator473
L_indecator474:
;other function.c,1459 :: 		}
L_end_indecator:
	RETURN      0
; end of _indecator

_Running:

;other function.c,1464 :: 		void Running()
;other function.c,1491 :: 		XX=X_distance;        //initialation of steps to rotat     x
	MOVF        _X_Distance+0, 0 
	MOVWF       _XX+0 
	MOVF        _X_Distance+1, 0 
	MOVWF       _XX+1 
;other function.c,1492 :: 		YY=Y_distance;       //initialation of steps to rotat     y
	MOVF        _Y_Distance+0, 0 
	MOVWF       _YY+0 
	MOVF        _Y_Distance+1, 0 
	MOVWF       _YY+1 
;other function.c,1493 :: 		ZZ=Degree/0.9;        //initialation of steps to rotat     z
	MOVF        _degree+0, 0 
	MOVWF       R0 
	MOVF        _degree+1, 0 
	MOVWF       R1 
	CALL        _word2double+0, 0
	MOVLW       102
	MOVWF       R4 
	MOVLW       102
	MOVWF       R5 
	MOVLW       102
	MOVWF       R6 
	MOVLW       126
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	CALL        _double2word+0, 0
	MOVF        R0, 0 
	MOVWF       _ZZ+0 
	MOVF        R1, 0 
	MOVWF       _ZZ+1 
;other function.c,1494 :: 		x_complite=0;y_complite=0;z_complite=0;
	CLRF        _x_complite+0 
	CLRF        _y_complite+0 
	CLRF        _z_complite+0 
;other function.c,1495 :: 		monitor_1=0;
	CLRF        _monitor_1+0 
;other function.c,1496 :: 		RPM_SET(Timer_0);
	CLRF        FARG_RPM_set_Timer_Name+0 
	CALL        _RPM_set+0, 0
;other function.c,1497 :: 		RPM_SET(Timer_1);
	MOVLW       1
	MOVWF       FARG_RPM_set_Timer_Name+0 
	CALL        _RPM_set+0, 0
;other function.c,1498 :: 		if (X_RPM!=0.0)
	MOVF        _X_RPM+0, 0 
	MOVWF       R0 
	MOVF        _X_RPM+1, 0 
	MOVWF       R1 
	MOVF        _X_RPM+2, 0 
	MOVWF       R2 
	MOVF        _X_RPM+3, 0 
	MOVWF       R3 
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	CALL        _Equals_Double+0, 0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Running478
;other function.c,1500 :: 		Timer0_ON();
	CALL        _Timer0_ON+0, 0
;other function.c,1501 :: 		}
	GOTO        L_Running479
L_Running478:
;other function.c,1502 :: 		else x_complite=1;
	MOVLW       1
	MOVWF       _x_complite+0 
L_Running479:
;other function.c,1504 :: 		if (Y_RPM!=0.0)
	MOVF        _y_RPM+0, 0 
	MOVWF       R0 
	MOVF        _y_RPM+1, 0 
	MOVWF       R1 
	MOVF        _y_RPM+2, 0 
	MOVWF       R2 
	MOVF        _y_RPM+3, 0 
	MOVWF       R3 
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	CALL        _Equals_Double+0, 0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Running480
;other function.c,1506 :: 		Timer1_ON();
	CALL        _Timer1_ON+0, 0
;other function.c,1507 :: 		}
	GOTO        L_Running481
L_Running480:
;other function.c,1508 :: 		else y_complite=1;
	MOVLW       1
	MOVWF       _y_complite+0 
L_Running481:
;other function.c,1510 :: 		SET_POSITION();
	CALL        _SET_POSITION+0, 0
;other function.c,1511 :: 		RPM_SET(Timer_3);
	MOVLW       3
	MOVWF       FARG_RPM_set_Timer_Name+0 
	CALL        _RPM_set+0, 0
;other function.c,1512 :: 		if (Z_RPM!=0.0)
	MOVF        _Z_RPM+0, 0 
	MOVWF       R0 
	MOVF        _Z_RPM+1, 0 
	MOVWF       R1 
	MOVF        _Z_RPM+2, 0 
	MOVWF       R2 
	MOVF        _Z_RPM+3, 0 
	MOVWF       R3 
	CLRF        R4 
	CLRF        R5 
	CLRF        R6 
	CLRF        R7 
	CALL        _Equals_Double+0, 0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Running482
;other function.c,1514 :: 		Timer3_ON();
	CALL        _timer3_on+0, 0
;other function.c,1515 :: 		}
	GOTO        L_Running483
L_Running482:
;other function.c,1516 :: 		else z_complite=1;
	MOVLW       1
	MOVWF       _z_complite+0 
L_Running483:
;other function.c,1517 :: 		}
L_end_Running:
	RETURN      0
; end of _Running

_initial_main:

;other function.c,1521 :: 		void initial_main()
;other function.c,1523 :: 		ADCON1=0X0F;
	MOVLW       15
	MOVWF       ADCON1+0 
;other function.c,1524 :: 		MEMCON=0XFF;
	MOVLW       255
	MOVWF       MEMCON+0 
;other function.c,1525 :: 		TRISA=0;
	CLRF        TRISA+0 
;other function.c,1526 :: 		TRISB=255;
	MOVLW       255
	MOVWF       TRISB+0 
;other function.c,1527 :: 		TRISC=0;
	CLRF        TRISC+0 
;other function.c,1528 :: 		TRISD=0;
	CLRF        TRISD+0 
;other function.c,1529 :: 		TRISE=0;
	CLRF        TRISE+0 
;other function.c,1530 :: 		trise.b7=1;
	BSF         TRISE+0, 7 
;other function.c,1532 :: 		TRISF=0;
	CLRF        TRISF+0 
;other function.c,1533 :: 		TRISG=0;
	CLRF        TRISG+0 
;other function.c,1534 :: 		TRISH=0;
	CLRF        TRISH+0 
;other function.c,1535 :: 		TRISJ=0;
	CLRF        TRISJ+0 
;other function.c,1536 :: 		TRISJ.B1=1;
	BSF         TRISJ+0, 1 
;other function.c,1537 :: 		TRISJ.B0=1;
	BSF         TRISJ+0, 0 
;other function.c,1539 :: 		PORTA=0;
	CLRF        PORTA+0 
;other function.c,1540 :: 		PORTB=0;
	CLRF        PORTB+0 
;other function.c,1541 :: 		PORTC=0;
	CLRF        PORTC+0 
;other function.c,1542 :: 		PORTD=0;
	CLRF        PORTD+0 
;other function.c,1543 :: 		PORTE=0;
	CLRF        PORTE+0 
;other function.c,1544 :: 		PORTF=0;
	CLRF        PORTF+0 
;other function.c,1545 :: 		PORTG=255;
	MOVLW       255
	MOVWF       PORTG+0 
;other function.c,1546 :: 		PORTH=0;
	CLRF        PORTH+0 
;other function.c,1547 :: 		PORTJ=0;
	CLRF        PORTJ+0 
;other function.c,1548 :: 		PORTJ.B1=1;
	BSF         PORTJ+0, 1 
;other function.c,1550 :: 		LATA=0;
	CLRF        LATA+0 
;other function.c,1551 :: 		LATB=255;
	MOVLW       255
	MOVWF       LATB+0 
;other function.c,1552 :: 		LATC=0;
	CLRF        LATC+0 
;other function.c,1553 :: 		LATD=0;
	CLRF        LATD+0 
;other function.c,1554 :: 		LATE=0;
	CLRF        LATE+0 
;other function.c,1555 :: 		LATF=0;
	CLRF        LATF+0 
;other function.c,1556 :: 		LATG=255;
	MOVLW       255
	MOVWF       LATG+0 
;other function.c,1557 :: 		LATH=0;
	CLRF        LATH+0 
;other function.c,1558 :: 		LATJ=0;
	CLRF        LATJ+0 
;other function.c,1561 :: 		rd_pin_dir=0;
	BCF         TRISG+0, 3 
;other function.c,1562 :: 		wr_pin_dir=0;
	BCF         TRISG+0, 4 
;other function.c,1563 :: 		ale_pin_dir=0;
	BCF         TRISG+0, 0 
;other function.c,1564 :: 		l_data_dir=255;
	MOVLW       255
	MOVWF       TRISD+0 
;other function.c,1565 :: 		h_data_dir=0;
	CLRF        TRISH+0 
;other function.c,1567 :: 		rd_pin=1;
	BSF         PORTG+0, 3 
;other function.c,1568 :: 		wr_pin=1;
	BSF         PORTG+0, 4 
;other function.c,1569 :: 		l_data=0;
	CLRF        PORTD+0 
;other function.c,1570 :: 		h_data=0;
	CLRF        PORTH+0 
;other function.c,1572 :: 		Main_SENSOR_DIR_2=1;
	BSF         TRISC+0, 0 
;other function.c,1575 :: 		thread_free_clk=0;
	BCF         PORTC+0, 7 
;other function.c,1576 :: 		thread_free_clk_direction=0;
	BCF         TRISC+0, 7 
;other function.c,1577 :: 		thread_free_dir=0;
	BCF         PORTC+0, 6 
;other function.c,1578 :: 		thread_free_dir_direction=0;
	BCF         TRISC+0, 6 
;other function.c,1580 :: 		main_motor=0;
	BCF         PORTC+0, 5 
;other function.c,1581 :: 		main_motor_dir=0;
	BCF         TRISC+0, 5 
;other function.c,1583 :: 		PWM1_Start();
	CALL        _PWM1_Start+0, 0
;other function.c,1584 :: 		PWM1_Init(4000);
	BSF         T2CON+0, 0, 0
	BSF         T2CON+0, 1, 0
	MOVLW       156
	MOVWF       PR2+0, 0
	CALL        _PWM1_Init+0, 0
;other function.c,1585 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;other function.c,1588 :: 		SN_1=1;
	BSF         PORTE+0, 5 
;other function.c,1589 :: 		SN_2=1;
	BSF         PORTE+0, 4 
;other function.c,1590 :: 		SN_3=1;
	BSF         PORTE+0, 3 
;other function.c,1591 :: 		SN_4=1;
	BSF         PORTE+0, 2 
;other function.c,1592 :: 		SN_5=1;
	BSF         PORTE+0, 6 
;other function.c,1594 :: 		SN_1_DIR=1;
	BSF         TRISE+0, 5 
;other function.c,1595 :: 		SN_2_DIR=1;
	BSF         TRISE+0, 4 
;other function.c,1596 :: 		SN_3_DIR=1;
	BSF         TRISE+0, 3 
;other function.c,1597 :: 		SN_4_DIR=1;
	BSF         TRISE+0, 2 
;other function.c,1598 :: 		SN_5_DIR=1;
	BSF         TRISE+0, 6 
;other function.c,1601 :: 		t_pin_DIR=1;
	BSF         TRISE+0, 7 
;other function.c,1602 :: 		t_pin_DIR_2=1;
	BSF         TRISC+0, 1 
;other function.c,1604 :: 		Main_SENSOR_DIR=1;
	BSF         TRISB+0, 0 
;other function.c,1605 :: 		Main_SENSOR=1;
	BSF         PORTB+0, 0 
;other function.c,1606 :: 		UART2_Init(baud_rate);
	MOVLW       64
	MOVWF       SPBRG2+0 
	BCF         TXSTA2+0, 2, 0
	CALL        _UART2_Init+0, 0
;other function.c,1607 :: 		delay_ms(200);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_initial_main484:
	DECFSZ      R13, 1, 1
	BRA         L_initial_main484
	DECFSZ      R12, 1, 1
	BRA         L_initial_main484
	DECFSZ      R11, 1, 1
	BRA         L_initial_main484
	NOP
	NOP
;other function.c,1608 :: 		UART_Set_Active(&UART2_Read, &UART2_Write, &UART2_Data_Ready, &UART2_Tx_Idle); // set UART2 active
	MOVLW       _UART2_Read+0
	MOVWF       FARG_UART_Set_Active_read_ptr+0 
	MOVLW       hi_addr(_UART2_Read+0)
	MOVWF       FARG_UART_Set_Active_read_ptr+1 
	MOVLW       0
	MOVWF       FARG_UART_Set_Active_read_ptr+2 
	MOVLW       0
	MOVWF       FARG_UART_Set_Active_read_ptr+3 
	MOVLW       _UART2_Write+0
	MOVWF       FARG_UART_Set_Active_write_ptr+0 
	MOVLW       hi_addr(_UART2_Write+0)
	MOVWF       FARG_UART_Set_Active_write_ptr+1 
	MOVLW       FARG_UART2_Write_data_+0
	MOVWF       FARG_UART_Set_Active_write_ptr+2 
	MOVLW       hi_addr(FARG_UART2_Write_data_+0)
	MOVWF       FARG_UART_Set_Active_write_ptr+3 
	MOVLW       _UART2_Data_Ready+0
	MOVWF       FARG_UART_Set_Active_ready_ptr+0 
	MOVLW       hi_addr(_UART2_Data_Ready+0)
	MOVWF       FARG_UART_Set_Active_ready_ptr+1 
	MOVLW       0
	MOVWF       FARG_UART_Set_Active_ready_ptr+2 
	MOVLW       0
	MOVWF       FARG_UART_Set_Active_ready_ptr+3 
	MOVLW       _UART2_Tx_Idle+0
	MOVWF       FARG_UART_Set_Active_tx_idle_ptr+0 
	MOVLW       hi_addr(_UART2_Tx_Idle+0)
	MOVWF       FARG_UART_Set_Active_tx_idle_ptr+1 
	MOVLW       0
	MOVWF       FARG_UART_Set_Active_tx_idle_ptr+2 
	MOVLW       0
	MOVWF       FARG_UART_Set_Active_tx_idle_ptr+3 
	CALL        _UART_Set_Active+0, 0
;other function.c,1609 :: 		UART2_WRITE_TEXT("HELO WORLD");
	MOVLW       ?lstr20_RPM_32STEPPER+0
	MOVWF       FARG_UART2_Write_Text_uart_text+0 
	MOVLW       hi_addr(?lstr20_RPM_32STEPPER+0)
	MOVWF       FARG_UART2_Write_Text_uart_text+1 
	CALL        _UART2_Write_Text+0, 0
;other function.c,1610 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;other function.c,1611 :: 		delay_ms(200);
	MOVLW       11
	MOVWF       R11, 0
	MOVLW       38
	MOVWF       R12, 0
	MOVLW       93
	MOVWF       R13, 0
L_initial_main485:
	DECFSZ      R13, 1, 1
	BRA         L_initial_main485
	DECFSZ      R12, 1, 1
	BRA         L_initial_main485
	DECFSZ      R11, 1, 1
	BRA         L_initial_main485
	NOP
	NOP
;other function.c,1612 :: 		LCD_CMD(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;other function.c,1613 :: 		LCD_CMD(_LCD_UNDERLINE_ON);
	MOVLW       14
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;other function.c,1614 :: 		LCD_CMD(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;other function.c,1615 :: 		delay_ms(40);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_initial_main486:
	DECFSZ      R13, 1, 1
	BRA         L_initial_main486
	DECFSZ      R12, 1, 1
	BRA         L_initial_main486
	DECFSZ      R11, 1, 1
	BRA         L_initial_main486
;other function.c,1618 :: 		Disable_intR();
	CALL        _disable_intr+0, 0
;other function.c,1619 :: 		OLD_FUNCTION=224;
	MOVLW       224
	MOVWF       _old_function+0 
;other function.c,1620 :: 		OLD_Z_Degree=270.0;
	MOVLW       0
	MOVWF       _OLD_Z_Degree+0 
	MOVLW       0
	MOVWF       _OLD_Z_Degree+1 
	MOVLW       7
	MOVWF       _OLD_Z_Degree+2 
	MOVLW       135
	MOVWF       _OLD_Z_Degree+3 
;other function.c,1621 :: 		}
L_end_initial_main:
	RETURN      0
; end of _initial_main

_EXTINT0:

;ext_into.c,1 :: 		void EXTINT0(char x)
;ext_into.c,3 :: 		if (x==1){
	MOVF        FARG_EXTINT0_x+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_EXTINT0487
;ext_into.c,4 :: 		INTCON|=(1<<INT0IE);
	BSF         INTCON+0, 4 
;ext_into.c,5 :: 		}
L_EXTINT0487:
;ext_into.c,6 :: 		if (x==0){
	MOVF        FARG_EXTINT0_x+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_EXTINT0488
;ext_into.c,7 :: 		INTCON&=~(1<<INT0IE);
	BCF         INTCON+0, 4 
;ext_into.c,8 :: 		}
L_EXTINT0488:
;ext_into.c,9 :: 		}
L_end_EXTINT0:
	RETURN      0
; end of _EXTINT0

_INT0EDG:

;ext_into.c,11 :: 		void INT0EDG(char x){
;ext_into.c,12 :: 		if (x==0){
	MOVF        FARG_INT0EDG_x+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_INT0EDG489
;ext_into.c,13 :: 		INTCON2&=~(1<<INTEDG0);
	BCF         INTCON2+0, 6 
;ext_into.c,14 :: 		}
L_INT0EDG489:
;ext_into.c,15 :: 		if (x==1){
	MOVF        FARG_INT0EDG_x+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_INT0EDG490
;ext_into.c,16 :: 		INTCON2|=(1<<INTEDG0);
	BSF         INTCON2+0, 6 
;ext_into.c,17 :: 		}
L_INT0EDG490:
;ext_into.c,18 :: 		}
L_end_INT0EDG:
	RETURN      0
; end of _INT0EDG

_degree_180:

;back_machine.c,3 :: 		void degree_180(char f_r_id)
;back_machine.c,6 :: 		if (f_r_id=='R' && loop_id=='R')
	MOVF        FARG_degree_180_f_r_id+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_degree_180493
	MOVF        _loop_id+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_degree_180493
L__degree_180793:
;back_machine.c,8 :: 		loop_id='F';
	MOVLW       70
	MOVWF       _loop_id+0 
;back_machine.c,9 :: 		for(i=0;i<200;i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_degree_180494:
	MOVLW       0
	SUBWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__degree_180931
	MOVLW       200
	SUBWF       _i+0, 0 
L__degree_180931:
	BTFSC       STATUS+0, 0 
	GOTO        L_degree_180495
;back_machine.c,11 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;back_machine.c,12 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_degree_180497:
	DECFSZ      R13, 1, 1
	BRA         L_degree_180497
	DECFSZ      R12, 1, 1
	BRA         L_degree_180497
	NOP
	NOP
;back_machine.c,13 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;back_machine.c,14 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_degree_180498:
	DECFSZ      R13, 1, 1
	BRA         L_degree_180498
	DECFSZ      R12, 1, 1
	BRA         L_degree_180498
	NOP
	NOP
;back_machine.c,9 :: 		for(i=0;i<200;i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;back_machine.c,15 :: 		}
	GOTO        L_degree_180494
L_degree_180495:
;back_machine.c,16 :: 		}
L_degree_180493:
;back_machine.c,17 :: 		if (f_r_id=='F' && loop_id=='F')
	MOVF        FARG_degree_180_f_r_id+0, 0 
	XORLW       70
	BTFSS       STATUS+0, 2 
	GOTO        L_degree_180501
	MOVF        _loop_id+0, 0 
	XORLW       70
	BTFSS       STATUS+0, 2 
	GOTO        L_degree_180501
L__degree_180792:
;back_machine.c,19 :: 		loop_id='R';
	MOVLW       82
	MOVWF       _loop_id+0 
;back_machine.c,21 :: 		for(i=0;i<200;i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_degree_180502:
	MOVLW       0
	SUBWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__degree_180932
	MOVLW       200
	SUBWF       _i+0, 0 
L__degree_180932:
	BTFSC       STATUS+0, 0 
	GOTO        L_degree_180503
;back_machine.c,23 :: 		CLK_Z=1;
	BSF         LATF+0, 5 
;back_machine.c,24 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_degree_180505:
	DECFSZ      R13, 1, 1
	BRA         L_degree_180505
	DECFSZ      R12, 1, 1
	BRA         L_degree_180505
	NOP
	NOP
;back_machine.c,25 :: 		CLK_Z=0;
	BCF         LATF+0, 5 
;back_machine.c,26 :: 		DELAY_uS(delays);
	MOVLW       4
	MOVWF       R12, 0
	MOVLW       161
	MOVWF       R13, 0
L_degree_180506:
	DECFSZ      R13, 1, 1
	BRA         L_degree_180506
	DECFSZ      R12, 1, 1
	BRA         L_degree_180506
	NOP
	NOP
;back_machine.c,21 :: 		for(i=0;i<200;i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;back_machine.c,27 :: 		}
	GOTO        L_degree_180502
L_degree_180503:
;back_machine.c,28 :: 		}
L_degree_180501:
;back_machine.c,29 :: 		}
L_end_degree_180:
	RETURN      0
; end of _degree_180

_back_design:

;back_machine.c,32 :: 		void  back_design()
;back_machine.c,34 :: 		while(1)
L_back_design507:
;back_machine.c,36 :: 		if (UP_button()==0)
	CALL        _up_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_back_design509
;back_machine.c,38 :: 		f_r='F';
	MOVLW       70
	MOVWF       _f_r+0 
;back_machine.c,39 :: 		f_r_main='F';
	MOVLW       70
	MOVWF       _f_r_main+0 
;back_machine.c,40 :: 		back_design_exit='F';
	MOVLW       70
	MOVWF       _back_design_exit+0 
;back_machine.c,41 :: 		delay_ms(10);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_back_design510:
	DECFSZ      R13, 1, 1
	BRA         L_back_design510
	DECFSZ      R12, 1, 1
	BRA         L_back_design510
	NOP
	NOP
;back_machine.c,42 :: 		break;
	GOTO        L_back_design508
;back_machine.c,43 :: 		}
L_back_design509:
;back_machine.c,44 :: 		else if (down_button()==0)
	CALL        _down_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_back_design512
;back_machine.c,46 :: 		f_r='R';
	MOVLW       82
	MOVWF       _f_r+0 
;back_machine.c,47 :: 		f_r_main='R';
	MOVLW       82
	MOVWF       _f_r_main+0 
;back_machine.c,48 :: 		back_design_exit='R';
	MOVLW       82
	MOVWF       _back_design_exit+0 
;back_machine.c,49 :: 		delay_ms(10);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_back_design513:
	DECFSZ      R13, 1, 1
	BRA         L_back_design513
	DECFSZ      R12, 1, 1
	BRA         L_back_design513
	NOP
	NOP
;back_machine.c,50 :: 		break;
	GOTO        L_back_design508
;back_machine.c,51 :: 		}
L_back_design512:
;back_machine.c,52 :: 		else if (back_button()==0)
	CALL        _back_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_back_design515
;back_machine.c,54 :: 		f_r='F';
	MOVLW       70
	MOVWF       _f_r+0 
;back_machine.c,55 :: 		f_r_main='F';
	MOVLW       70
	MOVWF       _f_r_main+0 
;back_machine.c,56 :: 		back_design_exit='B';
	MOVLW       66
	MOVWF       _back_design_exit+0 
;back_machine.c,57 :: 		break;
	GOTO        L_back_design508
;back_machine.c,58 :: 		}
L_back_design515:
;back_machine.c,59 :: 		}
	GOTO        L_back_design507
L_back_design508:
;back_machine.c,60 :: 		}
L_end_back_design:
	RETURN      0
; end of _back_design

_machine_started_back:

;back_machine.c,62 :: 		void machine_started_back()
;back_machine.c,65 :: 		do
L_machine_started_back516:
;back_machine.c,67 :: 		back_design();
	CALL        _back_design+0, 0
;back_machine.c,68 :: 		exit_loop=back_design_exit;
	MOVF        _back_design_exit+0, 0 
	MOVWF       machine_started_back_exit_loop_L0+0 
;back_machine.c,69 :: 		degree_180(f_r);
	MOVF        _f_r+0, 0 
	MOVWF       FARG_degree_180_f_r_id+0 
	CALL        _degree_180+0, 0
;back_machine.c,71 :: 		GET_DATA();
	CALL        _GET_DATA+0, 0
;back_machine.c,72 :: 		if (function!=248)
	MOVF        _function+0, 0 
	XORLW       248
	BTFSC       STATUS+0, 2 
	GOTO        L_machine_started_back519
;back_machine.c,74 :: 		function_id=GET_DEGREE();  //***GET DEGREE
	CALL        _GET_DEGREE+0, 0
	MOVF        R0, 0 
	MOVWF       machine_started_back_function_id_L0+0 
;back_machine.c,75 :: 		GET_RPM();
	CALL        _Get_RPM+0, 0
;back_machine.c,78 :: 		EXTINT0(1);
	MOVLW       1
	MOVWF       FARG_EXTINT0_x+0 
	CALL        _EXTINT0+0, 0
;back_machine.c,79 :: 		Running();
	CALL        _Running+0, 0
;back_machine.c,80 :: 		longtostr(stich_dis,text11);
	MOVF        _stich_dis+0, 0 
	MOVWF       FARG_LongToStr_input+0 
	MOVF        _stich_dis+1, 0 
	MOVWF       FARG_LongToStr_input+1 
	MOVF        _stich_dis+2, 0 
	MOVWF       FARG_LongToStr_input+2 
	MOVF        _stich_dis+3, 0 
	MOVWF       FARG_LongToStr_input+3 
	MOVLW       _text11+0
	MOVWF       FARG_LongToStr_output+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_LongToStr_output+1 
	CALL        _LongToStr+0, 0
;back_machine.c,81 :: 		LCD_OUT(1,1,TEXT11);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _text11+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;back_machine.c,82 :: 		if (f_r == 'F')
	MOVF        _f_r+0, 0 
	XORLW       70
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started_back520
;back_machine.c,84 :: 		stich_dis++;
	MOVLW       1
	ADDWF       _stich_dis+0, 1 
	MOVLW       0
	ADDWFC      _stich_dis+1, 1 
	ADDWFC      _stich_dis+2, 1 
	ADDWFC      _stich_dis+3, 1 
;back_machine.c,85 :: 		}
	GOTO        L_machine_started_back521
L_machine_started_back520:
;back_machine.c,86 :: 		else if (f_r == 'R')
	MOVF        _f_r+0, 0 
	XORLW       82
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started_back522
;back_machine.c,88 :: 		stich_dis--;
	MOVLW       1
	SUBWF       _stich_dis+0, 1 
	MOVLW       0
	SUBWFB      _stich_dis+1, 1 
	SUBWFB      _stich_dis+2, 1 
	SUBWFB      _stich_dis+3, 1 
;back_machine.c,89 :: 		}
L_machine_started_back522:
L_machine_started_back521:
;back_machine.c,90 :: 		if (stich_dis<=0)
	MOVLW       128
	MOVWF       R0 
	MOVLW       128
	XORWF       _stich_dis+3, 0 
	SUBWF       R0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__machine_started_back935
	MOVF        _stich_dis+2, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__machine_started_back935
	MOVF        _stich_dis+1, 0 
	SUBLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L__machine_started_back935
	MOVF        _stich_dis+0, 0 
	SUBLW       0
L__machine_started_back935:
	BTFSS       STATUS+0, 0 
	GOTO        L_machine_started_back523
;back_machine.c,92 :: 		function=248;
	MOVLW       248
	MOVWF       _function+0 
;back_machine.c,93 :: 		}
L_machine_started_back523:
;back_machine.c,94 :: 		while(x_complite==0);
L_machine_started_back524:
	MOVF        _x_complite+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started_back525
	GOTO        L_machine_started_back524
L_machine_started_back525:
;back_machine.c,95 :: 		while(y_complite==0);
L_machine_started_back526:
	MOVF        _y_complite+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started_back527
	GOTO        L_machine_started_back526
L_machine_started_back527:
;back_machine.c,110 :: 		while(z_complite==0);
L_machine_started_back528:
	MOVF        _z_complite+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started_back529
	GOTO        L_machine_started_back528
L_machine_started_back529:
;back_machine.c,112 :: 		EXTINT0(0);
	CLRF        FARG_EXTINT0_x+0 
	CALL        _EXTINT0+0, 0
;back_machine.c,114 :: 		}
L_machine_started_back519:
;back_machine.c,115 :: 		if(exit_loop=='B')
	MOVF        machine_started_back_exit_loop_L0+0, 0 
	XORLW       66
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started_back530
;back_machine.c,117 :: 		function_id_back_start=function_id;
	MOVF        machine_started_back_function_id_L0+0, 0 
	MOVWF       _function_id_back_start+0 
;back_machine.c,118 :: 		break;
	GOTO        L_machine_started_back517
;back_machine.c,119 :: 		}
L_machine_started_back530:
;back_machine.c,120 :: 		} while(function!=248);
	MOVF        _function+0, 0 
	XORLW       248
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started_back516
L_machine_started_back517:
;back_machine.c,121 :: 		}
L_end_machine_started_back:
	RETURN      0
; end of _machine_started_back

_required_stich:

;back_machine.c,126 :: 		void required_stich()
;back_machine.c,128 :: 		back_start=66;
	MOVLW       66
	MOVWF       _back_start+0 
;back_machine.c,129 :: 		machine_started_back();
	CALL        _machine_started_back+0, 0
;back_machine.c,130 :: 		cls();
	CALL        _cls+0, 0
;back_machine.c,131 :: 		lcd_out(1,1,"function test");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr21_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr21_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;back_machine.c,132 :: 		while(ok_button()==1);
L_required_stich531:
	CALL        _OK_button+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_required_stich532
	GOTO        L_required_stich531
L_required_stich532:
;back_machine.c,133 :: 		back_start='S';
	MOVLW       83
	MOVWF       _back_start+0 
;back_machine.c,169 :: 		}
L_end_required_stich:
	RETURN      0
; end of _required_stich

_display_m01:

;main_menu.c,7 :: 		void display_m01()
;main_menu.c,9 :: 		CLS();
	CALL        _cls+0, 0
;main_menu.c,10 :: 		LCD_OUT(1,1,CopyConst2Ram(MSG,M01));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _m01+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_m01+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_m01+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;main_menu.c,11 :: 		LCD_OUT(2,40-4,CopyConst2Ram(MSG,back));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _back+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_back+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_back+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       36
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;main_menu.c,12 :: 		}
L_end_display_m01:
	RETURN      0
; end of _display_m01

_display_m02:

;main_menu.c,14 :: 		void display_m02()
;main_menu.c,16 :: 		cls();
	CALL        _cls+0, 0
;main_menu.c,17 :: 		LCD_OUT(1,1,CopyConst2Ram(MSG,M02));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _m02+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_m02+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_m02+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;main_menu.c,18 :: 		}
L_end_display_m02:
	RETURN      0
; end of _display_m02

_display_m03:

;main_menu.c,20 :: 		void display_m03()
;main_menu.c,22 :: 		cls();
	CALL        _cls+0, 0
;main_menu.c,23 :: 		LCD_OUT(1,1,CopyConst2Ram(MSG,M03));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _m03+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_m03+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_m03+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;main_menu.c,24 :: 		}
L_end_display_m03:
	RETURN      0
; end of _display_m03

_frame_position:

;main_menu.c,29 :: 		void frame_position()
;main_menu.c,31 :: 		while(1)
L_frame_position533:
;main_menu.c,33 :: 		if (left_pin==0 || right_pin==0)
	BTFSS       PORTB+0, 7 
	GOTO        L__frame_position795
	BTFSS       PORTB+0, 6 
	GOTO        L__frame_position795
	GOTO        L_frame_position537
L__frame_position795:
;main_menu.c,35 :: 		if(left_pin==0)
	BTFSC       PORTB+0, 7 
	GOTO        L_frame_position538
;main_menu.c,37 :: 		X_Dir_P();       //+VE 0
	CALL        _X_Dir_P+0, 0
;main_menu.c,38 :: 		CLK_X=~CLK_X;
	BTG         LATF+0, 3 
;main_menu.c,39 :: 		DELAY_uS(free_Frame_pos);
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_frame_position539:
	DECFSZ      R13, 1, 1
	BRA         L_frame_position539
	DECFSZ      R12, 1, 1
	BRA         L_frame_position539
	NOP
	NOP
;main_menu.c,40 :: 		}
	GOTO        L_frame_position540
L_frame_position538:
;main_menu.c,41 :: 		else if(right_pin==0)
	BTFSC       PORTB+0, 6 
	GOTO        L_frame_position541
;main_menu.c,43 :: 		X_Dir_N();        //-VE  1
	CALL        _X_Dir_N+0, 0
;main_menu.c,44 :: 		CLK_X=~CLK_X;
	BTG         LATF+0, 3 
;main_menu.c,45 :: 		DELAY_uS(free_Frame_pos);
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_frame_position542:
	DECFSZ      R13, 1, 1
	BRA         L_frame_position542
	DECFSZ      R12, 1, 1
	BRA         L_frame_position542
	NOP
	NOP
;main_menu.c,46 :: 		}
L_frame_position541:
L_frame_position540:
;main_menu.c,47 :: 		}
L_frame_position537:
;main_menu.c,48 :: 		if(up_pin==0 || down_pin==0)
	BTFSS       PORTB+0, 4 
	GOTO        L__frame_position794
	BTFSS       PORTB+0, 5 
	GOTO        L__frame_position794
	GOTO        L_frame_position545
L__frame_position794:
;main_menu.c,50 :: 		if(down_pin==0)
	BTFSC       PORTB+0, 5 
	GOTO        L_frame_position546
;main_menu.c,52 :: 		Y_Dir_P();       //+VE
	CALL        _Y_Dir_P+0, 0
;main_menu.c,53 :: 		CLK_Y=~CLK_Y;
	BTG         LATF+0, 1 
;main_menu.c,54 :: 		DELAY_uS(free_Frame_pos);
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_frame_position547:
	DECFSZ      R13, 1, 1
	BRA         L_frame_position547
	DECFSZ      R12, 1, 1
	BRA         L_frame_position547
	NOP
	NOP
;main_menu.c,55 :: 		}
	GOTO        L_frame_position548
L_frame_position546:
;main_menu.c,56 :: 		else if(up_pin==0)
	BTFSC       PORTB+0, 4 
	GOTO        L_frame_position549
;main_menu.c,58 :: 		Y_Dir_N();        //-VE
	CALL        _Y_Dir_N+0, 0
;main_menu.c,59 :: 		CLK_Y=~CLK_Y;
	BTG         LATF+0, 1 
;main_menu.c,60 :: 		DELAY_uS(free_Frame_pos);
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       201
	MOVWF       R13, 0
L_frame_position550:
	DECFSZ      R13, 1, 1
	BRA         L_frame_position550
	DECFSZ      R12, 1, 1
	BRA         L_frame_position550
	NOP
	NOP
;main_menu.c,61 :: 		}
L_frame_position549:
L_frame_position548:
;main_menu.c,62 :: 		}
L_frame_position545:
;main_menu.c,63 :: 		if (centor_button()==0)
	CALL        _CENTOR_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_frame_position551
;main_menu.c,65 :: 		CHK_ALL_90_DEGREE();
	CALL        _CHK_ALL_90_DEGREE+0, 0
;main_menu.c,66 :: 		SN_5_REACHED();
	CALL        _SN_5_REACHED+0, 0
;main_menu.c,67 :: 		}
L_frame_position551:
;main_menu.c,68 :: 		if(back_button()==0)
	CALL        _back_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_frame_position552
;main_menu.c,70 :: 		while(back_button()==0);
L_frame_position553:
	CALL        _back_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_frame_position554
	GOTO        L_frame_position553
L_frame_position554:
;main_menu.c,71 :: 		cls();
	CALL        _cls+0, 0
;main_menu.c,72 :: 		break;
	GOTO        L_frame_position534
;main_menu.c,73 :: 		}
L_frame_position552:
;main_menu.c,74 :: 		}
	GOTO        L_frame_position533
L_frame_position534:
;main_menu.c,75 :: 		}
L_end_frame_position:
	RETURN      0
; end of _frame_position

_START_MACHINE_WITH_DESIGN:

;main_menu.c,77 :: 		void START_MACHINE_WITH_DESIGN()
;main_menu.c,79 :: 		lcd_out(2,21,CopyConst2Ram(MSG,back));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _back+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_back+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_back+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       21
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;main_menu.c,80 :: 		lcd_out(2,40-4,CopyConst2Ram(MSG,next));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _next+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_next+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_next+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       36
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;main_menu.c,81 :: 		while(1)
L_START_MACHINE_WITH_DESIGN555:
;main_menu.c,83 :: 		if (save_button()==0)
	CALL        _save_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_START_MACHINE_WITH_DESIGN557
;main_menu.c,85 :: 		start_machine_flage='Y';
	MOVLW       89
	MOVWF       _start_machine_flage+0 
;main_menu.c,86 :: 		break;
	GOTO        L_START_MACHINE_WITH_DESIGN556
;main_menu.c,87 :: 		}
L_START_MACHINE_WITH_DESIGN557:
;main_menu.c,88 :: 		else if (back_button()==0)
	CALL        _back_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_START_MACHINE_WITH_DESIGN559
;main_menu.c,90 :: 		start_machine_flage='N';
	MOVLW       78
	MOVWF       _start_machine_flage+0 
;main_menu.c,91 :: 		break;
	GOTO        L_START_MACHINE_WITH_DESIGN556
;main_menu.c,92 :: 		}
L_START_MACHINE_WITH_DESIGN559:
;main_menu.c,93 :: 		}
	GOTO        L_START_MACHINE_WITH_DESIGN555
L_START_MACHINE_WITH_DESIGN556:
;main_menu.c,94 :: 		}
L_end_START_MACHINE_WITH_DESIGN:
	RETURN      0
; end of _START_MACHINE_WITH_DESIGN

_chaking_designed:

;main_menu.c,98 :: 		void chaking_designed()
;main_menu.c,100 :: 		if (READ_DATA(5)=='C')
	MOVLW       5
	MOVWF       FARG_read_data_wadd+0 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+1 
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	XORLW       67
	BTFSS       STATUS+0, 2 
	GOTO        L_chaking_designed560
;main_menu.c,102 :: 		lcd_out(2,1,CopyConst2Ram(MSG,M04));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _m04+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_m04+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_m04+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;main_menu.c,103 :: 		lcd_chr_cp(READ_DATA(11));
	MOVLW       11
	MOVWF       FARG_read_data_wadd+0 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+1 
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Chr_CP_out_char+0 
	CALL        _Lcd_Chr_CP+0, 0
;main_menu.c,105 :: 		Lo(WADD)=READ_DATA(31);
	MOVLW       31
	MOVWF       FARG_read_data_wadd+0 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+1 
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	MOVWF       _wadd+0 
;main_menu.c,106 :: 		Hi(WADD)=READ_DATA(32);
	MOVLW       32
	MOVWF       FARG_read_data_wadd+0 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+1 
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	MOVWF       _wadd+1 
;main_menu.c,107 :: 		longtostr(wadd,text11);
	MOVF        _wadd+0, 0 
	MOVWF       FARG_LongToStr_input+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_LongToStr_input+1 
	MOVLW       0
	MOVWF       FARG_LongToStr_input+2 
	MOVWF       FARG_LongToStr_input+3 
	MOVLW       _text11+0
	MOVWF       FARG_LongToStr_output+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_LongToStr_output+1 
	CALL        _LongToStr+0, 0
;main_menu.c,109 :: 		LCD_OUT(1,17,text11);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       17
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _text11+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main_menu.c,110 :: 		START_MACHINE_WITH_DESIGN();
	CALL        _START_MACHINE_WITH_DESIGN+0, 0
;main_menu.c,111 :: 		}
	GOTO        L_chaking_designed561
L_chaking_designed560:
;main_menu.c,114 :: 		lcd_out(2,1,CopyConst2Ram(MSG,M05));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _m05+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_m05+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_m05+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;main_menu.c,115 :: 		while(back_button()==1);
L_chaking_designed562:
	CALL        _back_button+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_chaking_designed563
	GOTO        L_chaking_designed562
L_chaking_designed563:
;main_menu.c,116 :: 		}
L_chaking_designed561:
;main_menu.c,117 :: 		}
L_end_chaking_designed:
	RETURN      0
; end of _chaking_designed

_errow_show:

;main_menu.c,119 :: 		char errow_show()
;main_menu.c,121 :: 		if (down_button()==0)
	CALL        _down_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_errow_show564
;main_menu.c,123 :: 		if (current_msg==4)
	MOVF        _current_msg+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_errow_show565
;main_menu.c,125 :: 		current_msg=0;
	CLRF        _current_msg+0 
;main_menu.c,126 :: 		}
L_errow_show565:
;main_menu.c,127 :: 		current_msg++;
	INCF        _current_msg+0, 1 
;main_menu.c,128 :: 		move_errow_down(current_msg);
	MOVF        _current_msg+0, 0 
	MOVWF       FARG_move_errow_down_y+0 
	CALL        _move_errow_down+0, 0
;main_menu.c,129 :: 		while(down_button()==0);
L_errow_show566:
	CALL        _down_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_errow_show567
	GOTO        L_errow_show566
L_errow_show567:
;main_menu.c,130 :: 		}
L_errow_show564:
;main_menu.c,131 :: 		if (up_button()==0)
	CALL        _up_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_errow_show568
;main_menu.c,133 :: 		if (current_msg==1)
	MOVF        _current_msg+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_errow_show569
;main_menu.c,135 :: 		current_msg=5;
	MOVLW       5
	MOVWF       _current_msg+0 
;main_menu.c,136 :: 		}
L_errow_show569:
;main_menu.c,137 :: 		current_msg--;
	DECF        _current_msg+0, 1 
;main_menu.c,138 :: 		move_errow_down(current_msg);
	MOVF        _current_msg+0, 0 
	MOVWF       FARG_move_errow_down_y+0 
	CALL        _move_errow_down+0, 0
;main_menu.c,139 :: 		while(up_button()==0);
L_errow_show570:
	CALL        _up_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_errow_show571
	GOTO        L_errow_show570
L_errow_show571:
;main_menu.c,140 :: 		}
L_errow_show568:
;main_menu.c,141 :: 		return current_msg;
	MOVF        _current_msg+0, 0 
	MOVWF       R0 
;main_menu.c,142 :: 		}
L_end_errow_show:
	RETURN      0
; end of _errow_show

_menu_main_1:

;main_menu.c,144 :: 		void menu_main_1()
;main_menu.c,149 :: 		current_msg=errow_show();
	CALL        _errow_show+0, 0
	MOVF        R0, 0 
	MOVWF       _current_msg+0 
;main_menu.c,154 :: 		if (OK_button_1()==0)
	CALL        _OK_button_1+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_menu_main_1572
;main_menu.c,156 :: 		while(OK_button_1()==0);
L_menu_main_1573:
	CALL        _OK_button_1+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_menu_main_1574
	GOTO        L_menu_main_1573
L_menu_main_1574:
;main_menu.c,157 :: 		if (current_msg==1)
	MOVF        _current_msg+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_menu_main_1575
;main_menu.c,159 :: 		PWM1_Set_Duty(MAIN_MOTOR_LO_SPPED);
	MOVLW       50
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;main_menu.c,160 :: 		DISPLAY_M01();
	CALL        _display_m01+0, 0
;main_menu.c,161 :: 		relay_on();
	CALL        _relay_on+0, 0
;main_menu.c,162 :: 		en_on();
	CALL        _en_on+0, 0
;main_menu.c,163 :: 		break_on();
	CALL        _break_on+0, 0
;main_menu.c,164 :: 		frame_position();
	CALL        _frame_position+0, 0
;main_menu.c,165 :: 		en_off();
	CALL        _en_off+0, 0
;main_menu.c,166 :: 		display_mesg(current_msg);
	MOVF        _current_msg+0, 0 
	MOVWF       FARG_display_mesg_position_of_cursor+0 
	CALL        _display_mesg+0, 0
;main_menu.c,167 :: 		PWM1_Set_Duty(MAIN_MOTOR_LO_SPPED);
	MOVLW       50
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;main_menu.c,168 :: 		}
L_menu_main_1575:
;main_menu.c,169 :: 		if (current_msg==2)
	MOVF        _current_msg+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_menu_main_1576
;main_menu.c,171 :: 		display_m02();
	CALL        _display_m02+0, 0
;main_menu.c,172 :: 		SAVING_MAIN();
	CALL        _saving_main+0, 0
;main_menu.c,173 :: 		display_mesg(current_msg);
	MOVF        _current_msg+0, 0 
	MOVWF       FARG_display_mesg_position_of_cursor+0 
	CALL        _display_mesg+0, 0
;main_menu.c,174 :: 		}
L_menu_main_1576:
;main_menu.c,175 :: 		if (current_msg==3)
	MOVF        _current_msg+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_menu_main_1577
;main_menu.c,177 :: 		display_m03();
	CALL        _display_m03+0, 0
;main_menu.c,178 :: 		chaking_designed();
	CALL        _chaking_designed+0, 0
;main_menu.c,179 :: 		display_mesg(current_msg);
	MOVF        _current_msg+0, 0 
	MOVWF       FARG_display_mesg_position_of_cursor+0 
	CALL        _display_mesg+0, 0
;main_menu.c,180 :: 		}
L_menu_main_1577:
;main_menu.c,181 :: 		}
L_menu_main_1572:
;main_menu.c,182 :: 		}
L_end_menu_main_1:
	RETURN      0
; end of _menu_main_1

_chaking_stich_length:

;main_menu.c,186 :: 		void chaking_stich_length()
;main_menu.c,188 :: 		char counter=0;
;main_menu.c,189 :: 		COUNTER=read_data(++wadd);
	INFSNZ      _wadd+0, 1 
	INCF        _wadd+1, 1 
	MOVF        _wadd+0, 0 
	MOVWF       FARG_read_data_wadd+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_read_data_wadd+1 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
;main_menu.c,190 :: 		if (COUNTER>75)
	MOVF        R0, 0 
	SUBLW       75
	BTFSC       STATUS+0, 0 
	GOTO        L_chaking_stich_length578
;main_menu.c,192 :: 		cls();
	CALL        _cls+0, 0
;main_menu.c,193 :: 		lcd_out(1,1,"StichLongy");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr22_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr22_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main_menu.c,194 :: 		}
L_chaking_stich_length578:
;main_menu.c,195 :: 		COUNTER=read_data(++wadd);
	INFSNZ      _wadd+0, 1 
	INCF        _wadd+1, 1 
	MOVF        _wadd+0, 0 
	MOVWF       FARG_read_data_wadd+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_read_data_wadd+1 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
;main_menu.c,196 :: 		if (COUNTER>75)
	MOVF        R0, 0 
	SUBLW       75
	BTFSC       STATUS+0, 0 
	GOTO        L_chaking_stich_length579
;main_menu.c,198 :: 		cls();
	CALL        _cls+0, 0
;main_menu.c,199 :: 		lcd_out(1,1,"StichLongy");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr23_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr23_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main_menu.c,200 :: 		}
L_chaking_stich_length579:
;main_menu.c,201 :: 		}
L_end_chaking_stich_length:
	RETURN      0
; end of _chaking_stich_length

_ANALYSIS_START:

;main_menu.c,205 :: 		char ANALYSIS_START()
;main_menu.c,207 :: 		unsigned int counter=0,stop=0,trim=0,clour=0;
	CLRF        ANALYSIS_START_counter_L0+0 
	CLRF        ANALYSIS_START_counter_L0+1 
	CLRF        ANALYSIS_START_stop_L0+0 
	CLRF        ANALYSIS_START_stop_L0+1 
	CLRF        ANALYSIS_START_trim_L0+0 
	CLRF        ANALYSIS_START_trim_L0+1 
	CLRF        ANALYSIS_START_clour_L0+0 
	CLRF        ANALYSIS_START_clour_L0+1 
	CLRF        ANALYSIS_START_stich_L0+0 
	CLRF        ANALYSIS_START_stich_L0+1 
	CLRF        ANALYSIS_START_stich_L0+2 
	CLRF        ANALYSIS_START_stich_L0+3 
;main_menu.c,252 :: 		wadd=512;
	MOVLW       0
	MOVWF       _wadd+0 
	MOVLW       2
	MOVWF       _wadd+1 
;main_menu.c,253 :: 		COUNTER=read_data(++wadd);
	MOVLW       1
	MOVWF       _wadd+0 
	MOVLW       2
	MOVWF       _wadd+1 
	MOVLW       1
	MOVWF       FARG_read_data_wadd+0 
	MOVLW       2
	MOVWF       FARG_read_data_wadd+1 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	MOVWF       ANALYSIS_START_counter_L0+0 
	MOVLW       0
	MOVWF       ANALYSIS_START_counter_L0+1 
;main_menu.c,254 :: 		for(;;)
L_ANALYSIS_START580:
;main_menu.c,256 :: 		if(COUNTER==128 || COUNTER==160 || COUNTER==224 || COUNTER==192)
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START947
	MOVLW       128
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START947:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START804
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START948
	MOVLW       160
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START948:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START804
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START949
	MOVLW       224
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START949:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START804
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START950
	MOVLW       192
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START950:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START804
	GOTO        L_ANALYSIS_START585
L__ANALYSIS_START804:
;main_menu.c,258 :: 		stich+=1;
	MOVLW       1
	ADDWF       ANALYSIS_START_stich_L0+0, 1 
	MOVLW       0
	ADDWFC      ANALYSIS_START_stich_L0+1, 1 
	ADDWFC      ANALYSIS_START_stich_L0+2, 1 
	ADDWFC      ANALYSIS_START_stich_L0+3, 1 
;main_menu.c,259 :: 		chaking_stich_length();
	CALL        _chaking_stich_length+0, 0
;main_menu.c,260 :: 		COUNTER=read_data(++wadd);
	INFSNZ      _wadd+0, 1 
	INCF        _wadd+1, 1 
	MOVF        _wadd+0, 0 
	MOVWF       FARG_read_data_wadd+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_read_data_wadd+1 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	MOVWF       ANALYSIS_START_counter_L0+0 
	MOVLW       0
	MOVWF       ANALYSIS_START_counter_L0+1 
;main_menu.c,261 :: 		}
	GOTO        L_ANALYSIS_START586
L_ANALYSIS_START585:
;main_menu.c,263 :: 		else if(COUNTER==129 || COUNTER==161 || COUNTER==225 || COUNTER==193)
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START951
	MOVLW       129
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START951:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START803
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START952
	MOVLW       161
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START952:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START803
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START953
	MOVLW       225
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START953:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START803
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START954
	MOVLW       193
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START954:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START803
	GOTO        L_ANALYSIS_START589
L__ANALYSIS_START803:
;main_menu.c,265 :: 		stich+=1;
	MOVLW       1
	ADDWF       ANALYSIS_START_stich_L0+0, 1 
	MOVLW       0
	ADDWFC      ANALYSIS_START_stich_L0+1, 1 
	ADDWFC      ANALYSIS_START_stich_L0+2, 1 
	ADDWFC      ANALYSIS_START_stich_L0+3, 1 
;main_menu.c,266 :: 		chaking_stich_length();
	CALL        _chaking_stich_length+0, 0
;main_menu.c,267 :: 		COUNTER=read_data(++wadd);
	INFSNZ      _wadd+0, 1 
	INCF        _wadd+1, 1 
	MOVF        _wadd+0, 0 
	MOVWF       FARG_read_data_wadd+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_read_data_wadd+1 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	MOVWF       ANALYSIS_START_counter_L0+0 
	MOVLW       0
	MOVWF       ANALYSIS_START_counter_L0+1 
;main_menu.c,268 :: 		}
	GOTO        L_ANALYSIS_START590
L_ANALYSIS_START589:
;main_menu.c,270 :: 		else if(COUNTER==138 || COUNTER==170 || COUNTER==202 || COUNTER==234)
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START955
	MOVLW       138
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START955:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START802
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START956
	MOVLW       170
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START956:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START802
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START957
	MOVLW       202
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START957:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START802
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START958
	MOVLW       234
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START958:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START802
	GOTO        L_ANALYSIS_START593
L__ANALYSIS_START802:
;main_menu.c,272 :: 		stich+=1;
	MOVLW       1
	ADDWF       ANALYSIS_START_stich_L0+0, 1 
	MOVLW       0
	ADDWFC      ANALYSIS_START_stich_L0+1, 1 
	ADDWFC      ANALYSIS_START_stich_L0+2, 1 
	ADDWFC      ANALYSIS_START_stich_L0+3, 1 
;main_menu.c,273 :: 		chaking_stich_length();
	CALL        _chaking_stich_length+0, 0
;main_menu.c,274 :: 		COUNTER=read_data(++wadd);
	INFSNZ      _wadd+0, 1 
	INCF        _wadd+1, 1 
	MOVF        _wadd+0, 0 
	MOVWF       FARG_read_data_wadd+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_read_data_wadd+1 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	MOVWF       ANALYSIS_START_counter_L0+0 
	MOVLW       0
	MOVWF       ANALYSIS_START_counter_L0+1 
;main_menu.c,275 :: 		}
	GOTO        L_ANALYSIS_START594
L_ANALYSIS_START593:
;main_menu.c,277 :: 		else if(COUNTER==137 || COUNTER==169 || COUNTER==201 || COUNTER==233)
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START959
	MOVLW       137
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START959:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START801
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START960
	MOVLW       169
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START960:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START801
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START961
	MOVLW       201
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START961:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START801
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START962
	MOVLW       233
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START962:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START801
	GOTO        L_ANALYSIS_START597
L__ANALYSIS_START801:
;main_menu.c,279 :: 		stich+=1;
	MOVLW       1
	ADDWF       ANALYSIS_START_stich_L0+0, 1 
	MOVLW       0
	ADDWFC      ANALYSIS_START_stich_L0+1, 1 
	ADDWFC      ANALYSIS_START_stich_L0+2, 1 
	ADDWFC      ANALYSIS_START_stich_L0+3, 1 
;main_menu.c,280 :: 		chaking_stich_length();
	CALL        _chaking_stich_length+0, 0
;main_menu.c,281 :: 		COUNTER=read_data(++wadd);
	INFSNZ      _wadd+0, 1 
	INCF        _wadd+1, 1 
	MOVF        _wadd+0, 0 
	MOVWF       FARG_read_data_wadd+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_read_data_wadd+1 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	MOVWF       ANALYSIS_START_counter_L0+0 
	MOVLW       0
	MOVWF       ANALYSIS_START_counter_L0+1 
;main_menu.c,282 :: 		}
	GOTO        L_ANALYSIS_START598
L_ANALYSIS_START597:
;main_menu.c,284 :: 		else if(COUNTER==136 || COUNTER==168 || COUNTER==200 || COUNTER==232)
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START963
	MOVLW       136
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START963:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START800
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START964
	MOVLW       168
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START964:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START800
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START965
	MOVLW       200
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START965:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START800
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START966
	MOVLW       232
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START966:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START800
	GOTO        L_ANALYSIS_START601
L__ANALYSIS_START800:
;main_menu.c,286 :: 		stop+=1;
	INFSNZ      ANALYSIS_START_stop_L0+0, 1 
	INCF        ANALYSIS_START_stop_L0+1, 1 
;main_menu.c,287 :: 		stich+=1;
	MOVLW       1
	ADDWF       ANALYSIS_START_stich_L0+0, 1 
	MOVLW       0
	ADDWFC      ANALYSIS_START_stich_L0+1, 1 
	ADDWFC      ANALYSIS_START_stich_L0+2, 1 
	ADDWFC      ANALYSIS_START_stich_L0+3, 1 
;main_menu.c,288 :: 		chaking_stich_length();
	CALL        _chaking_stich_length+0, 0
;main_menu.c,289 :: 		COUNTER=read_data(++wadd);
	INFSNZ      _wadd+0, 1 
	INCF        _wadd+1, 1 
	MOVF        _wadd+0, 0 
	MOVWF       FARG_read_data_wadd+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_read_data_wadd+1 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	MOVWF       ANALYSIS_START_counter_L0+0 
	MOVLW       0
	MOVWF       ANALYSIS_START_counter_L0+1 
;main_menu.c,290 :: 		}
	GOTO        L_ANALYSIS_START602
L_ANALYSIS_START601:
;main_menu.c,292 :: 		else if(COUNTER==231 || COUNTER==230)
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START967
	MOVLW       231
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START967:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START799
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START968
	MOVLW       230
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START968:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START799
	GOTO        L_ANALYSIS_START605
L__ANALYSIS_START799:
;main_menu.c,294 :: 		Trim+=1;
	INFSNZ      ANALYSIS_START_trim_L0+0, 1 
	INCF        ANALYSIS_START_trim_L0+1, 1 
;main_menu.c,295 :: 		stich+=1;
	MOVLW       1
	ADDWF       ANALYSIS_START_stich_L0+0, 1 
	MOVLW       0
	ADDWFC      ANALYSIS_START_stich_L0+1, 1 
	ADDWFC      ANALYSIS_START_stich_L0+2, 1 
	ADDWFC      ANALYSIS_START_stich_L0+3, 1 
;main_menu.c,296 :: 		chaking_stich_length();
	CALL        _chaking_stich_length+0, 0
;main_menu.c,297 :: 		COUNTER=read_data(++wadd);
	INFSNZ      _wadd+0, 1 
	INCF        _wadd+1, 1 
	MOVF        _wadd+0, 0 
	MOVWF       FARG_read_data_wadd+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_read_data_wadd+1 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	MOVWF       ANALYSIS_START_counter_L0+0 
	MOVLW       0
	MOVWF       ANALYSIS_START_counter_L0+1 
;main_menu.c,298 :: 		}
	GOTO        L_ANALYSIS_START606
L_ANALYSIS_START605:
;main_menu.c,300 :: 		else if (COUNTER==139||COUNTER==171||COUNTER==203||COUNTER==235||
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START969
	MOVLW       139
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START969:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START970
	MOVLW       171
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START970:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START971
	MOVLW       203
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START971:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START972
	MOVLW       235
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START972:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
;main_menu.c,301 :: 		COUNTER==140||COUNTER==172||COUNTER==204||COUNTER==236||
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START973
	MOVLW       140
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START973:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START974
	MOVLW       172
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START974:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START975
	MOVLW       204
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START975:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START976
	MOVLW       236
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START976:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
;main_menu.c,302 :: 		COUNTER==141||COUNTER==173||COUNTER==205||COUNTER==237||
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START977
	MOVLW       141
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START977:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START978
	MOVLW       173
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START978:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START979
	MOVLW       205
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START979:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START980
	MOVLW       237
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START980:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
;main_menu.c,303 :: 		COUNTER==142||COUNTER==174||COUNTER==206||COUNTER==238||
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START981
	MOVLW       142
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START981:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START982
	MOVLW       174
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START982:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START983
	MOVLW       206
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START983:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START984
	MOVLW       238
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START984:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
;main_menu.c,304 :: 		COUNTER==143||COUNTER==175||COUNTER==207||COUNTER==239||
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START985
	MOVLW       143
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START985:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START986
	MOVLW       175
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START986:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START987
	MOVLW       207
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START987:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START988
	MOVLW       239
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START988:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
;main_menu.c,305 :: 		COUNTER==144||COUNTER==176||COUNTER==208||COUNTER==240||
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START989
	MOVLW       144
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START989:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START990
	MOVLW       176
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START990:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START991
	MOVLW       208
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START991:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START992
	MOVLW       240
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START992:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
;main_menu.c,306 :: 		COUNTER==145||COUNTER==177||COUNTER==209||COUNTER==241||
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START993
	MOVLW       145
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START993:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START994
	MOVLW       177
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START994:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START995
	MOVLW       209
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START995:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START996
	MOVLW       241
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START996:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
;main_menu.c,307 :: 		COUNTER==146||COUNTER==178||COUNTER==210||COUNTER==242||
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START997
	MOVLW       146
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START997:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START998
	MOVLW       178
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START998:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START999
	MOVLW       210
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START999:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1000
	MOVLW       242
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1000:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
;main_menu.c,308 :: 		COUNTER==147||COUNTER==179||COUNTER==211||COUNTER==243||
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1001
	MOVLW       147
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1001:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1002
	MOVLW       179
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1002:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1003
	MOVLW       211
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1003:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1004
	MOVLW       243
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1004:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
;main_menu.c,309 :: 		COUNTER==148||COUNTER==180||COUNTER==212||COUNTER==244||
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1005
	MOVLW       148
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1005:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1006
	MOVLW       180
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1006:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1007
	MOVLW       212
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1007:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1008
	MOVLW       244
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1008:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
;main_menu.c,310 :: 		COUNTER==149||COUNTER==181||COUNTER==213||COUNTER==245||
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1009
	MOVLW       149
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1009:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1010
	MOVLW       181
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1010:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1011
	MOVLW       213
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1011:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1012
	MOVLW       245
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1012:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
;main_menu.c,311 :: 		COUNTER==150||COUNTER==182||COUNTER==214||COUNTER==246||
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1013
	MOVLW       150
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1013:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1014
	MOVLW       182
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1014:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1015
	MOVLW       214
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1015:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1016
	MOVLW       246
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1016:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
;main_menu.c,312 :: 		COUNTER==151||COUNTER==183||COUNTER==215||COUNTER==247)
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1017
	MOVLW       151
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1017:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1018
	MOVLW       183
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1018:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1019
	MOVLW       215
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1019:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1020
	MOVLW       247
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1020:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START798
	GOTO        L_ANALYSIS_START609
L__ANALYSIS_START798:
;main_menu.c,314 :: 		colour_function =COUNTER & 0xf0;
	MOVLW       240
	ANDWF       ANALYSIS_START_counter_L0+0, 0 
	MOVWF       R1 
	MOVF        R1, 0 
	MOVWF       _colour_function+0 
;main_menu.c,315 :: 		if (colour_function==0x90 || colour_function==0xB0 || colour_function==0xD0 ||
	MOVF        R1, 0 
	XORLW       144
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START797
	MOVF        _colour_function+0, 0 
	XORLW       176
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START797
	MOVF        _colour_function+0, 0 
	XORLW       208
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START797
;main_menu.c,316 :: 		colour_function==0xF0)
	MOVF        _colour_function+0, 0 
	XORLW       240
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START797
	GOTO        L_ANALYSIS_START612
L__ANALYSIS_START797:
;main_menu.c,318 :: 		cls();
	CALL        _cls+0, 0
;main_menu.c,319 :: 		colour_function=counter;
	MOVF        ANALYSIS_START_counter_L0+0, 0 
	MOVWF       _colour_function+0 
;main_menu.c,320 :: 		inttostr(colour_function,text11);
	MOVF        ANALYSIS_START_counter_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVLW       0
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _text11+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;main_menu.c,321 :: 		lcd_out(1,1,text11);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _text11+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main_menu.c,322 :: 		delay_ms(500);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_ANALYSIS_START613:
	DECFSZ      R13, 1, 1
	BRA         L_ANALYSIS_START613
	DECFSZ      R12, 1, 1
	BRA         L_ANALYSIS_START613
	DECFSZ      R11, 1, 1
	BRA         L_ANALYSIS_START613
	NOP
;main_menu.c,323 :: 		while(ok_button()==1);
L_ANALYSIS_START614:
	CALL        _OK_button+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_ANALYSIS_START615
	GOTO        L_ANALYSIS_START614
L_ANALYSIS_START615:
;main_menu.c,324 :: 		}
L_ANALYSIS_START612:
;main_menu.c,325 :: 		clour+=1;
	INFSNZ      ANALYSIS_START_clour_L0+0, 1 
	INCF        ANALYSIS_START_clour_L0+1, 1 
;main_menu.c,326 :: 		stich+=1;
	MOVLW       1
	ADDWF       ANALYSIS_START_stich_L0+0, 1 
	MOVLW       0
	ADDWFC      ANALYSIS_START_stich_L0+1, 1 
	ADDWFC      ANALYSIS_START_stich_L0+2, 1 
	ADDWFC      ANALYSIS_START_stich_L0+3, 1 
;main_menu.c,327 :: 		chaking_stich_length();
	CALL        _chaking_stich_length+0, 0
;main_menu.c,328 :: 		COUNTER=read_data(++wadd);
	INFSNZ      _wadd+0, 1 
	INCF        _wadd+1, 1 
	MOVF        _wadd+0, 0 
	MOVWF       FARG_read_data_wadd+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_read_data_wadd+1 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	MOVWF       ANALYSIS_START_counter_L0+0 
	MOVLW       0
	MOVWF       ANALYSIS_START_counter_L0+1 
;main_menu.c,329 :: 		}
	GOTO        L_ANALYSIS_START616
L_ANALYSIS_START609:
;main_menu.c,331 :: 		else if (COUNTER==132||COUNTER==164||COUNTER==196||COUNTER==228 ||
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1021
	MOVLW       132
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1021:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START796
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1022
	MOVLW       164
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1022:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START796
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1023
	MOVLW       196
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1023:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START796
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1024
	MOVLW       228
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1024:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START796
;main_menu.c,332 :: 		COUNTER==130||COUNTER==162||COUNTER==194||COUNTER==226)
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1025
	MOVLW       130
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1025:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START796
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1026
	MOVLW       162
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1026:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START796
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1027
	MOVLW       194
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1027:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START796
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1028
	MOVLW       226
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1028:
	BTFSC       STATUS+0, 2 
	GOTO        L__ANALYSIS_START796
	GOTO        L_ANALYSIS_START619
L__ANALYSIS_START796:
;main_menu.c,334 :: 		CLS();
	CALL        _cls+0, 0
;main_menu.c,335 :: 		inttostr(counter,text11);
	MOVF        ANALYSIS_START_counter_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        ANALYSIS_START_counter_L0+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       _text11+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;main_menu.c,336 :: 		lcd_out(1,1,text11);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _text11+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main_menu.c,337 :: 		delay_ms(500);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_ANALYSIS_START620:
	DECFSZ      R13, 1, 1
	BRA         L_ANALYSIS_START620
	DECFSZ      R12, 1, 1
	BRA         L_ANALYSIS_START620
	DECFSZ      R11, 1, 1
	BRA         L_ANALYSIS_START620
	NOP
;main_menu.c,338 :: 		while(ok_button()==1);
L_ANALYSIS_START621:
	CALL        _OK_button+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_ANALYSIS_START622
	GOTO        L_ANALYSIS_START621
L_ANALYSIS_START622:
;main_menu.c,339 :: 		stich+=1;
	MOVLW       1
	ADDWF       ANALYSIS_START_stich_L0+0, 1 
	MOVLW       0
	ADDWFC      ANALYSIS_START_stich_L0+1, 1 
	ADDWFC      ANALYSIS_START_stich_L0+2, 1 
	ADDWFC      ANALYSIS_START_stich_L0+3, 1 
;main_menu.c,340 :: 		chaking_stich_length();
	CALL        _chaking_stich_length+0, 0
;main_menu.c,341 :: 		COUNTER=read_data(++wadd);
	INFSNZ      _wadd+0, 1 
	INCF        _wadd+1, 1 
	MOVF        _wadd+0, 0 
	MOVWF       FARG_read_data_wadd+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_read_data_wadd+1 
	MOVLW       0
	MOVWF       FARG_read_data_wadd+2 
	MOVWF       FARG_read_data_wadd+3 
	CALL        _read_data+0, 0
	MOVF        R0, 0 
	MOVWF       ANALYSIS_START_counter_L0+0 
	MOVLW       0
	MOVWF       ANALYSIS_START_counter_L0+1 
;main_menu.c,342 :: 		}
	GOTO        L_ANALYSIS_START623
L_ANALYSIS_START619:
;main_menu.c,344 :: 		else if (COUNTER==248){
	MOVLW       0
	XORWF       ANALYSIS_START_counter_L0+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__ANALYSIS_START1029
	MOVLW       248
	XORWF       ANALYSIS_START_counter_L0+0, 0 
L__ANALYSIS_START1029:
	BTFSS       STATUS+0, 2 
	GOTO        L_ANALYSIS_START624
;main_menu.c,346 :: 		cls();
	CALL        _cls+0, 0
;main_menu.c,347 :: 		longtostr(stich,text11);
	MOVF        ANALYSIS_START_stich_L0+0, 0 
	MOVWF       FARG_LongToStr_input+0 
	MOVF        ANALYSIS_START_stich_L0+1, 0 
	MOVWF       FARG_LongToStr_input+1 
	MOVF        ANALYSIS_START_stich_L0+2, 0 
	MOVWF       FARG_LongToStr_input+2 
	MOVF        ANALYSIS_START_stich_L0+3, 0 
	MOVWF       FARG_LongToStr_input+3 
	MOVLW       _text11+0
	MOVWF       FARG_LongToStr_output+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_LongToStr_output+1 
	CALL        _LongToStr+0, 0
;main_menu.c,348 :: 		LCD_OUT(1,4,TEXT11);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _text11+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main_menu.c,349 :: 		LCD_OUT(1,1,"Stich:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr24_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr24_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main_menu.c,350 :: 		longtostr(stop,text11);
	MOVF        ANALYSIS_START_stop_L0+0, 0 
	MOVWF       FARG_LongToStr_input+0 
	MOVF        ANALYSIS_START_stop_L0+1, 0 
	MOVWF       FARG_LongToStr_input+1 
	MOVLW       0
	MOVWF       FARG_LongToStr_input+2 
	MOVWF       FARG_LongToStr_input+3 
	MOVLW       _text11+0
	MOVWF       FARG_LongToStr_output+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_LongToStr_output+1 
	CALL        _LongToStr+0, 0
;main_menu.c,351 :: 		sprintf(text11,"%1u",stop);
	MOVLW       _text11+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_25_RPM_32STEPPER+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_25_RPM_32STEPPER+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_25_RPM_32STEPPER+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        ANALYSIS_START_stop_L0+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        ANALYSIS_START_stop_L0+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	CALL        _sprintf+0, 0
;main_menu.c,352 :: 		LCD_OUT(2,6,TEXT11);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       6
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _text11+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main_menu.c,353 :: 		LCD_OUT(2,1,"Stop:");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr26_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr26_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main_menu.c,354 :: 		longtostr(trim,text11);
	MOVF        ANALYSIS_START_trim_L0+0, 0 
	MOVWF       FARG_LongToStr_input+0 
	MOVF        ANALYSIS_START_trim_L0+1, 0 
	MOVWF       FARG_LongToStr_input+1 
	MOVLW       0
	MOVWF       FARG_LongToStr_input+2 
	MOVWF       FARG_LongToStr_input+3 
	MOVLW       _text11+0
	MOVWF       FARG_LongToStr_output+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_LongToStr_output+1 
	CALL        _LongToStr+0, 0
;main_menu.c,355 :: 		sprintf(text11,"%1u",trim);
	MOVLW       _text11+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_27_RPM_32STEPPER+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_27_RPM_32STEPPER+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_27_RPM_32STEPPER+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        ANALYSIS_START_trim_L0+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        ANALYSIS_START_trim_L0+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	CALL        _sprintf+0, 0
;main_menu.c,356 :: 		LCD_OUT(2,13,TEXT11);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       13
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _text11+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main_menu.c,357 :: 		LCD_OUT(2,8,"Trim:");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       8
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr28_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr28_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main_menu.c,358 :: 		longtostr(clour,text11);
	MOVF        ANALYSIS_START_clour_L0+0, 0 
	MOVWF       FARG_LongToStr_input+0 
	MOVF        ANALYSIS_START_clour_L0+1, 0 
	MOVWF       FARG_LongToStr_input+1 
	MOVLW       0
	MOVWF       FARG_LongToStr_input+2 
	MOVWF       FARG_LongToStr_input+3 
	MOVLW       _text11+0
	MOVWF       FARG_LongToStr_output+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_LongToStr_output+1 
	CALL        _LongToStr+0, 0
;main_menu.c,359 :: 		LCD_OUT(1,21,TEXT11);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       21
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _text11+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main_menu.c,360 :: 		LCD_OUT(1,17,"Clours:");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       17
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr29_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr29_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main_menu.c,361 :: 		while(ok_button()==1);
L_ANALYSIS_START625:
	CALL        _OK_button+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_ANALYSIS_START626
	GOTO        L_ANALYSIS_START625
L_ANALYSIS_START626:
;main_menu.c,362 :: 		return 'K';
	MOVLW       75
	MOVWF       R0 
	GOTO        L_end_ANALYSIS_START
;main_menu.c,363 :: 		}
L_ANALYSIS_START624:
;main_menu.c,367 :: 		CLS();
	CALL        _cls+0, 0
;main_menu.c,368 :: 		INTtostr(COUNTER,array_1);
	MOVF        ANALYSIS_START_counter_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        ANALYSIS_START_counter_L0+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       ANALYSIS_START_array_1_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(ANALYSIS_START_array_1_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;main_menu.c,369 :: 		lcd_out(1,9,array_1);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       9
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ANALYSIS_START_array_1_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(ANALYSIS_START_array_1_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main_menu.c,370 :: 		lcd_out(1,1,"FUNCTION");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr30_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr30_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main_menu.c,372 :: 		INTtostr(stich,array_1);
	MOVF        ANALYSIS_START_stich_L0+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        ANALYSIS_START_stich_L0+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       ANALYSIS_START_array_1_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(ANALYSIS_START_array_1_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;main_menu.c,373 :: 		lcd_out(2,7,array_1);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       7
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ANALYSIS_START_array_1_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(ANALYSIS_START_array_1_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main_menu.c,374 :: 		LCD_OUT(2,1,"STICH#");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr31_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr31_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main_menu.c,376 :: 		INTtostr(wadd,array_1);
	MOVF        _wadd+0, 0 
	MOVWF       FARG_IntToStr_input+0 
	MOVF        _wadd+1, 0 
	MOVWF       FARG_IntToStr_input+1 
	MOVLW       ANALYSIS_START_array_1_L0+0
	MOVWF       FARG_IntToStr_output+0 
	MOVLW       hi_addr(ANALYSIS_START_array_1_L0+0)
	MOVWF       FARG_IntToStr_output+1 
	CALL        _IntToStr+0, 0
;main_menu.c,377 :: 		lcd_out(1,18,array_1);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       18
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ANALYSIS_START_array_1_L0+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(ANALYSIS_START_array_1_L0+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main_menu.c,378 :: 		LCD_OUT(1,17,"C");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       17
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr32_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr32_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;main_menu.c,379 :: 		while(ok_button()==1);
L_ANALYSIS_START628:
	CALL        _OK_button+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_ANALYSIS_START629
	GOTO        L_ANALYSIS_START628
L_ANALYSIS_START629:
;main_menu.c,380 :: 		CLS();
	CALL        _cls+0, 0
;main_menu.c,381 :: 		return 'B';
	MOVLW       66
	MOVWF       R0 
	GOTO        L_end_ANALYSIS_START
;main_menu.c,382 :: 		}
L_ANALYSIS_START623:
L_ANALYSIS_START616:
L_ANALYSIS_START606:
L_ANALYSIS_START602:
L_ANALYSIS_START598:
L_ANALYSIS_START594:
L_ANALYSIS_START590:
L_ANALYSIS_START586:
;main_menu.c,383 :: 		}
	GOTO        L_ANALYSIS_START580
;main_menu.c,384 :: 		}
L_end_ANALYSIS_START:
	RETURN      0
; end of _ANALYSIS_START

_display_edit:

;main_menu.c,396 :: 		void display_edit(char position_of_cursor)
;main_menu.c,398 :: 		cls();
	CALL        _cls+0, 0
;main_menu.c,399 :: 		if (position_of_cursor==1)
	MOVF        FARG_display_edit_position_of_cursor+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_display_edit630
;main_menu.c,401 :: 		current_msg=1;
	MOVLW       1
	MOVWF       _current_msg+0 
;main_menu.c,402 :: 		}
	GOTO        L_display_edit631
L_display_edit630:
;main_menu.c,403 :: 		else if (position_of_cursor==2)
	MOVF        FARG_display_edit_position_of_cursor+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_display_edit632
;main_menu.c,405 :: 		current_msg=2;
	MOVLW       2
	MOVWF       _current_msg+0 
;main_menu.c,406 :: 		}
	GOTO        L_display_edit633
L_display_edit632:
;main_menu.c,407 :: 		else if (position_of_cursor==3)
	MOVF        FARG_display_edit_position_of_cursor+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_display_edit634
;main_menu.c,409 :: 		current_msg=3;
	MOVLW       3
	MOVWF       _current_msg+0 
;main_menu.c,410 :: 		}
	GOTO        L_display_edit635
L_display_edit634:
;main_menu.c,411 :: 		else if (position_of_cursor==4)
	MOVF        FARG_display_edit_position_of_cursor+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_display_edit636
;main_menu.c,413 :: 		current_msg=4;
	MOVLW       4
	MOVWF       _current_msg+0 
;main_menu.c,414 :: 		}
L_display_edit636:
L_display_edit635:
L_display_edit633:
L_display_edit631:
;main_menu.c,415 :: 		cls();
	CALL        _cls+0, 0
;main_menu.c,416 :: 		if (position_of_cursor==3)
	MOVF        FARG_display_edit_position_of_cursor+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_display_edit637
;main_menu.c,418 :: 		CustomChar(1,17);
	MOVLW       1
	MOVWF       FARG_CustomChar_pos_row+0 
	MOVLW       17
	MOVWF       FARG_CustomChar_pos_char+0 
	CALL        _CustomChar+0, 0
;main_menu.c,419 :: 		}
	GOTO        L_display_edit638
L_display_edit637:
;main_menu.c,420 :: 		else if (position_of_cursor==4)
	MOVF        FARG_display_edit_position_of_cursor+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_display_edit639
;main_menu.c,422 :: 		CustomChar(2,17);
	MOVLW       2
	MOVWF       FARG_CustomChar_pos_row+0 
	MOVLW       17
	MOVWF       FARG_CustomChar_pos_char+0 
	CALL        _CustomChar+0, 0
;main_menu.c,423 :: 		}
	GOTO        L_display_edit640
L_display_edit639:
;main_menu.c,424 :: 		else CustomChar(position_of_cursor,1);
	MOVF        FARG_display_edit_position_of_cursor+0, 0 
	MOVWF       FARG_CustomChar_pos_row+0 
	MOVLW       1
	MOVWF       FARG_CustomChar_pos_char+0 
	CALL        _CustomChar+0, 0
L_display_edit640:
L_display_edit638:
;main_menu.c,425 :: 		LCD_OUT(1,2,CopyConst2Ram(MSG,panel_setting));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _panel_setting+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_panel_setting+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_panel_setting+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;main_menu.c,426 :: 		LCD_OUT(2,2,CopyConst2Ram(MSG,z_motor_setting));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _z_motor_setting+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_z_motor_setting+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_z_motor_setting+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;main_menu.c,427 :: 		LCD_OUT(1,18,CopyConst2Ram(MSG,rever_forward));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _rever_forward+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_rever_forward+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_rever_forward+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       18
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;main_menu.c,428 :: 		LCD_OUT(2,18,CopyConst2Ram(MSG,cancel));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _cancel+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_cancel+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_cancel+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       18
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;main_menu.c,429 :: 		}
L_end_display_edit:
	RETURN      0
; end of _display_edit

_edit_menu:

;main_menu.c,433 :: 		void edit_menu()
;main_menu.c,436 :: 		display_edit(1);
	MOVLW       1
	MOVWF       FARG_display_edit_position_of_cursor+0 
	CALL        _display_edit+0, 0
;main_menu.c,437 :: 		while(start_button()==0);
L_edit_menu641:
	CALL        _start_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_edit_menu642
	GOTO        L_edit_menu641
L_edit_menu642:
;main_menu.c,438 :: 		do
L_edit_menu643:
;main_menu.c,440 :: 		current_msg=errow_show();
	CALL        _errow_show+0, 0
	MOVF        R0, 0 
	MOVWF       _current_msg+0 
;main_menu.c,441 :: 		if (ok_button_1()==0)
	CALL        _OK_button_1+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_edit_menu646
;main_menu.c,443 :: 		if (current_msg==1)
	MOVF        _current_msg+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_edit_menu647
;main_menu.c,445 :: 		cls();
	CALL        _cls+0, 0
;main_menu.c,446 :: 		DISPLAY_M01();
	CALL        _display_m01+0, 0
;main_menu.c,447 :: 		frame_position();
	CALL        _frame_position+0, 0
;main_menu.c,448 :: 		display_edit(current_msg);
	MOVF        _current_msg+0, 0 
	MOVWF       FARG_display_edit_position_of_cursor+0 
	CALL        _display_edit+0, 0
;main_menu.c,449 :: 		}
L_edit_menu647:
;main_menu.c,450 :: 		if (current_msg==2)
	MOVF        _current_msg+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_edit_menu648
;main_menu.c,452 :: 		cls();
	CALL        _cls+0, 0
;main_menu.c,453 :: 		LCD_OUT(2,2,CopyConst2Ram(MSG,z_motor_setting));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _z_motor_setting+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_z_motor_setting+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_z_motor_setting+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;main_menu.c,454 :: 		SN_5_REACHED();
	CALL        _SN_5_REACHED+0, 0
;main_menu.c,456 :: 		display_edit(current_msg);
	MOVF        _current_msg+0, 0 
	MOVWF       FARG_display_edit_position_of_cursor+0 
	CALL        _display_edit+0, 0
;main_menu.c,457 :: 		}
L_edit_menu648:
;main_menu.c,458 :: 		if (current_msg==3)
	MOVF        _current_msg+0, 0 
	XORLW       3
	BTFSS       STATUS+0, 2 
	GOTO        L_edit_menu649
;main_menu.c,460 :: 		cls();
	CALL        _cls+0, 0
;main_menu.c,461 :: 		LCD_OUT(1,2,CopyConst2Ram(MSG,rever_forward));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _rever_forward+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_rever_forward+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_rever_forward+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;main_menu.c,462 :: 		required_stich();
	CALL        _required_stich+0, 0
;main_menu.c,463 :: 		display_edit(current_msg);
	MOVF        _current_msg+0, 0 
	MOVWF       FARG_display_edit_position_of_cursor+0 
	CALL        _display_edit+0, 0
;main_menu.c,464 :: 		}
L_edit_menu649:
;main_menu.c,465 :: 		if (current_msg==4)
	MOVF        _current_msg+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_edit_menu650
;main_menu.c,467 :: 		cls();
	CALL        _cls+0, 0
;main_menu.c,468 :: 		LCD_OUT(1,2,CopyConst2Ram(MSG,ARE_U_SURE));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _ARE_U_SURE+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_ARE_U_SURE+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_ARE_U_SURE+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;main_menu.c,469 :: 		LCD_OUT(2,17,CopyConst2Ram(MSG,YES));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _YES+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_YES+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_YES+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       17
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;main_menu.c,470 :: 		LCD_OUT(2,32-2,CopyConst2Ram(MSG,NO));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _NO+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_NO+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_NO+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       30
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;main_menu.c,471 :: 		while(1)
L_edit_menu651:
;main_menu.c,473 :: 		if (start_button()==0)
	CALL        _start_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_edit_menu653
;main_menu.c,476 :: 		reset
	RESET
;main_menu.c,478 :: 		}
	GOTO        L_edit_menu654
L_edit_menu653:
;main_menu.c,479 :: 		else if (back_button()==0)
	CALL        _back_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_edit_menu655
;main_menu.c,481 :: 		break;
	GOTO        L_edit_menu652
;main_menu.c,482 :: 		}
L_edit_menu655:
L_edit_menu654:
;main_menu.c,483 :: 		}
	GOTO        L_edit_menu651
L_edit_menu652:
;main_menu.c,484 :: 		}
L_edit_menu650:
;main_menu.c,485 :: 		}
L_edit_menu646:
;main_menu.c,486 :: 		}while (back_button()==1);
	CALL        _back_button+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_edit_menu643
;main_menu.c,487 :: 		cls();
	CALL        _cls+0, 0
;main_menu.c,488 :: 		}
L_end_edit_menu:
	RETURN      0
; end of _edit_menu

_machine_started:

;machine_start_fun.c,2 :: 		void machine_started()
;machine_start_fun.c,7 :: 		Timer0_Intit();
	CALL        _timer0_Intit+0, 0
;machine_start_fun.c,8 :: 		Timer1_Init();
	CALL        _Timer1_init+0, 0
;machine_start_fun.c,9 :: 		Timer3_Init();
	CALL        _timer3_init+0, 0
;machine_start_fun.c,11 :: 		TIMER0_EN(1);
	MOVLW       1
	MOVWF       FARG_TIMER0_EN_x+0 
	CALL        _TIMER0_EN+0, 0
;machine_start_fun.c,12 :: 		Timer1_Enable();
	CALL        _Timer1_Enable+0, 0
;machine_start_fun.c,13 :: 		Timer3_Enable();
	CALL        _timer3_enable+0, 0
;machine_start_fun.c,15 :: 		EXTINT0(0);
	CLRF        FARG_EXTINT0_x+0 
	CALL        _EXTINT0+0, 0
;machine_start_fun.c,16 :: 		INT0EDG(0);
	CLRF        FARG_INT0EDG_x+0 
	CALL        _INT0EDG+0, 0
;machine_start_fun.c,17 :: 		Enable_intr();
	CALL        _Enable_intr+0, 0
;machine_start_fun.c,22 :: 		Clk_x=0;         //initialation of clk pin
	BCF         LATF+0, 3 
;machine_start_fun.c,23 :: 		Clk_y=0;         //initialation of clk pin
	BCF         LATF+0, 1 
;machine_start_fun.c,24 :: 		Clk_Z=0;         //initialation of clk pin
	BCF         LATF+0, 5 
;machine_start_fun.c,25 :: 		delay_us(2);
	MOVLW       6
	MOVWF       R13, 0
L_machine_started656:
	DECFSZ      R13, 1, 1
	BRA         L_machine_started656
	NOP
;machine_start_fun.c,26 :: 		Dir_x=0;         //initialation of Direction of motor
	BCF         LATF+0, 2 
;machine_start_fun.c,27 :: 		Dir_y=0;         //initialation of Direction of motor
	BCF         LATF+0, 0 
;machine_start_fun.c,28 :: 		Dir_Z=0;         //initialation of Direction of motor
	BCF         LATF+0, 4 
;machine_start_fun.c,30 :: 		end_of_jump='S',break_flag_internal='O'; // 'S'= START 'F'OFF 'O'=ON
	MOVLW       83
	MOVWF       _end_of_jump+0 
	MOVLW       79
	MOVWF       _break_flag_internal+0 
;machine_start_fun.c,31 :: 		menu_flag=0;
	CLRF        _menu_flag+0 
;machine_start_fun.c,32 :: 		monitor_1=0;
	CLRF        _monitor_1+0 
;machine_start_fun.c,33 :: 		WADD=513;
	MOVLW       1
	MOVWF       _wadd+0 
	MOVLW       2
	MOVWF       _wadd+1 
;machine_start_fun.c,34 :: 		stich_dis=WADD;
	MOVLW       1
	MOVWF       _stich_dis+0 
	MOVLW       2
	MOVWF       _stich_dis+1 
	MOVLW       0
	MOVWF       _stich_dis+2 
	MOVWF       _stich_dis+3 
;machine_start_fun.c,35 :: 		stich_dis-=513;
	CLRF        _stich_dis+0 
	CLRF        _stich_dis+1 
	CLRF        _stich_dis+2 
	CLRF        _stich_dis+3 
;machine_start_fun.c,36 :: 		stich_dis/=3.0;
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	CALL        _longint2double+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       64
	MOVWF       R6 
	MOVLW       128
	MOVWF       R7 
	CALL        _Div_32x32_FP+0, 0
	CALL        _double2longint+0, 0
	MOVF        R0, 0 
	MOVWF       _stich_dis+0 
	MOVF        R1, 0 
	MOVWF       _stich_dis+1 
	MOVF        R2, 0 
	MOVWF       _stich_dis+2 
	MOVF        R3, 0 
	MOVWF       _stich_dis+3 
;machine_start_fun.c,37 :: 		XX=0;
	CLRF        _XX+0 
	CLRF        _XX+1 
;machine_start_fun.c,38 :: 		YY=0;
	CLRF        _YY+0 
	CLRF        _YY+1 
;machine_start_fun.c,39 :: 		ZZ=0;
	CLRF        _ZZ+0 
	CLRF        _ZZ+1 
;machine_start_fun.c,43 :: 		do
L_machine_started657:
;machine_start_fun.c,45 :: 		GET_DATA();
	CALL        _GET_DATA+0, 0
;machine_start_fun.c,46 :: 		if (function!=248)
	MOVF        _function+0, 0 
	XORLW       248
	BTFSC       STATUS+0, 2 
	GOTO        L_machine_started660
;machine_start_fun.c,48 :: 		function_id=GET_DEGREE();  //***GET DEGREE
	CALL        _GET_DEGREE+0, 0
	MOVF        R0, 0 
	MOVWF       machine_started_function_id_L0+0 
;machine_start_fun.c,49 :: 		function_id_back_start=function_id;
	MOVF        R0, 0 
	MOVWF       _function_id_back_start+0 
;machine_start_fun.c,50 :: 		GET_RPM();
	CALL        _Get_RPM+0, 0
;machine_start_fun.c,52 :: 		if (function_id==0)
	MOVF        machine_started_function_id_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started661
;machine_start_fun.c,54 :: 		while(Main_SENSOR==1)
L_machine_started662:
	BTFSS       PORTB+0, 0 
	GOTO        L_machine_started663
;machine_start_fun.c,56 :: 		if (menu_flag==1) break;
	MOVF        _menu_flag+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started664
	GOTO        L_machine_started663
L_machine_started664:
;machine_start_fun.c,57 :: 		}
	GOTO        L_machine_started662
L_machine_started663:
;machine_start_fun.c,62 :: 		while(Main_SENSOR_2==1)
L_machine_started665:
	BTFSS       PORTC+0, 0 
	GOTO        L_machine_started666
;machine_start_fun.c,64 :: 		if (menu_flag==1) break;
	MOVF        _menu_flag+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started667
	GOTO        L_machine_started666
L_machine_started667:
;machine_start_fun.c,65 :: 		}
	GOTO        L_machine_started665
L_machine_started666:
;machine_start_fun.c,66 :: 		}
	GOTO        L_machine_started668
L_machine_started661:
;machine_start_fun.c,67 :: 		else if (function_id==2)  // funtion id 2 colours
	MOVF        machine_started_function_id_L0+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started669
;machine_start_fun.c,69 :: 		speed_riser=0;
	CLRF        _speed_riser+0 
;machine_start_fun.c,70 :: 		PWM1_Set_Duty(MAIN_MOTOR_LO_SPPED);
	MOVLW       50
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;machine_start_fun.c,71 :: 		cls();
	CALL        _cls+0, 0
;machine_start_fun.c,72 :: 		LCD_OUT(1,1,CopyConst2Ram(MSG,thread_position));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       machine_started_thread_position_L0+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(machine_started_thread_position_L0+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(machine_started_thread_position_L0+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;machine_start_fun.c,73 :: 		LCD_OUT(2,1,CopyConst2Ram(MSG,colour));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _colour+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_colour+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_colour+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;machine_start_fun.c,74 :: 		SN_5_REACHED();
	CALL        _SN_5_REACHED+0, 0
;machine_start_fun.c,75 :: 		cls();
	CALL        _cls+0, 0
;machine_start_fun.c,76 :: 		back_display();
	CALL        _back_display+0, 0
;machine_start_fun.c,77 :: 		Edit_Menu_dis();
	CALL        _Edit_Menu_dis+0, 0
;machine_start_fun.c,78 :: 		while(1)
L_machine_started670:
;machine_start_fun.c,80 :: 		if (ok_button_1()==0)
	CALL        _OK_button_1+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started672
;machine_start_fun.c,82 :: 		while(ok_button_1()==0);
L_machine_started673:
	CALL        _OK_button_1+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started674
	GOTO        L_machine_started673
L_machine_started674:
;machine_start_fun.c,83 :: 		edit_menu();
	CALL        _edit_menu+0, 0
;machine_start_fun.c,84 :: 		}
	GOTO        L_machine_started675
L_machine_started672:
;machine_start_fun.c,85 :: 		else if (back_button()==0)
	CALL        _back_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started676
;machine_start_fun.c,87 :: 		break;
	GOTO        L_machine_started671
;machine_start_fun.c,88 :: 		}
L_machine_started676:
L_machine_started675:
;machine_start_fun.c,89 :: 		}
	GOTO        L_machine_started670
L_machine_started671:
;machine_start_fun.c,90 :: 		cls();
	CALL        _cls+0, 0
;machine_start_fun.c,91 :: 		if (function_id_back_start==0 && back_start=='S')
	MOVF        _function_id_back_start+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started679
	MOVF        _back_start+0, 0 
	XORLW       83
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started679
L__machine_started808:
;machine_start_fun.c,93 :: 		break_oFF();
	CALL        _break_off+0, 0
;machine_start_fun.c,94 :: 		}
L_machine_started679:
;machine_start_fun.c,95 :: 		}
	GOTO        L_machine_started680
L_machine_started669:
;machine_start_fun.c,98 :: 		speed_riser=0;
	CLRF        _speed_riser+0 
;machine_start_fun.c,99 :: 		PWM1_Set_Duty(MAIN_MOTOR_LO_SPPED);
	MOVLW       50
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;machine_start_fun.c,100 :: 		}
L_machine_started680:
L_machine_started668:
;machine_start_fun.c,103 :: 		Main_shaft_ACK=0;
	CLRF        _Main_shaft_ACK+0 
;machine_start_fun.c,104 :: 		INTCON&=~(1<<INT0IF);
	BCF         INTCON+0, 1 
;machine_start_fun.c,105 :: 		EXTINT0(1);
	MOVLW       1
	MOVWF       FARG_EXTINT0_x+0 
	CALL        _EXTINT0+0, 0
;machine_start_fun.c,106 :: 		Running();
	CALL        _Running+0, 0
;machine_start_fun.c,108 :: 		longtostr(stich_dis,text11);
	MOVF        _stich_dis+0, 0 
	MOVWF       FARG_LongToStr_input+0 
	MOVF        _stich_dis+1, 0 
	MOVWF       FARG_LongToStr_input+1 
	MOVF        _stich_dis+2, 0 
	MOVWF       FARG_LongToStr_input+2 
	MOVF        _stich_dis+3, 0 
	MOVWF       FARG_LongToStr_input+3 
	MOVLW       _text11+0
	MOVWF       FARG_LongToStr_output+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_LongToStr_output+1 
	CALL        _LongToStr+0, 0
;machine_start_fun.c,109 :: 		LCD_OUT(1,1,TEXT11);
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _text11+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_text11+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;machine_start_fun.c,110 :: 		stich_dis++;
	MOVLW       1
	ADDWF       _stich_dis+0, 1 
	MOVLW       0
	ADDWFC      _stich_dis+1, 1 
	ADDWFC      _stich_dis+2, 1 
	ADDWFC      _stich_dis+3, 1 
;machine_start_fun.c,111 :: 		if (up_pin==0)
	BTFSC       PORTB+0, 4 
	GOTO        L_machine_started681
;machine_start_fun.c,113 :: 		if (current_speed>MAIN_MOTOR_HI_SPPED)
	MOVF        _current_speed+0, 0 
	SUBLW       5
	BTFSC       STATUS+0, 0 
	GOTO        L_machine_started682
;machine_start_fun.c,115 :: 		current_speed--;
	DECF        _current_speed+0, 1 
;machine_start_fun.c,116 :: 		PWM1_Set_Duty(current_speed);
	MOVF        _current_speed+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;machine_start_fun.c,117 :: 		}
L_machine_started682:
;machine_start_fun.c,118 :: 		}
	GOTO        L_machine_started683
L_machine_started681:
;machine_start_fun.c,119 :: 		else if (down_pin==0)
	BTFSC       PORTB+0, 5 
	GOTO        L_machine_started684
;machine_start_fun.c,121 :: 		if(current_speed<=MAIN_MOTOR_LO_SPPED)
	MOVF        _current_speed+0, 0 
	SUBLW       50
	BTFSS       STATUS+0, 0 
	GOTO        L_machine_started685
;machine_start_fun.c,123 :: 		current_speed++;
	INCF        _current_speed+0, 1 
;machine_start_fun.c,124 :: 		PWM1_Set_Duty(current_speed);
	MOVF        _current_speed+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;machine_start_fun.c,126 :: 		}
L_machine_started685:
;machine_start_fun.c,127 :: 		}
L_machine_started684:
L_machine_started683:
;machine_start_fun.c,128 :: 		while(x_complite==0);
L_machine_started686:
	MOVF        _x_complite+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started687
	GOTO        L_machine_started686
L_machine_started687:
;machine_start_fun.c,129 :: 		while(y_complite==0);
L_machine_started688:
	MOVF        _y_complite+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started689
	GOTO        L_machine_started688
L_machine_started689:
;machine_start_fun.c,144 :: 		while(z_complite==0);
L_machine_started690:
	MOVF        _z_complite+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started691
	GOTO        L_machine_started690
L_machine_started691:
;machine_start_fun.c,145 :: 		Main_shaft_ACK=0;
	CLRF        _Main_shaft_ACK+0 
;machine_start_fun.c,146 :: 		EXTINT0(0);
	CLRF        FARG_EXTINT0_x+0 
	CALL        _EXTINT0+0, 0
;machine_start_fun.c,148 :: 		if (function_id==0)
	MOVF        machine_started_function_id_L0+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started692
;machine_start_fun.c,150 :: 		if (t_pin==1 && t_pin_2==0)
	BTFSS       PORTE+0, 7 
	GOTO        L_machine_started695
	BTFSC       PORTC+0, 1 
	GOTO        L_machine_started695
L__machine_started807:
;machine_start_fun.c,152 :: 		break_on();
	CALL        _break_on+0, 0
;machine_start_fun.c,153 :: 		PWM1_Set_Duty(MAIN_MOTOR_LO_SPPED);
	MOVLW       50
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;machine_start_fun.c,154 :: 		speed_riser=0;
	CLRF        _speed_riser+0 
;machine_start_fun.c,155 :: 		cls();
	CALL        _cls+0, 0
;machine_start_fun.c,156 :: 		LCD_OUT(1,1,CopyConst2Ram(MSG,thread_position));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       machine_started_thread_position_L0+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(machine_started_thread_position_L0+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(machine_started_thread_position_L0+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;machine_start_fun.c,157 :: 		SN_5_REACHED();
	CALL        _SN_5_REACHED+0, 0
;machine_start_fun.c,158 :: 		cls();
	CALL        _cls+0, 0
;machine_start_fun.c,159 :: 		LCD_OUT(1,1,CopyConst2Ram(MSG,start_positoin));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       machine_started_start_positoin_L0+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(machine_started_start_positoin_L0+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(machine_started_start_positoin_L0+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;machine_start_fun.c,160 :: 		LCD_OUT(2,32-4,CopyConst2Ram(MSG,back));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _back+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_back+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_back+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       28
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;machine_start_fun.c,161 :: 		function_id_back_start=0; back_start='S';
	CLRF        _function_id_back_start+0 
	MOVLW       83
	MOVWF       _back_start+0 
;machine_start_fun.c,162 :: 		while(1)
L_machine_started696:
;machine_start_fun.c,164 :: 		if (ok_button()==0)
	CALL        _OK_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started698
;machine_start_fun.c,166 :: 		edit_menu();
	CALL        _edit_menu+0, 0
;machine_start_fun.c,173 :: 		}
L_machine_started698:
;machine_start_fun.c,174 :: 		if (back_button()==0)
	CALL        _back_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started699
;machine_start_fun.c,176 :: 		break;
	GOTO        L_machine_started697
;machine_start_fun.c,177 :: 		}
L_machine_started699:
;machine_start_fun.c,178 :: 		}
	GOTO        L_machine_started696
L_machine_started697:
;machine_start_fun.c,179 :: 		CLS();
	CALL        _cls+0, 0
;machine_start_fun.c,180 :: 		if (function_id_back_start==0 && back_start=='S')
	MOVF        _function_id_back_start+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started702
	MOVF        _back_start+0, 0 
	XORLW       83
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started702
L__machine_started806:
;machine_start_fun.c,182 :: 		break_oFF();
	CALL        _break_off+0, 0
;machine_start_fun.c,183 :: 		}
L_machine_started702:
;machine_start_fun.c,184 :: 		}
L_machine_started695:
;machine_start_fun.c,185 :: 		}
L_machine_started692:
;machine_start_fun.c,187 :: 		if (menu_flag==1)
	MOVF        _menu_flag+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started703
;machine_start_fun.c,189 :: 		speed_riser=0;
	CLRF        _speed_riser+0 
;machine_start_fun.c,190 :: 		PWM1_Set_Duty(MAIN_MOTOR_LO_SPPED);
	MOVLW       50
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;machine_start_fun.c,191 :: 		menu_flag=0;
	CLRF        _menu_flag+0 
;machine_start_fun.c,192 :: 		while(ok_button_1()==0);
L_machine_started704:
	CALL        _OK_button_1+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started705
	GOTO        L_machine_started704
L_machine_started705:
;machine_start_fun.c,195 :: 		edit_menu();
	CALL        _edit_menu+0, 0
;machine_start_fun.c,197 :: 		if (function_id_back_start==0 && back_start=='S')
	MOVF        _function_id_back_start+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started708
	MOVF        _back_start+0, 0 
	XORLW       83
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started708
L__machine_started805:
;machine_start_fun.c,199 :: 		break_oFF();
	CALL        _break_off+0, 0
;machine_start_fun.c,200 :: 		}
L_machine_started708:
;machine_start_fun.c,201 :: 		}
L_machine_started703:
;machine_start_fun.c,203 :: 		if (menu_pin==0)
	BTFSC       PORTB+0, 3 
	GOTO        L_machine_started709
;machine_start_fun.c,205 :: 		menu_flag=1;
	MOVLW       1
	MOVWF       _menu_flag+0 
;machine_start_fun.c,206 :: 		break_on();
	CALL        _break_on+0, 0
;machine_start_fun.c,207 :: 		}
L_machine_started709:
;machine_start_fun.c,208 :: 		}
L_machine_started660:
;machine_start_fun.c,210 :: 		if (speed_riser<stich_counting)
	MOVLW       4
	SUBWF       _speed_riser+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_machine_started710
;machine_start_fun.c,212 :: 		speed_riser++;
	INCF        _speed_riser+0, 1 
;machine_start_fun.c,213 :: 		}
	GOTO        L_machine_started711
L_machine_started710:
;machine_start_fun.c,216 :: 		PWM1_Set_Duty(current_speed);
	MOVF        _current_speed+0, 0 
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;machine_start_fun.c,217 :: 		}
L_machine_started711:
;machine_start_fun.c,218 :: 		} while(function!=248);
	MOVF        _function+0, 0 
	XORLW       248
	BTFSS       STATUS+0, 2 
	GOTO        L_machine_started657
;machine_start_fun.c,219 :: 		speed_riser=0;
	CLRF        _speed_riser+0 
;machine_start_fun.c,220 :: 		PWM1_Set_Duty(MAIN_MOTOR_LO_SPPED);
	MOVLW       50
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;machine_start_fun.c,221 :: 		Timer0_OFF();
	CALL        _Timer0_Off+0, 0
;machine_start_fun.c,222 :: 		Timer1_OFF();
	CALL        _Timer1_OFF+0, 0
;machine_start_fun.c,223 :: 		Timer3_OFF();
	CALL        _timer3_off+0, 0
;machine_start_fun.c,224 :: 		EXTINT0(0);
	CLRF        FARG_EXTINT0_x+0 
	CALL        _EXTINT0+0, 0
;machine_start_fun.c,225 :: 		break_on();
	CALL        _break_on+0, 0
;machine_start_fun.c,226 :: 		EN_OFF();
	CALL        _en_off+0, 0
;machine_start_fun.c,227 :: 		while(ok_button());
L_machine_started712:
	CALL        _OK_button+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_machine_started713
	GOTO        L_machine_started712
L_machine_started713:
;machine_start_fun.c,228 :: 		}
L_end_machine_started:
	RETURN      0
; end of _machine_started

_main:

;RPM STEPPER.c,213 :: 		void main()
;RPM STEPPER.c,215 :: 		char daa=0;
;RPM STEPPER.c,216 :: 		initial_main();
	CALL        _initial_main+0, 0
;RPM STEPPER.c,217 :: 		RELAY_ON();
	CALL        _relay_on+0, 0
;RPM STEPPER.c,218 :: 		EN_On();
	CALL        _en_on+0, 0
;RPM STEPPER.c,219 :: 		break_on();
	CALL        _break_on+0, 0
;RPM STEPPER.c,252 :: 		delay_ms(500);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main714:
	DECFSZ      R13, 1, 1
	BRA         L_main714
	DECFSZ      R12, 1, 1
	BRA         L_main714
	DECFSZ      R11, 1, 1
	BRA         L_main714
	NOP
;RPM STEPPER.c,253 :: 		RELAY_OFF();
	CALL        _relay_off+0, 0
;RPM STEPPER.c,254 :: 		EN_OFF();
	CALL        _en_off+0, 0
;RPM STEPPER.c,255 :: 		CLS();
	CALL        _cls+0, 0
;RPM STEPPER.c,271 :: 		LCD_OUT(1,5,CopyConst2Ram(MSG,WELCOM));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _WELCOM+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_WELCOM+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_WELCOM+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;RPM STEPPER.c,272 :: 		DELAY_MS(2000);
	MOVLW       102
	MOVWF       R11, 0
	MOVLW       118
	MOVWF       R12, 0
	MOVLW       193
	MOVWF       R13, 0
L_main715:
	DECFSZ      R13, 1, 1
	BRA         L_main715
	DECFSZ      R12, 1, 1
	BRA         L_main715
	DECFSZ      R11, 1, 1
	BRA         L_main715
;RPM STEPPER.c,273 :: 		CLS();
	CALL        _cls+0, 0
;RPM STEPPER.c,274 :: 		LCD_OUT(1,1,CopyConst2Ram(MSG,TXT_1));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _TXT_1+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_TXT_1+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_TXT_1+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;RPM STEPPER.c,275 :: 		LCD_OUT(2,1,CopyConst2Ram(MSG,TXT_2));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _TXT_2+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_TXT_2+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_TXT_2+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;RPM STEPPER.c,276 :: 		LCD_OUT(1,21,CopyConst2Ram(MSG,press_menu));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _press_menu+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_press_menu+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_press_menu+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       21
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;RPM STEPPER.c,277 :: 		delay_ms(500);
	MOVLW       26
	MOVWF       R11, 0
	MOVLW       94
	MOVWF       R12, 0
	MOVLW       110
	MOVWF       R13, 0
L_main716:
	DECFSZ      R13, 1, 1
	BRA         L_main716
	DECFSZ      R12, 1, 1
	BRA         L_main716
	DECFSZ      R11, 1, 1
	BRA         L_main716
	NOP
;RPM STEPPER.c,279 :: 		daa=Uart2_read();
	CALL        _UART2_Read+0, 0
;RPM STEPPER.c,280 :: 		daa=Uart2_read();
	CALL        _UART2_Read+0, 0
;RPM STEPPER.c,282 :: 		UART2_WRITE('O');
	MOVLW       79
	MOVWF       FARG_UART2_Write_data_+0 
	CALL        _UART2_Write+0, 0
;RPM STEPPER.c,283 :: 		for (i=0;i<1000;i++)
	CLRF        _i+0 
	CLRF        _i+1 
L_main717:
	MOVLW       3
	SUBWF       _i+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__main1034
	MOVLW       232
	SUBWF       _i+0, 0 
L__main1034:
	BTFSC       STATUS+0, 0 
	GOTO        L_main718
;RPM STEPPER.c,285 :: 		if(UART2_Data_Ready())
	CALL        _UART2_Data_Ready+0, 0
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main720
;RPM STEPPER.c,287 :: 		daa=Uart2_read();
	CALL        _UART2_Read+0, 0
;RPM STEPPER.c,288 :: 		if (daa=='O')
	MOVF        R0, 0 
	XORLW       79
	BTFSS       STATUS+0, 2 
	GOTO        L_main721
;RPM STEPPER.c,289 :: 		lcd_ouT(1,1,"Connection OK");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr33_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr33_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
	GOTO        L_main722
L_main721:
;RPM STEPPER.c,291 :: 		lcd_ouT(1,1,"Connection Fail");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr34_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr34_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
L_main722:
;RPM STEPPER.c,292 :: 		break;
	GOTO        L_main718
;RPM STEPPER.c,293 :: 		}
L_main720:
;RPM STEPPER.c,283 :: 		for (i=0;i<1000;i++)
	INFSNZ      _i+0, 1 
	INCF        _i+1, 1 
;RPM STEPPER.c,294 :: 		}
	GOTO        L_main717
L_main718:
;RPM STEPPER.c,295 :: 		delay_ms(5000);
	MOVLW       254
	MOVWF       R11, 0
	MOVLW       167
	MOVWF       R12, 0
	MOVLW       101
	MOVWF       R13, 0
L_main723:
	DECFSZ      R13, 1, 1
	BRA         L_main723
	DECFSZ      R12, 1, 1
	BRA         L_main723
	DECFSZ      R11, 1, 1
	BRA         L_main723
	NOP
	NOP
;RPM STEPPER.c,296 :: 		cls();
	CALL        _cls+0, 0
;RPM STEPPER.c,298 :: 		display_mesg(1);
	MOVLW       1
	MOVWF       FARG_display_mesg_position_of_cursor+0 
	CALL        _display_mesg+0, 0
;RPM STEPPER.c,302 :: 		while(1)
L_main724:
;RPM STEPPER.c,304 :: 		menu_main_1();
	CALL        _menu_main_1+0, 0
;RPM STEPPER.c,305 :: 		if (start_machine_flage=='Y')
	MOVF        _start_machine_flage+0, 0 
	XORLW       89
	BTFSS       STATUS+0, 2 
	GOTO        L_main726
;RPM STEPPER.c,307 :: 		start_machine_flage='N';
	MOVLW       78
	MOVWF       _start_machine_flage+0 
;RPM STEPPER.c,308 :: 		cls();
	CALL        _cls+0, 0
;RPM STEPPER.c,309 :: 		lcd_ouT(1,1,CopyConst2Ram(MSG,Analysis_Start_msg));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _Analysis_Start_msg+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_Analysis_Start_msg+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_Analysis_Start_msg+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;RPM STEPPER.c,310 :: 		if (ANALYSIS_START()=='K')
	CALL        _ANALYSIS_START+0, 0
	MOVF        R0, 0 
	XORLW       75
	BTFSS       STATUS+0, 2 
	GOTO        L_main727
;RPM STEPPER.c,312 :: 		cls();
	CALL        _cls+0, 0
;RPM STEPPER.c,313 :: 		lcd_out(1,1,CopyConst2Ram(MSG,Analysis_OKAY));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _Analysis_OKAY+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_Analysis_OKAY+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_Analysis_OKAY+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;RPM STEPPER.c,314 :: 		while(1)
L_main728:
;RPM STEPPER.c,316 :: 		LCD_OUT(2,17,CopyConst2Ram(MSG,start));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _start+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_start+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_start+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       17
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;RPM STEPPER.c,317 :: 		LCD_OUT(2,32-4,CopyConst2Ram(MSG,back));
	MOVLW       _msg+0
	MOVWF       FARG_CopyConst2Ram_dest+0 
	MOVLW       hi_addr(_msg+0)
	MOVWF       FARG_CopyConst2Ram_dest+1 
	MOVLW       _back+0
	MOVWF       FARG_CopyConst2Ram_src+0 
	MOVLW       hi_addr(_back+0)
	MOVWF       FARG_CopyConst2Ram_src+1 
	MOVLW       higher_addr(_back+0)
	MOVWF       FARG_CopyConst2Ram_src+2 
	CALL        _CopyConst2Ram+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_Lcd_Out_text+0 
	MOVF        R1, 0 
	MOVWF       FARG_Lcd_Out_text+1 
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       28
	MOVWF       FARG_Lcd_Out_column+0 
	CALL        _Lcd_Out+0, 0
;RPM STEPPER.c,318 :: 		if (start_button()==0)
	CALL        _start_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main730
;RPM STEPPER.c,320 :: 		relay_on();
	CALL        _relay_on+0, 0
;RPM STEPPER.c,321 :: 		en_on();
	CALL        _en_on+0, 0
;RPM STEPPER.c,322 :: 		delay_ms(10);
	MOVLW       130
	MOVWF       R12, 0
	MOVLW       221
	MOVWF       R13, 0
L_main731:
	DECFSZ      R13, 1, 1
	BRA         L_main731
	DECFSZ      R12, 1, 1
	BRA         L_main731
	NOP
	NOP
;RPM STEPPER.c,323 :: 		Sn_4_reached();
	CALL        _SN_4_REACHED+0, 0
;RPM STEPPER.c,324 :: 		cls();
	CALL        _cls+0, 0
;RPM STEPPER.c,325 :: 		delay_ms(1);
	MOVLW       13
	MOVWF       R12, 0
	MOVLW       251
	MOVWF       R13, 0
L_main732:
	DECFSZ      R13, 1, 1
	BRA         L_main732
	DECFSZ      R12, 1, 1
	BRA         L_main732
	NOP
	NOP
;RPM STEPPER.c,326 :: 		PWM1_Set_Duty(MAIN_MOTOR_LO_SPPED);
	MOVLW       50
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;RPM STEPPER.c,327 :: 		machine_started();  // machine started
	CALL        _machine_started+0, 0
;RPM STEPPER.c,328 :: 		display_mesg(1);
	MOVLW       1
	MOVWF       FARG_display_mesg_position_of_cursor+0 
	CALL        _display_mesg+0, 0
;RPM STEPPER.c,329 :: 		PWM1_Set_Duty(255);
	MOVLW       255
	MOVWF       FARG_PWM1_Set_Duty_new_duty+0 
	CALL        _PWM1_Set_Duty+0, 0
;RPM STEPPER.c,330 :: 		Disable_intR();
	CALL        _disable_intr+0, 0
;RPM STEPPER.c,331 :: 		OLD_FUNCTION=224;
	MOVLW       224
	MOVWF       _old_function+0 
;RPM STEPPER.c,332 :: 		OLD_Z_Degree=270.0;
	MOVLW       0
	MOVWF       _OLD_Z_Degree+0 
	MOVLW       0
	MOVWF       _OLD_Z_Degree+1 
	MOVLW       7
	MOVWF       _OLD_Z_Degree+2 
	MOVLW       135
	MOVWF       _OLD_Z_Degree+3 
;RPM STEPPER.c,333 :: 		break;
	GOTO        L_main729
;RPM STEPPER.c,335 :: 		}
L_main730:
;RPM STEPPER.c,336 :: 		else if (back_button()==0)
	CALL        _back_button+0, 0
	MOVF        R0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_main734
;RPM STEPPER.c,338 :: 		cls();
	CALL        _cls+0, 0
;RPM STEPPER.c,339 :: 		display_mesg(1);
	MOVLW       1
	MOVWF       FARG_display_mesg_position_of_cursor+0 
	CALL        _display_mesg+0, 0
;RPM STEPPER.c,340 :: 		break;
	GOTO        L_main729
;RPM STEPPER.c,341 :: 		}
L_main734:
;RPM STEPPER.c,342 :: 		}
	GOTO        L_main728
L_main729:
;RPM STEPPER.c,343 :: 		}
	GOTO        L_main735
L_main727:
;RPM STEPPER.c,346 :: 		cls();
	CALL        _cls+0, 0
;RPM STEPPER.c,347 :: 		lcd_out(1,1,"BAD SECTOER");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr35_RPM_32STEPPER+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr35_RPM_32STEPPER+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;RPM STEPPER.c,348 :: 		while(ok_button()==1);
L_main736:
	CALL        _OK_button+0, 0
	MOVF        R0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main737
	GOTO        L_main736
L_main737:
;RPM STEPPER.c,349 :: 		cls();
	CALL        _cls+0, 0
;RPM STEPPER.c,350 :: 		display_mesg(1);
	MOVLW       1
	MOVWF       FARG_display_mesg_position_of_cursor+0 
	CALL        _display_mesg+0, 0
;RPM STEPPER.c,351 :: 		}
L_main735:
;RPM STEPPER.c,352 :: 		}
L_main726:
;RPM STEPPER.c,353 :: 		}
	GOTO        L_main724
;RPM STEPPER.c,354 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_interrupt:

;RPM STEPPER.c,357 :: 		void interrupt ()   iv 0x000008
;RPM STEPPER.c,361 :: 		if (INTCON & (1<<TMR0IE)){
	BTFSS       INTCON+0, 5 
	GOTO        L_interrupt738
;RPM STEPPER.c,362 :: 		if(INTCON & (1<<TMR0IF))
	BTFSS       INTCON+0, 2 
	GOTO        L_interrupt739
;RPM STEPPER.c,364 :: 		INTCON&=~(1<<TMR0IF);
	BCF         INTCON+0, 2 
;RPM STEPPER.c,365 :: 		if (XX==0)
	MOVLW       0
	XORWF       _XX+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt1037
	MOVLW       0
	XORWF       _XX+0, 0 
L__interrupt1037:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt740
;RPM STEPPER.c,367 :: 		T0CON&=~(1<<TMR0ON); // timer0 off
	MOVLW       127
	ANDWF       T0CON+0, 1 
;RPM STEPPER.c,368 :: 		x_complite=1;
	MOVLW       1
	MOVWF       _x_complite+0 
;RPM STEPPER.c,369 :: 		}
L_interrupt740:
;RPM STEPPER.c,370 :: 		if (clk_X==1)
	BTFSS       LATF+0, 3 
	GOTO        L_interrupt741
;RPM STEPPER.c,372 :: 		clk_x=0;
	BCF         LATF+0, 3 
;RPM STEPPER.c,373 :: 		}
	GOTO        L_interrupt742
L_interrupt741:
;RPM STEPPER.c,376 :: 		clk_x=1;
	BSF         LATF+0, 3 
;RPM STEPPER.c,377 :: 		XX--;
	MOVLW       1
	SUBWF       _XX+0, 1 
	MOVLW       0
	SUBWFB      _XX+1, 1 
;RPM STEPPER.c,378 :: 		}
L_interrupt742:
;RPM STEPPER.c,379 :: 		TMR0H = Timer0_H;    // preset for Timer0 MSB register
	MOVF        _Timer0_H+0, 0 
	MOVWF       TMR0H+0 
;RPM STEPPER.c,380 :: 		TMR0L = Timer0_L;    // preset for Timer0 LSB register
	MOVF        _Timer0_L+0, 0 
	MOVWF       TMR0L+0 
;RPM STEPPER.c,381 :: 		}
L_interrupt739:
;RPM STEPPER.c,382 :: 		}
L_interrupt738:
;RPM STEPPER.c,384 :: 		if (PIE1.TMR1IE==1)
	BTFSS       PIE1+0, 0 
	GOTO        L_interrupt743
;RPM STEPPER.c,386 :: 		if (PIR1.TMR1IF==1)
	BTFSS       PIR1+0, 0 
	GOTO        L_interrupt744
;RPM STEPPER.c,388 :: 		PIR1.TMR1IF=0;
	BCF         PIR1+0, 0 
;RPM STEPPER.c,389 :: 		if (YY==0)
	MOVLW       0
	XORWF       _YY+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt1038
	MOVLW       0
	XORWF       _YY+0, 0 
L__interrupt1038:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt745
;RPM STEPPER.c,391 :: 		T1CON.TMR1ON=0; // off timer 1
	BCF         T1CON+0, 0 
;RPM STEPPER.c,392 :: 		y_complite=1;
	MOVLW       1
	MOVWF       _y_complite+0 
;RPM STEPPER.c,393 :: 		}
L_interrupt745:
;RPM STEPPER.c,394 :: 		if (clk_Y==1)
	BTFSS       LATF+0, 1 
	GOTO        L_interrupt746
;RPM STEPPER.c,396 :: 		clk_Y=0;
	BCF         LATF+0, 1 
;RPM STEPPER.c,397 :: 		}
	GOTO        L_interrupt747
L_interrupt746:
;RPM STEPPER.c,400 :: 		clk_Y=1;
	BSF         LATF+0, 1 
;RPM STEPPER.c,401 :: 		YY--;
	MOVLW       1
	SUBWF       _YY+0, 1 
	MOVLW       0
	SUBWFB      _YY+1, 1 
;RPM STEPPER.c,402 :: 		}
L_interrupt747:
;RPM STEPPER.c,403 :: 		TMR1H = Timer1_H;    // preset for Timer0 MSB register
	MOVF        _Timer1_H+0, 0 
	MOVWF       TMR1H+0 
;RPM STEPPER.c,404 :: 		TMR1L = Timer1_L;    // preset for Timer0 LSB register
	MOVF        _Timer1_L+0, 0 
	MOVWF       TMR1L+0 
;RPM STEPPER.c,405 :: 		}
L_interrupt744:
;RPM STEPPER.c,406 :: 		}
L_interrupt743:
;RPM STEPPER.c,451 :: 		if (PIE2.TMR3IE==1)
	BTFSS       PIE2+0, 1 
	GOTO        L_interrupt748
;RPM STEPPER.c,453 :: 		if (PIR2.TMR3IF==1)
	BTFSS       PIR2+0, 1 
	GOTO        L_interrupt749
;RPM STEPPER.c,455 :: 		PIR2.TMR3IF=0;
	BCF         PIR2+0, 1 
;RPM STEPPER.c,457 :: 		if (ZZ==0)
	MOVLW       0
	XORWF       _ZZ+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt1039
	MOVLW       0
	XORWF       _ZZ+0, 0 
L__interrupt1039:
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt750
;RPM STEPPER.c,459 :: 		T3CON.TMR3ON=0;     //off timer
	BCF         T3CON+0, 0 
;RPM STEPPER.c,460 :: 		Z_complite=1;
	MOVLW       1
	MOVWF       _z_complite+0 
;RPM STEPPER.c,461 :: 		}
L_interrupt750:
;RPM STEPPER.c,462 :: 		if (clk_z==1)
	BTFSS       LATF+0, 5 
	GOTO        L_interrupt751
;RPM STEPPER.c,464 :: 		clk_z=0;
	BCF         LATF+0, 5 
;RPM STEPPER.c,465 :: 		}
	GOTO        L_interrupt752
L_interrupt751:
;RPM STEPPER.c,468 :: 		clk_z=1;
	BSF         LATF+0, 5 
;RPM STEPPER.c,469 :: 		ZZ--;
	MOVLW       1
	SUBWF       _ZZ+0, 1 
	MOVLW       0
	SUBWFB      _ZZ+1, 1 
;RPM STEPPER.c,470 :: 		if (SN_1==1 && SN_2==1 && SN_3==1  && SN_4==1 && monitor_1==0)
	BTFSS       PORTE+0, 5 
	GOTO        L_interrupt755
	BTFSS       PORTE+0, 4 
	GOTO        L_interrupt755
	BTFSS       PORTE+0, 3 
	GOTO        L_interrupt755
	BTFSS       PORTE+0, 2 
	GOTO        L_interrupt755
	MOVF        _monitor_1+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt755
L__interrupt810:
;RPM STEPPER.c,472 :: 		monitor_1=1;
	MOVLW       1
	MOVWF       _monitor_1+0 
;RPM STEPPER.c,473 :: 		}
	GOTO        L_interrupt756
L_interrupt755:
;RPM STEPPER.c,474 :: 		else if (monitor_1==1)
	MOVF        _monitor_1+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt757
;RPM STEPPER.c,476 :: 		if (SN_1==0 || SN_2==0 || SN_3==0  || SN_4==0)
	BTFSS       PORTE+0, 5 
	GOTO        L__interrupt809
	BTFSS       PORTE+0, 4 
	GOTO        L__interrupt809
	BTFSS       PORTE+0, 3 
	GOTO        L__interrupt809
	BTFSS       PORTE+0, 2 
	GOTO        L__interrupt809
	GOTO        L_interrupt760
L__interrupt809:
;RPM STEPPER.c,478 :: 		monitor_1=0;
	CLRF        _monitor_1+0 
;RPM STEPPER.c,479 :: 		ZZ=0;
	CLRF        _ZZ+0 
	CLRF        _ZZ+1 
;RPM STEPPER.c,480 :: 		}
L_interrupt760:
;RPM STEPPER.c,481 :: 		}
L_interrupt757:
L_interrupt756:
;RPM STEPPER.c,482 :: 		}
L_interrupt752:
;RPM STEPPER.c,483 :: 		TMR3H = Timer3_H;       // preset for timer3 MSB register
	MOVF        _Timer3_H+0, 0 
	MOVWF       TMR3H+0 
;RPM STEPPER.c,484 :: 		TMR3L = Timer3_L;       // preset for timer3 LSB register
	MOVF        _Timer3_L+0, 0 
	MOVWF       TMR3L+0 
;RPM STEPPER.c,485 :: 		}
L_interrupt749:
;RPM STEPPER.c,486 :: 		}
L_interrupt748:
;RPM STEPPER.c,489 :: 		if (INTCON & (1<<INT0IE))
	BTFSS       INTCON+0, 4 
	GOTO        L_interrupt761
;RPM STEPPER.c,491 :: 		if (INTCON & (1<<INT0IF))
	BTFSS       INTCON+0, 1 
	GOTO        L_interrupt762
;RPM STEPPER.c,493 :: 		INTCON&=~(1<<INT0IF);
	BCF         INTCON+0, 1 
;RPM STEPPER.c,494 :: 		Main_shaft_ACK=255;
	MOVLW       255
	MOVWF       _Main_shaft_ACK+0 
;RPM STEPPER.c,495 :: 		portb.b7=~portb.b7;
	BTG         PORTB+0, 7 
;RPM STEPPER.c,497 :: 		}
L_interrupt762:
;RPM STEPPER.c,498 :: 		}
L_interrupt761:
;RPM STEPPER.c,499 :: 		}
L_end_interrupt:
L__interrupt1036:
	RETFIE      1
; end of _interrupt
