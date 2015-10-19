PImage img;

float speed = 5;
float newX = width;
float newY = height;

String myImageURL = "http://images.webcams.travel/webcam/1351013234.jpg";
String myOtherImageURL = "http://www2.comune.venezia.it/webcamrialto/imgbridge2_00001.jpg";


void setup() {
  size(1000, 640);
  img = loadImage(myImageURL);
}

void draw() {
  background(0);
  newX += random(-speed, speed);
  newY += random(-speed, speed);
  
  image(img, newX, newY, newX+img.width/2, newY+img.height/2);
}

void mousePressed(){

  img = loadImage(myOtherImageURL);
}

void mouseReleased(){

  img = loadImage(myImageURL);
}