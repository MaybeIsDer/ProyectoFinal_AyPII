PImage backs, banana, baya, mango, manzana, mora, uva, frontUI;

void initImages() {                         // Aca se cargan todas las imagenes y automaticamente se ponen del tamaño de los cuadraditos
  frontUI = loadImage("plato.png");
  backs = loadImage("backgroundFF.png");
  banana = loadImage("bananos.png");
  baya = loadImage("baya.png");
  mango = loadImage("mango.png");
  manzana = loadImage("manzana.png");
  mora = loadImage("mora.png");
  uva = loadImage("uva.png");

  banana.resize(unitSize, unitSize);
  baya.resize(unitSize, unitSize);
  mango.resize(unitSize, unitSize);
  manzana.resize(unitSize, unitSize);
  mora.resize(unitSize, unitSize);
  uva.resize(unitSize, unitSize);
}

void drawSelection() {                                     // Esta funcion dibuja un cuadrado verde clarito transparente para visualizar la seleccion del cursor
  int row = (int)(mouseX / unitSize);
  int col = (int)(mouseY / unitSize);

  fill (105, 255, 105, 70);
  rect(row*unitSize, col*unitSize, unitSize, unitSize);
}

void imgShadows(PImage imagen, int atRow, int atColumn) {   // Esta funcion carga la imagen a usar, le agrega una replica de la misma para simular una sombra              
  image(imagen, atRow*unitSize + toCenterX, atColumn*unitSize + toCenterY);
  tint(0, 50);
  image(imagen, atRow*unitSize + unitSize*0.1 + toCenterX, atColumn*unitSize+unitSize*0.1 + toCenterY);
  noTint();
}

void drawBoard ( int[][] board ) {                           // Aqui se dibuja el tablero dependiendo del valor referenciado
  strokeWeight(3);                                           // Cada frutica tiene su valor unico
  stroke(255, 255, 255, 150);
  for ( int i = 0; i < N; i++) {
    for ( int j = 0; j < N; j++) {
      switch ( board [i][j] ) {
      case 1: // Rojas
        imgShadows(manzana , i , j );
        break;
      case 2: // Naranjas
        imgShadows(baya , i , j );
        break;
      case 3: // Amarillas
        imgShadows(mango , i , j );
        break;
      case 4: // Verdes
        imgShadows(banana , i , j );
        break;
      case 5: // Azules
        imgShadows(uva , i , j );
        break;
      case 6: // Azules Oscuro
        imgShadows(mora , i , j );
        break;
      }
    }
  }
}
