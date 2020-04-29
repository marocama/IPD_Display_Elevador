#line 1 "C:/Users/Public/Documents/Mikroelektronika/mikroC PRO for PIC/Projects/DisplayIPD/Display2520.c"


char character_1Temp, character_2Temp;

char statusDirectionTemp = 0;



char character_1, character_2;

char statusDirection = 0;

char characterVetor[10] = { 16, 16, 16, 16, 16, 16, 16, 16, 16, 16 };

char characterVetorAux[10] = { 0, 16, 16, 16, 0, 0, 16, 16, 16, 0 };

char currentColumn = 1;

char counterFor = 0;

char counterPrint = 0;

char counterEmptyColumn = 0;

char currentPrint = 0;

char timeAnimation = 0, stopAnimation = 0;

char persistData = 1;

char serialData = 102;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/projects/displayipd/defines.h"
#line 41 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/projects/displayipd/defines.h"
char _A[4] = { 0b01111110, 0b10010000, 0b10010000, 0b01111110 };
char _B[4] = { 0b11111110, 0b10010010, 0b10010010, 0b01101100 };
char _C[4] = { 0b01111100, 0b10000010, 0b10000010, 0b01000100 };
char _D[4] = { 0b11111110, 0b10000010, 0b01000100, 0b00111000 };
char _E[4] = { 0b11111110, 0b10010010, 0b10010010, 0b10010010 };
char _F[4] = { 0b11111110, 0b10010000, 0b10010000, 0b10010000 };
char _G[4] = { 0b01111100, 0b10000010, 0b10010010, 0b01011100 };

char _H[4] = { 0b11111110, 0b00010000, 0b00010000, 0b11111110 };
char _I[4] = { 0b00000000, 0b10000010, 0b11111110, 0b10000010 };
char _J[4] = { 0b00000100, 0b10000010, 0b11111100, 0b10000000 };
char _K[4] = { 0b11111110, 0b00010000, 0b00101000, 0b11000110 };
char _L[4] = { 0b11111110, 0b00000010, 0b00000010, 0b00000010 };
char _M[5] = { 0b11111110, 0b01000000, 0b00100000, 0b01000000, 0b11111110 };
char _N[5] = { 0b11111110, 0b00100000, 0b00010000, 0b00001000, 0b11111110 };
char _O[4] = { 0b01111100, 0b10000010, 0b10000010, 0b01111100 };
char _P[4] = { 0b11111110, 0b10010000, 0b10010000, 0b01100000 };
char _Q[5] = { 0b01111100, 0b10000010, 0b10000110, 0b01111110, 0b00000010 };
char _R[5] = { 0b11111110, 0b10010000, 0b10011000, 0b10010100, 0b01100010 };
char _S[4] = { 0b01100100, 0b10010010, 0b10010010, 0b01001100 };
char _T[5] = { 0b10000000, 0b10000000, 0b11111110, 0b10000000, 0b10000000 };
char _U[4] = { 0b11111100, 0b00000010, 0b00000010, 0b11111100 };
char _V[5] = { 0b11111000, 0b00000100, 0b00000010, 0b00000100, 0b11111000 };
char _W[5] = { 0b11111110, 0b00000100, 0b00001000, 0b00000100, 0b11111110 };
char _X[5] = { 0b11000110, 0b00101000, 0b00010000, 0b00101000, 0b11000110 };
char _Y[5] = { 0b10000000, 0b01000000, 0b00111110, 0b01000000, 0b10000000 };
char _Z[5] = { 0b10000110, 0b10001010, 0b10010010, 0b10100010, 0b11000010 };

