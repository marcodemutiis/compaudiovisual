
import processing.video.*;
import pt.citar.diablu.processing.mindset.*;
import processing.serial.*;
import ddf.minim.*;
import ddf.minim.effects.*;

MindSet r;

Movie biubiu;
Movie classroom;

PImage elevator;
PImage keys;
PImage elefant;
PImage gang_toilette;
PImage uebersichtd23;
PImage uebersicht1d;
PImage uebersicht23;
PImage uebersichtd2;
PImage rebijessi;
PImage aurel;
PImage macbook;


int attention;
int attentionStorage = 0;
int distance;
int oldAtt;
int strength;
int sum;
int average;
int counter=1;
int scale;
int levelCounter=1;
int imageSel;

float a;
float wid=1920;
float heit=1080;
float xPos;
float yPos;
float wid2=1920;
float heit2=1080;
float xPos2;
float yPos2;
boolean attLost;
boolean levelFour = false;
boolean pressed = false;

PFont f;

AudioPlayer violin;
AudioPlayer zombie;
AudioPlayer cow;
AudioPlayer clap;
AudioPlayer ghost;
AudioPlayer heartbeat;
AudioPlayer laughing;
AudioPlayer scream;
AudioPlayer succeed;
AudioPlayer elevator_pim;

Minim minim;
Minim minimZombie;
Minim minimCow;
Minim minimClap;
Minim minimGhost;
Minim minimHeartbeat;
Minim minimLaughing;
Minim minimScream;
Minim minimSucceed;
Minim minimElevator_pim;



