import processing.sound.*;

PImage img;
PImage img2;

SoundFile Carl;
SoundFile Peter;

void setup() {
  size(1200, 640);
  
  img = loadImage("Adventure-Time-With-Finn-and-Jake-image-adventure-time-with-finn-and-jake-36089420-1920-1080.jpg"); //loads the pic
  img2 = loadImage("gorilla.jpg");

  Carl = new SoundFile(this, "07 John Handy - Hard Work.mp3"); //loads the sound file
  Peter = new SoundFile(this, "13 A Skillz & Krafty Kutz - Roll over Baby.mp3");

  //image()//displays the pic
  background(255, 0, 255);
}

void draw() {
  
}

void keyPressed() {
  if (key == 'a') {
    Carl.stop();
    Peter.stop();
    background(255, 0, 255);
    image(img, 50, mouseY, img.width/5, img.height/5);
    Carl.play();
  }
  
  if (key == 'k') {
    Peter.stop();
    Carl.stop();
    background(0, 0, 255);
    image(img2, 450, 50, img.width/5, img.height/5);
    Peter.play();
  }
}

void keyReleased() {
  if (key == 'a') {
    
  }
}