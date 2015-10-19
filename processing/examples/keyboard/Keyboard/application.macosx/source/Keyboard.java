import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.sound.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Keyboard extends PApplet {

/*
This example shows how to make a simple sampler and sequencer with the Sound library. In this
sketch 5 different short samples are loaded and played back at different pitches, in this
case 5 different octaves. The sequencer triggers and event every 200-1000 mSecs randomly.
Each time a sound is played a colored rect with a random color is displayed.
*/



AudioDevice device;
SoundFile[] file;

// Define the number of samples 
int numsounds = 5;
int value[] = {0,0,0};
PImage[] img = new PImage[numsounds];
int current;
boolean started;

public void setup(){
  
  background(255);
  
  // Create a Sound renderer and an array of empty soundfiles
  device = new AudioDevice(this, 48000, 32);
  file = new SoundFile[numsounds];
  
  // Load 5 soundfiles from a folder in a for loop. By naming the files 1., 2., 3., n.aif it is easy to iterate
  // through the folder and load all files in one line of code.
  for (int i = 0; i < numsounds; i++){
    file[i] = new SoundFile(this, (i+1) + ".aif");
    img[i] = loadImage((i+1) + ".jpg");
  }
  
}

public void draw(){

    background(value[0],value[1],value[2]);
    if(started){
image(img[current], 0, 0, img[current].width, img[current].height);
    }
}



public void keyPressed() {
  if(!started) started = true;
  
  for (int i=0; i < 3; i++) {  
      value[i]=PApplet.parseInt(random(255));
  }
 
  switch(key){
  case 'a':
    file[0].play(0.5f, 1.0f);
    current= 0;
    break;

  case 's':
    file[1].play(0.5f, 1.0f);
    current = 1;
    break;
  
  case 'd':
    file[2].play(0.5f, 1.0f);
    current = 2;
    break;
  
  case 'f':
    file[3].play(0.5f, 1.0f);
    current = 3;
    break;
  
  case 'g':
    file[4].play(0.5f, 1.0f);
    current = 4;
    break;
  
   case 'h':
    file[0].play(1.0f, 1.0f);
    current = 0;
    break;
   
   case 'j':
    file[1].play(1.0f, 1.0f);
    current = 1;
    break;

   case 'k':
    file[2].play(1.0f, 1.0f);
    current = 2;
    break;
    
   case 'l':
    file[3].play(1.0f, 1.0f);
    current = 3;
    break;
    
   case '\u00f6':
    file[4].play(1.0f, 1.0f);
    current = 4;
    break;
    
   case '\u00e4':
    file[0].play(2.0f, 1.0f);
    current = 0;
    break;
    
   case 'q':
    file[1].play(2.0f, 1.0f);
    current = 1;
    break;
   
   case 'w':
    file[2].play(2.0f, 1.0f);
    current = 2;
    break;    
   
   case 'e':
    file[3].play(2.0f, 1.0f);
    current = 3;
   break;
   
   case 'r':
    file[4].play(2.0f, 1.0f);
    current = 4;
   break; 
   
   case 't':
    file[0].play(3.0f, 1.0f);
    current = 0;
    break;
    
   case 'z':
    file[1].play(3.0f, 1.0f);
    current = 1;
    break;
   
   case 'u':
    file[2].play(3.0f, 1.0f);
    current = 2;
    break;    
   
   case 'i':
    file[3].play(3.0f, 1.0f);
    current = 3;
   break;
   
   case 'o':
    file[4].play(3.0f, 1.0f);
    current = 4;
    break;
   
   case 'p':
    file[0].play(4.0f, 1.0f);
    current = 0;
    break;    
   
   case '\u00fc':
    file[1].play(4.0f, 1.0f);
    current = 1;
   break;   
  }
}
  public void settings() {  size(1080, 720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "Keyboard" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
