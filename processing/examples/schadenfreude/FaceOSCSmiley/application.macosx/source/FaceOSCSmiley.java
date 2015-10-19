import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import oscP5.*; 
import java.awt.AWTException; 
import java.awt.Robot; 
import java.awt.event.KeyEvent; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class FaceOSCSmiley extends PApplet {

//
// a bar graph for overall smiliness
//
// derived from the FaceOSCReceiver demo


OscP5 oscP5;

SmartRobot robot;

int found;
float smileThreshold = 16;
float mouthWidth, previousMouthWidth;

PFont font;

String[] imgName = {"1", "2", "3"};
PImage[] img = new PImage[3];
int counter;

public void setup() {
  //64
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

public void draw() {  
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
public void oscEvent(OscMessage m) {
  if (m.isPlugged() == false) {
  }
}




public class SmartRobot extends Robot {

  public SmartRobot() throws AWTException {
    super();
  }

  public void keyType(int keyCode) {
    keyPress(keyCode);
    delay(50);
    keyRelease(keyCode);
  }

  public void keyType(int keyCode, int keyCodeModifier) {
    keyPress(keyCodeModifier);
    keyPress(keyCode);
    keyRelease(keyCode);
    keyRelease(keyCodeModifier);
  }


  public void type(String text) {
    String textUpper = text.toUpperCase();

    for (int i=0; i<text.length(); ++i) {
      typeChar(textUpper.charAt(i));
    }
  }

  private void typeChar(char c) {
    boolean shift = true;
    int keyCode;

    switch (c) {
    case '~':
      keyCode = (int)'`';
      break;
    case '!':
      keyCode = (int)'1';
      break;
    case '@':
      keyCode = (int)'2';
      break;
    case '#':
      keyCode = (int)'3';
      break;
    case '$':
      keyCode = (int)'4';
      break;
    case '%':
      keyCode = (int)'5';
      break;
    case '^':
      keyCode = (int)'6';
      break;
    case '&':
      keyCode = (int)'7';
      break;
    case '*':
      keyCode = (int)'8';
      break;
    case '(':
      keyCode = (int)'9';
      break;
    case ')':
      keyCode = (int)'0';
      break;
    case ':':
      keyCode = (int)';';
      break;
    case '_':
      keyCode = (int)'-';
      break;
    case '+':
      keyCode = (int)'=';
      break;
    case '|':
      keyCode = (int)'\\';
      break;
    case '?':
      keyCode = (int)'/';
      break;
    case '{':
      keyCode = (int)'[';
      break;
    case '}':
      keyCode = (int)']';
      break;
    case '<':
      keyCode = (int)',';
      break;
    case '>':
      keyCode = (int)'.';
      break;
    default:
      keyCode = (int)c;
      shift = false;
    }
    if (shift)
      keyType(keyCode, KeyEvent.VK_SHIFT);
    else
      keyType(keyCode);
  }

  private int charToKeyCode(char c) {
    switch (c) {
    case ':':
      return ';';
    }
    return (int)c;
  }
}
  public void settings() {  size(640, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "FaceOSCSmiley" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
