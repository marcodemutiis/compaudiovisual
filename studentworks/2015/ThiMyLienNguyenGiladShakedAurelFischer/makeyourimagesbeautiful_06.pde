import processing.sound.*;
import oscP5.*;
OscP5 oscP5;
SoundFile correct;

// our FaceOSC tracked face dat
Face face = new Face();
PFont font;
ArrayList<Graph> graphs;
int totalGraphs;

float startPunktX = 0;
float startPunktY = 0;

PImage img;
PImage imgtwo;
PImage imgthree;
PImage imgfour;
PImage imgfive;
PImage imgsorry;
PImage imgsticker;
String img1 = "img.jpg";
String img2 = "img2.jpg";
String img3 = "img3.jpg";
String img4 = "img4.jpg";
String img5 = "img5.jpg";
String img6 = "sorry.jpg";
String img7 = "sticker.jpg";
int counter;

float newX;
float newY;
float resizedX;
float resizedY;

int mouthThres = 18;
int eyebrowThres = 8;


int frameCounter;
int timer = 50;
int loopTime = 100;
int zoom = 1;

boolean startScreen = true;

//String correct = "correct.wav";

void setup() {
  //size(displayWidth, displayHeight);
  fullScreen();
  noCursor();
  frameRate(30);
  correct = new SoundFile(this, "correct.wav");
  img = loadImage(img1);//load the image URL
  imgtwo = loadImage(img2);
  imgthree = loadImage(img3);
  imgfour = loadImage(img4);
  imgfive = loadImage(img5);
  imgsorry = loadImage(img6);
  imgsticker = loadImage(img7);
  font = createFont("Helvetica", 10, false);
  textFont(font);

  oscP5 = new OscP5(this, 8338);

  totalGraphs = 12;
  reset();
}



void reset() {

}

void draw() {
  if(face.found == 0 && startScreen == true){
    image (imgsticker, 0, 0, displayWidth, displayHeight);
  }
  else{
    startScreen= false;
  
  
  background(0);
  
  //////////////////////for the last image, it will display even if a face is not found
  if (counter == 3) {
      frameCounter ++;
      if (frameCounter < timer) {
        image(imgfour, (newX)+ (face.posePosition.x), (newY) + (face.posePosition.y)/*-(face.poseOrientation.y * 1000)*/, img.width + resizedX, img.height + resizedY);
        println("img4");
      }
      if (frameCounter >= timer) {
        image(imgfive, (newX)+ (face.posePosition.x), (newY) + (face.posePosition.y)/*-(face.poseOrientation.y * 1000)*/, img.width + resizedX, img.height + resizedY);
        println("img5");
      }
    }
   
if (face.found == 0) {
  image(imgsorry, 0, 0, displayWidth, displayHeight);
}
    ////////////////////////if face is recognized
  if (face.found > 0) {
    //translate(500, 400);
    //scale(0.1, 0.1);
    face.poseScale = map(face.poseScale, 1, 7, 0, 10);

    resizedX = face.poseScale*150;
    resizedY = face.poseScale*100;//ratio needs to be 3:2 if your image has 3:2 ratio x:y

    newX = displayWidth-img.width-resizedX;
    newY = displayHeight- img.height-resizedY;


    if (counter == 0) {
      image(img, (newX)+ (face.posePosition.x), (newY) + (face.posePosition.y)/*-(face.poseOrientation.y * 1000)*/, img.width + resizedX, img.height + resizedY);
      println("img");
    } else if (counter == 1) {
      image(imgtwo, (newX)+ (face.posePosition.x), (newY)+ (face.posePosition.y)/*-(face.poseOrientation.y * 1000)*/, imgtwo.width + resizedX, imgtwo.height + resizedY);
      println("img2");
    } else if (counter == 2) {
      image(imgthree, (newX)+ (face.posePosition.x), (newY)+ (face.posePosition.y)/*-(face.poseOrientation.y * 1000)*/, imgthree.width + resizedX, imgthree.height + resizedY);
      println("img3");
    } else if (counter == 3) {
      frameCounter ++;
      if (frameCounter < timer) {
        float zoom = map(frameCounter, 1, timer, 1, 1.8); 
        scale(zoom, zoom);
        image(imgfour, (newX)+ (face.posePosition.x), (newY) + (face.posePosition.y)/*-(face.poseOrientation.y * 1000)*/, img.width + resizedX, img.height + resizedY);
        println("img4");
      }
      if (frameCounter >= timer && frameCounter < loopTime) {
        scale(1,1);
        image(imgfive, (newX)+ (face.posePosition.x), (newY) + (face.posePosition.y)/*-(face.poseOrientation.y * 1000)*/, img.width + resizedX, img.height + resizedY);
        println("img5");
      }
      if (frameCounter >= loopTime){
        counter = 0;
        frameCounter = 0;
      }
    }



    if (counter == 2 && face.mouthWidth > mouthThres-5 && face.eyebrowLeft > eyebrowThres-5 && face.mouthHeight > 5) {
      counter = 3;
      correct.play();
      println("counter ="+counter);
      //image(imgfour, (newX)+ (face.posePosition.x), (newY) + (face.posePosition.y)/*-(face.poseOrientation.y * 1000)*/, img.width + resizedX, img.height + resizedY);
    }
    if (counter == 1 && face.mouthWidth > mouthThres && face.eyebrowLeft > eyebrowThres) {
      counter = 2;
      correct.play();
      println("counter ="+counter);
      //image(imgthree, (newX)+ (face.posePosition.x), (newY)+ (face.posePosition.y)/*-(face.poseOrientation.y * 1000)*/, imgthree.width + resizedX, imgthree.height + resizedY);
    }

    if (counter == 0 && face.mouthWidth > mouthThres) { 
      counter = 1;
      correct.play();
      println("counter ="+counter);
      //image(imgtwo, (newX)+ (face.posePosition.x), (newY)+ (face.posePosition.y)/*-(face.poseOrientation.y * 1000)*/, imgtwo.width + resizedX, imgtwo.height + resizedY);
    }
  }

  }
}
// OSC CALLBACK FUNCTIONS

void oscEvent(OscMessage m) {
  face.parseOSC(m);
}