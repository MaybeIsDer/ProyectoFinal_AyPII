// Aca hago el port del programa para que quepa en un panel de 1920x1080, wip

public int firstItRemaining;

int findNear(int num, int numBase) {
  if ( num%numBase == 0 ){
    return num;
  } else {
    int lower = (int)(numBase/num) * num;
    int upper = (int)((numBase/num) + 1) * num;
    
    if ( (numBase - lower) < ( upper - numBase )){
      return lower;
    } else {
      return upper;
    }
  }
}
