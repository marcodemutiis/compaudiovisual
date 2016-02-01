PImage evert1; 
PImage evert2; 
PImage evert3; 
PImage evert4; 
PImage evert5; 
PImage evert6; 
PImage evert7; 
PImage evert8;
PImage evert9; 
PImage evert10; 
PImage wolfgang1;
PImage wolfgang2;
PImage wolfgang3;
PImage wolfgang4;
PImage wolfgang5;
PImage wolfgang6;
PImage wolfgang7;
PImage lukas1; 
PImage lukas2; 
PImage lukas3; 
PImage lukas4; 
PImage lukas5; 
PImage lukas6; 
PImage lukas7; 
PImage lukas8;
PImage kaspar1; 
PImage kaspar2; 
PImage kaspar3; 
PImage kaspar4; 
PImage kaspar5; 
PImage corina1; 
PImage corina2; 
PImage corina3; 
PImage corina4; 
PImage corina5; 
PImage johanna1; 
PImage johanna2; 
PImage johanna3; 
PImage johanna4; 
PImage johanna5; 
PImage johanna6; 
PImage johanna7;
PImage marco1;
PImage marco2;
PImage marco3;
PImage marco4;
PImage marco5;
PImage img6;

float x;
float y;
float x1;
float y1;
float score=10;

int lastTime;
int delayAmount;
int diameter = 300;
int counter;
int counter2;
int totalImages =47;
int speed;

boolean clickForScore = false;
boolean levelClicked=false;
boolean levelSolved;

PFont Clan;

///////////////////////////////////////////////////////////////////////////////////////
void setup () {
  fullScreen ();
  background (255);
  resetTimer();
  smooth();
  noStroke();
  evert1 = loadImage ("evert1 Kopie.png");
  evert2 = loadImage ("evert2 Kopie.png");
  evert3 = loadImage ("evert3 Kopie.png");
  evert4 = loadImage ("evert4 Kopie.png");
  evert5 = loadImage ("evert5 Kopie.png");
  evert6 = loadImage ("evert6 Kopie.png");
  evert7 = loadImage ("evert7 Kopie.png");
  evert8 = loadImage ("evert8 Kopie.png");
  evert9 = loadImage ("evert9 Kopie.png");
  evert10 = loadImage ("evert10 Kopie.png");
  wolfgang1 = loadImage ("wolfgang1 Kopie.png");
  wolfgang2 = loadImage ("wolfgang2 Kopie.png");
  wolfgang3 = loadImage ("wolfgang3 Kopie.png");
  wolfgang4 = loadImage ("wolfgang4 Kopie.png");
  wolfgang5 = loadImage ("wolfgang5 Kopie.png");
  wolfgang6 = loadImage ("wolfgang6 Kopie.png");
  wolfgang7 = loadImage ("wolfgang7 Kopie.png");
  lukas1 = loadImage ("lukas1.png");
  lukas2 = loadImage ("lukas2.png");
  lukas3 = loadImage ("lukas3.png");
  lukas4 = loadImage ("lukas4.png");
  lukas5 = loadImage ("lukas5.png");
  lukas6 = loadImage ("lukas6.png");
  lukas7 = loadImage ("lukas7.png");
  lukas8 = loadImage ("lukas8.png");
  kaspar1 = loadImage ("kaspar1.png");
  kaspar2 = loadImage ("kaspar2.png");
  kaspar3 = loadImage ("kaspar3.png");
  kaspar4 = loadImage ("kaspar4.png");
  kaspar5 = loadImage ("kaspar5.png");
  corina1 = loadImage ("corina1.png");
  corina2 = loadImage ("corina2.png");
  corina3 = loadImage ("corina3.png");
  corina4 = loadImage ("corina4.png");
  corina5 = loadImage ("corina5.png");
  johanna1 = loadImage ("johanna1.png");
  johanna2 = loadImage ("johanna2.png");
  johanna3 = loadImage ("johanna3.png");
  johanna4 = loadImage ("johanna4.png");
  johanna5 = loadImage ("johanna5.png");
  johanna6 = loadImage ("johanna6.png");
  johanna7 = loadImage ("johanna7.png");
  marco1 = loadImage ("marco1.png");
  marco2 = loadImage ("marco2.png");
  marco3 = loadImage ("marco3.png");
  marco4 = loadImage ("marco4.png");
  marco5 = loadImage ("marco5.png");
  img6 = loadImage("level2.png");

  counter = 0;

  x = random(0, displayWidth - evert1.width);
  y = random(0, displayHeight - evert1.height);
  x1 = random(0, displayWidth - evert1.width);
  y1 = random(0, displayHeight - evert1.height);

  speed = 2000;

  Clan = createFont ("ClanPro-Bold-48.vlw", 48);
}