char _0[4] = { 0b01111100, 0b10000010, 0b10000010, 0b01111100 };
char _00[5] = { 0b01111100, 0b10000010, 0b10000010, 0b10000010, 0b01111100 };
char _1[4] = { 0b00000000, 0b01000010, 0b11111110, 0b00000010 };
char _2[4] = { 0b01000110, 0b10001010, 0b10010010, 0b01100010 };
char _22[5] = { 0b01000110, 0b10001010, 0b10010010, 0b10010010, 0b01100010 };
char _3[4] = { 0b01000100, 0b10010010, 0b10010010, 0b01101100 };
char _33[5] = { 0b01000100, 0b10000010, 0b10010010, 0b10010010, 0b01101100 };
char _4[5] = { 0b00011000, 0b00101000, 0b01001000, 0b11111110, 0b00001000 };
char _5[4] = { 0b11100100, 0b10100010, 0b10100010, 0b10011100 };
char _55[5] = { 0b11100100, 0b10100010, 0b10100010, 0b10100010, 0b10011100 };
char _6[4] = { 0b00111100, 0b01010010, 0b10010010, 0b00001100 };
char _66[5] = { 0b00111100, 0b01010010, 0b10010010, 0b10010010, 0b00001100 };
char _7[4] = { 0b11000000, 0b10001110, 0b10010000, 0b11100000 };
char _77[5] = { 0b11000000, 0b10000000, 0b10001110, 0b10010000, 0b11100000 };
char _8[4] = { 0b01101100, 0b10010010, 0b10010010, 0b01101100 };
char _88[5] = { 0b01101100, 0b10010010, 0b10010010, 0b10010010, 0b01101100 };
char _9[4] = { 0b01100000, 0b10010010, 0b10010100, 0b01111000 };
char _99[5] = { 0b01100000, 0b10010010, 0b10010010, 0b10010100, 0b01111000 };

char _UP[6] = { 0b00100000, 0b01100000, 0b11111110, 0b11111110, 0b01100000, 0b00100000 };
char _DW[6] = { 0b00001000, 0b00001100, 0b11111110, 0b11111110, 0b00001100, 0b00001000 };
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/projects/displayipd/config.h"
void initialSetup() {

 TRISA = 0b00010000; TRISB = 0b11000000; TRISC = 0b11011000;

 ADCON1 = 0b00001111; CMCON = 0b00000111;

 OSCCON = 0b01110100; OSCTUNE = 0b00000001;

 INTCON = 0b11000000;

 PR2 = 255; RCON.IPEN = 1; PIE1.TMR2IE = 1; IPR1.TMR2IP = 1; PIR1.TMR2IF = 0; T2CON = 0b00000101;

 UART1_Init(9600);
}
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/projects/displayipd/functions.h"
void setColumn(int column) {

 PORTA |= 0b00101010;
 PORTB |= 0b00011001;
 PORTC |= 0b00100111;

 PORTA &= 0b00111010;
 PORTB &= 0b11011001;

 switch(column) {
 case 1:
  porta.f1=0 ;
 break;
 case 2:
  portb.f3=0 ;
 break;
 case 3:
  porta.f3=0 ;
 break;
 case 4:
  porta.f5=0 ;
 break;
 case 5:
  portb.f4=0 ;
 break;
 case 6:
  portc.f0=0 ;
 break;
 case 7:
  portc.f5=0 ;
 break;
 case 8:
  portc.f1=0 ;
 break;
 case 9:
  portc.f2=0 ;
 break;
 case 10:
  portb.f0=0 ;
 }
}

void lightLine(int line) {

 switch(line) {
 case 1:
  portb.f2=1 ;
 break;
 case 2:
  portb.f1=1 ;
 break;
 case 3:
  portb.f5=1 ;
 break;
 case 4:
  porta.f2=1 ;
 break;
 case 5:
  porta.f6=1 ;
 break;
 case 6:
  porta.f0=1 ;
 break;
 case 7:
  porta.f7=1 ;
 break;
 }
}

int verifyBit(char character, char position) {

 switch(position) {
 case 1:
 return character.f1;
 break;
 case 2:
 return character.f2;
 break;
 case 3:
 return character.f3;
 break;
 case 4:
 return character.f4;
 break;
 case 5:
 return character.f5;
 break;
 case 6:
 return character.f6;
 break;
 case 7:
 return character.f7;
 break;
 }
}

void printColumn(char character) {

 for(counterFor = 1; counterFor < 8; counterFor++) {
 if(verifyBit(character, counterFor))
 lightLine(counterFor);
 }
}

