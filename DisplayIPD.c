char character_1, character_2;                                                  // Caracteres que estão sendo impressos no momento

char characterVetor[10];                                                        // Vetor que será impresso

char nextCharacter_1, nextCharacter_2;                                          // Proximos caracteres na fila para impressao

char statusPrint;                                                               // Status atual: 0-Impressao Estatica | 1-Subindo | 2-Descendo

char currentColumn = 1, currentPosition = 1;                                    // Coluna ativa de leds e da letra atual

char counterVertical = 8;                                                       // Contador vertical para rolagem nas linhas

char counterFor = 0;                                                            // Variavel generica para contador em estruturas de repeticao

char counterPrint = 0;                                                          // É incrementada ao final e cada varredura das colunas.

char posInitialColumn = 1, posFinalColumn = 10;                                 // Posicao inicial e final de impressao. Irá alterar quando for ser impresso dois ou um caracter

#include <Defines.h>
#include <Functions.h>
#include <Interruption.h>

void main() {
     initialSetup();                                                            // Funcao que realiza as pre configuracoes do microcontrolador
     
     character_1 = '2';                                                         //
     character_2 = '9';
     statusPrint = 1;
     
     nextCharacter_1 = 'A';
     nextCharacter_2 = 'B';

     while(1) {
          asm {clrwdt}
          //on_column_5; on_line_5; turnOffLeds();
     }
}