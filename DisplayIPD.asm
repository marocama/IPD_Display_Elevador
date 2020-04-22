
_initialSetup:

;defines.h,60 :: 		void initialSetup() {
;defines.h,61 :: 		ANSEL = 0; ANSELH = 0;
	CLRF       ANSEL+0
	CLRF       ANSELH+0
;defines.h,63 :: 		C1ON_BIT = 0; C2ON_BIT = 0;
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;defines.h,65 :: 		TRISA = 0b00010000;
	MOVLW      16
	MOVWF      TRISA+0
;defines.h,66 :: 		TRISB = 0b11000000;
	MOVLW      192
	MOVWF      TRISB+0
;defines.h,67 :: 		TRISC = 0b11011000;
	MOVLW      216
	MOVWF      TRISC+0
;defines.h,69 :: 		WPUB   = 0b11000000; ADCON1  = 0b00001111;
	MOVLW      192
	MOVWF      WPUB+0
	MOVLW      15
	MOVWF      ADCON1+0
;defines.h,70 :: 		OSCCON = 0b01110100; OSCTUNE = 0b00000000;
	MOVLW      116
	MOVWF      OSCCON+0
	CLRF       OSCTUNE+0
;defines.h,72 :: 		OPTION_REG = 0b00001111;
	MOVLW      15
	MOVWF      OPTION_REG+0
;defines.h,73 :: 		INTCON = 0b11000000;
	MOVLW      192
	MOVWF      INTCON+0
;defines.h,75 :: 		PIE1.TMR2IE = 1;
	BSF        PIE1+0, 1
;defines.h,76 :: 		T2CON = 0b00000101;
	MOVLW      5
	MOVWF      T2CON+0
;defines.h,77 :: 		}
L_end_initialSetup:
	RETURN
; end of _initialSetup

_setColumn:

