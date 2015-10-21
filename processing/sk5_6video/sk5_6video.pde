import processing.video.*;

int counter;
Movie Grappathecat;
PImage George;



void setup() {
  size(640, 360);
  background(0);
  // Load and play the video in a loop
  Grappathecat = new Movie(this, "1min.mov");
  Grappathecat.play();

  George = loadImage("Maucci2.jpg");

  counter = 0;
}

void movieEvent(Movie m) {
  m.read();
}

void draw() {
  println(counter);
  tint(mouseX, mouseY, 0);
  image(Grappathecat, 0, 0, width, height);
  if (counter == 2) {
    Grappathecat.pause();
    image(George, 0, 0, 800, 485);
  }
}

void keyPressed() {
  //pause the video when I press the letter 'p' 23 times
  if (key == 'p') {
    counter++;
  }
  if (key == 's') {
    Grappathecat.play();
    counter =0;
  }
}