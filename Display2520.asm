
_initialSetup:

;config.h,1 :: 		void initialSetup() {
;config.h,3 :: 		TRISA = 0b00010000; TRISB = 0b11000000; TRISC = 0b11011000;                // Definação das entradas e saídas
	MOVLW       16
	MOVWF       TRISA+0 
	MOVLW       192
	MOVWF       TRISB+0 
	MOVLW       216
	MOVWF       TRISC+0 
;config.h,5 :: 		ADCON1 = 0b00001111; CMCON = 0b00000111;                                   // Registradores relacionados ao controle dos pinos analógicos
	MOVLW       15
	MOVWF       ADCON1+0 
	MOVLW       7
	MOVWF       CMCON+0 
;config.h,7 :: 		OSCCON = 0b01110100; OSCTUNE = 0b00000001;                                 // Registradores vinculados ao clock do microcontrolador
	MOVLW       116
	MOVWF       OSCCON+0 
	MOVLW       1
	MOVWF       OSCTUNE+0 
;config.h,9 :: 		INTCON = 0b11000000;                                                       // Registrador geral do microcontrolador
	MOVLW       192
	MOVWF       INTCON+0 
;config.h,11 :: 		PR2 = 255; RCON.IPEN = 1; PIE1.TMR2IE = 1; IPR1.TMR2IP = 1; PIR1.TMR2IF = 0; T2CON = 0b00000101;  // Registradores para configuração do Timer2. Interrompendo a cada 0.5ms
	MOVLW       255
	MOVWF       PR2+0 
	BSF         RCON+0, 7 
	BSF         PIE1+0, 1 
	BSF         IPR1+0, 1 
	BCF         PIR1+0, 1 
	MOVLW       5
	MOVWF       T2CON+0 
;config.h,13 :: 		UART1_Init(9600);                                                          // Inicializa a porta serial em 9600
	BSF         BAUDCON+0, 3, 0
	CLRF        SPBRGH+0 
	MOVLW       207
	MOVWF       SPBRG+0 
	BSF         TXSTA+0, 2, 0
	CALL        _UART1_Init+0, 0
;config.h,14 :: 		}
L_end_initialSetup:
	RETURN      0
; end of _initialSetup

_setColumn:

;functions.h,1 :: 		void setColumn(int column) {
;functions.h,3 :: 		PORTA |= 0b00101010;                                                       // Desliga todas as colunas
	MOVLW       42
	IORWF       PORTA+0, 1 
;functions.h,4 :: 		PORTB |= 0b00011001;                                                       // Desliga todas as colunas
	MOVLW       25
	IORWF       PORTB+0, 1 
;functions.h,5 :: 		PORTC |= 0b00100111;                                                       // Desliga todas as colunas
	MOVLW       39
	IORWF       PORTC+0, 1 
;functions.h,7 :: 		PORTA &= 0b00111010;                                                       // Desliga todas as linhas
	MOVLW       58
	ANDWF       PORTA+0, 1 
;functions.h,8 :: 		PORTB &= 0b11011001;
	MOVLW       217
	ANDWF       PORTB+0, 1 
;functions.h,10 :: 		switch(column) {                                                           // Liga a coluna passada por parametro
	GOTO        L_setColumn0
;functions.h,11 :: 		case 1:
L_setColumn2:
;functions.h,12 :: 		on_column_1;
	BCF         PORTA+0, 1 
;functions.h,13 :: 		break;
	GOTO        L_setColumn1
;functions.h,14 :: 		case 2:
L_setColumn3:
;functions.h,15 :: 		on_column_2;
	BCF         PORTB+0, 3 
;functions.h,16 :: 		break;
	GOTO        L_setColumn1
;functions.h,17 :: 		case 3:
L_setColumn4:
;functions.h,18 :: 		on_column_3;
	BCF         PORTA+0, 3 
;functions.h,19 :: 		break;
	GOTO        L_setColumn1
;functions.h,20 :: 		case 4:
L_setColumn5:
;functions.h,21 :: 		on_column_4;
	BCF         PORTA+0, 5 
;functions.h,22 :: 		break;
	GOTO        L_setColumn1
;functions.h,23 :: 		case 5:
L_setColumn6:
;functions.h,24 :: 		on_column_5;
	BCF         PORTB+0, 4 
;functions.h,25 :: 		break;
	GOTO        L_setColumn1
;functions.h,26 :: 		case 6:
L_setColumn7:
;functions.h,27 :: 		on_column_6;
	BCF         PORTC+0, 0 
;functions.h,28 :: 		break;
	GOTO        L_setColumn1
;functions.h,29 :: 		case 7:
L_setColumn8:
;functions.h,30 :: 		on_column_7;
	BCF         PORTC+0, 5 
;functions.h,31 :: 		break;
	GOTO        L_setColumn1
;functions.h,32 :: 		case 8:
L_setColumn9:
;functions.h,33 :: 		on_column_8;
	BCF         PORTC+0, 1 
;functions.h,34 :: 		break;
	GOTO        L_setColumn1
;functions.h,35 :: 		case 9:
L_setColumn10:
;functions.h,36 :: 		on_column_9;
	BCF         PORTC+0, 2 
;functions.h,37 :: 		break;
	GOTO        L_setColumn1
;functions.h,38 :: 		case 10:
L_setColumn11:
;functions.h,39 :: 		on_column_10;
	BCF         PORTB+0, 0 
;functions.h,40 :: 		}
	GOTO        L_setColumn1
L_setColumn0:
	MOVLW       0
	XORWF       FARG_setColumn_column+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__setColumn169
	MOVLW       1
	XORWF       FARG_setColumn_column+0, 0 
L__setColumn169:
	BTFSC       STATUS+0, 2 
	GOTO        L_setColumn2
	MOVLW       0
	XORWF       FARG_setColumn_column+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__setColumn170
	MOVLW       2
	XORWF       FARG_setColumn_column+0, 0 
L__setColumn170:
	BTFSC       STATUS+0, 2 
	GOTO        L_setColumn3
	MOVLW       0
	XORWF       FARG_setColumn_column+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__setColumn171
	MOVLW       3
	XORWF       FARG_setColumn_column+0, 0 
L__setColumn171:
	BTFSC       STATUS+0, 2 
	GOTO        L_setColumn4
	MOVLW       0
	XORWF       FARG_setColumn_column+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__setColumn172
	MOVLW       4
	XORWF       FARG_setColumn_column+0, 0 
L__setColumn172:
	BTFSC       STATUS+0, 2 
	GOTO        L_setColumn5
	MOVLW       0
	XORWF       FARG_setColumn_column+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__setColumn173
	MOVLW       5
	XORWF       FARG_setColumn_column+0, 0 
L__setColumn173:
	BTFSC       STATUS+0, 2 
	GOTO        L_setColumn6
	MOVLW       0
	XORWF       FARG_setColumn_column+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__setColumn174
	MOVLW       6
	XORWF       FARG_setColumn_column+0, 0 
L__setColumn174:
	BTFSC       STATUS+0, 2 
	GOTO        L_setColumn7
	MOVLW       0
	XORWF       FARG_setColumn_column+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__setColumn175
	MOVLW       7
	XORWF       FARG_setColumn_column+0, 0 
L__setColumn175:
	BTFSC       STATUS+0, 2 
	GOTO        L_setColumn8
	MOVLW       0
	XORWF       FARG_setColumn_column+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__setColumn176
	MOVLW       8
	XORWF       FARG_setColumn_column+0, 0 
L__setColumn176:
	BTFSC       STATUS+0, 2 
	GOTO        L_setColumn9
	MOVLW       0
	XORWF       FARG_setColumn_column+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__setColumn177
	MOVLW       9
	XORWF       FARG_setColumn_column+0, 0 
L__setColumn177:
	BTFSC       STATUS+0, 2 
	GOTO        L_setColumn10
	MOVLW       0
	XORWF       FARG_setColumn_column+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__setColumn178
	MOVLW       10
	XORWF       FARG_setColumn_column+0, 0 
L__setColumn178:
	BTFSC       STATUS+0, 2 
	GOTO        L_setColumn11
L_setColumn1:
;functions.h,41 :: 		}
L_end_setColumn:
	RETURN      0