;functions.h,1 :: 		void setColumn(int column) {
;functions.h,3 :: 		PORTA |= 0b00101010; // off all columns
	MOVLW      42
	IORWF      PORTA+0, 1
;functions.h,4 :: 		PORTB |= 0b00011001;
	MOVLW      25
	IORWF      PORTB+0, 1
;functions.h,5 :: 		PORTC |= 0b00100111;
	MOVLW      39
	IORWF      PORTC+0, 1
;functions.h,7 :: 		PORTA &= 0b00111010; // off all lines
	MOVLW      58
	ANDWF      PORTA+0, 1
;functions.h,8 :: 		PORTB &= 0b11011001;
	MOVLW      217
	ANDWF      PORTB+0, 1
;functions.h,10 :: 		switch(column) {
	GOTO       L_setColumn0
;functions.h,11 :: 		case 1:
L_setColumn2:
;functions.h,12 :: 		on_column_1;
	BCF        PORTA+0, 1
;functions.h,13 :: 		break;
	GOTO       L_setColumn1
;functions.h,14 :: 		case 2:
L_setColumn3:
;functions.h,15 :: 		on_column_2;
	BCF        PORTB+0, 3
;functions.h,16 :: 		break;
	GOTO       L_setColumn1
;functions.h,17 :: 		case 3:
L_setColumn4:
;functions.h,18 :: 		on_column_3;
	BCF        PORTA+0, 3
;functions.h,19 :: 		break;
	GOTO       L_setColumn1
;functions.h,20 :: 		case 4:
L_setColumn5:
;functions.h,21 :: 		on_column_4;
	BCF        PORTA+0, 5
;functions.h,22 :: 		break;
	GOTO       L_setColumn1
;functions.h,23 :: 		case 5:
L_setColumn6:
;functions.h,24 :: 		if(posInitialColumn == 4) on_column_5;
	MOVF       _posInitialColumn+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L_setColumn7
	BCF        PORTB+0, 4
L_setColumn7:
;functions.h,25 :: 		break;
	GOTO       L_setColumn1
;functions.h,26 :: 		case 6:
L_setColumn8:
;functions.h,27 :: 		on_column_6;
	BCF        PORTC+0, 0
;functions.h,28 :: 		break;
	GOTO       L_setColumn1
;functions.h,29 :: 		case 7:
L_setColumn9:
;functions.h,30 :: 		on_column_7;
	BCF        PORTC+0, 5
;functions.h,31 :: 		break;
	GOTO       L_setColumn1
;functions.h,32 :: 		case 8:
L_setColumn10:
;functions.h,33 :: 		on_column_8;
	BCF        PORTC+0, 1
;functions.h,34 :: 		break;
	GOTO       L_setColumn1
;functions.h,35 :: 		case 9:
L_setColumn11:
;functions.h,36 :: 		on_column_9;
	BCF        PORTC+0, 2
;functions.h,37 :: 		break;
	GOTO       L_setColumn1
;functions.h,38 :: 		default:
L_setColumn12:
;functions.h,39 :: 		break;
	GOTO       L_setColumn1
;functions.h,40 :: 		}
L_setColumn0:
	MOVLW      0
	XORWF      FARG_setColumn_column+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setColumn87
	MOVLW      1
	XORWF      FARG_setColumn_column+0, 0
L__setColumn87:
	BTFSC      STATUS+0, 2
	GOTO       L_setColumn2
	MOVLW      0
	XORWF      FARG_setColumn_column+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setColumn88
	MOVLW      2
	XORWF      FARG_setColumn_column+0, 0
L__setColumn88:
	BTFSC      STATUS+0, 2
	GOTO       L_setColumn3
	MOVLW      0
	XORWF      FARG_setColumn_column+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setColumn89
	MOVLW      3
	XORWF      FARG_setColumn_column+0, 0
L__setColumn89:
	BTFSC      STATUS+0, 2
	GOTO       L_setColumn4
	MOVLW      0
	XORWF      FARG_setColumn_column+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setColumn90
	MOVLW      4
	XORWF      FARG_setColumn_column+0, 0
L__setColumn90:
	BTFSC      STATUS+0, 2
	GOTO       L_setColumn5
	MOVLW      0
	XORWF      FARG_setColumn_column+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setColumn91
	MOVLW      5
	XORWF      FARG_setColumn_column+0, 0
L__setColumn91:
	BTFSC      STATUS+0, 2
	GOTO       L_setColumn6
	MOVLW      0
	XORWF      FARG_setColumn_column+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setColumn92
	MOVLW      6
	XORWF      FARG_setColumn_column+0, 0
L__setColumn92:
	BTFSC      STATUS+0, 2
	GOTO       L_setColumn8
	MOVLW      0
	XORWF      FARG_setColumn_column+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setColumn93
	MOVLW      7
	XORWF      FARG_setColumn_column+0, 0
L__setColumn93:
	BTFSC      STATUS+0, 2
	GOTO       L_setColumn9
	MOVLW      0
	XORWF      FARG_setColumn_column+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setColumn94
	MOVLW      8
	XORWF      FARG_setColumn_column+0, 0
L__setColumn94:
	BTFSC      STATUS+0, 2
	GOTO       L_setColumn10
	MOVLW      0
	XORWF      FARG_setColumn_column+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setColumn95
	MOVLW      9
	XORWF      FARG_setColumn_column+0, 0
L__setColumn95:
	BTFSC      STATUS+0, 2
	GOTO       L_setColumn11
	GOTO       L_setColumn12
L_setColumn1:
;functions.h,41 :: 		}
L_end_setColumn:
	RETURN
; end of _setColumn

_lightLine:

