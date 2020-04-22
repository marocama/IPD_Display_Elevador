// VARIAVEIS A SEREM POPULADAS PELA SERIAL -------------------------------------//
                                                                                //
char character_1, character_2;                                                  // Caracteres que estão sendo impressos no momento
                                                                                //
char nextCharacter_1, nextCharacter_2;                                          // Proximos caracteres na fila para impressao
                                                                                //
char statusPrint;                                                               // Status atual: 0-Impressao Estatica | 1-Subindo | 2-Descendo
                                                                                //
// VARIAVEIS DE USO INTERNO DO PROGRAMA ----------------------------------------//
                                                                                //
char characterVetor[10] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };                     // Vetor que será impresso
                                                                                //
char characterVetorAux[10] = { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };                  // Vetor auxiliar que deslocará seus bits para o vetor principal
                                                                                //
char currentColumn = 1;                                                         // Coluna ativa de leds atual
                                                                                //
char counterFor = 0;                                                            // Variavel generica para contador em estruturas de repeticao
                                                                                //
char counterPrint = 0;                                                          // É incrementada ao final e cada varredura das colunas.
                                                                                //
char counterEmptyColumn = 0;                                                    // Informa o esvaziamento do vetor auxiliar
// -----------------------------------------------------------------------------//

#include <Defines.h>
#include <Functions.h>
#include <Interruption.h>

void main() {
     initialSetup();                                                            // Funcao que realiza as pre configuracoes do microcontrolador
     
     character_1 = 'A';
     character_2 = '2';
     statusPrint = 1;
     
     nextCharacter_1 = '2';
     nextCharacter_2 = 'A';

     while(1) {
          asm {clrwdt}
          //on_column_5; on_line_5; turnOffLeds();
     }
}