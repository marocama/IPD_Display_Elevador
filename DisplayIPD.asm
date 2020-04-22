
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
;functions.h,3 :: 		PORTA |= 0b00101010;                                                       // Desliga todas as colunas
	MOVLW      42
	IORWF      PORTA+0, 1
;functions.h,4 :: 		PORTB |= 0b00011001;                                                       // Desliga todas as colunas
	MOVLW      25
	IORWF      PORTB+0, 1
;functions.h,5 :: 		PORTC |= 0b00100111;                                                       // Desliga todas as colunas
	MOVLW      39
	IORWF      PORTC+0, 1
;functions.h,7 :: 		PORTA &= 0b00111010;                                                       // Desliga todas as linhas
	MOVLW      58
	ANDWF      PORTA+0, 1
;functions.h,8 :: 		PORTB &= 0b11011001;                                                       // Desliga todas as linhas
	MOVLW      217
	ANDWF      PORTB+0, 1
;functions.h,10 :: 		switch(column) {                                                           // Liga a coluna passada por parametro
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
;functions.h,24 :: 		on_column_5;
	BCF        PORTB+0, 4
;functions.h,25 :: 		break;
	GOTO       L_setColumn1
;functions.h,26 :: 		case 6:
L_setColumn7:
;functions.h,27 :: 		on_column_6;
	BCF        PORTC+0, 0
;functions.h,28 :: 		break;
	GOTO       L_setColumn1
;functions.h,29 :: 		case 7:
L_setColumn8:
;functions.h,30 :: 		on_column_7;
	BCF        PORTC+0, 5
;functions.h,31 :: 		break;
	GOTO       L_setColumn1
;functions.h,32 :: 		case 8:
L_setColumn9:
;functions.h,33 :: 		on_column_8;
	BCF        PORTC+0, 1
;functions.h,34 :: 		break;
	GOTO       L_setColumn1
;functions.h,35 :: 		case 9:
L_setColumn10:
;functions.h,36 :: 		on_column_9;
	BCF        PORTC+0, 2
;functions.h,37 :: 		break;
	GOTO       L_setColumn1
;functions.h,38 :: 		case 10:
L_setColumn11:
;functions.h,39 :: 		on_column_10;
	BCF        PORTB+0, 0
;functions.h,40 :: 		default:
L_setColumn12:
;functions.h,41 :: 		break;
	GOTO       L_setColumn1
;functions.h,42 :: 		}
L_setColumn0:
	MOVLW      0
	XORWF      FARG_setColumn_column+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setColumn63
	MOVLW      1
	XORWF      FARG_setColumn_column+0, 0
L__setColumn63:
	BTFSC      STATUS+0, 2
	GOTO       L_setColumn2
	MOVLW      0
	XORWF      FARG_setColumn_column+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setColumn64
	MOVLW      2
	XORWF      FARG_setColumn_column+0, 0
L__setColumn64:
	BTFSC      STATUS+0, 2
	GOTO       L_setColumn3
	MOVLW      0
	XORWF      FARG_setColumn_column+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setColumn65
	MOVLW      3
	XORWF      FARG_setColumn_column+0, 0
L__setColumn65:
	BTFSC      STATUS+0, 2
	GOTO       L_setColumn4
	MOVLW      0
	XORWF      FARG_setColumn_column+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setColumn66
	MOVLW      4
	XORWF      FARG_setColumn_column+0, 0
L__setColumn66:
	BTFSC      STATUS+0, 2
	GOTO       L_setColumn5
	MOVLW      0
	XORWF      FARG_setColumn_column+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setColumn67
	MOVLW      5
	XORWF      FARG_setColumn_column+0, 0
L__setColumn67:
	BTFSC      STATUS+0, 2
	GOTO       L_setColumn6
	MOVLW      0
	XORWF      FARG_setColumn_column+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setColumn68
	MOVLW      6
	XORWF      FARG_setColumn_column+0, 0
