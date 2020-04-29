void setColumn(int column) {

     PORTA |= 0b00101010;                                                       // Desliga todas as colunas
     PORTB |= 0b00011001;                                                       // Desliga todas as colunas
     PORTC |= 0b00100111;                                                       // Desliga todas as colunas

     PORTA &= 0b00111010;                                                       // Desliga todas as linhas
     PORTB &= 0b11011001;
     
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

     char max = 4, oneChar = 0;                                                 // Variaveis locais para controle de posicionamento

     if(position == 2) max = 6;                                                 // Se a posicao for 2, significa que sera impresso a seta, e a mesma possui 6 colunas
     if(position == 3) oneChar = 1;                                             // Se a posicao for 3, significa que apenas um caracter sera impresso

     for(counterFor = 0; counterFor < max; counterFor++) {                      // Realiza o procedimento nas quatro colunas do caracter escolhido

          switch(character) {                                                   // Busca nos defines pelo caracter
               case 'A':
                    characterVetorAux[position] = _A[counterFor];               // Preenche no vetor na posicao escolhida
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
                    if(max == 4) max++;                                         // Por ser um caracter que necessita de 5 colunas para ficar bem desenhado, incrementa uma coluna para impressao
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
                    characterVetorAux[position] = (oneChar == 1) ? _00[counterFor] : _0[counterFor];  // Verifica se apenas um caracter esta sendo impresso. Se sim, utiliza o caracter com 5 colunas para melhor estetica.
                    if(oneChar) max = 5;                                                              // Alem de incrementar uma coluna na impressao para comportar o caracter mais largo
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
          position++;                                                           // Avança a proxima posicao no vetor auxiliar
     }
}


void loadVetor(char character_1V, char character_2V) {                          // Recebe os dois caracteres e preenche o vetor auxiliar por completo

     for(counterFor = 0; counterFor < 10; counterFor++) {                       // Limpa todo o vetor auxiliar
          characterVetorAux[counterFor] = 0;
     }

     if(character_1V == 0x19) {                                                 // Se o character_1 for igual a 0x20, a seta sera impressa
          switchCharacter(2, character_2V);
     } else if(character_1V == 0x20) {                                          // Senao, se o character_1 for igual a 0x00, apenas o character_2 sera impresso e o mesmo sera centralizado
          switchCharacter(3, character_2V);
     } else {                                                                   // Senao, imprime os dois caracteres
          switchCharacter(0, character_1V);
          switchCharacter(5, character_2V);
     }

     character_1 = character_1Temp;                                             // Contesta que o caracter que foi recebido na serial ja persiste na tela
     character_2 = character_2Temp;

}

void setSerial(char characterV_1, char characterV_2, char status) {

     if(characterV_1 != 0x19) character_1Temp = characterV_1;
     if(characterV_2 != 0x19) character_2Temp = characterV_2;
     if(status != 0x19)   statusDirectionTemp = status;

     persistData = 0;
}