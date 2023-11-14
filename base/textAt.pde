PFont fuente;
int startTime = 0, stopTime = 0;
boolean running = false;

void startTimer() {
  startTime = millis();
  running = true;
}

void stopTimer() {
  stopTime = millis();
  running = false;
}

int getElapsedTime() {
  int elapsed;
  if (running) {
    elapsed = (millis() - startTime);
  } else {
    elapsed = (stopTime - startTime);
  }
  return elapsed;
}

int seconds() {
  return (getElapsedTime() / 1000) % 60;
}
int minutes() {
  return (getElapsedTime() / (1000*60)) % 60;
}
int hours() {
  return (getElapsedTime() / (1000*60*60)) % 24;
}

void rightRow () {
  fuente = createFont("Arial Negrita", 40);
  textFont(fuente);

  fill(#332219);
  timerShow(0, 59);
  text("| Tiempo Restante |", 1515, 268);
  fill(#E6CCAA);
  text("| Tiempo Restante |", 1515, 263);

  fill(#332219);
  text("| Burbujas Restantes |", 1490, 493);
  text(remainingBubbles(gameBoard)+"/"+firstItRemaining, 1640, 573);
  fill(#E6CCAA);
  text("| Burbujas Restantes |", 1490, 488);

  fill(#332219);
  text("| Puntuacion |", 1555, 708);
  text(points, 1685 - ((str(points).length())*8), 798);
  fill(#E6CCAA);
  text("| Puntuacion |", 1555, 703);
}

void timerShow ( int minutesLimit, int secondsLimit) {
  if ( (minutesLimit-minutes()) >= 10) {
    if ( (secondsLimit-seconds()) >= 10) {
      text((minutesLimit-minutes())+":"+(60-seconds()), 1635, 350 );
    } else {
      text((minutesLimit-minutes())+":0"+(60-seconds()), 1635, 350 );
    }
  } else {
    if ( (secondsLimit-seconds()) >= 10) {
      text("0"+(minutesLimit-minutes())+":"+(60-seconds()), 1635, 350 );
    } else {
      text("0"+(minutesLimit-minutes())+":0"+(60-seconds()), 1635, 350 );
    }
  }
}

void pointsVisuals() {
  float starsPercentage = points*0.02;
  noStroke();
  fill(#FCC554);
  if ( starsPercentage <= 220 ) {
    rect((965+toCenterX), 0, ((1920-(925+toCenterX)-75)), starsPercentage);
  } else {
    rect((965+toCenterX), 0, ((1920-(925+toCenterX)-75)), 220);
  }
}
