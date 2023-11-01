package propuestoinicial;

public class PropuestoInicial {

    // Crear la matriz (MxN) 
    public static final int M = 10;
    public static final int N = 10;
    public static String gameBoard[][] = new String[M][N];

    // Generar el tablero ( Seed define la tasa de aparicion de X)
    public static void newBoard(int seed) {
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
    public static void isAround(String[][] matrix, int atRow, int atColumn, int rowMove, int columnMove) {
        if (!((rowMove == -1 && atRow <= 0) || (rowMove == 1 && atRow >= M - 1) || (columnMove == -1 && atColumn <= 0) || (columnMove == 1 && atColumn >= N - 1))) {
            if (matrix[atRow + rowMove][atColumn + columnMove].matches("X|#")) { // Compara si equivale a un posible elemento de la burbuja
                matrix[atRow + rowMove][atColumn + columnMove] = "#"; // Cambia si pertenece a una burbuja
                matrix[atRow][atColumn] = "#";
            }
        }
    }

    // Funcion para corroborar proximidad
    public static void haveAround(String[][] matrix, int atRow, int atColumn) {
        if (matrix[atRow][atColumn].matches("X|#")) {
            // Revisa los elementos en todas las direcciones, si alguno cumple la condicion, X será cambiada a #
            isAround(matrix, atRow, atColumn, -1, 0); // Arriba
            isAround(matrix, atRow, atColumn, 1, 0); // Abajo
            isAround(matrix, atRow, atColumn, 0, -1); // Izquierda
            isAround(matrix, atRow, atColumn, 0, 1); // Derecha
        }
    }

    public static void main(String[] args) {
        newBoard(6);

        for (int i = 0; i < M; i++) {
            for (int j = 0; j < N; j++) {
                System.out.printf("[%s]", gameBoard[i][j]);
            }
            System.out.println();
        }

        System.out.println("\n");

        for (int i = 0; i < M; i++) {
            for (int j = 0; j < N; j++) {
                haveAround(gameBoard, i, j);
                if (gameBoard[i][j].equals("#")) {
                    System.out.printf("\033[32m[%s]", gameBoard[i][j]);
                } else {
                    System.out.printf("\033[30m[%s]", gameBoard[i][j]);
                }
            }
            System.out.println();
        }
    }

}
