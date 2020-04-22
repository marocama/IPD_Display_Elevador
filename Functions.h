void setColumn(int column) {

     PORTA |= 0b00101010; // off all columns
     PORTB |= 0b00011001;
     PORTC |= 0b00100111;

     PORTA &= 0b00111010; // off all lines
     PORTB &= 0b11011001;

     switch(column) {
          case 1:
               on_column_1;
               break;
          case 2:
               on_column_2;
               break;
          case 3:
               on_column_3;
               break;
          case 4:
               on_column_4;
               break;
          case 5:
               if(posInitialColumn == 4) on_column_5;
               break;
          case 6:
               on_column_6;
               break;
          case 7:
               on_column_7;
               break;
          case 8:
               on_column_8;
               break;
          case 9:
               on_column_9;
               break;
          default:
               break;
     }
}

void lightLine(int line) {

     switch(line) {
          case 1:
               on_line_7;
               break;
          case 2:
               on_line_6;
               break;
          case 3:
               on_line_5;
               break;
          case 4:
               on_line_4;
               break;
          case 5:
               on_line_3;
               break;
          case 6:
               on_line_2;
               break;
          case 7:
               on_line_1;
               break;
     }
}

int verifyBit(char character, char position) {
     
     switch(position) {
          case 0:
               return character.f0;
               break;
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

     for(counterFor = 1; counterFor < counterVertical; counterFor++) {
          if(verifyBit(character, counterFor)) 
               lightLine(counterVertical-counterFor);
     }
}

void printStorey(char character_1, char character_2, int status) {

     char characterAux;

     if(posInitialColumn == 1 && currentColumn < 6) {                           // Seta caracter que sera impresso no momento
          characterAux = character_1;
     } else {
          characterAux = character_2;
     }
     
     //if(currentPrint % 2)
       //              character = SETA;

     switch(characterAux) {
          case 'A':
               printColumn(_A[currentPosition-1]);
               break;
          case 'B':
               printColumn(_B[currentPosition-1]);
               break;
          case 'C':
               printColumn(_C[currentPosition-1]);
               break;
          case 'D':
               printColumn(_D[currentPosition-1]);
               break;
          case 'E':
               printColumn(_E[currentPosition-1]);
               break;
          case '0':
               printColumn(_0[currentPosition-1]);
               break;
          case '1':
               printColumn(_1[currentPosition-1]);
               break;
          case '2':
               printColumn(_2[currentPosition-1]);
               break;
          case '3':
               printColumn(_3[currentPosition-1]);
               break;
          case '4':
               printColumn(_4[currentPosition-1]);
               break;
          case '5':
               printColumn(_5[currentPosition-1]);
               break;
          case '6':
               printColumn(_6[currentPosition-1]);
               break;
          case '7':
               printColumn(_7[currentPosition-1]);
               break;
          case '8':
               printColumn(_8[currentPosition-1]);
               break;
          case '9':
               printColumn(_9[currentPosition-1]);
               break;
          default:
               break;
     }


}