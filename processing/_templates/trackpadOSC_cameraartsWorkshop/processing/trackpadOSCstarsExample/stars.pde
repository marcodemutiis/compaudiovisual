void stars1() {
  for (int i = 0; i < maxTouches; i++) {
    for (int j = 0; j < maxTouches; j++) {
      for (int k = 0; k < maxTouches; k++) {
        if (dist(coordinatesX[i], coordinatesY[i], stars1[0].x, stars1[0].y) < thres && 
        dist(coordinatesX[j], coordinatesY[j], stars1[1].x, stars1[1].y) < thres && 
        dist(coordinatesX[k], coordinatesY[k], stars1[2].x, stars1[2].y) < thres) {

          counter++;
          if (counter >= stars1.length) {
            unlocked = true;
            currentStars++;
            //println(currentStars);
          }
        }
      }
    }
  }
}