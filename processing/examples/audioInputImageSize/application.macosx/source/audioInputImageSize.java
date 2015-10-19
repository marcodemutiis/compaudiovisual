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

public class audioInputImageSize extends PApplet {

/*
Be Careful with your speaker volume, you might produce a painful 
feedback. We recommend to wear headphones for this example.
*/



AudioIn input;
Amplitude rms;

int scale=1;
PImage img;
int imgWidth = 480;
int imgHeight= 360;

public void setup() {
    
    background(255);
    img = loadImage("gosling.jpg");
    
    //Create an Audio input and grab the 1st channel
    input = new AudioIn(this, 0);
    
    // start the Audio Input
    input.start();
    
    // create a new Amplitude analyzer
    rms = new Amplitude(this);
    
    // Patch the input to an volume analyzer
    rms.input(input);
}      


public void draw() {
    background(125,255,125);
    
    // adjust the volume of the audio input
    input.amp(map(mouseY, 0, height, 0.0f, 1.0f));
    
    // rms.analyze() return a value between 0 and 1. To adjust
    // the scaling and mapping of an ellipse we scale from 0 to 0.5
    scale=PApplet.parseInt(map(rms.analyze(), 0, 0.5f, 0, 1000));
    noStroke();
    
    fill(255,0,150);
    // We draw an image coupled to the audio analysis
    image(img, width/2 - scale/2, height/2 - scale/2, scale, scale); 
    if(scale > 100){
      println("loud!");
    }
}
  public void settings() {  size(640,360); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "audioInputImageSize" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