; end of _setColumn

_lightLine:

;functions.h,43 :: 		void lightLine(int line) {                                                      // Liga a linha passada por parametro
;functions.h,45 :: 		switch(line) {
	GOTO        L_lightLine12
;functions.h,46 :: 		case 1:
L_lightLine14:
;functions.h,47 :: 		on_line_7;
	BSF         PORTB+0, 2 
;functions.h,48 :: 		break;
	GOTO        L_lightLine13
;functions.h,49 :: 		case 2:
L_lightLine15:
;functions.h,50 :: 		on_line_6;
	BSF         PORTB+0, 1 
;functions.h,51 :: 		break;
	GOTO        L_lightLine13
;functions.h,52 :: 		case 3:
L_lightLine16:
;functions.h,53 :: 		on_line_5;
	BSF         PORTB+0, 5 
;functions.h,54 :: 		break;
	GOTO        L_lightLine13
;functions.h,55 :: 		case 4:
L_lightLine17:
;functions.h,56 :: 		on_line_4;
	BSF         PORTA+0, 2 
;functions.h,57 :: 		break;
	GOTO        L_lightLine13
;functions.h,58 :: 		case 5:
L_lightLine18:
;functions.h,59 :: 		on_line_3;
	BSF         PORTA+0, 6 
;functions.h,60 :: 		break;
	GOTO        L_lightLine13
;functions.h,61 :: 		case 6:
L_lightLine19:
;functions.h,62 :: 		on_line_2;
	BSF         PORTA+0, 0 
;functions.h,63 :: 		break;
	GOTO        L_lightLine13
;functions.h,64 :: 		case 7:
L_lightLine20:
;functions.h,65 :: 		on_line_1;
	BSF         PORTA+0, 7 
;functions.h,66 :: 		break;
	GOTO        L_lightLine13
;functions.h,67 :: 		}
L_lightLine12:
	MOVLW       0
	XORWF       FARG_lightLine_line+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lightLine180
	MOVLW       1
	XORWF       FARG_lightLine_line+0, 0 
L__lightLine180:
	BTFSC       STATUS+0, 2 
	GOTO        L_lightLine14
	MOVLW       0
	XORWF       FARG_lightLine_line+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lightLine181
	MOVLW       2
	XORWF       FARG_lightLine_line+0, 0 
L__lightLine181:
	BTFSC       STATUS+0, 2 
	GOTO        L_lightLine15
	MOVLW       0
	XORWF       FARG_lightLine_line+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lightLine182
	MOVLW       3
	XORWF       FARG_lightLine_line+0, 0 
L__lightLine182:
	BTFSC       STATUS+0, 2 
	GOTO        L_lightLine16
	MOVLW       0
	XORWF       FARG_lightLine_line+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lightLine183
	MOVLW       4
	XORWF       FARG_lightLine_line+0, 0 
L__lightLine183:
	BTFSC       STATUS+0, 2 
	GOTO        L_lightLine17
	MOVLW       0
	XORWF       FARG_lightLine_line+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lightLine184
	MOVLW       5
	XORWF       FARG_lightLine_line+0, 0 
L__lightLine184:
	BTFSC       STATUS+0, 2 
	GOTO        L_lightLine18
	MOVLW       0
	XORWF       FARG_lightLine_line+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lightLine185
	MOVLW       6
	XORWF       FARG_lightLine_line+0, 0 
L__lightLine185:
	BTFSC       STATUS+0, 2 
	GOTO        L_lightLine19
	MOVLW       0
	XORWF       FARG_lightLine_line+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__lightLine186
	MOVLW       7
	XORWF       FARG_lightLine_line+0, 0 
L__lightLine186:
	BTFSC       STATUS+0, 2 
	GOTO        L_lightLine20
L_lightLine13:
;functions.h,68 :: 		}
L_end_lightLine:
	RETURN      0
; end of _lightLine

_verifyBit:

;functions.h,70 :: 		int verifyBit(char character, char position) {                                  // Recebe um caracter e uma posição de 0 a 7 e retorna o bit do caracter na posicao solicitada
;functions.h,72 :: 		switch(position) {
	GOTO        L_verifyBit21
;functions.h,73 :: 		case 1:
L_verifyBit23:
;functions.h,74 :: 		return character.f1;
	MOVLW       0
	BTFSC       FARG_verifyBit_character+0, 1 
	MOVLW       1
	MOVWF       R0 
	CLRF        R1 
	GOTO        L_end_verifyBit
;functions.h,76 :: 		case 2:
L_verifyBit24:
;functions.h,77 :: 		return character.f2;
	MOVLW       0
	BTFSC       FARG_verifyBit_character+0, 2 
	MOVLW       1
	MOVWF       R0 
	CLRF        R1 
	GOTO        L_end_verifyBit
;functions.h,79 :: 		case 3:
L_verifyBit25:
;functions.h,80 :: 		return character.f3;
	MOVLW       0
	BTFSC       FARG_verifyBit_character+0, 3 
	MOVLW       1
	MOVWF       R0 
	CLRF        R1 
	GOTO        L_end_verifyBit
;functions.h,82 :: 		case 4:
L_verifyBit26:
;functions.h,83 :: 		return character.f4;
	MOVLW       0
	BTFSC       FARG_verifyBit_character+0, 4 
	MOVLW       1
	MOVWF       R0 
	CLRF        R1 
	GOTO        L_end_verifyBit
;functions.h,85 :: 		case 5:
L_verifyBit27:
;functions.h,86 :: 		return character.f5;
	MOVLW       0
	BTFSC       FARG_verifyBit_character+0, 5 
	MOVLW       1
	MOVWF       R0 
	CLRF        R1 
	GOTO        L_end_verifyBit
;functions.h,88 :: 		case 6:
L_verifyBit28:
;functions.h,89 :: 		return character.f6;
	MOVLW       0
	BTFSC       FARG_verifyBit_character+0, 6 
	MOVLW       1
	MOVWF       R0 
	CLRF        R1 
	GOTO        L_end_verifyBit
;functions.h,91 :: 		case 7:
L_verifyBit29:
;functions.h,92 :: 		return character.f7;
	MOVLW       0
	BTFSC       FARG_verifyBit_character+0, 7 
	MOVLW       1
	MOVWF       R0 
	CLRF        R1 
	GOTO        L_end_verifyBit
;functions.h,94 :: 		}
L_verifyBit21:
	MOVF        FARG_verifyBit_position+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_verifyBit23
	MOVF        FARG_verifyBit_position+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_verifyBit24
	MOVF        FARG_verifyBit_position+0, 0 
	XORLW       3
	BTFSC       STATUS+0, 2 
	GOTO        L_verifyBit25
	MOVF        FARG_verifyBit_position+0, 0 
	XORLW       4
	BTFSC       STATUS+0, 2 
	GOTO        L_verifyBit26
	MOVF        FARG_verifyBit_position+0, 0 
	XORLW       5
	BTFSC       STATUS+0, 2 
	GOTO        L_verifyBit27
	MOVF        FARG_verifyBit_position+0, 0 
	XORLW       6
	BTFSC       STATUS+0, 2 
	GOTO        L_verifyBit28
	MOVF        FARG_verifyBit_position+0, 0 
	XORLW       7
	BTFSC       STATUS+0, 2 
	GOTO        L_verifyBit29
;functions.h,95 :: 		}
L_end_verifyBit:
	RETURN      0
; end of _verifyBit

_printColumn:

