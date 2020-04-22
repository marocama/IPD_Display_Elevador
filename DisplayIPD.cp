#line 1 "C:/Users/Public/Documents/Mikroelektronika/mikroC PRO for PIC/Projects/DisplayIPD/v3/DisplayIPD.c"


char character_1, character_2;

char nextCharacter_1, nextCharacter_2;

char statusPrint;



char characterVetor[10] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

char characterVetorAux[10] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };

char currentColumn = 1, currentPosition = 1;

char counterFor = 0;

char counterPrint = 0;

char counterEmptyColumn = 0;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/projects/displayipd/v3/defines.h"
#line 39 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/projects/displayipd/v3/defines.h"
char _A[4] = { 0b01111110, 0b10010000, 0b10010000, 0b01111110 };
char _B[4] = { 0b11111110, 0b10010010, 0b10010010, 0b01101100 };
char _C[4] = { 0b01111110, 0b10000010, 0b10000010, 0b01111100 };
char _D[4] = { 0b11111110, 0b10000010, 0b01000100, 0b00111000 };
char _E[4] = { 0b11111110, 0b10010010, 0b10010010, 0b10010010 };

char _0[4] = { 0b01111100, 0b10000010, 0b10000010, 0b01111100 };
char _1[4] = { 0b00001000, 0b10000100, 0b11111110, 0b10000000 };
char _2[4] = { 0b01000110, 0b10001010, 0b10010010, 0b01100010 };
char _3[4] = { 0b00000000, 0b00000000, 0b00000000, 0b00000000 };
char _4[4] = { 0b00000000, 0b00000000, 0b00000000, 0b00000000 };
char _5[4] = { 0b00000000, 0b00000000, 0b00000000, 0b00000000 };
char _6[4] = { 0b00000000, 0b00000000, 0b00000000, 0b00000000 };
char _7[4] = { 0b00000000, 0b00000000, 0b00000000, 0b00000000 };
char _8[4] = { 0b00000000, 0b00000000, 0b00000000, 0b00000000 };
char _9[4] = { 0b01001100, 0b10010010, 0b10010010, 0b01111100 };

char _DW[6] = { 0b01000000, 0b01100000, 0b11111111, 0b11111111, 0b01100000, 0b01000000, };
char _UP[6] = { 0b00000100, 0b00001100, 0b11111111, 0b11111111, 0b00001100, 0b00000100, };


void initialSetup() {
ANSEL = 0; ANSELH = 0;

C1ON_BIT = 0; C2ON_BIT = 0;

TRISA = 0b00010000;
TRISB = 0b11000000;
TRISC = 0b11011000;

WPUB = 0b11000000; ADCON1 = 0b00001111;
OSCCON = 0b01110100; OSCTUNE = 0b00000000;

OPTION_REG = 0b00001111;
INTCON = 0b11000000;

PIE1.TMR2IE = 1;
T2CON = 0b00000101;
}
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/projects/displayipd/v3/functions.h"
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
 default:
 break;
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

 for(counterFor = 0; counterFor < 4; counterFor++) {

 switch(character) {
 case 'A':
 characterVetorAux[position] = _A[counterFor];
 break;
 case '2':
 characterVetorAux[position] = _2[counterFor];
 break;
 }
 position++;
 }
}

void loadVetor(char character_1, char character_2) {

 for(counterFor = 0; counterFor < 10; counterFor++) {
 characterVetorAux[counterFor] = 0;
 }

 if(character_1 == 0x20) {
 switchCharacter(3, character_2);
 } else {
 switchCharacter(0, character_1);
 switchCharacter(5, character_2);
 }
}
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/projects/displayipd/v3/interruption.h"
void interrupt() {

 setColumn(currentColumn);
 printColumn(characterVetor[currentColumn-1]);

 if(currentColumn >= 10) {
 currentColumn = 1;
 currentPosition = 1;
 counterPrint++;
 } else {
 currentColumn++;
 currentPosition++;
 }

 if(counterPrint >= 180) {

 for(counterFor = 0; counterFor < 10; counterFor++) {

 switch(statusPrint) {
 case 0:
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
 counterPrint = 0;
 counterEmptyColumn++;

 if(counterEmptyColumn >= 8) {
#line 51 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/projects/displayipd/v3/interruption.h"
 loadVetor(character_1, character_2);

 counterEmptyColumn = 0;
 }
 }

 PIR1.TMR2IF = 0;
}
#line 28 "C:/Users/Public/Documents/Mikroelektronika/mikroC PRO for PIC/Projects/DisplayIPD/v3/DisplayIPD.c"
void main() {
 initialSetup();

 character_1 = 'A';
 character_2 = '2';
 statusPrint = 1;

 nextCharacter_1 = '2';
 nextCharacter_2 = 'A';

 while(1) {
 asm {clrwdt}

 }
}