void switchCharacter(int position, char character) {

 char max = 4, oneChar = 0;

 if(position == 2) max = 6;
 if(position == 3) oneChar = 1;

 for(counterFor = 0; counterFor < max; counterFor++) {

 switch(character) {
 case 'A':
 characterVetorAux[position] = _A[counterFor];
 break;
 case 'B':
 characterVetorAux[position] = _B[counterFor];
 break;
 case 'C':
 characterVetorAux[position] = _C[counterFor];
 break;
 case 'D':
 characterVetorAux[position] = _D[counterFor];
 break;
 case 'E':
 characterVetorAux[position] = _E[counterFor];
 break;
 case 'F':
 characterVetorAux[position] = _F[counterFor];
 break;
 case 'G':
 characterVetorAux[position] = _G[counterFor];
 break;
 case 'H':
 characterVetorAux[position] = _H[counterFor];
 break;
 case 'I':
 characterVetorAux[position] = _I[counterFor];
 break;
 case 'J':
 characterVetorAux[position] = _J[counterFor];
 break;
 case 'K':
 characterVetorAux[position] = _K[counterFor];
 break;
 case 'L':
 characterVetorAux[position] = _L[counterFor];
 break;
 case 'M':
 if(max == 4) max++;
 characterVetorAux[position] = _M[counterFor];
 break;
 case 'N':
 if(max == 4) max++;
 characterVetorAux[position] = _N[counterFor];
 break;
 case 'O':
 characterVetorAux[position] = _O[counterFor];
 break;
 case 'P':
 characterVetorAux[position] = _P[counterFor];
 break;
 case 'Q':
 if(max == 4) max++;
 characterVetorAux[position] = _Q[counterFor];
 break;
 case 'R':
 if(max == 4) max++;
 characterVetorAux[position] = _R[counterFor];
 break;
 case 'S':
 characterVetorAux[position] = _S[counterFor];
 break;
 case 'T':
 if(max == 4) max++;
 characterVetorAux[position] = _T[counterFor];
 break;
 case 'U':
 characterVetorAux[position] = _U[counterFor];
 break;
 case 'V':
 if(max == 4) max++;
 characterVetorAux[position] = _V[counterFor];
 break;
 case 'W':
 if(max == 4) max++;
 characterVetorAux[position] = _W[counterFor];
 break;
 case 'X':
 if(max == 4) max++;
 characterVetorAux[position] = _X[counterFor];
 break;
 case 'Y':
 if(max == 4) max++;
 characterVetorAux[position] = _Y[counterFor];
 break;
 case 'Z':
 if(max == 4) max++;
 characterVetorAux[position] = _Z[counterFor];
 break;
 case '0':
 characterVetorAux[position] = (oneChar == 1) ? _00[counterFor] : _0[counterFor];
 if(oneChar) max = 5;
 break;
 case '1':
 characterVetorAux[position] = _1[counterFor];
 break;
 case '2':
 characterVetorAux[position] = (oneChar) ? _22[counterFor] : _2[counterFor];
 if(oneChar) max = 5;
 break;
 case '3':
 characterVetorAux[position] = (oneChar) ? _33[counterFor] : _3[counterFor];
 if(oneChar) max = 5;
 break;
 case '4':
 if(max == 4) max++;
 characterVetorAux[position] = _4[counterFor];
 break;
 case '5':
 characterVetorAux[position] = (oneChar) ? _55[counterFor] : _5[counterFor];
 if(oneChar) max = 5;
 break;
 case '6':
 characterVetorAux[position] = (oneChar) ? _66[counterFor] : _6[counterFor];
 if(oneChar) max = 5;
 break;
 case '7':
 characterVetorAux[position] = (oneChar) ? _77[counterFor] : _7[counterFor];
 if(oneChar) max = 5;
 break;
 case '8':
 characterVetorAux[position] = (oneChar) ? _88[counterFor] : _8[counterFor];
 if(oneChar) max = 5;
 break;
 case '9':
 characterVetorAux[position] = (oneChar) ? _99[counterFor] : _9[counterFor];
 if(oneChar) max = 5;
 break;
 case '>':
 characterVetorAux[position] = _UP[counterFor];
 break;
 case '<':
 characterVetorAux[position] = _DW[counterFor];
 break;
 }
 position++;
 }
}