;functions.h,43 :: 		void lightLine(int line) {
;functions.h,45 :: 		switch(line) {
	GOTO       L_lightLine13
;functions.h,46 :: 		case 1:
L_lightLine15:
;functions.h,47 :: 		on_line_7;
	BSF        PORTB+0, 2
;functions.h,48 :: 		break;
	GOTO       L_lightLine14
;functions.h,49 :: 		case 2:
L_lightLine16:
;functions.h,50 :: 		on_line_6;
	BSF        PORTB+0, 1
;functions.h,51 :: 		break;
	GOTO       L_lightLine14
;functions.h,52 :: 		case 3:
L_lightLine17:
;functions.h,53 :: 		on_line_5;
	BSF        PORTB+0, 5
;functions.h,54 :: 		break;
	GOTO       L_lightLine14
;functions.h,55 :: 		case 4:
L_lightLine18:
;functions.h,56 :: 		on_line_4;
	BSF        PORTA+0, 2
;functions.h,57 :: 		break;
	GOTO       L_lightLine14
;functions.h,58 :: 		case 5:
L_lightLine19:
;functions.h,59 :: 		on_line_3;
	BSF        PORTA+0, 6
;functions.h,60 :: 		break;
	GOTO       L_lightLine14
;functions.h,61 :: 		case 6:
L_lightLine20:
;functions.h,62 :: 		on_line_2;
	BSF        PORTA+0, 0
;functions.h,63 :: 		break;
	GOTO       L_lightLine14
;functions.h,64 :: 		case 7:
L_lightLine21:
;functions.h,65 :: 		on_line_1;
	BSF        PORTA+0, 7
;functions.h,66 :: 		break;
	GOTO       L_lightLine14
;functions.h,67 :: 		}
L_lightLine13:
	MOVLW      0
	XORWF      FARG_lightLine_line+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__lightLine97
	MOVLW      1
	XORWF      FARG_lightLine_line+0, 0
L__lightLine97:
	BTFSC      STATUS+0, 2
	GOTO       L_lightLine15
	MOVLW      0
	XORWF      FARG_lightLine_line+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__lightLine98
	MOVLW      2
	XORWF      FARG_lightLine_line+0, 0
L__lightLine98:
	BTFSC      STATUS+0, 2
	GOTO       L_lightLine16
	MOVLW      0
	XORWF      FARG_lightLine_line+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__lightLine99
	MOVLW      3
	XORWF      FARG_lightLine_line+0, 0
L__lightLine99:
	BTFSC      STATUS+0, 2
	GOTO       L_lightLine17
	MOVLW      0
	XORWF      FARG_lightLine_line+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__lightLine100
	MOVLW      4
	XORWF      FARG_lightLine_line+0, 0
L__lightLine100:
	BTFSC      STATUS+0, 2
	GOTO       L_lightLine18
	MOVLW      0
	XORWF      FARG_lightLine_line+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__lightLine101
	MOVLW      5
	XORWF      FARG_lightLine_line+0, 0
L__lightLine101:
	BTFSC      STATUS+0, 2
	GOTO       L_lightLine19
	MOVLW      0
	XORWF      FARG_lightLine_line+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__lightLine102
	MOVLW      6
	XORWF      FARG_lightLine_line+0, 0
L__lightLine102:
	BTFSC      STATUS+0, 2
	GOTO       L_lightLine20
	MOVLW      0
	XORWF      FARG_lightLine_line+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__lightLine103
	MOVLW      7
	XORWF      FARG_lightLine_line+0, 0
L__lightLine103:
	BTFSC      STATUS+0, 2
	GOTO       L_lightLine21
L_lightLine14:
;functions.h,68 :: 		}
L_end_lightLine:
	RETURN
; end of _lightLine

_verifyBit:

