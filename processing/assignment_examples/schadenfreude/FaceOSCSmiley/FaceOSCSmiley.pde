//
// a bar graph for overall smiliness
//
// derived from the FaceOSCReceiver demo

import oscP5.*;
OscP5 oscP5;

SmartRobot robot;

int found;
float smileThreshold = 16;
float mouthWidth, previousMouthWidth;

PFont font;

String[] imgName = {"1", "2", "3"};
PImage[] img = new PImage[3];
int counter;

void setup() {
  size(640, 480);//64
  frameRate(30);
  for (int i = 0; i < imgName.length; i++) {
    img[i] = loadImage(imgName[i] + ".jpg");
  }
  oscP5 = new OscP5(this, 8338);
  oscP5.plug(this, "found", "/found");
  oscP5.plug(this, "mouthWidthReceived", "/gesture/mouth/width");
  try {
    robot = new SmartRobot();
  } catch (AWTException e) {
  }
  font = createFont("Helvetica", 64);
  textFont(font);
  textAlign(LEFT, TOP);
}

void draw() {  
  background(255);
  fill(50);
  String smile = "smile!";
  text(smile, width/2 - 100, height/2 - 20);
  
  if (found > 0) {
    noStroke();
    if(mouthWidth > smileThreshold) image(img[counter], 0, 0, img[counter].width, img[counter].height); 
    fill(mouthWidth > smileThreshold ? color(255, 0, 0) : 0);
    float drawWidth = map(mouthWidth, 10, 25, 0, width);
    rect(0, 0, drawWidth, 64);
    text(nf(mouthWidth, 0, 1), drawWidth + 10, 0);
    if (previousMouthWidth < smileThreshold && mouthWidth > smileThreshold) {
      //robot.type(":)\n");
      
      counter++;
    if(counter>=3)counter=0;
    }
    previousMouthWidth = mouthWidth;
    
  }
}

public void found(int i) {
  found = i;
}

public void mouthWidthReceived(float w) {
  mouthWidth = w;
}

// all other OSC messages end up here
void oscEvent(OscMessage m) {
  if (m.isPlugged() == false) {
  }
}