final int N = 10;           // Dimensiones de la matriz
final int M = 10;           // Dimensiones de la matriz
final int unitSize = 900/N; // En general, el tamaño de todo de la interfaz

final int toCenterX = findNear(unitSize,(1920 - 900)/2);
final int toCenterY = findNear(unitSize,(1080 - 900)/2);


int gameBoard[][] = new int [N][M];       // Matriz principal con todas las burbujas (y las que no)
int supportBoard[][] = new int [N][M];    // Matriz que dibuja la seleccion conforme se crea

int redBubbles[][] = new int [N][M];      // Matriz con las burbujas rojas
int oraBubbles[][] = new int [N][M];      // Matriz con las burbujas naranjas
int yelBubbles[][] = new int [N][M];      // Matriz con las burbujas amarillas
int greBubbles[][] = new int [N][M];      // Matriz con las burbujas verdes
int cyaBubbles[][] = new int [N][M];      // Matriz con las burbujas cyan
int bluBubbles[][] = new int [N][M];      // Matriz con las burbujas azules


void fillBoard ( ) {                     // Funcion para llenar cada casilla con algun numero del 1 al 6
  for ( int i = 0; i < N; i++) {
    for ( int j = 0; j < N; j++) {
      gameBoard[i][j] = (int)(random(6))+1;
    }
  }
}

void keyPressed() {   
  // Este es el fondo (el bosque)
  tint(255, 50);
  image(backs, toCenterX, toCenterY);
  noTint();
  
  // Dependiendo de la tecla, muestra un tablero u otro (solo las burbujas de un color, etc)
  switch (key) {
  case 'f':
    drawBoard(gameBoard);
    break;
  case 'r':
    drawBoard(redBubbles);
    break;
  case 'o':
    drawBoard(oraBubbles);
    break;
  case 'y':
    drawBoard(yelBubbles);
    break;
  case 'g':
    drawBoard(greBubbles);
    break;
  case 'c':
    drawBoard(cyaBubbles);
    break;
  case 'b':
    drawBoard(bluBubbles);
    break;
  default:
    drawBoard(gameBoard);
    break;
  }
}
