/**
 * Array. 
 * 
 * An array is a list of data. 
 *
 * Each piece of data in an array 
 * is identified by an index number representing its position in 
 * the array. 
 *
 * Arrays are zero based, which means that the first 
 * element in the array is [0], the second element is [1], and so on. 
 * 
 * We can have arrays of int, char, float... and arrays of objects
 * to go through all the items in the list we often use a for loop.
 * This loops through the array until it reaches the end of it and then exits the loop.
 *
 * Here we create an array of images, and we assign them to a key command for display.
 */


String[] names = {"SYR-9-Simon-Werner-A-Disparu-cover", "taborRobak_1rocklarge", "tommypenton-Illustrations-c-12-BTM"}; //I can also insert the values manually separated by commas within curly brackets
PImage[] img;
int counter;

void setup() {

  size(1200, 800);

  img  = new PImage[3];
  for (int i = 0; i < 3; i++) {
    img[i] = loadImage(names[i] + ".jpg");
  }
}

void draw() {
  background(255);
  image(img[counter], 0, 0, img[counter].width, img[counter].height);
}

void keyPressed() {
  if (key == ' ') {
    counter ++;
    if (counter >= 3) {
      counter = 0;
    }
  }
}