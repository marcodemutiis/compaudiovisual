//totaltouches
int totalTouches;
int maxTouches = 40;
int ID[] = new int[maxTouches];
int id;
// orientation
float[] coordinatesX = new float[maxTouches];
float[] coordinatesY = new float[maxTouches];
// touch axis
float[] majoraxis = new float[maxTouches];
float[] minoraxis = new float[maxTouches];
//pressure
float[] pressure= new float[maxTouches];
//angle
float[] angle= new float[maxTouches];
int[] down = new int[maxTouches];

//star stuff
int currentStars = 1;
PVector[] stars1 = new PVector[3];
boolean[]firstTouch = new boolean[maxTouches];
int counter;
int thres = 20; //how close to the star you can get
boolean unlocked;

import oscP5.*;
OscP5 oscP5;

void setup() {
  frameRate(60);
  size(800, 680);
  oscP5 = new OscP5(this, 8338);
  
  stars1[0] = new PVector(19, 18);
  stars1[1] = new PVector(200, 100);
  stars1[2] = new PVector(600, 200);
}


void draw() {
  if (currentStars == 1) {
      background(50, 50, 50, 100);
  }
  else if (currentStars == 2) {
      background(255, 200, 200, 100);
  }
  
 /* if (totalTouches == 2) {
    background(255, 0, 0, 100);
  }*/



  //check touches
  fill(255, 255, 255, 255);
  noStroke();
  
  for (int i = 0; i < maxTouches; i++) {

    ellipse(coordinatesX[i], coordinatesY[i], pressure[i]*5, pressure[i]*5);

    //compare touches with stars coordinates
    if (currentStars==1) {
      stars1();
    }

    if (down[i] == 0) {
      coordinatesX[i] = -1000; 
      coordinatesY[i] = -1000;
    }
  }

  //draw stars of current costellation
  fill(255);
  if (currentStars == 1) {
    for (int i = 0; i < stars1.length; i++) {
      ellipse(stars1[i].x, stars1[i].y, 50, 50);
    }
  }
}

void oscEvent(OscMessage m) {
  parseOSC(m);
}