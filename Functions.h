void setColumn(int column) {

     PORTA |= 0b00101010;                                                       // Desliga todas as colunas
     PORTB |= 0b00011001;                                                       // Desliga todas as colunas
     PORTC |= 0b00100111;                                                       // Desliga todas as colunas

     PORTA &= 0b00111010;                                                       // Desliga todas as linhas
     PORTB &= 0b11011001;                                                       // Desliga todas as linhas

     switch(column) {                                                           // Liga a coluna passada por parametro
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
               on_column_5;
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
          case 10:
               on_column_10;
          default:
               break;
     }
}

void lightLine(int line) {                                                      // Liga a linha passada por parametro

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

int verifyBit(char character, char position) {                                  // Recebe um caracter e uma posição de 0 a 7 e retorna o bit do caracter na posicao solicitada
     
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

void printColumn(char character) {                                              // Recebe a coluna de um caracter como parametro e liga as respectivas linhas

     for(counterFor = 1; counterFor < 8; counterFor++) {                        // Varre os 8 bits do caracter recebido como parametro
          if(verifyBit(character, counterFor))                                  // Verifica se o bit atual é 1 ou 0
               lightLine(counterFor);                                           // Se o bit atual for 1, liga a respectiva linha
     }
}

void switchCharacter(int position, char character) {                            // Recebe a posicao do vetor auxiliar um caracter. Após a busca nos defines, completa aquela posicao com o caracter desejado

     for(counterFor = 0; counterFor < 4; counterFor++) {                        // Realiza o procedimento nas quatro colunas do caracter escolhido

          switch(character) {                                                   // Busca nos defines pelo caracter
               case 'A':
                    characterVetorAux[position] = _A[counterFor];               // Preenche no vetor na posicao escolhida
                    break;
               case '2':
                    characterVetorAux[position] = _2[counterFor];
                    break;
          }
          position++;                                                           // Avança a proxima posicao no vetor auxiliar
     }
}

void loadVetor(char character_1, char character_2) {                            // Recebe os dois caracteres e preenche o vetor auxiliar por completo

     for(counterFor = 0; counterFor < 10; counterFor++) {                       // Limpa todo o vetor auxiliar
          characterVetorAux[counterFor] = 0;
     }

     if(character_1 == 0x20) {                                                  // Se o character_1 for igual a 0x20, apenas o character_2 sera impresso e o mesmo sera centralizado
          switchCharacter(3, character_2);
     } else {                                                                   // Senao, imprime os dois caracteres
          switchCharacter(0, character_1);
          switchCharacter(5, character_2);
     }
}
