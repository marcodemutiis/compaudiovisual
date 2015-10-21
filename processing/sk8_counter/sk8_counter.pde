int counter;

void setup() {
  size(displayWidth, displayHeight); 
  background(0);
  counter =0;
}

void draw() {

}

void keyPressed() {
  counter++;
  println(counter);
  if (counter >= 50 && counter < 100) {
    background(#FFFFFF); //white
  }
  if (counter >= 100) {
    background(255, 0, 0); //rgb
    counter = 0;
  }
}