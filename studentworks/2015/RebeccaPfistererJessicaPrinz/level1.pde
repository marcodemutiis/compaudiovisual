import processing.sound.*;
AudioIn input;
Amplitude rms;
import processing.sound.*;
SoundFile file;

int scale;
int frameCounter =20;
int level = 1;
int counter;

PImage img;
PImage[] closer;
PImage img6;
PImage last;

boolean levelClicked=false;
boolean levelSolved;

PFont Arial;

float score=0;

///////////////////////////////////////////////////////////////////////////////////////
void setup() {
  Arial = createFont ("ClanPro-Bold-48.vlw", 48);
  fullScreen();
  background(255);

  img = loadImage("fotograf.png");
  img6 = loadImage ("level1.png");
  last = loadImage ("5.jpg");

  counter = -1;

  closer = new PImage [6];
  for (int i=0; i<6; i++) {
    closer [i] = loadImage(i+".jpg");
  }

  //Create an Audio input and grab the 1st channel
  input = new AudioIn(this, 0);

  // start the Audio Input
  input.start();

  // create a new Amplitude analyzer
  rms = new Amplitude(this);

  // Patch the input to an volume analyzer
  rms.input(input);

  file = new SoundFile(this, "shutter.wav");
  scale = 1;
}      

///////////////////////////////////////////////////////////////////////////////////////
void draw() { 
  background(255);
  if (levelClicked == false) {
    background(255);
    image(img, scale, 300, img.width/2, img.height/2);
    image (img6, 0, 0, displayWidth, displayHeight);
  } else {
    image(img, scale, 300, img.width/2, img.height/2);
  }

  // adjust the volume of the audio input
  input.amp(map(mouseY, 0, height, 0.0, 1.0));

  // rms.analyze() return a value between 0 and 1. To adjust
  // the scaling and mapping of an ellipse we scale from 0 to 0.5
  float difficulty = level*0.3;
  scale=int(map(rms.analyze(), 0, difficulty, 0, width + img.width));
  if (frameCounter < 15) { 
    scale = 0;
  }

  noStroke();

  fill(0, 0, 0);
  textSize(32);
  text("ECTS: "+score+"/10", displayWidth*10/13, displayHeight*1/11);

  if (scale >= 800) {
    frameCounter=0;
    level++;
    file.play();
    score = score + 1.5;
    counter++;
  }
  
  if (frameCounter < 15) { 
    image (closer[counter], 0, 0, displayWidth, displayHeight);
  }

  if (counter == 5) {
    image (last, 0, 0, displayWidth, displayHeight);
    fill(0, 0, 0);
    text ("next level >>>", displayWidth*10/13, displayHeight*10/11);
    fill(255);
    text ("ECTS: 10", displayWidth*10/13, displayHeight*1/11);
  }

  if (levelSolved == true) {
    exit();
  }

  frameCounter++;
}

///////////////////////////////////////////////////////////////////////////////////////
void mousePressed() {
  if (mouseX>displayWidth/4 && mouseY>displayHeight/4  ) {
    levelClicked = true;
    println("Hello");
  }
  
  if (levelSolved == false) {
    if (counter == 5) {
      if (mouseX>displayWidth/4 && mouseY>displayHeight/4  ) {
        levelSolved = true;
      }
    }
  }
}