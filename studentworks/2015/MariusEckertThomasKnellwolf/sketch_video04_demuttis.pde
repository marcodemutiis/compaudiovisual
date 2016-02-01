
import processing.video.*;
Movie[] Tosca;

int counter = 0;
int max;

int level = 1;
int frameCounter;

boolean isMovieFinished = false;

void setup() {
  frameRate(60);
  noCursor();
  
  size(1280, 720);
  //fullScreen(0);
  counter = 0;
  max = 10;
  Tosca = new Movie[max];

  for (int i=0; i<max; i++) {
    Tosca[i] = new Movie(this, i+".mp4");
  }
}

void draw() {
  Tosca[counter].play();
  image(Tosca[counter], 0, 0, Tosca[counter].width, Tosca[counter].height);
  if (counter==2) {
   frameCounter++;
    if (frameCounter > 2000) {
      exit();
    }
  }

  if (counter == 6 || counter == 5 || counter == 8 || counter == 7 || counter == 4 || counter == 9) {
    println("movie = " +counter);
    println("time = "+ Tosca[counter].time());
    println("duration = "+Tosca[counter].duration());
    //int frame = getFrame(Tosca[counter]);
    //int totalFrames = getLength(Tosca[counter]);
    if (Tosca[counter].time() >= Tosca[counter].duration()-1) {
      Tosca[counter].stop();
      println("movie ended");
      level = 1;
      counter = 0;
    }
  }
}

void keyPressed() {
  if (Tosca[counter].time() >= Tosca[counter].duration()-10) {
    if (key == CODED) {
      if (keyCode == LEFT) {
        Tosca[counter].stop();

        if (level == 3 && counter == 8) {
          counter = 0;
          level = 1;
        }
        if (level == 2 && counter == 3) {
          counter = 8;
          level++;
        }
        if (level == 2 && counter == 1) {
          counter = 4;
          level = 1;
        }
        if (level == 1 && counter == 0) {
          counter = 1;
          level++;
        }
      }
      if (keyCode == RIGHT) {
        Tosca[counter].stop();
        if (level == 2 && counter == 3) {
          counter = 9;
          level = 1;
        }
        if (level == 1 && counter == 0 ) {
          counter = 3;
          level++;
        }   

        if (level == 2 && counter == 1) {
          counter = 4;
          level = 1;
        }
      }
      if (keyCode == DOWN) {
        Tosca[counter].stop();
        if (level == 2 && counter == 1) {
          counter = 5;
          level = 1;
        }
      }
      if (keyCode == UP) {
        Tosca[counter].stop();
        if (level == 2 && counter == 3 ) {
          counter = 7;
          level++;
        }
        if (level == 2 && counter == 1) {
          counter = 6;
          level++;
        }
        if (level == 1) {
          counter = 2;
          level++;
        }
      }
    }
  }
}
void movieEvent(Movie m) {
  m.read();
}
int getFrame(Movie mov) {    
  return ceil(mov.time() *  mov.frameRate);
}
int getLength(Movie mov) {
  return int(mov.duration() *  mov.frameRate);
}