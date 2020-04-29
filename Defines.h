#define      on_column_1       porta.f1=0                                       // Definição para ligar colunas
#define      on_column_2       portb.f3=0
#define      on_column_3       porta.f3=0
#define      on_column_4       porta.f5=0
#define      on_column_5       portb.f4=0
#define      on_column_6       portc.f0=0
#define      on_column_7       portc.f5=0
#define      on_column_8       portc.f1=0
#define      on_column_9       portc.f2=0
#define      on_column_10      portb.f0=0

#define      off_column_1      portc.f0=1                                       // Definição para desligar colunas
#define      off_column_2      portc.f5=1
#define      off_column_3      portc.f1=1
#define      off_column_4      portc.f2=1
#define      off_column_5      portb.f0=1
#define      off_column_6      porta.f1=1
#define      off_column_7      portb.f3=1
#define      off_column_8      porta.f3=1
#define      off_column_9      porta.f5=1
#define      off_column_10     portb.f4=1

#define      on_line_1         porta.f7=1                                       // Definição para ligar linhas
#define      on_line_2         porta.f0=1
#define      on_line_3         porta.f6=1
#define      on_line_4         porta.f2=1
#define      on_line_5         portb.f5=1
#define      on_line_6         portb.f1=1
#define      on_line_7         portb.f2=1

#define      off_line_1        porta.f7=0                                       // Definição para desligar colunas
#define      off_line_2        porta.f0=0
#define      off_line_3        porta.f6=0
#define      off_line_4        porta.f2=0
#define      off_line_5        portb.f5=0
#define      off_line_6        portb.f1=0
#define      off_line_7        portb.f2=0

// DEFINIÇÃO DOS DESENHOS DE CADA CARACTER ------------------------------------ //

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

char _0[4]  = { 0b01111100, 0b10000010, 0b10000010, 0b01111100 };
char _00[5] = { 0b01111100, 0b10000010, 0b10000010, 0b10000010, 0b01111100 };
char _1[4]  = { 0b00000000, 0b01000010, 0b11111110, 0b00000010 };
char _2[4]  = { 0b01000110, 0b10001010, 0b10010010, 0b01100010 };
char _22[5] = { 0b01000110, 0b10001010, 0b10010010, 0b10010010, 0b01100010 };
char _3[4]  = { 0b01000100, 0b10010010, 0b10010010, 0b01101100 };
char _33[5] = { 0b01000100, 0b10000010, 0b10010010, 0b10010010, 0b01101100 };
char _4[5]  = { 0b00011000, 0b00101000, 0b01001000, 0b11111110, 0b00001000 };
char _5[4]  = { 0b11100100, 0b10100010, 0b10100010, 0b10011100 };
char _55[5] = { 0b11100100, 0b10100010, 0b10100010, 0b10100010, 0b10011100 };
char _6[4]  = { 0b00111100, 0b01010010, 0b10010010, 0b00001100 };
char _66[5] = { 0b00111100, 0b01010010, 0b10010010, 0b10010010, 0b00001100 };
char _7[4]  = { 0b11000000, 0b10001110, 0b10010000, 0b11100000 };
char _77[5] = { 0b11000000, 0b10000000, 0b10001110, 0b10010000, 0b11100000 };
char _8[4]  = { 0b01101100, 0b10010010, 0b10010010, 0b01101100 };
char _88[5] = { 0b01101100, 0b10010010, 0b10010010, 0b10010010, 0b01101100 };
char _9[4]  = { 0b01100000, 0b10010010, 0b10010100, 0b01111000 };
char _99[5] = { 0b01100000, 0b10010010, 0b10010010, 0b10010100, 0b01111000 };

char _UP[6] = { 0b00100000, 0b01100000, 0b11111110, 0b11111110, 0b01100000, 0b00100000 };
char _DW[6] = { 0b00001000, 0b00001100, 0b11111110, 0b11111110, 0b00001100, 0b00001000 };