///////////////////////////////////////////////////////////////////////////////////////
void draw() {

  if (levelClicked == false) {
    image (evert1, x, y, evert1.width*1.5, evert1.height*1.5);
    image (img6, 0, 0, displayWidth, displayHeight);
  } else {

    if (levelSolved == true) {
      exit();
    }

    if ((mousePressed == true) && (dist(mouseX, mouseY, x + evert1.width/2, y + evert1.height/2) <= diameter)) {
      counter = int(random(0, totalImages));
      score = score + 0.5;
      x = random(0, displayWidth - evert1.width);
      y = random(0, displayHeight - evert1.height);
      resetTimer();
      speed -= 70;

      if (speed<600) {
        speed = 800;
      }  

      delay(100);
    } else if ((mousePressed == true) && (dist(mouseX, mouseY, x1 + evert1.width/2, y1 + evert1.height/2) <= diameter)) {
      score = score + 0.5;
      counter2 = int(random(0, totalImages));
      x1 = random(0, displayWidth - evert1.width);
      y1 = random(0, displayHeight - evert1.height);
      resetTimer();
      speed -= 70;

      if (speed<600) {
        speed = 800;
      }

      delay(100);
    }

    background (255);

    if (counter == 0) {
      image(evert1, x, y, evert1.width*1.5, evert1.height*1.5);
    }
    if (counter == 1) {
      image (evert2, x, y, evert2.width*1.5, evert2.height*1.5);
    }
    if (counter2 == 1) {
      image (wolfgang2, x1, y1, wolfgang2.width*1.5, wolfgang2.height*1.5);
    }
    if (counter == 2) {
      image (evert3, x, y, evert3.width*1.5, evert3.height*1.5);
    }
    if (counter == 3) {
      image (evert4, x, y, evert4.width*1.5, evert4.height*1.5);
    }
    if (counter == 4) {
      image (evert5, x, y, evert5.width*1.5, evert5.height*1.5);
    }
    if (counter == 5) {
      image (evert6, x, y, evert6.width*1.5, evert6.height*1.5);
    }
    if (counter == 6) {
      image (evert7, x, y, evert7.width*1.5, evert7.height*1.5);
    }
    if (counter2 == 6) {
      image (johanna3, x1, y1, johanna3.width*1.5, johanna3.height*1.5);
    }
    if (counter == 7) {
      image (evert8, x, y, evert8.width*1.5, evert8.height*1.5);
    }
    if (counter == 8) {
      image (evert9, x, y, evert9.width*1.5, evert9.height*1.5);
    }
    if (counter == 9) {
      image (evert10, x, y, evert10.width*1.5, evert10.height*1.5);
    }
    if (counter == 10) {
      image(wolfgang1, x, y, wolfgang1.width*1.5, wolfgang1.height*1.5);
    }
    if (counter == 11) {
      image (wolfgang2, x, y, wolfgang2.width*1.5, wolfgang2.height*1.5);
    }
    if (counter == 12) {
      image (wolfgang3, x, y, wolfgang3.width*1.5, wolfgang3.height*1.5);
    }
    if (counter == 13) {
      image (wolfgang4, x, y, wolfgang4.width*1.5, wolfgang4.height*1.5);
    }
    if (counter == 14) {
      image (wolfgang5, x, y, wolfgang5.width*1.5, wolfgang5.height*1.5);
    }
    if (counter == 15) {
      image (wolfgang6, x, y, wolfgang6.width*1.5, wolfgang6.height*1.5);
    }
    if (counter == 16) {
      image (wolfgang7, x, y, wolfgang7.width*1.5, wolfgang7.height*1.5);
    }
    if (counter == 17) {
      image(lukas1, x, y, lukas1.width*1.5, lukas1.height*1.5);
    }
    if (counter == 18) {
      image (lukas2, x, y, lukas2.width*1.5, lukas2.height*1.5);
    }
    if (counter == 19) {
      image (lukas3, x, y, lukas3.width*1.5, lukas3.height*1.5);
    }
    if (counter == 20) {
      image (lukas4, x, y, lukas4.width*1.5, lukas4.height*1.5);
    }
    if (counter == 21) {
      image (lukas5, x, y, lukas5.width*1.5, lukas5.height*1.5);
    }
    if (counter == 22) {
      image (lukas6, x, y, lukas6.width*1.5, lukas6.height*1.5);
    }
    if (counter2 == 22) {
      image (kaspar4, x1, y1, kaspar4.width*1.5, kaspar4.height*1.5);
    }
    if (counter == 23) {
      image (lukas7, x, y, lukas7.width*1.5, lukas7.height*1.5);
    }
    if (counter == 24) {
      image (lukas8, x, y, lukas8.width*1.5, lukas8.height*1.5);
    }
    if (counter == 25) {
      image(kaspar1, x, y, kaspar1.width*1.5, kaspar1.height*1.5);
    }
    if (counter == 26) {
      image (kaspar2, x, y, kaspar2.width*1.5, kaspar2.height*1.5);
    }
    if (counter2 == 26) {
      image (corina3, x1, y1, corina3.width*1.5, corina3.height*1.5);
    }
    if (counter == 27) {
      image (kaspar3, x, y, kaspar3.width*1.5, kaspar3.height*1.5);
    }
    if (counter == 28) {
      image (kaspar4, x, y, kaspar4.width*1.5, kaspar4.height*1.5);
    }
    if (counter == 29) {
      image (kaspar5, x, y, kaspar5.width*1.5, kaspar5.height*1.5);
    }
    if (counter == 30) {
      image(corina1, x, y, corina1.width*1.5, corina1.height*1.5);
    }
    if (counter == 31) {
      image (corina2, x, y, corina2.width*1.5, corina2.height*1.5);
    }
    if (counter == 32) {
      image (corina3, x, y, corina3.width*1.5, corina3.height*1.5);
    }
    if (counter2 ==32) {
      image (johanna6, x1, y1, johanna6.width*1.5, johanna6.height*1.5);
    }
    if (counter == 33) {
      image (corina4, x, y, corina4.width*1.5, corina4.height*1.5);
    }
    if (counter == 34) {
      image (corina5, x, y, corina5.width*1.5, corina5.height*1.5);
    }
    if (counter == 35) {
      image(johanna1, x, y, johanna1.width*1.5, johanna1.height*1.5);
    }
    if (counter == 36) {
      image (johanna2, x, y, johanna2.width*1.5, johanna2.height*1.5);
    }
    if (counter == 37) {
      image (johanna3, x, y, johanna3.width*1.5, johanna3.height*1.5);
    }
    if (counter == 38) {
      image (johanna4, x, y, johanna4.width*1.5, johanna4.height*1.5);
    }
    if (counter == 39) {
      image (johanna5, x, y, johanna5.width*1.5, johanna5.height*1.5);
    }
    if (counter == 40) {
      image (johanna6, x, y, johanna6.width*1.5, johanna6.height*1.5);
    }
    if (counter == 41) {
      image (johanna7, x, y, johanna7.width*1.5, johanna7.height*1.5);
    }
    if (counter == 42) {
      image (marco1, x, y);
    }
    if (counter == 43) {
      image (marco2, x, y);
    }
    if (counter == 44) {
      image (marco3, x, y);
    }
    if (counter == 45) {
      image (marco4, x, y);
    }
    if (counter == 46) {
      image (marco5, x, y);
    }
  }
  
  if (millis() - lastTime > delayAmount) {

    x = random(0, displayWidth - evert1.width);
    y = random(0, displayHeight - evert1.height);
    x1 = random(0, displayWidth - evert1.width);
    y1 = random(0, displayHeight - evert1.height);
    resetTimer();
  }

  //text
  fill(0, 0, 0);
  textSize(32);
  text("ECTS: "+score +"/20", displayWidth*6/7, displayHeight*1/11);

  if (score >= 20) {
    text ("next level >>>", displayWidth*7/8, displayHeight*10/11);
    levelSolved=false;
  }
}

///////////////////////////////////////////////////////////////////////////////////////
void resetTimer() {
  lastTime = millis();
  delayAmount = int(random(1, 1) * speed);
}

///////////////////////////////////////////////////////////////////////////////////////
void mousePressed() {
  if (levelClicked == false) {
    if (mouseX>displayWidth/4 && mouseY>displayHeight/4  ) {
      levelClicked = true;
    }
  }
  if (levelSolved == false) {
    if (score >= 20) {
      if (mouseX>displayWidth/4 && mouseY>displayHeight/4  ) {
        levelSolved = true;
      }
    }
  }
}