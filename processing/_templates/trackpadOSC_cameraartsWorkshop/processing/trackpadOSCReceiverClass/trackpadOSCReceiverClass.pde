//totaltouches
int totalTouches;
int maxTouches = 20;
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

import oscP5.*;
OscP5 oscP5;

void setup() {
  frameRate(60);
  size(800, 680);
  oscP5 = new OscP5(this, 8338);
}


void draw() {
  background(50, 50, 50, 100);
  fill(255, 255, 255, 100);
  translate(-100, -70);
  for (int i =0; i<totalTouches; i++) {
    ellipse(coordinatesX[i], coordinatesY[i], pressure[i]*5, pressure[i]*5);
  }
  
  if(totalTouches == 2){
    background(255, 0, 0);
  }
  if(totalTouches == 3){
    background(0, 255, 0);
  }
}

void oscEvent(OscMessage m) {
  parseOSC(m);
  /*  print("### received an osc message.");
   print(" addrpattern: "+m.addrPattern());
   println(" typetag: "+m.typetag());
   println(" value = "+m.get(0).intValue());*/
}