;functions.h,97 :: 		void printColumn(char character) {                                              // Recebe a coluna de um caracter como parametro e liga as respectivas linhas
;functions.h,99 :: 		for(counterFor = 1; counterFor < 8; counterFor++) {                        // Varre os 8 bits do caracter recebido como parametro
	MOVLW       1
	MOVWF       _counterFor+0 
L_printColumn30:
	MOVLW       8
	SUBWF       _counterFor+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_printColumn31
;functions.h,100 :: 		if(verifyBit(character, counterFor))                                  // Verifica se o bit atual é 1 ou 0
	MOVF        FARG_printColumn_character+0, 0 
	MOVWF       FARG_verifyBit_character+0 
	MOVF        _counterFor+0, 0 
	MOVWF       FARG_verifyBit_position+0 
	CALL        _verifyBit+0, 0
	MOVF        R0, 0 
	IORWF       R1, 0 
	BTFSC       STATUS+0, 2 
	GOTO        L_printColumn33
;functions.h,101 :: 		lightLine(counterFor);                                           // Se o bit atual for 1, liga a respectiva linha
	MOVF        _counterFor+0, 0 
	MOVWF       FARG_lightLine_line+0 
	MOVLW       0
	MOVWF       FARG_lightLine_line+1 
	CALL        _lightLine+0, 0
L_printColumn33:
;functions.h,99 :: 		for(counterFor = 1; counterFor < 8; counterFor++) {                        // Varre os 8 bits do caracter recebido como parametro
	INCF        _counterFor+0, 1 
;functions.h,102 :: 		}
	GOTO        L_printColumn30
L_printColumn31:
;functions.h,103 :: 		}
L_end_printColumn:
	RETURN      0
; end of _printColumn

_switchCharacter:

;functions.h,105 :: 		void switchCharacter(int position, char character) {                            // Recebe a posicao do vetor auxiliar um caracter. Após a busca nos defines, completa aquela posicao com o caracter desejado
;functions.h,107 :: 		char max = 4, oneChar = 0;                                                 // Variaveis locais para controle de posicionamento
	MOVLW       4
	MOVWF       switchCharacter_max_L0+0 
	CLRF        switchCharacter_oneChar_L0+0 
;functions.h,109 :: 		if(position == 2) max = 6;                                                 // Se a posicao for 2, significa que sera impresso a seta, e a mesma possui 6 colunas
	MOVLW       0
	XORWF       FARG_switchCharacter_position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__switchCharacter190
	MOVLW       2
	XORWF       FARG_switchCharacter_position+0, 0 
L__switchCharacter190:
	BTFSS       STATUS+0, 2 
	GOTO        L_switchCharacter34
	MOVLW       6
	MOVWF       switchCharacter_max_L0+0 
L_switchCharacter34:
;functions.h,110 :: 		if(position == 3) oneChar = 1;                                             // Se a posicao for 3, significa que apenas um caracter sera impresso
	MOVLW       0
	XORWF       FARG_switchCharacter_position+1, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__switchCharacter191
	MOVLW       3
	XORWF       FARG_switchCharacter_position+0, 0 
L__switchCharacter191:
	BTFSS       STATUS+0, 2 
	GOTO        L_switchCharacter35
	MOVLW       1
	MOVWF       switchCharacter_oneChar_L0+0 
L_switchCharacter35:
;functions.h,112 :: 		for(counterFor = 0; counterFor < max; counterFor++) {                      // Realiza o procedimento nas quatro colunas do caracter escolhido
	CLRF        _counterFor+0 
L_switchCharacter36:
	MOVF        switchCharacter_max_L0+0, 0 
	SUBWF       _counterFor+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_switchCharacter37
;functions.h,114 :: 		switch(character) {                                                   // Busca nos defines pelo caracter
	GOTO        L_switchCharacter39
;functions.h,115 :: 		case 'A':
L_switchCharacter41:
;functions.h,116 :: 		characterVetorAux[position] = _A[counterFor];               // Preenche no vetor na posicao escolhida
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __A+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__A+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,117 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,118 :: 		case 'B':
L_switchCharacter42:
;functions.h,119 :: 		characterVetorAux[position] = _B[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __B+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__B+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,120 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,121 :: 		case 'C':
L_switchCharacter43:
;functions.h,122 :: 		characterVetorAux[position] = _C[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __C+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__C+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,123 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,124 :: 		case 'D':
L_switchCharacter44:
;functions.h,125 :: 		characterVetorAux[position] = _D[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __D+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__D+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,126 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,127 :: 		case 'E':
L_switchCharacter45:
;functions.h,128 :: 		characterVetorAux[position] = _E[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __E+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__E+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,129 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,130 :: 		case 'F':
L_switchCharacter46:
;functions.h,131 :: 		characterVetorAux[position] = _F[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __F+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__F+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,132 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,133 :: 		case 'G':
L_switchCharacter47:
;functions.h,134 :: 		characterVetorAux[position] = _G[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __G+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__G+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,135 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,136 :: 		case 'H':
L_switchCharacter48:
;functions.h,137 :: 		characterVetorAux[position] = _H[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __H+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__H+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,138 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,139 :: 		case 'I':
L_switchCharacter49:
;functions.h,140 :: 		characterVetorAux[position] = _I[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __I+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__I+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,141 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,142 :: 		case 'J':
L_switchCharacter50:
;functions.h,143 :: 		characterVetorAux[position] = _J[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __J+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__J+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,144 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,145 :: 		case 'K':
L_switchCharacter51:
;functions.h,146 :: 		characterVetorAux[position] = _K[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __K+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__K+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,147 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,148 :: 		case 'L':
L_switchCharacter52:
;functions.h,149 :: 		characterVetorAux[position] = _L[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __L+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__L+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,150 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,151 :: 		case 'M':
L_switchCharacter53:
;functions.h,152 :: 		if(max == 4) max++;                                         // Por ser um caracter que necessita de 5 colunas para ficar bem desenhado, incrementa uma coluna para impressao
	MOVF        switchCharacter_max_L0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_switchCharacter54
	INCF        switchCharacter_max_L0+0, 1 
L_switchCharacter54:
;functions.h,153 :: 		characterVetorAux[position] = _M[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __M+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__M+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,154 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,155 :: 		case 'N':
L_switchCharacter55:
;functions.h,156 :: 		if(max == 4) max++;
	MOVF        switchCharacter_max_L0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_switchCharacter56
	INCF        switchCharacter_max_L0+0, 1 
L_switchCharacter56:
;functions.h,157 :: 		characterVetorAux[position] = _N[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __N+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__N+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,158 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,159 :: 		case 'O':
L_switchCharacter57:
;functions.h,160 :: 		characterVetorAux[position] = _O[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __O+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__O+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,161 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,162 :: 		case 'P':
L_switchCharacter58:
;functions.h,163 :: 		characterVetorAux[position] = _P[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __P+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__P+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,164 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,165 :: 		case 'Q':
L_switchCharacter59:
;functions.h,166 :: 		if(max == 4) max++;
	MOVF        switchCharacter_max_L0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_switchCharacter60
	INCF        switchCharacter_max_L0+0, 1 
L_switchCharacter60:
;functions.h,167 :: 		characterVetorAux[position] = _Q[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __Q+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__Q+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,168 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,169 :: 		case 'R':
L_switchCharacter61:
;functions.h,170 :: 		if(max == 4) max++;
	MOVF        switchCharacter_max_L0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_switchCharacter62
	INCF        switchCharacter_max_L0+0, 1 
L_switchCharacter62:
;functions.h,171 :: 		characterVetorAux[position] = _R[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __R+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__R+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,172 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,173 :: 		case 'S':
L_switchCharacter63:
;functions.h,174 :: 		characterVetorAux[position] = _S[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __S+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__S+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,175 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,176 :: 		case 'T':
L_switchCharacter64:
;functions.h,177 :: 		if(max == 4) max++;
	MOVF        switchCharacter_max_L0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_switchCharacter65
	INCF        switchCharacter_max_L0+0, 1 
L_switchCharacter65:
;functions.h,178 :: 		characterVetorAux[position] = _T[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __T+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__T+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,179 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,180 :: 		case 'U':
L_switchCharacter66:
;functions.h,181 :: 		characterVetorAux[position] = _U[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __U+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__U+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,182 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,183 :: 		case 'V':
L_switchCharacter67:
;functions.h,184 :: 		if(max == 4) max++;
	MOVF        switchCharacter_max_L0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_switchCharacter68
	INCF        switchCharacter_max_L0+0, 1 
L_switchCharacter68:
;functions.h,185 :: 		characterVetorAux[position] = _V[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __V+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__V+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,186 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,187 :: 		case 'W':
L_switchCharacter69:
;functions.h,188 :: 		if(max == 4) max++;
	MOVF        switchCharacter_max_L0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_switchCharacter70
	INCF        switchCharacter_max_L0+0, 1 
L_switchCharacter70:
;functions.h,189 :: 		characterVetorAux[position] = _W[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __W+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__W+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,190 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,191 :: 		case 'X':
L_switchCharacter71:
;functions.h,192 :: 		if(max == 4) max++;
	MOVF        switchCharacter_max_L0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_switchCharacter72
	INCF        switchCharacter_max_L0+0, 1 
L_switchCharacter72:
;functions.h,193 :: 		characterVetorAux[position] = _X[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __X+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__X+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,194 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,195 :: 		case 'Y':
L_switchCharacter73:
;functions.h,196 :: 		if(max == 4) max++;
	MOVF        switchCharacter_max_L0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_switchCharacter74
	INCF        switchCharacter_max_L0+0, 1 
L_switchCharacter74:
;functions.h,197 :: 		characterVetorAux[position] = _Y[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __Y+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__Y+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,198 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,199 :: 		case 'Z':
L_switchCharacter75:
;functions.h,200 :: 		if(max == 4) max++;
	MOVF        switchCharacter_max_L0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_switchCharacter76
	INCF        switchCharacter_max_L0+0, 1 
L_switchCharacter76:
;functions.h,201 :: 		characterVetorAux[position] = _Z[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __Z+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__Z+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,202 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,203 :: 		case '0':
L_switchCharacter77:
;functions.h,204 :: 		characterVetorAux[position] = (oneChar == 1) ? _00[counterFor] : _0[counterFor];  // Verifica se apenas um caracter esta sendo impresso. Se sim, utiliza o caracter com 5 colunas para melhor estetica.
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       R1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       R2 
	MOVF        switchCharacter_oneChar_L0+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_switchCharacter78
	MOVLW       __00+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__00+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
	GOTO        L_switchCharacter79
L_switchCharacter78:
	MOVLW       __0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__0+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R3 
L_switchCharacter79:
	MOVFF       R1, FSR1
	MOVFF       R2, FSR1H
	MOVF        R3, 0 
	MOVWF       POSTINC1+0 
;functions.h,205 :: 		if(oneChar) max = 5;                                                              // Alem de incrementar uma coluna na impressao para comportar o caracter mais largo
	MOVF        switchCharacter_oneChar_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter80
	MOVLW       5
	MOVWF       switchCharacter_max_L0+0 
L_switchCharacter80:
;functions.h,206 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,207 :: 		case '1':
L_switchCharacter81:
;functions.h,208 :: 		characterVetorAux[position] = _1[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __1+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__1+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,209 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,210 :: 		case '2':
L_switchCharacter82:
;functions.h,211 :: 		characterVetorAux[position] = (oneChar) ? _22[counterFor] : _2[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       R0 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       R1 
	MOVF        switchCharacter_oneChar_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter83
	MOVLW       __22+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__22+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
	GOTO        L_switchCharacter84
L_switchCharacter83:
	MOVLW       __2+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__2+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R4 
L_switchCharacter84:
	MOVFF       R0, FSR1
	MOVFF       R1, FSR1H
	MOVF        R4, 0 
	MOVWF       POSTINC1+0 
;functions.h,212 :: 		if(oneChar) max = 5;
	MOVF        switchCharacter_oneChar_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter85
	MOVLW       5
	MOVWF       switchCharacter_max_L0+0 
L_switchCharacter85:
;functions.h,213 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,214 :: 		case '3':
L_switchCharacter86:
;functions.h,215 :: 		characterVetorAux[position] = (oneChar) ? _33[counterFor] : _3[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       R0 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       R1 
	MOVF        switchCharacter_oneChar_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter87
	MOVLW       __33+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__33+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R5 
	GOTO        L_switchCharacter88
L_switchCharacter87:
	MOVLW       __3+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__3+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R5 
L_switchCharacter88:
	MOVFF       R0, FSR1
	MOVFF       R1, FSR1H
	MOVF        R5, 0 
	MOVWF       POSTINC1+0 
;functions.h,216 :: 		if(oneChar) max = 5;
	MOVF        switchCharacter_oneChar_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter89
	MOVLW       5
	MOVWF       switchCharacter_max_L0+0 
L_switchCharacter89:
;functions.h,217 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,218 :: 		case '4':
L_switchCharacter90:
;functions.h,219 :: 		if(max == 4) max++;
	MOVF        switchCharacter_max_L0+0, 0 
	XORLW       4
	BTFSS       STATUS+0, 2 
	GOTO        L_switchCharacter91
	INCF        switchCharacter_max_L0+0, 1 
L_switchCharacter91:
;functions.h,220 :: 		characterVetorAux[position] = _4[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __4+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__4+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,221 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,222 :: 		case '5':
L_switchCharacter92:
;functions.h,223 :: 		characterVetorAux[position] = (oneChar) ? _55[counterFor] : _5[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       R0 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       R1 
	MOVF        switchCharacter_oneChar_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter93
	MOVLW       __55+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__55+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R6 
	GOTO        L_switchCharacter94
L_switchCharacter93:
	MOVLW       __5+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__5+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R6 
L_switchCharacter94:
	MOVFF       R0, FSR1
	MOVFF       R1, FSR1H
	MOVF        R6, 0 
	MOVWF       POSTINC1+0 
;functions.h,224 :: 		if(oneChar) max = 5;
	MOVF        switchCharacter_oneChar_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter95
	MOVLW       5
	MOVWF       switchCharacter_max_L0+0 
L_switchCharacter95:
;functions.h,225 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,226 :: 		case '6':
L_switchCharacter96:
;functions.h,227 :: 		characterVetorAux[position] = (oneChar) ? _66[counterFor] : _6[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       R0 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       R1 
	MOVF        switchCharacter_oneChar_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter97
	MOVLW       __66+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__66+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R7 
	GOTO        L_switchCharacter98
L_switchCharacter97:
	MOVLW       __6+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__6+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R7 
L_switchCharacter98:
	MOVFF       R0, FSR1
	MOVFF       R1, FSR1H
	MOVF        R7, 0 
	MOVWF       POSTINC1+0 
;functions.h,228 :: 		if(oneChar) max = 5;
	MOVF        switchCharacter_oneChar_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter99
	MOVLW       5
	MOVWF       switchCharacter_max_L0+0 
L_switchCharacter99:
;functions.h,229 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,230 :: 		case '7':
L_switchCharacter100:
;functions.h,231 :: 		characterVetorAux[position] = (oneChar) ? _77[counterFor] : _7[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       R0 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       R1 
	MOVF        switchCharacter_oneChar_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter101
	MOVLW       __77+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__77+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R8 
	GOTO        L_switchCharacter102
L_switchCharacter101:
	MOVLW       __7+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__7+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R8 
L_switchCharacter102:
	MOVFF       R0, FSR1
	MOVFF       R1, FSR1H
	MOVF        R8, 0 
	MOVWF       POSTINC1+0 
;functions.h,232 :: 		if(oneChar) max = 5;
	MOVF        switchCharacter_oneChar_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter103
	MOVLW       5
	MOVWF       switchCharacter_max_L0+0 
L_switchCharacter103:
;functions.h,233 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,234 :: 		case '8':
L_switchCharacter104:
;functions.h,235 :: 		characterVetorAux[position] = (oneChar) ? _88[counterFor] : _8[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       R0 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       R1 
	MOVF        switchCharacter_oneChar_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter105
	MOVLW       __88+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__88+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R9 
	GOTO        L_switchCharacter106
L_switchCharacter105:
	MOVLW       __8+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__8+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R9 
L_switchCharacter106:
	MOVFF       R0, FSR1
	MOVFF       R1, FSR1H
	MOVF        R9, 0 
	MOVWF       POSTINC1+0 
;functions.h,236 :: 		if(oneChar) max = 5;
	MOVF        switchCharacter_oneChar_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter107
	MOVLW       5
	MOVWF       switchCharacter_max_L0+0 
L_switchCharacter107:
;functions.h,237 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,238 :: 		case '9':
L_switchCharacter108:
;functions.h,239 :: 		characterVetorAux[position] = (oneChar) ? _99[counterFor] : _9[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       R0 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       R1 
	MOVF        switchCharacter_oneChar_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter109
	MOVLW       __99+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__99+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R10 
	GOTO        L_switchCharacter110
L_switchCharacter109:
	MOVLW       __9+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__9+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R10 
L_switchCharacter110:
	MOVFF       R0, FSR1
	MOVFF       R1, FSR1H
	MOVF        R10, 0 
	MOVWF       POSTINC1+0 
;functions.h,240 :: 		if(oneChar) max = 5;
	MOVF        switchCharacter_oneChar_L0+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter111
	MOVLW       5
	MOVWF       switchCharacter_max_L0+0 
L_switchCharacter111:
;functions.h,241 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,242 :: 		case '>':
L_switchCharacter112:
;functions.h,243 :: 		characterVetorAux[position] = _UP[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __UP+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__UP+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,244 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,245 :: 		case '<':
L_switchCharacter113:
;functions.h,246 :: 		characterVetorAux[position] = _DW[counterFor];
	MOVLW       _characterVetorAux+0
	ADDWF       FARG_switchCharacter_position+0, 0 
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	ADDWFC      FARG_switchCharacter_position+1, 0 
	MOVWF       FSR1H 
	MOVLW       __DW+0
	MOVWF       FSR0 
	MOVLW       hi_addr(__DW+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;functions.h,247 :: 		break;
	GOTO        L_switchCharacter40
;functions.h,248 :: 		}
L_switchCharacter39:
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       65
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter41
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       66
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter42
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       67
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter43
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       68
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter44
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       69
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter45
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       70
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter46
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       71
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter47
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       72
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter48
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       73
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter49
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       74
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter50
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       75
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter51
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       76
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter52
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       77
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter53
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       78
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter55
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       79
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter57
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       80
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter58
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       81
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter59
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       82
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter61
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       83
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter63
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       84
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter64
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       85
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter66
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       86
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter67
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       87
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter69
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       88
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter71
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       89
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter73
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       90
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter75
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       48
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter77
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       49
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter81
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       50
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter82
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       51
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter86
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       52
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter90
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       53
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter92
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       54
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter96
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       55
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter100
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       56
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter104
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       57
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter108
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       62
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter112
	MOVF        FARG_switchCharacter_character+0, 0 
	XORLW       60
	BTFSC       STATUS+0, 2 
	GOTO        L_switchCharacter113
L_switchCharacter40:
;functions.h,249 :: 		position++;                                                           // Avança a proxima posicao no vetor auxiliar
	INFSNZ      FARG_switchCharacter_position+0, 1 
	INCF        FARG_switchCharacter_position+1, 1 
;functions.h,112 :: 		for(counterFor = 0; counterFor < max; counterFor++) {                      // Realiza o procedimento nas quatro colunas do caracter escolhido
	INCF        _counterFor+0, 1 
;functions.h,250 :: 		}
	GOTO        L_switchCharacter36
L_switchCharacter37:
;functions.h,251 :: 		}
L_end_switchCharacter:
	RETURN      0
; end of _switchCharacter

_loadVetor:

;functions.h,254 :: 		void loadVetor(char character_1V, char character_2V) {                          // Recebe os dois caracteres e preenche o vetor auxiliar por completo
;functions.h,256 :: 		for(counterFor = 0; counterFor < 10; counterFor++) {                       // Limpa todo o vetor auxiliar
	CLRF        _counterFor+0 
L_loadVetor114:
	MOVLW       10
	SUBWF       _counterFor+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_loadVetor115
;functions.h,257 :: 		characterVetorAux[counterFor] = 0;
	MOVLW       _characterVetorAux+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetorAux+0)
	MOVWF       FSR1H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	CLRF        POSTINC1+0 
;functions.h,256 :: 		for(counterFor = 0; counterFor < 10; counterFor++) {                       // Limpa todo o vetor auxiliar
	INCF        _counterFor+0, 1 
;functions.h,258 :: 		}
	GOTO        L_loadVetor114
L_loadVetor115:
;functions.h,260 :: 		if(character_1V == 0x19) {                                                 // Se o character_1 for igual a 0x20, a seta sera impressa
	MOVF        FARG_loadVetor_character_1V+0, 0 
	XORLW       25
	BTFSS       STATUS+0, 2 
	GOTO        L_loadVetor117
;functions.h,261 :: 		switchCharacter(2, character_2V);
	MOVLW       2
	MOVWF       FARG_switchCharacter_position+0 
	MOVLW       0
	MOVWF       FARG_switchCharacter_position+1 
	MOVF        FARG_loadVetor_character_2V+0, 0 
	MOVWF       FARG_switchCharacter_character+0 
	CALL        _switchCharacter+0, 0
;functions.h,262 :: 		} else if(character_1V == 0x20) {                                          // Senao, se o character_1 for igual a 0x00, apenas o character_2 sera impresso e o mesmo sera centralizado
	GOTO        L_loadVetor118
L_loadVetor117:
	MOVF        FARG_loadVetor_character_1V+0, 0 
	XORLW       32
	BTFSS       STATUS+0, 2 
	GOTO        L_loadVetor119
;functions.h,263 :: 		switchCharacter(3, character_2V);
	MOVLW       3
	MOVWF       FARG_switchCharacter_position+0 
	MOVLW       0
	MOVWF       FARG_switchCharacter_position+1 
	MOVF        FARG_loadVetor_character_2V+0, 0 
	MOVWF       FARG_switchCharacter_character+0 
	CALL        _switchCharacter+0, 0
;functions.h,264 :: 		} else {                                                                   // Senao, imprime os dois caracteres
	GOTO        L_loadVetor120
L_loadVetor119:
;functions.h,265 :: 		switchCharacter(0, character_1V);
	CLRF        FARG_switchCharacter_position+0 
	CLRF        FARG_switchCharacter_position+1 
	MOVF        FARG_loadVetor_character_1V+0, 0 
	MOVWF       FARG_switchCharacter_character+0 
	CALL        _switchCharacter+0, 0
;functions.h,266 :: 		switchCharacter(5, character_2V);
	MOVLW       5
	MOVWF       FARG_switchCharacter_position+0 
	MOVLW       0
	MOVWF       FARG_switchCharacter_position+1 
	MOVF        FARG_loadVetor_character_2V+0, 0 
	MOVWF       FARG_switchCharacter_character+0 
	CALL        _switchCharacter+0, 0
;functions.h,267 :: 		}
L_loadVetor120:
L_loadVetor118:
;functions.h,269 :: 		character_1 = character_1Temp;                                             // Contesta que o caracter que foi recebido na serial ja persiste na tela
	MOVF        _character_1Temp+0, 0 
	MOVWF       _character_1+0 
;functions.h,270 :: 		character_2 = character_2Temp;
	MOVF        _character_2Temp+0, 0 
	MOVWF       _character_2+0 
;functions.h,272 :: 		}
L_end_loadVetor:
	RETURN      0
; end of _loadVetor

_setSerial:

;functions.h,274 :: 		void setSerial(char characterV_1, char characterV_2, char status) {
;functions.h,276 :: 		if(characterV_1 != 0x19) character_1Temp = characterV_1;
	MOVF        FARG_setSerial_characterV_1+0, 0 
	XORLW       25
	BTFSC       STATUS+0, 2 
	GOTO        L_setSerial121
	MOVF        FARG_setSerial_characterV_1+0, 0 
	MOVWF       _character_1Temp+0 
L_setSerial121:
;functions.h,277 :: 		if(characterV_2 != 0x19) character_2Temp = characterV_2;
	MOVF        FARG_setSerial_characterV_2+0, 0 
	XORLW       25
	BTFSC       STATUS+0, 2 
	GOTO        L_setSerial122
	MOVF        FARG_setSerial_characterV_2+0, 0 
	MOVWF       _character_2Temp+0 
L_setSerial122:
;functions.h,278 :: 		if(status != 0x19)   statusDirectionTemp = status;
	MOVF        FARG_setSerial_status+0, 0 
	XORLW       25
	BTFSC       STATUS+0, 2 
	GOTO        L_setSerial123
	MOVF        FARG_setSerial_status+0, 0 
	MOVWF       _statusDirectionTemp+0 
L_setSerial123:
;functions.h,280 :: 		persistData = 0;
	CLRF        _persistData+0 
;functions.h,281 :: 		}
L_end_setSerial:
	RETURN      0
; end of _setSerial

_interrupt:

;interrupt.h,1 :: 		void interrupt() {
;interrupt.h,4 :: 		serialData = UART1_Read();
	CALL        _UART1_Read+0, 0
	MOVF        R0, 0 
	MOVWF       _serialData+0 
;interrupt.h,5 :: 		if(serialData == 97) { setSerial('2', '0', 0); } // 20 parado
	MOVF        R0, 0 
	XORLW       97
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt124
	MOVLW       50
	MOVWF       FARG_setSerial_characterV_1+0 
	MOVLW       48
	MOVWF       FARG_setSerial_characterV_2+0 
	CLRF        FARG_setSerial_status+0 
	CALL        _setSerial+0, 0
L_interrupt124:
;interrupt.h,6 :: 		if(serialData == 98) { setSerial('2', '0', 1); } // 20 desce
	MOVF        _serialData+0, 0 
	XORLW       98
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt125
	MOVLW       50
	MOVWF       FARG_setSerial_characterV_1+0 
	MOVLW       48
	MOVWF       FARG_setSerial_characterV_2+0 
	MOVLW       1
	MOVWF       FARG_setSerial_status+0 
	CALL        _setSerial+0, 0
L_interrupt125:
;interrupt.h,7 :: 		if(serialData == 99) { setSerial('2', '1', 0); } // 21 parado
	MOVF        _serialData+0, 0 
	XORLW       99
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt126
	MOVLW       50
	MOVWF       FARG_setSerial_characterV_1+0 
	MOVLW       49
	MOVWF       FARG_setSerial_characterV_2+0 
	CLRF        FARG_setSerial_status+0 
	CALL        _setSerial+0, 0
L_interrupt126:
;interrupt.h,8 :: 		if(serialData == 100) { setSerial('2', '1', 2); } // 21 desce
	MOVF        _serialData+0, 0 
	XORLW       100
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt127
	MOVLW       50
	MOVWF       FARG_setSerial_characterV_1+0 
	MOVLW       49
	MOVWF       FARG_setSerial_characterV_2+0 
	MOVLW       2
	MOVWF       FARG_setSerial_status+0 
	CALL        _setSerial+0, 0
L_interrupt127:
;interrupt.h,10 :: 		if(serialData == 48) { setSerial(' ', 'T', 0); } // T parado
	MOVF        _serialData+0, 0 
	XORLW       48
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt128
	MOVLW       32
	MOVWF       FARG_setSerial_characterV_1+0 
	MOVLW       84
	MOVWF       FARG_setSerial_characterV_2+0 
	CLRF        FARG_setSerial_status+0 
	CALL        _setSerial+0, 0
L_interrupt128:
;interrupt.h,11 :: 		if(serialData == 49) { setSerial(' ', 'T', 1); } // T desce
	MOVF        _serialData+0, 0 
	XORLW       49
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt129
	MOVLW       32
	MOVWF       FARG_setSerial_characterV_1+0 
	MOVLW       84
	MOVWF       FARG_setSerial_characterV_2+0 
	MOVLW       1
	MOVWF       FARG_setSerial_status+0 
	CALL        _setSerial+0, 0
L_interrupt129:
;interrupt.h,12 :: 		if(serialData == 50) { setSerial(' ', '1', 0); } // 1 parado
	MOVF        _serialData+0, 0 
	XORLW       50
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt130
	MOVLW       32
	MOVWF       FARG_setSerial_characterV_1+0 
	MOVLW       49
	MOVWF       FARG_setSerial_characterV_2+0 
	CLRF        FARG_setSerial_status+0 
	CALL        _setSerial+0, 0
L_interrupt130:
;interrupt.h,13 :: 		if(serialData == 51) { setSerial(' ', '1', 1); } // 3 desce
	MOVF        _serialData+0, 0 
	XORLW       51
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt131
	MOVLW       32
	MOVWF       FARG_setSerial_characterV_1+0 
	MOVLW       49
	MOVWF       FARG_setSerial_characterV_2+0 
	MOVLW       1
	MOVWF       FARG_setSerial_status+0 
	CALL        _setSerial+0, 0
L_interrupt131:
;interrupt.h,14 :: 		if(serialData == 52) { setSerial(' ', '2', 0); } // 21 desce
	MOVF        _serialData+0, 0 
	XORLW       52
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt132
	MOVLW       32
	MOVWF       FARG_setSerial_characterV_1+0 
	MOVLW       50
	MOVWF       FARG_setSerial_characterV_2+0 
	CLRF        FARG_setSerial_status+0 
	CALL        _setSerial+0, 0
L_interrupt132:
;interrupt.h,15 :: 		if(serialData == 53) { setSerial(' ', '2', 1); } // 21 desce
	MOVF        _serialData+0, 0 
	XORLW       53
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt133
	MOVLW       32
	MOVWF       FARG_setSerial_characterV_1+0 
	MOVLW       50
	MOVWF       FARG_setSerial_characterV_2+0 
	MOVLW       1
	MOVWF       FARG_setSerial_status+0 
	CALL        _setSerial+0, 0
L_interrupt133:
;interrupt.h,16 :: 		if(serialData == 54) { setSerial(' ', '3', 0); } // 21 desce
	MOVF        _serialData+0, 0 
	XORLW       54
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt134
	MOVLW       32
	MOVWF       FARG_setSerial_characterV_1+0 
	MOVLW       51
	MOVWF       FARG_setSerial_characterV_2+0 
	CLRF        FARG_setSerial_status+0 
	CALL        _setSerial+0, 0
L_interrupt134:
;interrupt.h,17 :: 		if(serialData == 55) { setSerial(' ', '3', 2); } // 21 desce
	MOVF        _serialData+0, 0 
	XORLW       55
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt135
	MOVLW       32
	MOVWF       FARG_setSerial_characterV_1+0 
	MOVLW       51
	MOVWF       FARG_setSerial_characterV_2+0 
	MOVLW       2
	MOVWF       FARG_setSerial_status+0 
	CALL        _setSerial+0, 0
L_interrupt135:
;interrupt.h,24 :: 		setColumn(currentColumn);                                                  // Apaga tudo e varre as colunas
	MOVF        _currentColumn+0, 0 
	MOVWF       FARG_setColumn_column+0 
	MOVLW       0
	MOVWF       FARG_setColumn_column+1 
	CALL        _setColumn+0, 0
;interrupt.h,25 :: 		printColumn(characterVetor[currentColumn-1]);                              // Imprime a coluna atual
	DECF        _currentColumn+0, 0 
	MOVWF       R0 
	CLRF        R1 
	MOVLW       0
	SUBWFB      R1, 1 
	MOVLW       _characterVetor+0
	ADDWF       R0, 0 
	MOVWF       FSR0 
	MOVLW       hi_addr(_characterVetor+0)
	ADDWFC      R1, 0 
	MOVWF       FSR0H 
	MOVF        POSTINC0+0, 0 
	MOVWF       FARG_printColumn_character+0 
	CALL        _printColumn+0, 0
;interrupt.h,27 :: 		if(currentColumn >= 11) {                                                  // Verifica se chegou no final de uma varredura de colunas
	MOVLW       11
	SUBWF       _currentColumn+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt136
;interrupt.h,28 :: 		currentColumn   = 1;                                                  // Posiciona na primeira coluna novamente
	MOVLW       1
	MOVWF       _currentColumn+0 
;interrupt.h,29 :: 		counterPrint++;                                                       // Incrementa um contador de varreduras completas
	INCF        _counterPrint+0, 1 
;interrupt.h,30 :: 		} else {
	GOTO        L_interrupt137
L_interrupt136:
;interrupt.h,31 :: 		currentColumn++;                                                      // Posiciona na proxima coluna
	INCF        _currentColumn+0, 1 
;interrupt.h,32 :: 		}
L_interrupt137:
;interrupt.h,34 :: 		if(stopAnimation == 1) { timeAnimation = 70; } else { timeAnimation = 15; } // Verifica se ha sinalizacao para congelar a animacao e aumenta o tempo
	MOVF        _stopAnimation+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt138
	MOVLW       70
	MOVWF       _timeAnimation+0 
	GOTO        L_interrupt139
L_interrupt138:
	MOVLW       15
	MOVWF       _timeAnimation+0 
L_interrupt139:
;interrupt.h,36 :: 		if(counterPrint >= timeAnimation) {                                        // Verifica um determinado numero de varreduras de colunas
	MOVF        _timeAnimation+0, 0 
	SUBWF       _counterPrint+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt140
;interrupt.h,38 :: 		counterPrint = 0;                                                     // Zera a varredura de colunas completas
	CLRF        _counterPrint+0 
;interrupt.h,39 :: 		stopAnimation = 0;                                                    // Reseta a flag de congelamento
	CLRF        _stopAnimation+0 
;interrupt.h,41 :: 		for(counterFor = 0; counterFor < 10; counterFor++) {                  // Executa o bloco de alterações 10 vezes para modificiar as 10 colunas
	CLRF        _counterFor+0 
L_interrupt141:
	MOVLW       10
	SUBWF       _counterFor+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_interrupt142
;interrupt.h,43 :: 		switch(statusDirection) {                                        // Status atual: 0-Impressao Estatica | 1-Subindo | 2-Descendo
	GOTO        L_interrupt144
;interrupt.h,44 :: 		case 0:
L_interrupt146:
;interrupt.h,45 :: 		characterVetor[counterFor]    = characterVetorAux[counterFor];         // Clona o vetor auxiliar para o principal que sera impresso
	MOVLW       _characterVetor+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetor+0)
	MOVWF       FSR1H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       _characterVetorAux+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_characterVetorAux+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
;interrupt.h,46 :: 		break;
	GOTO        L_interrupt145
;interrupt.h,47 :: 		case 1:
L_interrupt147:
;interrupt.h,48 :: 		characterVetor[counterFor]    = (characterVetor[counterFor] << 1);     // Desloca a coluna principal para a esquerda
	MOVLW       _characterVetor+0
	MOVWF       R3 
	MOVLW       hi_addr(_characterVetor+0)
	MOVWF       R4 
	MOVF        _counterFor+0, 0 
	ADDWF       R3, 1 
	BTFSC       STATUS+0, 0 
	INCF        R4, 1 
	MOVFF       R3, FSR0
	MOVFF       R4, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVFF       R3, FSR1
	MOVFF       R4, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;interrupt.h,49 :: 		characterVetor[counterFor].f0 = (characterVetorAux[counterFor].f7);    // Ocupa o espaço vazio que ficou na coluna principal após o deslocamento
	MOVLW       _characterVetor+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetor+0)
	MOVWF       FSR1H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       _characterVetorAux+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_characterVetorAux+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	BTFSC       R0, 7 
	GOTO        L__interrupt196
	BCF         POSTINC1+0, 0 
	GOTO        L__interrupt197
L__interrupt196:
	BSF         POSTINC1+0, 0 
L__interrupt197:
;interrupt.h,50 :: 		characterVetorAux[counterFor] = (characterVetorAux[counterFor] << 1);  // Desloca a coluna auxiliar para acompanhar a proxima alteração
	MOVLW       _characterVetorAux+0
	MOVWF       R3 
	MOVLW       hi_addr(_characterVetorAux+0)
	MOVWF       R4 
	MOVF        _counterFor+0, 0 
	ADDWF       R3, 1 
	BTFSC       STATUS+0, 0 
	INCF        R4, 1 
	MOVFF       R3, FSR0
	MOVFF       R4, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RLCF        R0, 1 
	BCF         R0, 0 
	MOVFF       R3, FSR1
	MOVFF       R4, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;interrupt.h,51 :: 		break;
	GOTO        L_interrupt145
;interrupt.h,52 :: 		case 2:
L_interrupt148:
;interrupt.h,53 :: 		characterVetor[counterFor]    = (characterVetor[counterFor] >> 1);     // Desloca a coluna principal para a direita
	MOVLW       _characterVetor+0
	MOVWF       R3 
	MOVLW       hi_addr(_characterVetor+0)
	MOVWF       R4 
	MOVF        _counterFor+0, 0 
	ADDWF       R3, 1 
	BTFSC       STATUS+0, 0 
	INCF        R4, 1 
	MOVFF       R3, FSR0
	MOVFF       R4, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVFF       R3, FSR1
	MOVFF       R4, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;interrupt.h,54 :: 		characterVetor[counterFor].f7 = (characterVetorAux[counterFor].f0);    // Ocupa o espaço vazio que ficou na coluna principal após o deslocamento
	MOVLW       _characterVetor+0
	MOVWF       FSR1 
	MOVLW       hi_addr(_characterVetor+0)
	MOVWF       FSR1H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR1, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR1H, 1 
	MOVLW       _characterVetorAux+0
	MOVWF       FSR0 
	MOVLW       hi_addr(_characterVetorAux+0)
	MOVWF       FSR0H 
	MOVF        _counterFor+0, 0 
	ADDWF       FSR0, 1 
	BTFSC       STATUS+0, 0 
	INCF        FSR0H, 1 
	MOVF        POSTINC0+0, 0 
	MOVWF       R0 
	BTFSC       R0, 0 
	GOTO        L__interrupt198
	BCF         POSTINC1+0, 7 
	GOTO        L__interrupt199
L__interrupt198:
	BSF         POSTINC1+0, 7 
L__interrupt199:
;interrupt.h,55 :: 		characterVetorAux[counterFor] = (characterVetorAux[counterFor] >> 1);  // Desloca a coluna auxiliar para acompanhar a proxima alteração
	MOVLW       _characterVetorAux+0
	MOVWF       R3 
	MOVLW       hi_addr(_characterVetorAux+0)
	MOVWF       R4 
	MOVF        _counterFor+0, 0 
	ADDWF       R3, 1 
	BTFSC       STATUS+0, 0 
	INCF        R4, 1 
	MOVFF       R3, FSR0
	MOVFF       R4, FSR0H
	MOVF        POSTINC0+0, 0 
	MOVWF       R2 
	MOVF        R2, 0 
	MOVWF       R0 
	RRCF        R0, 1 
	BCF         R0, 7 
	MOVFF       R3, FSR1
	MOVFF       R4, FSR1H
	MOVF        R0, 0 
	MOVWF       POSTINC1+0 
;interrupt.h,56 :: 		break;
	GOTO        L_interrupt145
;interrupt.h,57 :: 		}
L_interrupt144:
	MOVF        _statusDirection+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt146
	MOVF        _statusDirection+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt147
	MOVF        _statusDirection+0, 0 
	XORLW       2
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt148
L_interrupt145:
;interrupt.h,41 :: 		for(counterFor = 0; counterFor < 10; counterFor++) {                  // Executa o bloco de alterações 10 vezes para modificiar as 10 colunas
	INCF        _counterFor+0, 1 
;interrupt.h,59 :: 		}
	GOTO        L_interrupt141
L_interrupt142:
;interrupt.h,60 :: 		counterEmptyColumn++;                                                 // Incrementa o esvaziamento do vetor auxiliar
	INCF        _counterEmptyColumn+0, 1 
;interrupt.h,62 :: 		if(counterEmptyColumn >= 8) {                                         // Verifica o esvaziamento do vetor auxiliar. Para aumentar o espaçamento entre os caracteres verticalmente basta aumentar este numero
	MOVLW       8
	SUBWF       _counterEmptyColumn+0, 0 
	BTFSS       STATUS+0, 0 
	GOTO        L_interrupt149
;interrupt.h,64 :: 		switch(currentPrint) {
	GOTO        L_interrupt150
;interrupt.h,65 :: 		case 0:                                                     // Impresso andar
L_interrupt152:
;interrupt.h,66 :: 		if(statusDirectionTemp == 0) {                         // Se o elevador sinalizar que parou
	MOVF        _statusDirectionTemp+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt153
;interrupt.h,67 :: 		if((character_1Temp != character_1) || (character_2Temp != character_2)) { // Se estiver impresso um andar, mas recebeu um andar novo
	MOVF        _character_1Temp+0, 0 
	XORWF       _character_1+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt166
	MOVF        _character_2Temp+0, 0 
	XORWF       _character_2+0, 0 
	BTFSS       STATUS+0, 2 
	GOTO        L__interrupt166
	GOTO        L_interrupt156
L__interrupt166:
;interrupt.h,68 :: 		if(statusDirection == 1) loadVetor(0x19,'>');// Caso estivesse subindo
	MOVF        _statusDirection+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt157
	MOVLW       25
	MOVWF       FARG_loadVetor_character_1V+0 
	MOVLW       62
	MOVWF       FARG_loadVetor_character_2V+0 
	CALL        _loadVetor+0, 0
L_interrupt157:
;interrupt.h,69 :: 		if(statusDirection == 2) loadVetor(0x19,'<');// Caso estivesse descendo
	MOVF        _statusDirection+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt158
	MOVLW       25
	MOVWF       FARG_loadVetor_character_1V+0 
	MOVLW       60
	MOVWF       FARG_loadVetor_character_2V+0 
	CALL        _loadVetor+0, 0
L_interrupt158:
;interrupt.h,70 :: 		currentPrint = 1;                            // Configura proxima impressao
	MOVLW       1
	MOVWF       _currentPrint+0 
;interrupt.h,71 :: 		} else {
	GOTO        L_interrupt159
L_interrupt156:
;interrupt.h,72 :: 		loadVetor(character_1Temp, character_2Temp);
	MOVF        _character_1Temp+0, 0 
	MOVWF       FARG_loadVetor_character_1V+0 
	MOVF        _character_2Temp+0, 0 
	MOVWF       FARG_loadVetor_character_2V+0 
	CALL        _loadVetor+0, 0
;interrupt.h,73 :: 		statusDirection = statusDirectionTemp;
	MOVF        _statusDirectionTemp+0, 0 
	MOVWF       _statusDirection+0 
;interrupt.h,74 :: 		}
L_interrupt159:
;interrupt.h,75 :: 		} else {
	GOTO        L_interrupt160
L_interrupt153:
;interrupt.h,76 :: 		if(statusDirectionTemp == 1) loadVetor(0x19, '>');// Caso estivesse subindo
	MOVF        _statusDirectionTemp+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt161
	MOVLW       25
	MOVWF       FARG_loadVetor_character_1V+0 
	MOVLW       62
	MOVWF       FARG_loadVetor_character_2V+0 
	CALL        _loadVetor+0, 0
L_interrupt161:
;interrupt.h,77 :: 		if(statusDirectionTemp == 2) loadVetor(0x19, '<');// Caso estivesse descendo
	MOVF        _statusDirectionTemp+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_interrupt162
	MOVLW       25
	MOVWF       FARG_loadVetor_character_1V+0 
	MOVLW       60
	MOVWF       FARG_loadVetor_character_2V+0 
	CALL        _loadVetor+0, 0
L_interrupt162:
;interrupt.h,78 :: 		currentPrint = 1;
	MOVLW       1
	MOVWF       _currentPrint+0 
;interrupt.h,79 :: 		statusDirection = statusDirectionTemp;
	MOVF        _statusDirectionTemp+0, 0 
	MOVWF       _statusDirection+0 
;interrupt.h,80 :: 		}
L_interrupt160:
;interrupt.h,81 :: 		stopAnimation = 1;                                     // Sinaliza para congelar a animação quando exibir o andar atual
	MOVLW       1
	MOVWF       _stopAnimation+0 
;interrupt.h,82 :: 		break;
	GOTO        L_interrupt151
;interrupt.h,83 :: 		case 1:                                                     // Impresso seta
L_interrupt163:
;interrupt.h,84 :: 		loadVetor(character_1Temp, character_2Temp);           // Carrega o vetor auxiliar
	MOVF        _character_1Temp+0, 0 
	MOVWF       FARG_loadVetor_character_1V+0 
	MOVF        _character_2Temp+0, 0 
	MOVWF       FARG_loadVetor_character_2V+0 
	CALL        _loadVetor+0, 0
;interrupt.h,85 :: 		currentPrint = 0;                                      // Configura proxima impressao
	CLRF        _currentPrint+0 
;interrupt.h,86 :: 		break;
	GOTO        L_interrupt151
;interrupt.h,87 :: 		}
L_interrupt150:
	MOVF        _currentPrint+0, 0 
	XORLW       0
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt152
	MOVF        _currentPrint+0, 0 
	XORLW       1
	BTFSC       STATUS+0, 2 
	GOTO        L_interrupt163
L_interrupt151:
;interrupt.h,88 :: 		counterEmptyColumn = 0;                                          // Seta o vetor auxiliar como cheio
	CLRF        _counterEmptyColumn+0 
;interrupt.h,89 :: 		}
L_interrupt149:
;interrupt.h,90 :: 		}
L_interrupt140:
;interrupt.h,91 :: 		PIR1.TMR2IF = 0;                                                           // Termina a execução do Timer2
	BCF         PIR1+0, 1 
;interrupt.h,92 :: 		}
L_end_interrupt:
L__interrupt195:
	RETFIE      1
; end of _interrupt

_main:

;Display2520.c,39 :: 		void main() {
;Display2520.c,41 :: 		initialSetup();
	CALL        _initialSetup+0, 0
;Display2520.c,43 :: 		character_1Temp = 'A';
	MOVLW       65
	MOVWF       _character_1Temp+0 
;Display2520.c,44 :: 		character_2Temp = 'G';
	MOVLW       71
	MOVWF       _character_2Temp+0 
;Display2520.c,46 :: 		while(1) {
L_main164:
;Display2520.c,47 :: 		asm {clrwdt}
	CLRWDT
;Display2520.c,48 :: 		}
	GOTO        L_main164
;Display2520.c,49 :: 		}
L_end_main:
	GOTO        $+0
; end of _main
