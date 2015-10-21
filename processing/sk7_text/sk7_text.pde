PFont Luna; // a new font
String noMorePets = "hello";
float randColor;
float randColor2;
float randColor3;

void setup() {
  size(1000, 400); 
  Luna = createFont("ComicSansMS", 48);
  textFont(Luna);
}


void draw() {

  background(randColor, randColor2, randColor3);
  text(noMorePets, mouseX, mouseY);
}
void mouseMoved() {
  randColor = random(255);
  randColor2 = random(255);
  randColor3 = random(255);
}

void mousePressed() {
  noMorePets = "sometimes when I am alone in my room I use Comic Sans";
}
void mouseReleased() {
  noMorePets = "hello";
}