void loadVetor(char character_1V, char character_2V) {

 for(counterFor = 0; counterFor < 10; counterFor++) {
 characterVetorAux[counterFor] = 0;
 }

 if(character_1V == 0x19) {
 switchCharacter(2, character_2V);
 } else if(character_1V == 0x20) {
 switchCharacter(3, character_2V);
 } else {
 switchCharacter(0, character_1V);
 switchCharacter(5, character_2V);
 }

 character_1 = character_1Temp;
 character_2 = character_2Temp;

}

void setSerial(char characterV_1, char characterV_2, char status) {

 if(characterV_1 != 0x19) character_1Temp = characterV_1;
 if(characterV_2 != 0x19) character_2Temp = characterV_2;
 if(status != 0x19) statusDirectionTemp = status;

 persistData = 0;
}
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/projects/displayipd/interrupt.h"
void interrupt() {


 serialData = UART1_Read();
 if(serialData == 97) { setSerial('2', '0', 0); }
 if(serialData == 98) { setSerial('2', '0', 1); }
 if(serialData == 99) { setSerial('2', '1', 0); }
 if(serialData == 100) { setSerial('2', '1', 2); }

 if(serialData == 48) { setSerial(' ', 'T', 0); }
 if(serialData == 49) { setSerial(' ', 'T', 1); }
 if(serialData == 50) { setSerial(' ', '1', 0); }
 if(serialData == 51) { setSerial(' ', '1', 1); }
 if(serialData == 52) { setSerial(' ', '2', 0); }
 if(serialData == 53) { setSerial(' ', '2', 1); }
 if(serialData == 54) { setSerial(' ', '3', 0); }
 if(serialData == 55) { setSerial(' ', '3', 2); }






 setColumn(currentColumn);
 printColumn(characterVetor[currentColumn-1]);

 if(currentColumn >= 11) {
 currentColumn = 1;
 counterPrint++;
 } else {
 currentColumn++;
 }

 if(stopAnimation == 1) { timeAnimation = 70; } else { timeAnimation = 15; }

 if(counterPrint >= timeAnimation) {

 counterPrint = 0;
 stopAnimation = 0;

 for(counterFor = 0; counterFor < 10; counterFor++) {

 switch(statusDirection) {
 case 0:
 characterVetor[counterFor] = characterVetorAux[counterFor];
 break;
 case 1:
 characterVetor[counterFor] = (characterVetor[counterFor] << 1);
 characterVetor[counterFor].f0 = (characterVetorAux[counterFor].f7);
 characterVetorAux[counterFor] = (characterVetorAux[counterFor] << 1);
 break;
 case 2:
 characterVetor[counterFor] = (characterVetor[counterFor] >> 1);
 characterVetor[counterFor].f7 = (characterVetorAux[counterFor].f0);
 characterVetorAux[counterFor] = (characterVetorAux[counterFor] >> 1);
 break;
 }

 }
 counterEmptyColumn++;

 if(counterEmptyColumn >= 8) {

 switch(currentPrint) {
 case 0:
 if(statusDirectionTemp == 0) {
 if((character_1Temp != character_1) || (character_2Temp != character_2)) {
 if(statusDirection == 1) loadVetor(0x19,'>');
 if(statusDirection == 2) loadVetor(0x19,'<');
 currentPrint = 1;
 } else {
 loadVetor(character_1Temp, character_2Temp);
 statusDirection = statusDirectionTemp;
 }
 } else {
 if(statusDirectionTemp == 1) loadVetor(0x19, '>');
 if(statusDirectionTemp == 2) loadVetor(0x19, '<');
 currentPrint = 1;
 statusDirection = statusDirectionTemp;
 }
 stopAnimation = 1;
 break;
 case 1:
 loadVetor(character_1Temp, character_2Temp);
 currentPrint = 0;
 break;
 }
 counterEmptyColumn = 0;
 }
 }
 PIR1.TMR2IF = 0;
}
#line 39 "C:/Users/Public/Documents/Mikroelektronika/mikroC PRO for PIC/Projects/DisplayIPD/Display2520.c"
void main() {

 initialSetup();

 character_1Temp = 'A';
 character_2Temp = 'G';

 while(1) {
 asm {clrwdt}
 }
}
