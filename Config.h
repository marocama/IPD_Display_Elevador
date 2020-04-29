void initialSetup() {

     TRISA = 0b00010000; TRISB = 0b11000000; TRISC = 0b11011000;                // Definação das entradas e saídas

     ADCON1 = 0b00001111; CMCON = 0b00000111;                                   // Registradores relacionados ao controle dos pinos analógicos

     OSCCON = 0b01110100; OSCTUNE = 0b00000001;                                 // Registradores vinculados ao clock do microcontrolador

     INTCON = 0b11000000;                                                       // Registrador geral do microcontrolador

     PR2 = 255; RCON.IPEN = 1; PIE1.TMR2IE = 1; IPR1.TMR2IP = 1; PIR1.TMR2IF = 0; T2CON = 0b00000101;  // Registradores para configuração do Timer2. Interrompendo a cada 0.5ms

     UART1_Init(9600);                                                          // Inicializa a porta serial em 9600
}