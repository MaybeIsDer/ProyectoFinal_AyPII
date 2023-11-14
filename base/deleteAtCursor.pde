
boolean clickedBubble(int clickRow, int clickColumn) {               // *[ Mucho Texto ]* 
  if (redBubbles[clickRow][clickColumn] != 0) {                      // Lee como parametros la casilla clickeada por el mouse
    eliminateBubbles(redBubbles, clickRow, clickColumn);             // Si el elemento en la matriz de burbujas rojas existe (es diferente de 0)
    return true;                                                     // Entonces retorna true, por lo tanto se puede explotar.
  } else if (oraBubbles[clickRow][clickColumn] != 0) { 
    eliminateBubbles(oraBubbles, clickRow, clickColumn);             // Repetir para el resto de burbujas
    return true;
  } else if (yelBubbles[clickRow][clickColumn] != 0) {
    eliminateBubbles(yelBubbles, clickRow, clickColumn);
    return true;
  } else if (greBubbles[clickRow][clickColumn] != 0) {
    eliminateBubbles(greBubbles, clickRow, clickColumn);
    return true;
  } else if (cyaBubbles[clickRow][clickColumn] != 0) {
    eliminateBubbles(cyaBubbles, clickRow, clickColumn);
    return true;
  } else if (bluBubbles[clickRow][clickColumn] != 0) {
    eliminateBubbles(bluBubbles, clickRow, clickColumn);
    return true;
  }
  return false;
}


void popBubbles(int[][] bubbleColor, int atRow, int atColumn, int element) {           // Esta funcion corrobora que en efecto, sea una burbuja (si, otra vez)
  boolean validMove = atRow >= 0 && atRow < N && atColumn >= 0 && atColumn < M;
  if (validMove) {                                                                     // Si está dentro de la matriz
    if (bubbleColor[atRow][atColumn] == element) {                                       // Y el elemento es igual al otro
      bubbleColor[atRow][atColumn] = 0;                                                     // Lo desaparece del tablero de su color y del principal (hace pop)
      gameBoard[atRow][atColumn] = 0;
      popBubbles (bubbleColor, atRow - 1, atColumn, element); // Arriba
      popBubbles (bubbleColor, atRow + 1, atColumn, element); // Abajo
      popBubbles (bubbleColor, atRow, atColumn - 1, element); // Izquierda
      popBubbles (bubbleColor, atRow, atColumn + 1, element); // Derecha
    }
  }
}

void eliminateBubbles(int[][] bubbleColor, int clickRow, int clickColumn) {           // Esto existe porque si sirve no se toca
  int element = bubbleColor[clickRow][clickColumn];
  popBubbles ( bubbleColor, clickRow, clickColumn, element);
}