L__setColumn68:
	BTFSC      STATUS+0, 2
	GOTO       L_setColumn7
	MOVLW      0
	XORWF      FARG_setColumn_column+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setColumn69
	MOVLW      7
	XORWF      FARG_setColumn_column+0, 0
L__setColumn69:
	BTFSC      STATUS+0, 2
	GOTO       L_setColumn8
	MOVLW      0
	XORWF      FARG_setColumn_column+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setColumn70
	MOVLW      8
	XORWF      FARG_setColumn_column+0, 0
L__setColumn70:
	BTFSC      STATUS+0, 2
	GOTO       L_setColumn9
	MOVLW      0
	XORWF      FARG_setColumn_column+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setColumn71
	MOVLW      9
	XORWF      FARG_setColumn_column+0, 0
L__setColumn71:
	BTFSC      STATUS+0, 2
	GOTO       L_setColumn10
	MOVLW      0
	XORWF      FARG_setColumn_column+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__setColumn72
	MOVLW      10
	XORWF      FARG_setColumn_column+0, 0
L__setColumn72:
	BTFSC      STATUS+0, 2
	GOTO       L_setColumn11
	GOTO       L_setColumn12
L_setColumn1:
;functions.h,43 :: 		}
L_end_setColumn:
	RETURN
; end of _setColumn

_lightLine:

;functions.h,45 :: 		void lightLine(int line) {                                                      // Liga a linha passada por parametro
;functions.h,47 :: 		switch(line) {
	GOTO       L_lightLine13
;functions.h,48 :: 		case 1:
L_lightLine15:
;functions.h,49 :: 		on_line_7;
	BSF        PORTB+0, 2
;functions.h,50 :: 		break;
	GOTO       L_lightLine14
;functions.h,51 :: 		case 2:
L_lightLine16:
;functions.h,52 :: 		on_line_6;
	BSF        PORTB+0, 1
;functions.h,53 :: 		break;
	GOTO       L_lightLine14
;functions.h,54 :: 		case 3:
L_lightLine17:
;functions.h,55 :: 		on_line_5;
	BSF        PORTB+0, 5
;functions.h,56 :: 		break;
	GOTO       L_lightLine14
;functions.h,57 :: 		case 4:
L_lightLine18:
;functions.h,58 :: 		on_line_4;
	BSF        PORTA+0, 2
;functions.h,59 :: 		break;
	GOTO       L_lightLine14
;functions.h,60 :: 		case 5:
L_lightLine19:
;functions.h,61 :: 		on_line_3;
	BSF        PORTA+0, 6
;functions.h,62 :: 		break;
	GOTO       L_lightLine14
;functions.h,63 :: 		case 6:
L_lightLine20:
;functions.h,64 :: 		on_line_2;
	BSF        PORTA+0, 0
;functions.h,65 :: 		break;
	GOTO       L_lightLine14
;functions.h,66 :: 		case 7:
L_lightLine21:
;functions.h,67 :: 		on_line_1;
	BSF        PORTA+0, 7
;functions.h,68 :: 		break;
	GOTO       L_lightLine14
;functions.h,69 :: 		}
L_lightLine13:
	MOVLW      0
	XORWF      FARG_lightLine_line+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__lightLine74
	MOVLW      1
	XORWF      FARG_lightLine_line+0, 0
L__lightLine74:
	BTFSC      STATUS+0, 2
	GOTO       L_lightLine15
	MOVLW      0
	XORWF      FARG_lightLine_line+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__lightLine75
	MOVLW      2
	XORWF      FARG_lightLine_line+0, 0
L__lightLine75:
	BTFSC      STATUS+0, 2
	GOTO       L_lightLine16
	MOVLW      0
	XORWF      FARG_lightLine_line+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__lightLine76
	MOVLW      3
	XORWF      FARG_lightLine_line+0, 0
L__lightLine76:
	BTFSC      STATUS+0, 2
	GOTO       L_lightLine17
	MOVLW      0
	XORWF      FARG_lightLine_line+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__lightLine77
	MOVLW      4
	XORWF      FARG_lightLine_line+0, 0
L__lightLine77:
	BTFSC      STATUS+0, 2
	GOTO       L_lightLine18
	MOVLW      0
	XORWF      FARG_lightLine_line+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__lightLine78
	MOVLW      5
	XORWF      FARG_lightLine_line+0, 0
L__lightLine78:
	BTFSC      STATUS+0, 2
	GOTO       L_lightLine19
	MOVLW      0
	XORWF      FARG_lightLine_line+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__lightLine79
	MOVLW      6
	XORWF      FARG_lightLine_line+0, 0
L__lightLine79:
	BTFSC      STATUS+0, 2
	GOTO       L_lightLine20
	MOVLW      0
	XORWF      FARG_lightLine_line+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__lightLine80
	MOVLW      7
	XORWF      FARG_lightLine_line+0, 0
L__lightLine80:
	BTFSC      STATUS+0, 2
	GOTO       L_lightLine21
L_lightLine14:
;functions.h,70 :: 		}
L_end_lightLine:
	RETURN
