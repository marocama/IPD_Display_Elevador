void interrupt() {

     setColumn(currentColumn);                                                  // Apaga tudo e varre as colunas

     switch(statusPrint) {
          case 0:
               // EXIBIÇÃO ESTÁTICA
               break;
          case 1:
               // EXIBIÇÃO SUBINDO
               // DESLOCAMENTO DE BIT PARA DIREITA
               break;
          case 2:
               // EXIBIÇÃO DESCENDO
               // DESLOCAMENTO DE BIT PARA ESQUERDA
               break;
          default:
                  // EXIBIÇÃO ESTÁTICA
                  break;
     }
     
     if(character_1 == 0x20) { posInitialColumn = 4; posFinalColumn = 7; } else { posInitialColumn = 1; posFinalColumn = 10; }
     


     printStorey(character_1, character_2, 1);


     if(currentColumn >= posFinalColumn) { 
          currentColumn = posInitialColumn; 
          currentPosition = 1;
          counterPrint++;
     } else {
          currentColumn++;
          if(currentPosition >= 5) {
               currentPosition = 1;
          } else {
               currentPosition++;
          }
     }

     if((posInitialColumn == 1 && counterPrint > 90) ||                         // Velocidade de animação para 1 caracter
        (posInitialColumn == 4 && counterPrint == 180)) {                       // Velocidade de animação para 2 caracteres

          counterVertical == 1 ? counterVertical = 8 : counterVertical--;
          counterPrint = 0;
     }
     

     PIR1.TMR2IF = 0;
}