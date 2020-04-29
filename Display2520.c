// -----------------------------------------------------------------------------
// Projeto : Display IPD Elev
// Placa: IPD de Cabine 
// Microcontrolador : 18F2520
// Data : 28/04/2020
// Autor : Marcus Roberto
// Versão: 1.2
// Compilador: MikroC PRO for PIC v.6.6.2
// Obs: Protocolo a ser recebido pela serial: (Primeiro caracter | Secundo caracter | Status cabine)
//------------------------------------------------------------------------------

// VARIAVEIS A SEREM POPULADAS PELA SERIAL ------------------------------------ //
                                                                                //
char character_1Temp, character_2Temp;                                          // Proximos caracteres a serem impressos
                                                                                //
char statusDirectionTemp = 0;                                                   // Proximo status: 0- Parado | 1- Subindo | 2- Descendo
                                                                                //
// VARIAVEIS DE USO INTERNO DO PROGRAMA --------------------------------------- //
                                                                                //
char character_1, character_2;                                                  // Caracteres que estão sendo impressos no momento
                                                                                //
char statusDirection = 0;                                                       // Status atual: 0- Parado | 1- Subindo | 2- Descendo
                                                                                //
char characterVetor[10] = { 16, 16, 16, 16, 16, 16, 16, 16, 16, 16 };           // Vetor que será impresso
                                                                                //
char characterVetorAux[10] = { 0, 16, 16, 16, 0, 0, 16, 16, 16, 0 };            // Vetor auxiliar que deslocará seus bits para o vetor principal
                                                                                //
char currentColumn = 1;                                                         // Coluna ativa de leds atual
                                                                                //
char counterFor = 0;                                                            // Variavel generica para contador em estruturas de repeticao
                                                                                //
char counterPrint = 0;                                                          // É incrementada ao final de cada varredura das colunas.
                                                                                //
char counterEmptyColumn = 0;                                                    // Informa o esvaziamento do vetor auxiliar
                                                                                //
char currentPrint = 0;                                                          // Controla a impressao atual do display. 0- Seta | 1- Caracter
                                                                                //
char timeAnimation = 0, stopAnimation = 0;                                      // Variaveis de controle do congelamento da animacao
                                                                                //
char persistData = 1;                                                           // Controla se os ultimos dados recebidos pela serial foram persistidos. 0- Dados desatualizados | 1- Dados atualizados
                                                                                //
char serialData = 102;                                                            // Recebe o byte lido da serial
// ---------------------------------------------------------------------------- //

#include <Defines.h>
#include <Config.h>
#include <Functions.h>
#include <Interrupt.h>

void main() {

     initialSetup();
     
     character_1Temp = 'A';
     character_2Temp = 'G';

     while(1) {
          asm {clrwdt}
     }
}