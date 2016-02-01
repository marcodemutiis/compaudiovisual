//use this example with the trackpadOSCremappedXY_fullscreen app
import processing.video.*;

//totaltouches
int totalTouches;
int maxTouches = 13;
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
PVector[] stars1 = new PVector[5];
boolean[]firstTouch = new boolean[maxTouches];
int counter;
int thres = 50; //how close to the star you can get
boolean unlocked;

Movie Cancer;


import oscP5.*;
OscP5 oscP5;

void setup() {
  frameRate(60);
  //size(800, 600);
  fullScreen();
  oscP5 = new OscP5(this, 8338);
  Cancer = new Movie(this, "Cancer.mp4");


  stars1[0] = new PVector(157, 66);
  stars1[1] = new PVector(790, 66);
  stars1[2] = new PVector(400, 455);
  stars1[3] = new PVector(724, 644);
  stars1[4] = new PVector(268, 822);
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  noCursor();
  
  
  if (currentStars == 1) {
    background(50, 50, 50, 100);
  } else if (currentStars == 2) {
    Cancer.play();
    image(Cancer, 0, 0, displayWidth, displayHeight);
    // background(255, 200, 200, 100);
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

    if (down[i] == 0 || pressure[i] < 20) {
      coordinatesX[i] = -10000; 
      coordinatesY[i] = -10000;
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