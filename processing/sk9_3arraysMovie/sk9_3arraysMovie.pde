import processing.video.*;
Movie[] Tosca;

int counter;
int max;

void setup() {
  size(1920, 1080);
  //fullScreen(0);
  counter = 0;
  max = 10;
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
  if (key == ' ') {
    Tosca[counter].pause();
    counter++;
    if (counter == max) {
      counter = 0;
    }
  }
}
void movieEvent(Movie m) {
  m.read();
}