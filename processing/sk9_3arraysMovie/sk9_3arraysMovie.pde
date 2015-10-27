import processing.video.*;
Movie[] Tosca;

int counter;
int max;

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
  Tosca[counter].pause();
  if (key == CODED) {
    if (keyCode == LEFT) {
      counter = 1,
    }
      if (keyCode == RIGHT) {
      counter = 2;
    }
    if (keyCode == UP) {
      counter = 3;
    }
    
  }
}
void movieEvent(Movie m) {
  m.read();
}