; end of _lightLine

_verifyBit:

;functions.h,72 :: 		int verifyBit(char character, char position) {                                  // Recebe um caracter e uma posição de 0 a 7 e retorna o bit do caracter na posicao solicitada
;functions.h,74 :: 		switch(position) {
	GOTO       L_verifyBit22
;functions.h,75 :: 		case 1:
L_verifyBit24:
;functions.h,76 :: 		return character.f1;
	MOVLW      0
	BTFSC      FARG_verifyBit_character+0, 1
	MOVLW      1
	MOVWF      R0+0
	CLRF       R0+1
	GOTO       L_end_verifyBit
;functions.h,78 :: 		case 2:
L_verifyBit25:
;functions.h,79 :: 		return character.f2;
	MOVLW      0
	BTFSC      FARG_verifyBit_character+0, 2
	MOVLW      1
	MOVWF      R0+0
	CLRF       R0+1
	GOTO       L_end_verifyBit
;functions.h,81 :: 		case 3:
L_verifyBit26:
;functions.h,82 :: 		return character.f3;
	MOVLW      0
	BTFSC      FARG_verifyBit_character+0, 3
	MOVLW      1
	MOVWF      R0+0
	CLRF       R0+1
	GOTO       L_end_verifyBit
;functions.h,84 :: 		case 4:
L_verifyBit27:
;functions.h,85 :: 		return character.f4;
	MOVLW      0
	BTFSC      FARG_verifyBit_character+0, 4
	MOVLW      1
	MOVWF      R0+0
	CLRF       R0+1
	GOTO       L_end_verifyBit
;functions.h,87 :: 		case 5:
L_verifyBit28:
;functions.h,88 :: 		return character.f5;
	MOVLW      0
	BTFSC      FARG_verifyBit_character+0, 5
	MOVLW      1
	MOVWF      R0+0
	CLRF       R0+1
	GOTO       L_end_verifyBit
;functions.h,90 :: 		case 6:
L_verifyBit29:
;functions.h,91 :: 		return character.f6;
	MOVLW      0
	BTFSC      FARG_verifyBit_character+0, 6
	MOVLW      1
	MOVWF      R0+0
	CLRF       R0+1
	GOTO       L_end_verifyBit
;functions.h,93 :: 		case 7:
L_verifyBit30:
;functions.h,94 :: 		return character.f7;
	MOVLW      0
	BTFSC      FARG_verifyBit_character+0, 7
	MOVLW      1
	MOVWF      R0+0
	CLRF       R0+1
	GOTO       L_end_verifyBit
;functions.h,96 :: 		}
L_verifyBit22:
	MOVF       FARG_verifyBit_position+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_verifyBit24
	MOVF       FARG_verifyBit_position+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_verifyBit25
	MOVF       FARG_verifyBit_position+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_verifyBit26
	MOVF       FARG_verifyBit_position+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_verifyBit27
	MOVF       FARG_verifyBit_position+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_verifyBit28
	MOVF       FARG_verifyBit_position+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_verifyBit29
	MOVF       FARG_verifyBit_position+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_verifyBit30
;functions.h,97 :: 		}
L_end_verifyBit:
	RETURN
