PImage img; //this is an image datatype (we tell the program that it should expect an image 

int imageX = 0; //integer for the image position on the x axis
int imageY = 0; //integer for the image position on the y axis

void setup() {
  size(1000, 640); //size of the canvas
  img = loadImage("http://www.rigi.ch/Rigi_webcams/eventzelt.jpg"); //load the image URL
}

void draw() {
  background(159);
  image(img, 153, imageY, img.width, img.height);
}