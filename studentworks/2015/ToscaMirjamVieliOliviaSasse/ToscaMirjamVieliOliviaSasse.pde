//use this example with the trackpadOSCremappedXY_fullscreen app
import processing.video.*;

String s = "The End";
//totaltouches
int totalTouches;
int maxTouches = 16;
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
int currentStars = 0;
PVector[] stars0 = new PVector[3];
PVector[] stars1 = new PVector[4];
PVector[] stars2 = new PVector[5];
PVector[] stars3 = new PVector[6];


boolean[]firstTouch = new boolean[maxTouches];
int counter;
int thres = 50; //how close to the star you can get
boolean unlocked;

Movie Aries;
Movie Libra;
Movie Cancer;
Movie Gemini;

boolean AriesFinishedPlaying = false;
boolean LibraFinishedPlaying = false;
boolean CancerFinishedPlaying = false;
boolean GeminiFinishedPlaying = false;


import oscP5.*;
OscP5 oscP5;

void setup() {
  frameRate(60);
  //size(800, 600);
  fullScreen();
  oscP5 = new OscP5(this, 8338);
  Aries = new Movie(this, "Aries1.mp4");
  Libra = new Movie(this, "Libra1.mp4");
  Cancer = new Movie(this, "Cancer1.mp4");
  Gemini = new Movie(this, "Gemini1.mp4");


  //Aries
  stars0[0] = new PVector(1237, 150);
  stars0[1] = new PVector(1050, 680);
  stars0[2] = new PVector(808, 846);

  //Libra
  stars1[0] = new PVector(244, 685);
  stars1[1] = new PVector(395, 913);
  stars1[2] = new PVector(533, 399);
  stars1[3] = new PVector(910, 638);

  //Cancer
  stars2[0] = new PVector(157, 66);
  stars2[1] = new PVector(790, 66);
  stars2[2] = new PVector(400, 455);
  stars2[3] = new PVector(724, 644);
  stars2[4] = new PVector(268, 822);

  //Gemini
  stars3[0] = new PVector(173, 567);
  stars3[1] = new PVector(497, 567);
  stars3[2] = new PVector(569, 154);
  stars3[3] = new PVector(785, 567);
  stars3[4] = new PVector(1073, 369);
  stars3[5] = new PVector(1288, 855);
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  noCursor();
  background(50, 50, 50, 100);

  if (currentStars == 0) {
    // background(50, 50, 50, 100);
  }
  /////////////////////////////////////step 1 play aries when touches match
  else if (currentStars == 1) {
    if (AriesFinishedPlaying == false) {
      Aries.play();
      image(Aries, 0, 0, displayWidth, displayHeight);
    }
    if (getFrame(Aries) == getLength(Aries)) {
      AriesFinishedPlaying = true;
      Aries.stop();
    }
    /////////////////////////////////////step 2 play Libra when touches match
  } else if (currentStars == 2) {
    if (LibraFinishedPlaying == false) {
      Libra.play();
      image(Libra, 0, 0, displayWidth, displayHeight);
    }
    // background(255, 200, 200, 100);
    if (getFrame(Libra) == getLength(Libra)) {
      LibraFinishedPlaying = true;
      Libra.stop();
    }

    ///////////////////step 3, Cancer
  } else if (currentStars == 3) {

    if (CancerFinishedPlaying == false) {
      Cancer.play();
      image(Cancer, 0, 0, displayWidth, displayHeight);
    }

    if (getFrame(Cancer) == getLength(Cancer)) {
      CancerFinishedPlaying = true;
      Cancer.stop();
    }
    ////////Step 4, Gemini
  } else if (currentStars == 4) {
    if (GeminiFinishedPlaying == false) {
      Gemini.play();
      image(Gemini, 0, 0, displayWidth, displayHeight);
    }
    if (getFrame(Gemini) == getLength(Gemini)) {
      GeminiFinishedPlaying = true;
      Gemini.stop();
    }
  }




  fill(200, 200, 200, 255); //color of circles
  noStroke(); //no edges 
  ////////////////////////////////////////////////////loop through all the touch points
  for (int i = 0; i < maxTouches; i++) {
    ////////////////////////////////////////////display touch points as circles
    ellipse(coordinatesX[i], coordinatesY[i], pressure[i]*5, pressure[i]*5);
    /////////////////////////////compare touches with stars coordinates
    if (currentStars==0) {
      stars0(); //check that my touch points match aries star coords
    } else if (currentStars==1) {
      stars1(); //
    } else if (currentStars==2) {
      stars2(); //
    } else if (currentStars==3) {
      stars3(); //
    }


    //////////////////////////////if touchpoints are not there move them out of the screen
    if (down[i] == 0 || pressure[i] < 40) {
      coordinatesX[i] = -10000; 
      coordinatesY[i] = -10000;
    }
  }


  /////////////////////////////////////draw stars of current costellation
  fill(255);
  if (currentStars == 0) {
    for (int i = 0; i < stars0.length; i++) {
      ellipse(stars0[i].x, stars0[i].y, 50, 50);
    }
  } else if (currentStars == 1 && AriesFinishedPlaying == true) {
    for (int i = 0; i < stars1.length; i++) {
      ellipse(stars1[i].x, stars1[i].y, 50, 50);
    }
  } else if (currentStars == 2 && LibraFinishedPlaying == true) {
    for (int i = 0; i < stars2.length; i++) {
      ellipse(stars2[i].x, stars2[i].y, 50, 50);
    }
  } else if (currentStars == 3 && CancerFinishedPlaying == true) {
    for (int i = 0; i < stars3.length; i++) {
      ellipse(stars3[i].x, stars3[i].y, 50, 50);
    }
  }
}


void oscEvent(OscMessage m) {
  parseOSC(m);
}

int getFrame(Movie mov) {    
  return ceil(mov.time() * mov.frameRate) - 1;
}
int getLength(Movie mov) {
  return int(mov.duration() * mov.frameRate);
}

//Credits to Marco de Mutiis, who did most of the programming and also to Christof Steinmann, who helped with testing and adjustments at the end.