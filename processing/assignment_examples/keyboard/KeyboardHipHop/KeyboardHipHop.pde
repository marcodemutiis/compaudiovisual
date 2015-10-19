/*
Keyboard Hip Hop
 created by Marco De Mutiis, 2015. Modified from the Sound Library example Keyboard.
 press keys to trigger smaples and associated images.
 */

import processing.sound.*;

AudioDevice device;
SoundFile[] file;

// Define the number of samples 
int numsounds = 10;
int value[] = {0, 0, 0};
//define the images in an array
PImage[] img = new PImage[numsounds];
int current;
boolean started;

void setup() {
  size(1080, 720);
  background(255);

  // Create a Sound renderer and an array of empty soundfiles
  device = new AudioDevice(this, 48000, 32);
  file = new SoundFile[numsounds];

  // Load 10 soundfiles and 10 images from a folder in a for loop. By naming the files 1., 2., 3., n.aif it is easy to iterate
  // through the folder and load all files in one line of code.
  for (int i = 0; i < numsounds; i++) {
    file[i] = new SoundFile(this, (i+1) + ".aif");
    img[i] = loadImage((i+1) + ".jpg");
  }
}

void draw() {

  background(0);

  if (started) {  //this boolean turns true at the first time we hit a key, so we don't show any image before the interaction
    image(img[current], 0, 0, img[current].width, img[current].height);  //display the selected image
  }
}


//if we press a key we enter the keyPressed() function
void keyPressed() {
  if (!started) started = true; //turn boolean true if it's false

//depending on what key we push we trigger a specific image and sound sample
  switch(key) {
  case 'a':
    file[0].play(0.5, 1.0);
    current= 0;
    break;

  case 's':
    file[1].play(0.5, 1.0);
    current = 1;
    break;

  case 'd':
    file[2].play(0.5, 1.0);
    current = 2;
    break;

  case 'f':
    file[3].play(0.5, 1.0);
    current = 3;
    break;

  case 'g':
    file[4].play(0.5, 1.0);
    current = 4;
    break;

  case 'h':
    file[5].play(1.0, 1.0);
    current = 5;
    break;

  case 'j':
    file[6].play(1.0, 1.0);
    current = 6;
    break;

  case 'k':
    file[7].play(1.0, 1.0);
    current = 7;
    break;

  case 'l':
    file[8].play(1.0, 1.0);
    current = 8;
    break;

  case 'ö':
    file[9].play(1.0, 1.0);
    current = 9;
    break;

  case 'ä':
    file[0].play(2.0, 1.0);
    current = 0;
    break;

  case 'q':
    file[1].play(2.0, 1.0);
    current = 1;
    break;

  case 'w':
    file[2].play(2.0, 1.0);
    current = 2;
    break;    

  case 'e':
    file[3].play(2.0, 1.0);
    current = 3;
    break;

  case 'r':
    file[4].play(2.0, 1.0);
    current = 4;
    break; 

  case 't':
    file[0].play(3.0, 1.0);
    current = 0;
    break;

  case 'z':
    file[1].play(3.0, 1.0);
    current = 1;
    break;

  case 'u':
    file[2].play(3.0, 1.0);
    current = 2;
    break;    

  case 'i':
    file[3].play(3.0, 1.0);
    current = 3;
    break;

  case 'o':
    file[4].play(3.0, 1.0);
    current = 4;
    break;

  case 'p':
    file[0].play(4.0, 1.0);
    current = 0;
    break;    

  case 'ü':
    file[1].play(4.0, 1.0);
    current = 1;
    break;
  }
}