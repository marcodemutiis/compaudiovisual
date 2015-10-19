/*
Face Slot Machine.
a program that constantly reshuffles images, noses and mouths. Mouse click to stop the shuffling and get a random combination face.
created by Marco De Mutiis, 2015.
*/

//we create an array of names according to our image file names
String[] eyes = {"blue", "green", "brown"};
String[] nose = {"big", "medium", "small"};
String[] mouth = {"open", "closed", "bite"};

//we store our images in an image array for each face part
PImage[] imgEyes = new PImage[3];
PImage[] imgNose = new PImage[3];
PImage[] imgMouth = new PImage[3];

//we creater a global variable to store the number of the picture that will be randomly picked
int eye, nos, mou;

//a boolean is a variable that can be either true or false, we use it stop the shuffling if the mouse is pressed, and to turn it on when it's on
boolean stopped;

void setup() {
  //size of the canvas
  size(900, 900);

//a for loop to load all of our images
  for (int i = 0; i < 3; i++) {
    imgEyes[i] = loadImage(eyes[i] + ".jpg");
    imgNose[i] = loadImage(nose[i] + ".jpg");
    imgMouth[i] = loadImage(mouth[i] + ".jpg");
  }
}

void draw() {
 //the image function displays the image every time we loop
  image(imgEyes[eye], 0, 0);
  image(imgNose[nos], 0, 300);
  image(imgMouth[mou], 0, 600);

//if we don't keep the mouse clicked we pick another image randomly from our image arrays
  if (!stopped) {
    eye = int(random(0, 3));  
    nos = int(random(0, 3));
    mou = int(random(0, 3));
    //stop for 100 milliseconds
    delay(100);
  }
}

void mousePressed() {
  //if we keep the mouse clicked we stop the images to be randomly changed
  stopped = true;
}

void mouseReleased() {
  //we stop clicking the mouse and the shuffling begins again
  stopped = false;
}