void findBubbles(int[][] board) {                               // FindBubbles revisa todos los elementos de la matriz y registra si tiene un adyacente
  for (int i = 0; i < M; i++) {                               // Del mismo color en alguna de las 4 direcciones
    for (int j = 0; j < N; j++) {
      checkAround(board, i, j, -1, 0); // Arriba
      checkAround(board, i, j, 1, 0);  // Abajo
      checkAround(board, i, j, 0, -1); // Izquierda
      checkAround(board, i, j, 0, 1);  // Derecha
    }
  }
}

void checkAround(int[][] board, int atRow, int atColumn, int rowMove, int columnMove) {
  // Este parametro es para corroborar si está dentro de la matriz
  boolean validMove = atRow + rowMove >= 0 && atRow + rowMove < M && atColumn + columnMove >= 0 && atColumn + columnMove < N;

  // Si se cumple que está dentro de la matriz y el elemento en la posicion indicada es igual, entonces lo guarda en su matriz correspondiente
  if (validMove && board[atRow][atColumn] == board[atRow + rowMove][atColumn + columnMove]) {
    saveAt(board[atRow][atColumn], atRow, atColumn, rowMove, columnMove);
  }
}


void saveAt(int element, int atRow, int atColumn, int rowMove, int columnMove) {  // Esta funcion solo es un "repositorio"
  switch (element) {                                                              // dependiendo de un elemento devuelve a que matriz se guardará
  case 1: // Rojas                                                          
    redBubbles[atRow][atColumn] = 1;
    redBubbles[atRow + rowMove][atColumn + columnMove] = 1;
    break;
  case 2: // Naranjas
    oraBubbles[atRow][atColumn] = 2;
    oraBubbles[atRow + rowMove][atColumn + columnMove] = 2;
    break;
  case 3: // Amarillas
    yelBubbles[atRow][atColumn] = 3;
    yelBubbles[atRow + rowMove][atColumn + columnMove] = 3;
    break;
  case 4: // Verdes
    greBubbles[atRow][atColumn] = 4;
    greBubbles[atRow + rowMove][atColumn + columnMove] = 4;
    break;
  case 5: // Azules
    cyaBubbles[atRow][atColumn] = 5;
    cyaBubbles[atRow + rowMove][atColumn + columnMove] = 5;
    break;
  case 6: // Azules Oscuro
    bluBubbles[atRow][atColumn] = 6;
    bluBubbles[atRow + rowMove][atColumn + columnMove] = 6;
    break;
  }
}
