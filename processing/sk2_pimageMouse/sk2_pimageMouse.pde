PImage img;

int imageX = 0;
int imageY = 0;

void setup() {
  size(1000, 640);
  img = loadImage("http://www.rigi.ch/Rigi_webcams/eventzelt.jpg");
}

void draw() {
  //background(0);
  image(img, imageX, imageY, mouseX, mouseY);
}