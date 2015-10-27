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
 */
 
 int[] aNameForMyArray; //create an empty array 
 
 void setup(){
   size(640, 480);
   
   aNameForMyArray = new int[640]; //we initialize the array specifying how many item should be in it (here are 640)
   
   for(int i = 0; i < 640; i++){ //this means increase the value of "i" from 0 to 640
     aNameForMyArray[i] = int(random(0, 480)); //every loop we write a value for each items in the array, one after the other
   } //when the loop is complete (when "i" reaches 639  we exit the loop and go on in the rest of the setup
 }
 
 void draw(){
   background(255);
   for(int i = 0; i < 640; i++){
     line(i, 480, i, aNameForMyArray[i] );
   }
 }