void setup() {
  size(1920, 1080);
  background(255);


  //Load Images
  gang_toilette = loadImage("gang_toilette.jpg" );
  uebersichtd23 = loadImage("uebersichtd23.jpg" );
  uebersicht1d = loadImage("uebersicht1d.jpg" );
  uebersicht23 = loadImage("uebersicht23.jpg" );
  uebersichtd2 = loadImage("uebersichtd2.jpg" );
  elefant = loadImage("elefant.jpg");
  aurel = loadImage("aurel.jpg");
  rebijessi = loadImage("rebijessi.jpg");
  macbook = loadImage("macbook.jpg");
  gang_toilette = loadImage("gang_toilette.jpg" );
  uebersichtd23 = loadImage("uebersichtd23.jpg" );
  uebersicht1d = loadImage("uebersicht1d.jpg" );
  uebersicht23 = loadImage("uebersicht23.jpg" );
  uebersichtd2 = loadImage("uebersichtd2.jpg" );

  keys = loadImage("keys.jpg");

  //Load Movies
  biubiu = new Movie(this, "biubiu.mov");
  classroom = new Movie(this, "classroom.mov");


  //Load Audio
  minim = new Minim(this);
  minimZombie = new Minim(this);
  minimCow = new Minim(this);
  minimClap = new Minim(this);
  minimGhost = new Minim(this);
  minimHeartbeat = new Minim(this);
  minimLaughing = new Minim(this);
  minimScream = new Minim(this);
  minimSucceed = new Minim(this);
  minimElevator_pim = new Minim(this);
  violin = minim.loadFile("groove.mp3", 2048);
  cow = minimZombie.loadFile("cow.wav", 2048);
  heartbeat = minimHeartbeat.loadFile("heart beat.wav", 2048);
  clap = minimClap.loadFile("clap.wav", 2048);
  ghost = minimGhost.loadFile("ghost.wav", 2048);
  laughing = minimLaughing.loadFile("laughing.wav", 2048);
  zombie = minimZombie.loadFile("zombie.wav", 2048);
  scream = minimScream.loadFile("scream.wav", 2048);
  succeed = minimSucceed.loadFile("succeed.wav", 2048);
  elevator_pim = minimElevator_pim.loadFile("elevator_pim.mp3", 2048);

  for (int i = 0; i < violin.bufferSize() - 1; i++)
  {
    line(i, 50  + violin.left.get(i)*50, i+1, 50  + violin.left.get(i+1)*50);
    line(i, 150 + violin.right.get(i)*50, i+1, 150 + violin.right.get(i+1)*50);
  }

  for (int i = 0; i < zombie.bufferSize() - 1; i++)
  {
    line(i, 50  + zombie.left.get(i)*50, i+1, 50  + zombie.left.get(i+1)*50);
    line(i, 150 + zombie.right.get(i)*50, i+1, 150 + zombie.right.get(i+1)*50);
  }


  for (int i = 0; i < cow.bufferSize() - 1; i++)
  {
    line(i, 50  + cow.left.get(i)*50, i+1, 50  + cow.left.get(i+1)*50);
    line(i, 150 + cow.right.get(i)*50, i+1, 150 + cow.right.get(i+1)*50);
  }


  for (int i = 0; i <heartbeat.bufferSize() - 1; i++)
  {
    line(i, 50  + heartbeat.left.get(i)*50, i+1, 50  + heartbeat.left.get(i+1)*50);
    line(i, 150 + heartbeat.right.get(i)*50, i+1, 150 + heartbeat.right.get(i+1)*50);
  }


  for (int i = 0; i < clap.bufferSize() - 1; i++)
  {
    line(i, 50  + clap.left.get(i)*50, i+1, 50  + clap.left.get(i+1)*50);
    line(i, 150 + clap.right.get(i)*50, i+1, 150 + clap.right.get(i+1)*50);
  }


  for (int i = 0; i <ghost.bufferSize() - 1; i++)
  {
    line(i, 50  + ghost.left.get(i)*50, i+1, 50  + ghost.left.get(i+1)*50);
    line(i, 150 + ghost.right.get(i)*50, i+1, 150 + ghost.right.get(i+1)*50);
  }



  for (int i = 0; i <laughing.bufferSize() - 1; i++)
  {
    line(i, 50  + laughing.left.get(i)*50, i+1, 50  + laughing.left.get(i+1)*50);
    line(i, 150 + laughing.right.get(i)*50, i+1, 150 + laughing.right.get(i+1)*50);
  }



  for (int i = 0; i <scream.bufferSize() - 1; i++)
  {
    line(i, 50  + scream.left.get(i)*50, i+1, 50  + scream.left.get(i+1)*50);
    line(i, 150 + scream.right.get(i)*50, i+1, 150 + scream.right.get(i+1)*50);
  }

  for (int i = 0; i <succeed.bufferSize() - 1; i++)
  {
    line(i, 50  + succeed.left.get(i)*50, i+1, 50  + succeed.left.get(i+1)*50);
    line(i, 150 + succeed.right.get(i)*50, i+1, 150 + succeed.right.get(i+1)*50);
  }

  for (int i = 0; i <elevator_pim.bufferSize() - 1; i++)
  {
    line(i, 50  + elevator_pim.left.get(i)*50, i+1, 50  + elevator_pim.left.get(i+1)*50);
    line(i, 150 + elevator_pim.right.get(i)*50, i+1, 150 + elevator_pim.right.get(i+1)*50);
  }




  //Load Mindwave

  r = new MindSet(this, "/dev/tty.MindWaveMobile-DevA");
  violin.loop();
  elevator = loadImage("elevator.jpg" );
  frameRate(30);
}