;functions.h,70 :: 		int verifyBit(char character, char position) {
;functions.h,72 :: 		switch(position) {
	GOTO       L_verifyBit22
;functions.h,73 :: 		case 0:
L_verifyBit24:
;functions.h,74 :: 		return character.f0;
	MOVLW      0
	BTFSC      FARG_verifyBit_character+0, 0
	MOVLW      1
	MOVWF      R0+0
	CLRF       R0+1
	GOTO       L_end_verifyBit
;functions.h,76 :: 		case 1:
L_verifyBit25:
;functions.h,77 :: 		return character.f1;
	MOVLW      0
	BTFSC      FARG_verifyBit_character+0, 1
	MOVLW      1
	MOVWF      R0+0
	CLRF       R0+1
	GOTO       L_end_verifyBit
;functions.h,79 :: 		case 2:
L_verifyBit26:
;functions.h,80 :: 		return character.f2;
	MOVLW      0
	BTFSC      FARG_verifyBit_character+0, 2
	MOVLW      1
	MOVWF      R0+0
	CLRF       R0+1
	GOTO       L_end_verifyBit
;functions.h,82 :: 		case 3:
L_verifyBit27:
;functions.h,83 :: 		return character.f3;
	MOVLW      0
	BTFSC      FARG_verifyBit_character+0, 3
	MOVLW      1
	MOVWF      R0+0
	CLRF       R0+1
	GOTO       L_end_verifyBit
;functions.h,85 :: 		case 4:
L_verifyBit28:
;functions.h,86 :: 		return character.f4;
	MOVLW      0
	BTFSC      FARG_verifyBit_character+0, 4
	MOVLW      1
	MOVWF      R0+0
	CLRF       R0+1
	GOTO       L_end_verifyBit
;functions.h,88 :: 		case 5:
L_verifyBit29:
;functions.h,89 :: 		return character.f5;
	MOVLW      0
	BTFSC      FARG_verifyBit_character+0, 5
	MOVLW      1
	MOVWF      R0+0
	CLRF       R0+1
	GOTO       L_end_verifyBit
;functions.h,91 :: 		case 6:
L_verifyBit30:
;functions.h,92 :: 		return character.f6;
	MOVLW      0
	BTFSC      FARG_verifyBit_character+0, 6
	MOVLW      1
	MOVWF      R0+0
	CLRF       R0+1
	GOTO       L_end_verifyBit
;functions.h,94 :: 		case 7:
L_verifyBit31:
;functions.h,95 :: 		return character.f7;
	MOVLW      0
	BTFSC      FARG_verifyBit_character+0, 7
	MOVLW      1
	MOVWF      R0+0
	CLRF       R0+1
	GOTO       L_end_verifyBit
;functions.h,97 :: 		}
L_verifyBit22:
	MOVF       FARG_verifyBit_position+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_verifyBit24
	MOVF       FARG_verifyBit_position+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_verifyBit25
	MOVF       FARG_verifyBit_position+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_verifyBit26
	MOVF       FARG_verifyBit_position+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_verifyBit27
	MOVF       FARG_verifyBit_position+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_verifyBit28
	MOVF       FARG_verifyBit_position+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_verifyBit29
	MOVF       FARG_verifyBit_position+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_verifyBit30
	MOVF       FARG_verifyBit_position+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_verifyBit31
;functions.h,98 :: 		}
L_end_verifyBit:
	RETURN
; end of _verifyBit

_printColumn:

