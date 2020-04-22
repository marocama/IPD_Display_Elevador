void interrupt() {

     setColumn(currentColumn);                                                  // Apaga tudo e varre as colunas
     printColumn(characterVetor[currentColumn-1]);                            // Imprime a coluna atual

     if(currentColumn >= 10) {                                                  // Verifica se chegou no final de uma varredura de colunas
          currentColumn   = 1;                                                  // Posiciona na primeira coluna novamente
          currentPosition = 1;                                                  // Posiciona no inicio do vetor a ser impresso
          counterPrint++;                                                       // Incrementa um contador de varreduras completas
     } else {
          currentColumn++;                                                      // Posiciona na proxima coluna
          currentPosition++;                                                    // Avança na proxima posição do vetor a ser impresso
     }

     if(counterPrint >= 180) {                                                  // Verifica um determinado numero de varreduras de colunas

          for(counterFor = 0; counterFor < 10; counterFor++) {                  // Executa o bloco de alterações 10 vezes para modificiar as 10 colunas

               switch(statusPrint) {                                            // Status atual: 0-Impressao Estatica | 1-Subindo | 2-Descendo
                    case 0:
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
          counterPrint = 0;                                                     // Zera a varredura de colunas
          counterEmptyColumn++;                                                 // Incrementa o esvaziamento do vetor auxiliar
          
          if(counterEmptyColumn >= 8) {                                         // Verifica o esvaziamento do vetor auxiliar. Para aumentar o espaçamento entre os caracteres verticalmente basta aumentar este numero

               // LOGICA DE ENVIAR CARACTER ATUAL, SETA OU PROXIMO CARACTER
               
               /*
               if() {
                    //
               } else if {
                    //
               } else {
                    //
               }
               */
               loadVetor(character_1, character_2);                             // Carrega o vetor auxiliar

               counterEmptyColumn = 0;                                          // Seta o vetor auxiliar como cheio
          }
     }
     
     PIR1.TMR2IF = 0;                                                           // Termina a execução do Timer2
}