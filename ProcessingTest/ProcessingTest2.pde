// Crear la matriz (MxN)
public static final int M = 30;
public static final int N = 30;
public static final int unitSize = 720/M;
public static String gameBoard[][] = new String[M][N];
public static int A[][] = new int[M][N];

// Generar el tablero ( Seed define la tasa de aparicion de X)
void newBoard(int seed) {
  for (int i = 0; i < M; i++) {
    for (int j = 0; j < N; j++) {
      if ((int) (Math.random() * seed + 1) == 1) {
        gameBoard[i][j] = "X";
      } else {
        gameBoard[i][j] = " ";
      }
    }
  }
}

// Funcion para corroborar proximidad
void isAround(String[][] matrix, int atRow, int atColumn, int rowMove, int columnMove) {
  if (!((rowMove == -1 && atRow <= 0) || (rowMove == 1 && atRow >= M - 1) || (columnMove == -1 && atColumn <= 0) || (columnMove == 1 && atColumn >= N - 1))) {
    if (matrix[atRow + rowMove][atColumn + columnMove].matches("X|#")) { // Compara si equivale a un posible elemento de la burbuja
      matrix[atRow + rowMove][atColumn + columnMove] = "#"; // Cambia si pertenece a una burbuja
      matrix[atRow][atColumn] = "#";
    }
  }
}

// Funcion para corroborar proximidad
void haveAround(String[][] matrix, int atRow, int atColumn) {
  if (matrix[atRow][atColumn].matches("X|#")) {
    // Revisa los elementos en todas las direcciones, si alguno cumple la condicion, X será cambiada a #
    isAround(matrix, atRow, atColumn, -1, 0); // Arriba
    isAround(matrix, atRow, atColumn, 1, 0); // Abajo
    isAround(matrix, atRow, atColumn, 0, -1); // Izquierda
    isAround(matrix, atRow, atColumn, 0, 1); // Derecha
  }
}

void setup() {
  size(720, 720);
  background(#242130);
  newBoard(6);
  for (int i = 0; i < M; i++) {
    for (int j = 0; j < N; j++) {
      haveAround(gameBoard, i, j);
    }
  }
}

void draw() {
  stroke(#3B3947);
  for (int i = 0; i < M; i++) {
    fill (#2B2739);
    for (int j = 0; j < N; j++) {
      if (i % 2 != 0 && j%2 == 0) {
        fill(#242130,90);
      } else {
        fill(#2B2739,90);
      }
      rect(i * unitSize, j * unitSize, unitSize, unitSize);
    }
  }
  

  int row = (int)(mouseX / unitSize);
  int col = (int)(mouseY / unitSize);

  fill (255, 255, 255, 70);
  rect(row*unitSize, col*unitSize, unitSize, unitSize);
}

void mousePressed() {
  int clickRow = (int)(mouseX/unitSize);
  int clickColumn = (int)(mouseY/unitSize);

  A[clickRow][clickColumn] = 1;
  System.out.println(A[clickRow][clickColumn]);
}
