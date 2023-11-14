
// ======================================================================================
void setup () {
  key= 'f';                                       // Inicializar la tecla para que se muestre todo el tablero automaticamente
  fullScreen();
  size (1920, 1080);
  background(0);

  initImages();
  fillBoard();
  startTimer();
  findBubbles( gameBoard );                       // Cargar las burbujas de este tablero
  firstItRemaining = remainingBubbles(gameBoard);
}

void draw () {
  keyPressed();
  drawSelection();

  if ( selecting ) {                              // Si se está seleccionando, dibuje el cuadrado con la seleccion
    drawSelectionSquare();
  }
  
  image(frontUI, 0, 0);
  rightRow();
  pointsVisuals();
}
// ======================================================================================
