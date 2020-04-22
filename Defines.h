#define      on_column_1       porta.f1=0
#define      on_column_2       portb.f3=0
#define      on_column_3       porta.f3=0
#define      on_column_4       porta.f5=0
#define      on_column_5       portb.f4=0
#define      on_column_6       portc.f0=0
#define      on_column_7       portc.f5=0
#define      on_column_8       portc.f1=0
#define      on_column_9       portc.f2=0
#define      on_column_10      portb.f0=0

#define      off_column_1      portc.f0=1
#define      off_column_2      portc.f5=1
#define      off_column_3      portc.f1=1
#define      off_column_4      portc.f2=1
#define      off_column_5      portb.f0=1
#define      off_column_6      porta.f1=1
#define      off_column_7      portb.f3=1
#define      off_column_8      porta.f3=1
#define      off_column_9      porta.f5=1
#define      off_column_10     portb.f4=1

#define      on_line_1         porta.f7=1
#define      on_line_2         porta.f0=1
#define      on_line_3         porta.f6=1
#define      on_line_4         porta.f2=1
#define      on_line_5         portb.f5=1
#define      on_line_6         portb.f1=1
#define      on_line_7         portb.f2=1

#define      off_line_1        porta.f7=0
#define      off_line_2        porta.f0=0
#define      off_line_3        porta.f6=0
#define      off_line_4        porta.f2=0
#define      off_line_5        portb.f5=0
#define      off_line_6        portb.f1=0
#define      off_line_7        portb.f2=0

char _A[4] = { 0b11111100, 0b00010010, 0b00010010, 0b11111100 };
char _B[4] = { 0b11111110, 0b10010010, 0b10010010, 0b01101100 };
char _C[4] = { 0b01111110, 0b10000010, 0b10000010, 0b01111100 };
char _D[4] = { 0b11111110, 0b10000010, 0b01000100, 0b00111000 };
char _E[4] = { 0b11111110, 0b10010010, 0b10010010, 0b10010010 };

char _0[4] = { 0b01111100, 0b10000010, 0b10000010, 0b01111100 };
char _1[4] = { 0b00001000, 0b10000100, 0b11111110, 0b10000000 };
char _2[4] = { 0b11000100, 0b10100010, 0b10010010, 0b10001100 };
char _3[4] = { 0b00000000, 0b00000000, 0b00000000, 0b00000000 };
char _4[4] = { 0b00000000, 0b00000000, 0b00000000, 0b00000000 };
char _5[4] = { 0b00000000, 0b00000000, 0b00000000, 0b00000000 };
char _6[4] = { 0b00000000, 0b00000000, 0b00000000, 0b00000000 };
char _7[4] = { 0b00000000, 0b00000000, 0b00000000, 0b00000000 };
char _8[4] = { 0b00000000, 0b00000000, 0b00000000, 0b00000000 };
char _9[4] = { 0b01001100, 0b10010010, 0b10010010, 0b01111100 };

char _DW[6] = { 0b00100000, 0b01100000, 0b11111111, 0b11111111, 0b01100000, 0b01000000, };
char _UP[6] = { 0b00000100, 0b00001100, 0b11111111, 0b11111111, 0b00001100, 0b00000100, };


void initialSetup() {
ANSEL = 0; ANSELH = 0;

C1ON_BIT = 0; C2ON_BIT = 0;

TRISA = 0b00010000; 
TRISB = 0b11000000; 
TRISC = 0b11011000;

WPUB   = 0b11000000; ADCON1  = 0b00001111;
OSCCON = 0b01110100; OSCTUNE = 0b00000000;
   
OPTION_REG = 0b00001111;
INTCON = 0b11000000;

PIE1.TMR2IE = 1;
T2CON = 0b00000101;
}