void draw() {

  //Level 1
  if (levelCounter == 1) {




    image(elevator, xPos, yPos, wid, heit);
    attentionDisplay();
    cheat();

    if ((attention>60)) {      //Zoom in image if concentrationlevel is above 80
      wid = wid +30f;
      heit = heit +30f;
      xPos = xPos-15f;
      yPos = yPos-15f;
    }

    if ((attention<40)&&((wid)!=1920)) {
      wid = wid -30f;
      heit = heit -30f;
      xPos =xPos+15f;
      yPos =yPos+15f;
    }

    if (wid>3200) {
      levelCounter=2;
    }
  }


  //Level 2
  if (levelCounter == 2) {
    violin.mute();
    elevator_pim.play();

    image(keys, 0, 0, width, height);
    useKeys();

    if (keyPressed) {
      if (key == '0') {
        cow.play();
        cow.rewind();
      }
      if (key == '1') {
        println("Hello Zombie");
        zombie.play();
        zombie.rewind();
      }
      if (key == '2') {
        laughing.play();
        laughing.rewind();
      }
      if (key == '3') {
        elevator_pim.rewind();
        levelCounter=3;
        elevator_pim.play();
        wid2=1920;
        classroom.stop();
      }
      if (key == '4') {
        ghost.play();
        ghost.rewind();
      }
      if (key == '5') {
        clap.play();
        clap.rewind();
      }
      if (key == '6') {
        heartbeat.play();
        heartbeat.rewind();
      }
      if (key == '7') {
        scream.play();
        scream.rewind();
      }
    }
  }
  //Level 3
  if (levelCounter == 3) {
    pressed=false;

    biubiu.play();

    image(biubiu, 0, 0, width, height);
    println("I am in the video loop");
    if (biubiu.time()==biubiu.duration()) {
      levelCounter = 4;
    }
  }


  //Level 4
  if (levelCounter == 4) {
    biubiu.stop();
    image(uebersichtd23, xPos2, yPos2, wid2, heit2);
    attentionDisplay();
  cheat();
    violin.unmute();



    if ((attention>75)) {      //Zoom in image if concentrationlevel is above 80
      wid2 = wid2 +30f;
      heit2 = heit2 +30f;
      xPos2 = xPos2-15f;
      yPos2 = yPos2-15f;
    }

    //&&attLost==false&&(attention!=0)
    if ((attention<50)&&((wid2)!=1920)) {
      wid2 = wid2 -30f;
      heit2 = heit2 -30f;
      xPos2 =xPos2+15f;
      yPos2 =yPos2+15f;
    }

    if (wid2>4400) {

      levelCounter=5;
    }
  }


  //Level5
  if (levelCounter==5) {

    classroom.play();
    classroom.volume(0);
    
    image(classroom, 0, 0, width, height);
    if (classroom.duration() == classroom.time()) {
      useMouse();
     // classroom.stop();

      if (pressed==false) {
        if (mousePressed) {
          if (mouseX > 0 && mouseX < (width/3)) {
            imageSel = 1;
            pressed=true;
            println("1 pressed");
          }  
          if (mouseX > (width/3) && mouseX < (width*0.66)) {
            imageSel=2;
            pressed=true;
            println("2pressed");
          } 
          if (mouseX > width*0.66 && mouseX<width) {
            imageSel =3;
            pressed=true;
            println("3 pressed");
          }
        }
      }
    }
  }

  if (imageSel==1 && levelCounter==5) {
    image(rebijessi, 0, 0, width, height);
    imageSel=0;
    
  }
  if (imageSel==2 && levelCounter==5) {
    image(macbook, 0, 0, width, height);
    if (mousePressed) {
      levelCounter=2;
      println(levelCounter);
      elevator_pim.rewind();
      imageSel=0;
    }
  }
  if (imageSel==3 && levelCounter==5) {
    image(aurel, 0, 0, width, height);
    imageSel=0;
  }
}


//AttentionFunction
public void attentionEvent(int attentionLevel) {

  println("Attention Level: " + attentionLevel);
  attention = attentionLevel;
  if (attentionLevel != 0) {
    if (attentionLevel - oldAtt > 10) {
      attLost = false;
      println("You lost Attention");
    } else {
      if (attentionLevel<85) {
        attLost = true;
      }
    }

    if (counter <= 20) {      //averagecalc
      sum = sum + attentionLevel;
      average = sum/counter;
      oldAtt = attentionLevel;
      counter++;
      if (counter == 20) {
        println("average is: " + average);
        //delay(10000);

        counter = 1;
        average = 0;
        sum = 0;
        println("lets start again");
      }
    }
  }
}


//Playmovie
void movieEvent(Movie m) {
  m.read();
}

//Attention Indicator
void attentionDisplay() {
  
  strokeWeight(10);
  strokeCap(ROUND);
  textSize(26);
  fill(0);
  text("Your Attentionlevel", width/9.5*7, 500);
 
  
  
   if(attention <60){
    fill(255,0,0);
  }
  if(attention>=60){
    fill(0,255,0);
  }
  //line((width/8*7), 500, (width/8*7), (500-(attention*3)));
  noStroke();
  rect(width/8*7, 500, 4, -attention*2);

  
  
}


//Use Mouse

void useMouse(){
  
  text("USE MOUSE",width/8*7, height/5*4);
  
}

//Use Keys
void useKeys(){
  
  text("USE KEYBOARD",width/8*7, height/5*4);
  
}

//Cheat

void cheat(){
  if(mousePressed){
    attention=100;
  }
  
}