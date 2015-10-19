import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class faceSlotMachine extends PApplet {

String[] eyes = {"blue", "green", "brown"};
String[] nose = {"big", "medium", "small"};
String[] mouth = {"open", "closed", "bite"};

PImage[] imgEyes = new PImage[3];
PImage[] imgNose = new PImage[3];
PImage[] imgMouth = new PImage[3];

int eye, nos, mou;

boolean stopped;

public void setup() {
  //frameRate(12);
  

  for (int i = 0; i < 3; i++) {
    imgEyes[i] = loadImage(eyes[i] + ".jpg");
    imgNose[i] = loadImage(nose[i] + ".jpg");
    imgMouth[i] = loadImage(mouth[i] + ".jpg");
  }
}

public void draw() {
  image(imgEyes[eye], 0, 0);
  image(imgNose[nos], 0, 300);
  image(imgMouth[mou], 0, 600);

  if (!stopped) {
    eye = PApplet.parseInt(random(0, 3));  
    nos = PApplet.parseInt(random(0, 3));
    mou = PApplet.parseInt(random(0, 3));
    delay(100);
  }
}

public void mousePressed() {
  stopped = true;
}

public void mouseReleased() {
  stopped = false;
}
  public void settings() {  size(900, 900); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "faceSlotMachine" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