; end of _verifyBit

_printColumn:

;functions.h,99 :: 		void printColumn(char character) {                                              // Recebe a coluna de um caracter como parametro e liga as respectivas linhas
;functions.h,101 :: 		for(counterFor = 1; counterFor < 8; counterFor++) {                        // Varre os 8 bits do caracter recebido como parametro
	MOVLW      1
	MOVWF      _counterFor+0
L_printColumn31:
	MOVLW      8
	SUBWF      _counterFor+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_printColumn32
;functions.h,102 :: 		if(verifyBit(character, counterFor))                                  // Verifica se o bit atual é 1 ou 0
	MOVF       FARG_printColumn_character+0, 0
	MOVWF      FARG_verifyBit_character+0
	MOVF       _counterFor+0, 0
	MOVWF      FARG_verifyBit_position+0
	CALL       _verifyBit+0
	MOVF       R0+0, 0
	IORWF      R0+1, 0
	BTFSC      STATUS+0, 2
	GOTO       L_printColumn34
;functions.h,103 :: 		lightLine(counterFor);                                           // Se o bit atual for 1, liga a respectiva linha
	MOVF       _counterFor+0, 0
	MOVWF      FARG_lightLine_line+0
	CLRF       FARG_lightLine_line+1
	CALL       _lightLine+0
L_printColumn34:
;functions.h,101 :: 		for(counterFor = 1; counterFor < 8; counterFor++) {                        // Varre os 8 bits do caracter recebido como parametro
	INCF       _counterFor+0, 1
;functions.h,104 :: 		}
	GOTO       L_printColumn31
L_printColumn32:
;functions.h,105 :: 		}
L_end_printColumn:
	RETURN
; end of _printColumn

_switchCharacter:

;functions.h,107 :: 		void switchCharacter(int position, char character) {                            // Recebe a posicao do vetor auxiliar um caracter. Após a busca nos defines, completa aquela posicao com o caracter desejado
;functions.h,109 :: 		for(counterFor = 0; counterFor < 4; counterFor++) {                        // Realiza o procedimento nas quatro colunas do caracter escolhido
	CLRF       _counterFor+0
L_switchCharacter35:
	MOVLW      4
	SUBWF      _counterFor+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_switchCharacter36
;functions.h,111 :: 		switch(character) {                                                   // Busca nos defines pelo caracter
	GOTO       L_switchCharacter38
;functions.h,112 :: 		case 'A':
L_switchCharacter40:
;functions.h,113 :: 		characterVetorAux[position] = _A[counterFor];               // Preenche no vetor na posicao escolhida
	MOVF       FARG_switchCharacter_position+0, 0
	ADDLW      _characterVetorAux+0
	MOVWF      R1+0
	MOVF       _counterFor+0, 0
	ADDLW      __A+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;functions.h,114 :: 		break;
	GOTO       L_switchCharacter39
;functions.h,115 :: 		case '2':
L_switchCharacter41:
;functions.h,116 :: 		characterVetorAux[position] = _2[counterFor];
	MOVF       FARG_switchCharacter_position+0, 0
	ADDLW      _characterVetorAux+0
	MOVWF      R1+0
	MOVF       _counterFor+0, 0
	ADDLW      __2+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;functions.h,117 :: 		break;
	GOTO       L_switchCharacter39
;functions.h,118 :: 		}
L_switchCharacter38:
	MOVF       FARG_switchCharacter_character+0, 0
	XORLW      65
	BTFSC      STATUS+0, 2
	GOTO       L_switchCharacter40
	MOVF       FARG_switchCharacter_character+0, 0
	XORLW      50
	BTFSC      STATUS+0, 2
	GOTO       L_switchCharacter41
L_switchCharacter39:
;functions.h,119 :: 		position++;                                                           // Avança a proxima posicao no vetor auxiliar
	INCF       FARG_switchCharacter_position+0, 1
	BTFSC      STATUS+0, 2
	INCF       FARG_switchCharacter_position+1, 1
;functions.h,109 :: 		for(counterFor = 0; counterFor < 4; counterFor++) {                        // Realiza o procedimento nas quatro colunas do caracter escolhido
	INCF       _counterFor+0, 1
;functions.h,120 :: 		}
	GOTO       L_switchCharacter35
L_switchCharacter36:
;functions.h,121 :: 		}
L_end_switchCharacter:
	RETURN
; end of _switchCharacter

_loadVetor:

;functions.h,123 :: 		void loadVetor(char character_1, char character_2) {                            // Recebe os dois caracteres e preenche o vetor auxiliar por completo
;functions.h,125 :: 		for(counterFor = 0; counterFor < 10; counterFor++) {                       // Limpa todo o vetor auxiliar
	CLRF       _counterFor+0
L_loadVetor42:
	MOVLW      10
	SUBWF      _counterFor+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_loadVetor43
;functions.h,126 :: 		characterVetorAux[counterFor] = 0;
	MOVF       _counterFor+0, 0
	ADDLW      _characterVetorAux+0
	MOVWF      FSR
	CLRF       INDF+0
;functions.h,125 :: 		for(counterFor = 0; counterFor < 10; counterFor++) {                       // Limpa todo o vetor auxiliar
	INCF       _counterFor+0, 1
;functions.h,127 :: 		}
	GOTO       L_loadVetor42
L_loadVetor43:
;functions.h,129 :: 		if(character_1 == 0x20) {                                                  // Se o character_1 for igual a 0x20, apenas o character_2 sera impresso e o mesmo sera centralizado
	MOVF       FARG_loadVetor_character_1+0, 0
	XORLW      32
	BTFSS      STATUS+0, 2
	GOTO       L_loadVetor45
;functions.h,130 :: 		switchCharacter(3, character_2);
	MOVLW      3
	MOVWF      FARG_switchCharacter_position+0
	MOVLW      0
	MOVWF      FARG_switchCharacter_position+1
	MOVF       FARG_loadVetor_character_2+0, 0
	MOVWF      FARG_switchCharacter_character+0
	CALL       _switchCharacter+0
;functions.h,131 :: 		} else {                                                                   // Senao, imprime os dois caracteres
	GOTO       L_loadVetor46
L_loadVetor45:
;functions.h,132 :: 		switchCharacter(0, character_1);
	CLRF       FARG_switchCharacter_position+0
	CLRF       FARG_switchCharacter_position+1
	MOVF       FARG_loadVetor_character_1+0, 0
	MOVWF      FARG_switchCharacter_character+0
	CALL       _switchCharacter+0
;functions.h,133 :: 		switchCharacter(5, character_2);
	MOVLW      5
	MOVWF      FARG_switchCharacter_position+0
	MOVLW      0
	MOVWF      FARG_switchCharacter_position+1
	MOVF       FARG_loadVetor_character_2+0, 0
	MOVWF      FARG_switchCharacter_character+0
	CALL       _switchCharacter+0
;functions.h,134 :: 		}
L_loadVetor46:
;functions.h,135 :: 		}
L_end_loadVetor:
	RETURN
; end of _loadVetor

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
;interruption.h,4 :: 		printColumn(characterVetor[currentColumn-1]);                            // Imprime a coluna atual
	MOVLW      1
	SUBWF      _currentColumn+0, 0
	MOVWF      R0+0
	CLRF       R0+1
	BTFSS      STATUS+0, 0
	DECF       R0+1, 1
	MOVF       R0+0, 0
	ADDLW      _characterVetor+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_printColumn_character+0
	CALL       _printColumn+0
;interruption.h,6 :: 		if(currentColumn >= 10) {                                                  // Verifica se chegou no final de uma varredura de colunas
	MOVLW      10
	SUBWF      _currentColumn+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt47
;interruption.h,7 :: 		currentColumn   = 1;                                                  // Posiciona na primeira coluna novamente
	MOVLW      1
	MOVWF      _currentColumn+0
;interruption.h,8 :: 		currentPosition = 1;                                                  // Posiciona no inicio do vetor a ser impresso
	MOVLW      1
	MOVWF      _currentPosition+0
;interruption.h,9 :: 		counterPrint++;                                                       // Incrementa um contador de varreduras completas
	INCF       _counterPrint+0, 1
;interruption.h,10 :: 		} else {
	GOTO       L_interrupt48
L_interrupt47:
;interruption.h,11 :: 		currentColumn++;                                                      // Posiciona na proxima coluna
	INCF       _currentColumn+0, 1
;interruption.h,12 :: 		currentPosition++;                                                    // Avança na proxima posição do vetor a ser impresso
	INCF       _currentPosition+0, 1
;interruption.h,13 :: 		}
L_interrupt48:
;interruption.h,15 :: 		if(counterPrint >= 180) {                                                  // Verifica um determinado numero de varreduras de colunas
	MOVLW      180
	SUBWF      _counterPrint+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt49
;interruption.h,17 :: 		for(counterFor = 0; counterFor < 10; counterFor++) {                  // Executa o bloco de alterações 10 vezes para modificiar as 10 colunas
	CLRF       _counterFor+0
L_interrupt50:
	MOVLW      10
	SUBWF      _counterFor+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt51
;interruption.h,19 :: 		switch(statusPrint) {                                            // Status atual: 0-Impressao Estatica | 1-Subindo | 2-Descendo
	GOTO       L_interrupt53
;interruption.h,20 :: 		case 0:
L_interrupt55:
;interruption.h,21 :: 		break;
	GOTO       L_interrupt54
;interruption.h,22 :: 		case 1:
L_interrupt56:
;interruption.h,23 :: 		characterVetor[counterFor]    = (characterVetor[counterFor] << 1);     // Desloca a coluna principal para a esquerda
	MOVF       _counterFor+0, 0
	ADDLW      _characterVetor+0
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;interruption.h,24 :: 		characterVetor[counterFor].f0 = (characterVetorAux[counterFor].f7);    // Ocupa o espaço vazio que ficou na coluna principal após o deslocamento
	MOVF       _counterFor+0, 0
	ADDLW      _characterVetor+0
	MOVWF      R1+0
	MOVF       _counterFor+0, 0
	ADDLW      _characterVetorAux+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      FSR
	BTFSC      R0+0, 7
	GOTO       L__interrupt87
	BCF        INDF+0, 0
	GOTO       L__interrupt88
L__interrupt87:
	BSF        INDF+0, 0
L__interrupt88:
;interruption.h,25 :: 		characterVetorAux[counterFor] = (characterVetorAux[counterFor] << 1);  // Desloca a coluna auxiliar para acompanhar a proxima alteração
	MOVF       _counterFor+0, 0
	ADDLW      _characterVetorAux+0
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RLF        R0+0, 1
	BCF        R0+0, 0
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;interruption.h,26 :: 		break;
	GOTO       L_interrupt54
;interruption.h,27 :: 		case 2:
L_interrupt57:
;interruption.h,28 :: 		characterVetor[counterFor]    = (characterVetor[counterFor] >> 1);     // Desloca a coluna principal para a direita
	MOVF       _counterFor+0, 0
	ADDLW      _characterVetor+0
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;interruption.h,29 :: 		characterVetor[counterFor].f7 = (characterVetorAux[counterFor].f0);    // Ocupa o espaço vazio que ficou na coluna principal após o deslocamento
	MOVF       _counterFor+0, 0
	ADDLW      _characterVetor+0
	MOVWF      R1+0
	MOVF       _counterFor+0, 0
	ADDLW      _characterVetorAux+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
	MOVWF      FSR
	BTFSC      R0+0, 0
	GOTO       L__interrupt89
	BCF        INDF+0, 7
	GOTO       L__interrupt90
L__interrupt89:
	BSF        INDF+0, 7
L__interrupt90:
;interruption.h,30 :: 		characterVetorAux[counterFor] = (characterVetorAux[counterFor] >> 1);  // Desloca a coluna auxiliar para acompanhar a proxima alteração
	MOVF       _counterFor+0, 0
	ADDLW      _characterVetorAux+0
	MOVWF      R3+0
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R2+0
	MOVF       R2+0, 0
	MOVWF      R0+0
	RRF        R0+0, 1
	BCF        R0+0, 7
	MOVF       R3+0, 0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;interruption.h,31 :: 		break;
	GOTO       L_interrupt54
;interruption.h,32 :: 		}
L_interrupt53:
	MOVF       _statusPrint+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt55
	MOVF       _statusPrint+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt56
	MOVF       _statusPrint+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_interrupt57
L_interrupt54:
;interruption.h,17 :: 		for(counterFor = 0; counterFor < 10; counterFor++) {                  // Executa o bloco de alterações 10 vezes para modificiar as 10 colunas
	INCF       _counterFor+0, 1
;interruption.h,34 :: 		}
	GOTO       L_interrupt50
L_interrupt51:
;interruption.h,35 :: 		counterPrint = 0;                                                     // Zera a varredura de colunas
	CLRF       _counterPrint+0
;interruption.h,36 :: 		counterEmptyColumn++;                                                 // Incrementa o esvaziamento do vetor auxiliar
	INCF       _counterEmptyColumn+0, 1
;interruption.h,38 :: 		if(counterEmptyColumn >= 8) {                                         // Verifica o esvaziamento do vetor auxiliar. Para aumentar o espaçamento entre os caracteres verticalmente basta aumentar este numero
	MOVLW      8
	SUBWF      _counterEmptyColumn+0, 0
	BTFSS      STATUS+0, 0
	GOTO       L_interrupt58
;interruption.h,51 :: 		loadVetor(character_1, character_2);                             // Carrega o vetor auxiliar
	MOVF       _character_1+0, 0
	MOVWF      FARG_loadVetor_character_1+0
	MOVF       _character_2+0, 0
	MOVWF      FARG_loadVetor_character_2+0
	CALL       _loadVetor+0
;interruption.h,53 :: 		counterEmptyColumn = 0;                                          // Seta o vetor auxiliar como cheio
	CLRF       _counterEmptyColumn+0
;interruption.h,54 :: 		}
L_interrupt58:
;interruption.h,55 :: 		}
L_interrupt49:
;interruption.h,57 :: 		PIR1.TMR2IF = 0;                                                           // Termina a execução do Timer2
	BCF        PIR1+0, 1
;interruption.h,58 :: 		}
L_end_interrupt:
L__interrupt86:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;DisplayIPD.c,28 :: 		void main() {
;DisplayIPD.c,29 :: 		initialSetup();                                                            // Funcao que realiza as pre configuracoes do microcontrolador
	CALL       _initialSetup+0
;DisplayIPD.c,31 :: 		character_1 = 'A';
	MOVLW      65
	MOVWF      _character_1+0
;DisplayIPD.c,32 :: 		character_2 = '2';
	MOVLW      50
	MOVWF      _character_2+0
;DisplayIPD.c,33 :: 		statusPrint = 1;
	MOVLW      1
	MOVWF      _statusPrint+0
;DisplayIPD.c,35 :: 		nextCharacter_1 = '2';
	MOVLW      50
	MOVWF      _nextCharacter_1+0
;DisplayIPD.c,36 :: 		nextCharacter_2 = 'A';
	MOVLW      65
	MOVWF      _nextCharacter_2+0
;DisplayIPD.c,38 :: 		while(1) {
L_main59:
;DisplayIPD.c,39 :: 		asm {clrwdt}
	CLRWDT
;DisplayIPD.c,41 :: 		}
	GOTO       L_main59
;DisplayIPD.c,42 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
