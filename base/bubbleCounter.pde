int remainingBubbles(int[][] bubbleColor) {                 // Funcion que registra en una matriz booleana todas las burbujas restantes
  int count = 0;                                            // Y retorna Count que lleva el conteo de burbujas explotadas
  boolean[][] counted = new boolean[N][M];

  for (int i = 0; i < N; i++) {
    for (int j = 0; j < M; j++) {
      if (bubbleColor[i][j] != 0 && !counted[i][j]) {      // Basicamente si un elemento de esa matriz es diferente de 0 (Está dibujado)
        if (hasAdjacent(bubbleColor, i, j)) {              // Y es falso en la matriz booleana (No ha sido seleccionado antes)
          count++;                                         // Lo cuentas como burbuja siempre y cuando tenga adyacentes 
          markConnected(bubbleColor, i, j, counted);       // Luego, lo marcas a él y marcas su adyacente como visitado (para no contar dos veces un mismo elemento)
        }
      }
    }
  }
  return count;
}

void markConnected(int[][] bubbleColor, int row, int col, boolean[][] counted) {  // *[ Funcion Recursiva ]* Tengan cuidado con esta
  if (row < 0 || row >= N || col < 0 || col >= M || counted[row][col]) {
    return;
  }
  
  counted[row][col] = true;                                // Marcar la burbuja actual como contada
  int colors = bubbleColor[row][col];                      // Verificar burbujas conectadas en las cuatro direcciones
  
  if (row - 1 >= 0 && bubbleColor[row - 1][col] == colors) {
    markConnected(bubbleColor, row - 1, col, counted);     // Arriba
  }
  if (row + 1 < N && bubbleColor[row + 1][col] == colors) {
    markConnected(bubbleColor, row + 1, col, counted);     // Abajo
  }
  if (col - 1 >= 0 && bubbleColor[row][col - 1] == colors) {
    markConnected(bubbleColor, row, col - 1, counted);     // Izquierda
  }
  if (col + 1 < M && bubbleColor[row][col + 1] == colors) {
    markConnected(bubbleColor, row, col + 1, counted);     // Derecha
  }
}


boolean hasAdjacent(int[][] bubbleColor, int row, int col) {             // Funcion que verifica si hay al menos un adyacente del mismo color, si es asi, retorna true
  int colors = bubbleColor[row][col];                                    // (Nota, no se reutiliza "findBubbles" porque su enfoque es un tanto diferente
  return (
    (row - 1 >= 0 && bubbleColor[row - 1][col] == colors) ||  // Arriba
    (row + 1 < N && bubbleColor[row + 1][col] == colors)  ||   // Abajo
    (col - 1 >= 0 && bubbleColor[row][col - 1] == colors) ||   // Izquierda
    (col + 1 < M && bubbleColor[row][col + 1] == colors)       // Derecha
  );
}
