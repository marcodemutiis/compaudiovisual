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

public class failing_at__the_subtle_art_of_seduction extends PApplet {

PFont font;
 
 
public void setup()  {
   
  
  font = loadFont("Helvetica-30.vlw");
  textFont(font);
   
}
 
public void draw(){
   
  if (mousePressed==false){
     
    background(random(0, 150),random(0, 150), mouseX, 10);
    fill(255, 255, 255);
    text("I'm going crazy without you!", mouseX + 250, mouseY + (random(-300, 300)));
    fill(255, 255, 255);
     
    }
     
  else if(mousePressed==true){
     
    background(0); 
    delay(60);
    fill(255, 255, 255);
    text("stop stalking me!", mouseX, mouseY-10);
     
    }
}
  public void settings() {  size(640, 640); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "failing_at__the_subtle_art_of_seduction" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
