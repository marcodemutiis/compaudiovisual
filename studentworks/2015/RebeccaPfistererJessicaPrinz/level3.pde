String contextual="contextual";
String international="international";
String narrational="narrational";
String relational="relational";

PImage img1;
PImage img2;
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage schrift;
PImage beer;

float score = 20;

char letter;
String words =" ";
boolean levelClicked=false;
boolean contextualB;
boolean relationalB;
boolean internationalB;
boolean narrationalB;
boolean levelSolved;

PFont Clan;
///////////////////////////////////////////////////////////////////////////////////////
void setup() {
  Clan = createFont ("ClanPro-Bold-48.vlw", 48);
  fullScreen();
  background(255);
  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5.png");
  img6 = loadImage("level3.png");
  beer = loadImage("beer.jpg");
  schrift = loadImage("schrift.png");
}
///////////////////////////////////////////////////////////////////////////////////////
void draw() {

  if (levelClicked == false) {
    background(255);
    image (img1, 0, 0, displayWidth, displayHeight);
    image (img6, 0, 0, displayWidth, displayHeight);
  } else {
    image (img1, 0, 0, displayWidth, displayHeight);
    noCursor();
  }

  fill(0, 0, 0);
  textSize(32);
  text("ECTS: "+score+"/30", displayWidth*2/10, displayHeight*1/11);

  if (words.indexOf(contextual) != -1) {
    image (img2, 0, 0, displayWidth, displayHeight);
    if (!contextualB) {
      score += 2.5;
      contextualB = true;
    }
  }

  if (words.indexOf(international) != -1) {
    image (img3, 0, 0, displayWidth, displayHeight);
    if (!internationalB) {
      score += 2.5;
      internationalB = true;
    }
  }

  if (words.indexOf(narrational) != -1) {
    image (img4, 0, 0, displayWidth, displayHeight);
    if (!narrationalB) {
      score += 2.5;
      narrationalB = true;
    }
  }

  if (words.indexOf(relational) != -1) {
    image (img5, 0, 0, displayWidth, displayHeight);
    if (!relationalB) {
      score += 2.5;
      relationalB = true;
    }
  }

  if (score == 30) {
    textSize(200);
    image(schrift, 0, 0, displayWidth, displayHeight
      );
  }

  if (levelSolved == true) {
    image (beer, 0, 0, displayWidth, displayHeight);
  }
}
///////////////////////////////////////////////////////////////////////////////////////
void keyTyped() {
  // The variable "key" always contains the value 
  // of the most recent key pressed.
  if ((key >= 'A' && key <= 'z') || key == ' ') {
    letter = key;
    words = words + key;
    // Write the letter to the console
    println(key);
  }
}
///////////////////////////////////////////////////////////////////////////////////////
void mousePressed() {
  if (mouseX>displayWidth/4 && mouseY>displayHeight/4  ) {
    levelClicked = true;
    println("Hello");
  }
}
///////////////////////////////////////////////////////////////////////////////////////
void keyPressed() {
  if (levelSolved == false) {
    if (score == 30) {
      if (keyPressed) {
        levelSolved = true;
      }
    }
  }
}
///////////////////////////////////////////////////////////////////////////////////////