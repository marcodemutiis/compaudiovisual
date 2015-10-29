import processing.video.*;
Movie[] Tosca;

int counter;
int max;

int level = 1;

void setup() {
  size(1920, 1080);
  //fullScreen(0);
  counter = 0;
  max = 4;
  Tosca = new Movie[max];

  for (int i=0; i<max; i++) {
    Tosca[i] = new Movie(this, i+".mov");
  }
}

void draw() {
  Tosca[counter].play();
  image(Tosca[counter], 0, 0, Tosca[counter].width, Tosca[counter].height);
}

void keyPressed() {

  if (key == CODED) {
    if (keyCode == LEFT) {
      Tosca[counter].pause();
      if (level == 1) {
        counter = 1;
        level++;
      }
      if(level == 2){
        counter = 0;
        level++;
      }
    }
    if (keyCode == RIGHT) {
      Tosca[counter].pause();
      if (level == 1) {
      counter = 2;
      level++;
      }
    }
    if (keyCode == UP) {
      Tosca[counter].pause();
      if (level == 1) {
      counter = 3;
      level++;
      }
    }
  }
}
void movieEvent(Movie m) {
  m.read();
}