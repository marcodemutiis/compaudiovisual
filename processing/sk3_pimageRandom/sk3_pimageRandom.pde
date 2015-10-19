PImage img;

float speed = 2.5;
float newX = width;
float newY = height;

void setup() {
  size(1000, 640);
  img = loadImage("http://images.webcams.travel/webcam/1351013234.jpg");
}

void draw() {
  background(0);
  newX += random(-speed, speed);
  newY += random(-speed, speed);
  
  image(img, newX, newY, newX+img.width/2, newY+img.height/2);
}