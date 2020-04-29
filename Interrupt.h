void interrupt() {

     
     serialData = UART1_Read();
     if(serialData == 97) { setSerial('2', '0', 0); } // 20 parado
     if(serialData == 98) { setSerial('2', '0', 1); } // 20 desce
     if(serialData == 99) { setSerial('2', '1', 0); } // 21 parado
     if(serialData == 100) { setSerial('2', '1', 2); } // 21 desce
     
     if(serialData == 48) { setSerial(' ', 'T', 0); } // T parado
     if(serialData == 49) { setSerial(' ', 'T', 1); } // T desce
     if(serialData == 50) { setSerial(' ', '1', 0); } // 1 parado
     if(serialData == 51) { setSerial(' ', '1', 1); } // 3 desce
     if(serialData == 52) { setSerial(' ', '2', 0); } // 21 desce
     if(serialData == 53) { setSerial(' ', '2', 1); } // 21 desce
     if(serialData == 54) { setSerial(' ', '3', 0); } // 21 desce
     if(serialData == 55) { setSerial(' ', '3', 2); } // 21 desce
     //if(serialData ==   6) { setSerial('2', '0', 0); } // 20 parado
     //if(serialData ==  24) { setSerial('2', '0', 1); } // 20 sube
     //if(serialData ==  30) { setSerial('2', '0', 2); } // 20 desce
     //if(serialData ==  96) { setSerial('2', '1', 0); } // 21 parado
     //if(serialData == 102) { setSerial(' ', '3', 2); } // 21 desce

     setColumn(currentColumn);                                                  // Apaga tudo e varre as colunas
     printColumn(characterVetor[currentColumn-1]);                              // Imprime a coluna atual

     if(currentColumn >= 11) {                                                  // Verifica se chegou no final de uma varredura de colunas
          currentColumn   = 1;                                                  // Posiciona na primeira coluna novamente
          counterPrint++;                                                       // Incrementa um contador de varreduras completas
     } else {
          currentColumn++;                                                      // Posiciona na proxima coluna
     }

     if(stopAnimation == 1) { timeAnimation = 70; } else { timeAnimation = 15; } // Verifica se ha sinalizacao para congelar a animacao e aumenta o tempo

     if(counterPrint >= timeAnimation) {                                        // Verifica um determinado numero de varreduras de colunas

          counterPrint = 0;                                                     // Zera a varredura de colunas completas
          stopAnimation = 0;                                                    // Reseta a flag de congelamento

          for(counterFor = 0; counterFor < 10; counterFor++) {                  // Executa o bloco de alterações 10 vezes para modificiar as 10 colunas

               switch(statusDirection) {                                        // Status atual: 0-Impressao Estatica | 1-Subindo | 2-Descendo
                    case 0:
                         characterVetor[counterFor]    = characterVetorAux[counterFor];         // Clona o vetor auxiliar para o principal que sera impresso
                         break;
                    case 1:
                         characterVetor[counterFor]    = (characterVetor[counterFor] << 1);     // Desloca a coluna principal para a esquerda
                         characterVetor[counterFor].f0 = (characterVetorAux[counterFor].f7);    // Ocupa o espaço vazio que ficou na coluna principal após o deslocamento
                         characterVetorAux[counterFor] = (characterVetorAux[counterFor] << 1);  // Desloca a coluna auxiliar para acompanhar a proxima alteração
                         break;
                    case 2:
                         characterVetor[counterFor]    = (characterVetor[counterFor] >> 1);     // Desloca a coluna principal para a direita
                         characterVetor[counterFor].f7 = (characterVetorAux[counterFor].f0);    // Ocupa o espaço vazio que ficou na coluna principal após o deslocamento
                         characterVetorAux[counterFor] = (characterVetorAux[counterFor] >> 1);  // Desloca a coluna auxiliar para acompanhar a proxima alteração
                         break;
               }

          }
          counterEmptyColumn++;                                                 // Incrementa o esvaziamento do vetor auxiliar

          if(counterEmptyColumn >= 8) {                                         // Verifica o esvaziamento do vetor auxiliar. Para aumentar o espaçamento entre os caracteres verticalmente basta aumentar este numero

               switch(currentPrint) {
                    case 0:                                                     // Impresso andar
                         if(statusDirectionTemp == 0) {                         // Se o elevador sinalizar que parou
                              if((character_1Temp != character_1) || (character_2Temp != character_2)) { // Se estiver impresso um andar, mas recebeu um andar novo
                                   if(statusDirection == 1) loadVetor(0x19,'>');// Caso estivesse subindo
                                   if(statusDirection == 2) loadVetor(0x19,'<');// Caso estivesse descendo
                                   currentPrint = 1;                            // Configura proxima impressao
                              } else {
                                   loadVetor(character_1Temp, character_2Temp);
                                   statusDirection = statusDirectionTemp;
                              }
                         } else {
                              if(statusDirectionTemp == 1) loadVetor(0x19, '>');// Caso estivesse subindo
                              if(statusDirectionTemp == 2) loadVetor(0x19, '<');// Caso estivesse descendo
                              currentPrint = 1;
                              statusDirection = statusDirectionTemp;
                         }
                         stopAnimation = 1;                                     // Sinaliza para congelar a animação quando exibir o andar atual
                         break;
                    case 1:                                                     // Impresso seta
                         loadVetor(character_1Temp, character_2Temp);           // Carrega o vetor auxiliar
                         currentPrint = 0;                                      // Configura proxima impressao
                         break;
               }
               counterEmptyColumn = 0;                                          // Seta o vetor auxiliar como cheio
          }
     }
     PIR1.TMR2IF = 0;                                                           // Termina a execução do Timer2
}