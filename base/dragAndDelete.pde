boolean selecting = false;    // Variable de estado, para saber si continuar o no
int startRow, startColumn;

void mousePressed() {               // Siempre y cuando se esté sosteniendo el click, se podrá seleccionar
  if (mouseX > 540 && mouseX < 1440 && mouseY > 90 && mouseY < 990) {
    startRow = (mouseX - toCenterX) / unitSize;
    startColumn = (mouseY - toCenterY) / unitSize;
    selecting = true;
  }
}

void drawSelectionSquare() {         // Dibuja la seleccion y los elementos ya explotados, se vale de la matriz de soporte que va variando
  fill(0, 255, 0, 150);              // En cada tic del raton.
  stroke(0, 255, 0);
  strokeWeight(2);
  for (int i = 0; i < N; i++) {
    for (int j = 0; j < M; j++) {
      if (supportBoard[i][j] != 0 && supportBoard[i][j] == 9) {
        square(i * unitSize + toCenterX, j * unitSize + toCenterY, unitSize);
      }
    }
  }
}

public int taken = 0;
public int conteo= 0;
public int points = 0;
void mouseDragged() {                                     // Mientras se vaya arrastrando el mouse, se actualizan las casillas visitadas
  if (mouseX > 540 && mouseX < 1440 && mouseY > 90 && mouseY < 990) {
    int actualRow = (mouseX - toCenterX) / unitSize;                      // Se reportan en la matriz y como explotadas siempre y cuando..
    int actualColumn = (mouseY - toCenterY) / unitSize;
    if (gameBoard[startRow][startColumn] == gameBoard[actualRow][actualColumn]) {     // Sean elementos iguales los que se seleccionen
      conteo = conteo + 1;                                                            // Sea mas de un elemento
      if (conteo > 1 && selecting && supportBoard[actualRow][actualColumn] == 0) {
        supportBoard[actualRow][actualColumn] = 9;
      }
    } else {                                                                          // Sino, para la seleccion
      selecting = false;
    }
  }
}

void mouseReleased() {                                    // Una vez se suelta el raton, guarda las coordenadas finales
  if (mouseX > 540 && mouseX < 1440 && mouseY > 90 && mouseY < 990) {
    int endRow = (mouseX - toCenterX )  / unitSize;                        // Si es del mismo tipo de la inicial entonces explotó una burbuja
    int endColumn = (mouseY - toCenterY ) / unitSize;

    if (gameBoard[startRow][startColumn] == gameBoard[endRow][endColumn] && selecting && conteo > 1) {
      clickedBubble(endRow, endColumn);
      points = points + (conteo*10);
      taken++;
      conteo = 0;
      println(taken);
    } else {
      selecting = false;
    }

    if ( remainingBubbles(gameBoard) == 0 ){
      youWon();
    }

    selecting = false;
  }
}