;functions.h,100 :: 		void printColumn(char character) {
;functions.h,102 :: 		for(counterFor = 1; counterFor < counterVertical; counterFor++) {
	MOVLW      1
	MOVWF      _counterFor+0
L_printColumn32:
	MOVF       _counterVertical+0, 0
	SUBWF      _counterFor+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_printColumn33
;functions.h,103 :: 		if(verifyBit(character, counterFor))
	MOVF       FARG_printColumn_character+0, 0
	MOVWF      FARG_verifyBit_character+0
	MOVF       _counterFor+0, 0
	MOVWF      FARG_verifyBit_position+0
	CALL       _verifyBit+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_printColumn35
;functions.h,104 :: 		lightLine(counterVertical-counterFor);
	MOVF       _counterFor+0, 0
	SUBWF      _counterVertical+0, 0
	MOVWF      FARG_lightLine_line+0
	CLRF       FARG_lightLine_line+1
	BTFSS      STATUS+0, 0
	DECF       FARG_lightLine_line+1, 1
	CALL       _lightLine+0
L_printColumn35:
;functions.h,102 :: 		for(counterFor = 1; counterFor < counterVertical; counterFor++) {
	INCF       _counterFor+0, 1
;functions.h,105 :: 		}
	GOTO       L_printColumn32
L_printColumn33:
;functions.h,106 :: 		}
L_end_printColumn:
	RETURN
; end of _printColumn

_printStorey:

;functions.h,108 :: 		void printStorey(char character_1, char character_2, int status) {
;functions.h,112 :: 		if(posInitialColumn == 1 && currentColumn < 6) {                           // Seta caracter que sera impresso no momento
	MOVF       _posInitialColumn+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_printStorey38
	MOVLW      6
	SUBWF      _currentColumn+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_printStorey38
L__printStorey81:
;functions.h,113 :: 		characterAux = character_1;
	MOVF       FARG_printStorey_character_1+0, 0
	MOVWF      printStorey_characterAux_L0+0
;functions.h,114 :: 		} else {
	GOTO       L_printStorey39
L_printStorey38:
;functions.h,115 :: 		characterAux = character_2;
	MOVF       FARG_printStorey_character_2+0, 0
	MOVWF      printStorey_characterAux_L0+0
;functions.h,116 :: 		}
L_printStorey39:
;functions.h,121 :: 		switch(characterAux) {
	GOTO       L_printStorey40
;functions.h,122 :: 		case 'A':
L_printStorey42:
;functions.h,123 :: 		printColumn(_A[currentPosition-1]);
	MOVLW      1
	SUBWF      _currentPosition+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      __A+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_printColumn_character+0
	CALL       _printColumn+0
;functions.h,124 :: 		break;
	GOTO       L_printStorey41
;functions.h,125 :: 		case 'B':
L_printStorey43:
;functions.h,126 :: 		printColumn(_B[currentPosition-1]);
	MOVLW      1
	SUBWF      _currentPosition+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      __B+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_printColumn_character+0
	CALL       _printColumn+0
;functions.h,127 :: 		break;
	GOTO       L_printStorey41
;functions.h,128 :: 		case 'C':
L_printStorey44:
;functions.h,129 :: 		printColumn(_C[currentPosition-1]);
	MOVLW      1
	SUBWF      _currentPosition+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      __C+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_printColumn_character+0
	CALL       _printColumn+0
;functions.h,130 :: 		break;
	GOTO       L_printStorey41
;functions.h,131 :: 		case 'D':
L_printStorey45:
;functions.h,132 :: 		printColumn(_D[currentPosition-1]);
	MOVLW      1
	SUBWF      _currentPosition+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      __D+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_printColumn_character+0
	CALL       _printColumn+0
;functions.h,133 :: 		break;
	GOTO       L_printStorey41
;functions.h,134 :: 		case 'E':
L_printStorey46:
;functions.h,135 :: 		printColumn(_E[currentPosition-1]);
	MOVLW      1
	SUBWF      _currentPosition+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      __E+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_printColumn_character+0
	CALL       _printColumn+0
;functions.h,136 :: 		break;
	GOTO       L_printStorey41
;functions.h,137 :: 		case '0':
L_printStorey47:
;functions.h,138 :: 		printColumn(_0[currentPosition-1]);
	MOVLW      1
	SUBWF      _currentPosition+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      __0+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_printColumn_character+0
	CALL       _printColumn+0
;functions.h,139 :: 		break;
	GOTO       L_printStorey41
;functions.h,140 :: 		case '1':
L_printStorey48:
;functions.h,141 :: 		printColumn(_1[currentPosition-1]);
	MOVLW      1
	SUBWF      _currentPosition+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      __1+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_printColumn_character+0
	CALL       _printColumn+0
;functions.h,142 :: 		break;
	GOTO       L_printStorey41
;functions.h,143 :: 		case '2':
L_printStorey49:
;functions.h,144 :: 		printColumn(_2[currentPosition-1]);
	MOVLW      1
	SUBWF      _currentPosition+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      __2+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_printColumn_character+0
	CALL       _printColumn+0
;functions.h,145 :: 		break;
	GOTO       L_printStorey41
;functions.h,146 :: 		case '3':
L_printStorey50:
;functions.h,147 :: 		printColumn(_3[currentPosition-1]);
	MOVLW      1
	SUBWF      _currentPosition+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      __3+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_printColumn_character+0
	CALL       _printColumn+0
;functions.h,148 :: 		break;
	GOTO       L_printStorey41
;functions.h,149 :: 		case '4':
L_printStorey51:
;functions.h,150 :: 		printColumn(_4[currentPosition-1]);
	MOVLW      1
	SUBWF      _currentPosition+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      __4+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_printColumn_character+0
	CALL       _printColumn+0
;functions.h,151 :: 		break;
	GOTO       L_printStorey41
;functions.h,152 :: 		case '5':
L_printStorey52:
;functions.h,153 :: 		printColumn(_5[currentPosition-1]);
	MOVLW      1
	SUBWF      _currentPosition+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      __5+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_printColumn_character+0
	CALL       _printColumn+0
;functions.h,154 :: 		break;
	GOTO       L_printStorey41
;functions.h,155 :: 		case '6':
L_printStorey53:
;functions.h,156 :: 		printColumn(_6[currentPosition-1]);
	MOVLW      1
	SUBWF      _currentPosition+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      __6+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_printColumn_character+0
	CALL       _printColumn+0
;functions.h,157 :: 		break;
	GOTO       L_printStorey41
;functions.h,158 :: 		case '7':
L_printStorey54:
;functions.h,159 :: 		printColumn(_7[currentPosition-1]);
	MOVLW      1
	SUBWF      _currentPosition+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      __7+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_printColumn_character+0
	CALL       _printColumn+0
;functions.h,160 :: 		break;
	GOTO       L_printStorey41
;functions.h,161 :: 		case '8':
L_printStorey55:
;functions.h,162 :: 		printColumn(_8[currentPosition-1]);
	MOVLW      1
	SUBWF      _currentPosition+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      __8+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_printColumn_character+0
	CALL       _printColumn+0
;functions.h,163 :: 		break;
	GOTO       L_printStorey41
;functions.h,164 :: 		case '9':
L_printStorey56:
;functions.h,165 :: 		printColumn(_9[currentPosition-1]);
	MOVLW      1
	SUBWF      _currentPosition+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      __9+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_printColumn_character+0
	CALL       _printColumn+0
;functions.h,166 :: 		break;
	GOTO       L_printStorey41
;functions.h,167 :: 		default:
L_printStorey57:
;functions.h,168 :: 		break;
	GOTO       L_printStorey41
;functions.h,169 :: 		}
L_printStorey40:
	MOVF       printStorey_characterAux_L0+0, 0
	XORLW      65
	BTFSC      STATUS+0, 2
	GOTO       L_printStorey42
	MOVF       printStorey_characterAux_L0+0, 0
	XORLW      66
	BTFSC      STATUS+0, 2
	GOTO       L_printStorey43
	MOVF       printStorey_characterAux_L0+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L_printStorey44
	MOVF       printStorey_characterAux_L0+0, 0
	XORLW      68
	BTFSC      STATUS+0, 2
	GOTO       L_printStorey45
	MOVF       printStorey_characterAux_L0+0, 0
	XORLW      69
	BTFSC      STATUS+0, 2
	GOTO       L_printStorey46
	MOVF       printStorey_characterAux_L0+0, 0
	XORLW      48
	BTFSC      STATUS+0, 2
	GOTO       L_printStorey47
	MOVF       printStorey_characterAux_L0+0, 0
	XORLW      49
	BTFSC      STATUS+0, 2
	GOTO       L_printStorey48
	MOVF       printStorey_characterAux_L0+0, 0
	XORLW      50
	BTFSC      STATUS+0, 2
	GOTO       L_printStorey49
	MOVF       printStorey_characterAux_L0+0, 0
	XORLW      51
	BTFSC      STATUS+0, 2
	GOTO       L_printStorey50
	MOVF       printStorey_characterAux_L0+0, 0
	XORLW      52
	BTFSC      STATUS+0, 2
	GOTO       L_printStorey51
	MOVF       printStorey_characterAux_L0+0, 0
	XORLW      53
	BTFSC      STATUS+0, 2
	GOTO       L_printStorey52
	MOVF       printStorey_characterAux_L0+0, 0
	XORLW      54
	BTFSC      STATUS+0, 2
	GOTO       L_printStorey53
	MOVF       printStorey_characterAux_L0+0, 0
	XORLW      55
	BTFSC      STATUS+0, 2
	GOTO       L_printStorey54
	MOVF       printStorey_characterAux_L0+0, 0
	XORLW      56
	BTFSC      STATUS+0, 2
	GOTO       L_printStorey55
	MOVF       printStorey_characterAux_L0+0, 0
	XORLW      57
	BTFSC      STATUS+0, 2
	GOTO       L_printStorey56
	GOTO       L_printStorey57
L_printStorey41:
;functions.h,172 :: 		}
L_end_printStorey:
	RETURN
; end of _printStorey

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;interruption.h,1 :: 		void interrupt() {
;interruption.h,3 :: 		setColumn(currentColumn);                                                  // Apaga tudo e varre as colunas
	MOVF       _currentColumn+0, 0
	MOVWF      FARG_setColumn_column+0
	CLRF       FARG_setColumn_column+1
	CALL       _setColumn+0
;interruption.h,5 :: 		switch(statusPrint) {
	GOTO       L_interrupt58
;interruption.h,6 :: 		case 0:
L_interrupt60:
;interruption.h,8 :: 		break;
	GOTO       L_interrupt59
;interruption.h,9 :: 		case 1:
L_interrupt61:
;interruption.h,12 :: 		break;
	GOTO       L_interrupt59
;interruption.h,13 :: 		case 2:
L_interrupt62:
;interruption.h,16 :: 		break;
	GOTO       L_interrupt59
;interruption.h,17 :: 		default:
L_interrupt63:
;interruption.h,19 :: 		break;
	GOTO       L_interrupt59
;interruption.h,20 :: 		}
L_interrupt58:
	MOVF       _statusPrint+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt60
	MOVF       _statusPrint+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt61
	MOVF       _statusPrint+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt62
	GOTO       L_interrupt63
L_interrupt59:
;interruption.h,22 :: 		if(character_1 == 0x20) { posInitialColumn = 4; posFinalColumn = 7; } else { posInitialColumn = 1; posFinalColumn = 10; }
	MOVF       _character_1+0, 0
	XORLW      32
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt64
	MOVLW      4
	MOVWF      _posInitialColumn+0
	MOVLW      7
	MOVWF      _posFinalColumn+0
	GOTO       L_interrupt65
L_interrupt64:
	MOVLW      1
	MOVWF      _posInitialColumn+0
	MOVLW      10
	MOVWF      _posFinalColumn+0
L_interrupt65:
;interruption.h,26 :: 		printStorey(character_1, character_2, 1);
	MOVF       _character_1+0, 0
	MOVWF      FARG_printStorey_character_1+0
	MOVF       _character_2+0, 0
	MOVWF      FARG_printStorey_character_2+0
	MOVLW      1
	MOVWF      FARG_printStorey_status+0
	MOVLW      0
	MOVWF      FARG_printStorey_status+1
	CALL       _printStorey+0
;interruption.h,29 :: 		if(currentColumn >= posFinalColumn) {
	MOVF       _posFinalColumn+0, 0
	SUBWF      _currentColumn+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt66
;interruption.h,30 :: 		currentColumn = posInitialColumn;
	MOVF       _posInitialColumn+0, 0
	MOVWF      _currentColumn+0
;interruption.h,31 :: 		currentPosition = 1;
	MOVLW      1
	MOVWF      _currentPosition+0
;interruption.h,32 :: 		counterPrint++;
	INCF       _counterPrint+0, 1
;interruption.h,33 :: 		} else {
	GOTO       L_interrupt67
L_interrupt66:
;interruption.h,34 :: 		currentColumn++;
	INCF       _currentColumn+0, 1
;interruption.h,35 :: 		if(currentPosition >= 5) {
	MOVLW      5
	SUBWF      _currentPosition+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt68
;interruption.h,36 :: 		currentPosition = 1;
	MOVLW      1
	MOVWF      _currentPosition+0
;interruption.h,37 :: 		} else {
	GOTO       L_interrupt69
L_interrupt68:
;interruption.h,38 :: 		currentPosition++;
	INCF       _currentPosition+0, 1
;interruption.h,39 :: 		}
L_interrupt69:
;interruption.h,40 :: 		}
L_interrupt67:
;interruption.h,42 :: 		if((posInitialColumn == 1 && counterPrint > 90) ||                         // Velocidade de animação para 1 caracter
	MOVF       _posInitialColumn+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt84
	MOVF       _counterPrint+0, 0
	SUBLW      90
	BTFSC      STATUS+0, 0
	GOTO       L__interrupt84
	GOTO       L__interrupt82
;interruption.h,43 :: 		(posInitialColumn == 4 && counterPrint == 180)) {                       // Velocidade de animação para 2 caracteres
L__interrupt84:
	MOVF       _posInitialColumn+0, 0
	XORLW      4
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt83
	MOVF       _counterPrint+0, 0
	XORLW      180
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt83
	GOTO       L__interrupt82
L__interrupt83:
	GOTO       L_interrupt76
L__interrupt82:
;interruption.h,45 :: 		counterVertical == 1 ? counterVertical = 8 : counterVertical--;
	MOVF       _counterVertical+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt77
	MOVLW      8
	MOVWF      _counterVertical+0
	GOTO       L_interrupt78
L_interrupt77:
	DECF       _counterVertical+0, 1
L_interrupt78:
;interruption.h,46 :: 		counterPrint = 0;
	CLRF       _counterPrint+0
;interruption.h,47 :: 		}
L_interrupt76:
;interruption.h,50 :: 		PIR1.TMR2IF = 0;
	BCF        PIR1+0, 1
;interruption.h,51 :: 		}
L_end_interrupt:
L__interrupt108:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;DisplayIPD.c,23 :: 		void main() {
;DisplayIPD.c,24 :: 		initialSetup();                                                            // Funcao que realiza as pre configuracoes do microcontrolador
	CALL       _initialSetup+0
;DisplayIPD.c,26 :: 		character_1 = '2';                                                         //
	MOVLW      50
	MOVWF      _character_1+0
;DisplayIPD.c,27 :: 		character_2 = '9';
	MOVLW      57
	MOVWF      _character_2+0
;DisplayIPD.c,28 :: 		statusPrint = 1;
	MOVLW      1
	MOVWF      _statusPrint+0
;DisplayIPD.c,30 :: 		nextCharacter_1 = 'A';
	MOVLW      65
	MOVWF      _nextCharacter_1+0
;DisplayIPD.c,31 :: 		nextCharacter_2 = 'B';
	MOVLW      66
	MOVWF      _nextCharacter_2+0
;DisplayIPD.c,33 :: 		while(1) {
L_main79:
;DisplayIPD.c,34 :: 		asm {clrwdt}
	CLRWDT
;DisplayIPD.c,36 :: 		}
	GOTO       L_main79
;DisplayIPD.c,37 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
