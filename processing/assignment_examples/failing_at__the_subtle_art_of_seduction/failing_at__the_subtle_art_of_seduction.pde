/*
(failing at) the subtle art of seduction
created by Marco De Mutiis, 2015.

a simple sketch about the difficult relationship 
between a mouse cursor and a string of text.. 
you know that kind of love/hate relationships, don't you?
*/
PFont font;
 
 
void setup()  {
  //canvas size
  size(640, 640);
  //create font (go to Tools > Create Font...)
  font = loadFont("Helvetica-30.vlw");
  textFont(font);
   
}
 
void draw(){
   
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