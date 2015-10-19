/*
Midi Head Spinning Sketch
 created by Marco De Mutiis, 2015. Based on MidiBus Library example and the Image Sprite example by Daniel Shiffman
 you will need a monotasker o, or a MIDI keyboard mapped to Parameter no.3
 more info: monotaskers.com
 */

import themidibus.*; //Import the library
import javax.sound.midi.MidiMessage; //Import the MidiMessage classes http://java.sun.com/j2se/1.5.0/docs/api/javax/sound/midi/MidiMessage.html
import javax.sound.midi.SysexMessage;
import javax.sound.midi.ShortMessage;


MidiBus myBus; // The MidiBus
PImage img;  //the head image
float newX;  //an integer variable to store x position information
float rot;   //an integer variable to store rotaion information

void setup() {
  size(800, 600);  //canvas size

  img = loadImage("head.jpg");  //load image
  newX = -img.width;  //image starts left of the screen
  rot = 0.0;          //rotation is zero at startup

  MidiBus.list(); // List all available Midi devices on STDOUT. This will show each device's index and name.
  myBus = new MidiBus(this, 0, 0); // Create a new MidiBus object
}

void draw() {
  background(255);

  // Translate and rotate
  translate(newX, height/2);
  rotate(rot);

  // Images can be animated just like regular shapes using variables, translate(), rotate(), and so on.
  imageMode(CENTER);
  image(img, 0, 0);
  rot = newX*0.01;
  
}


void midiMessage(MidiMessage message) { // You can also use midiMessage(MidiMessage message, long timestamp, String bus_name)
  // Receive a MidiMessage
  // MidiMessage is an abstract class, the actual passed object will be either javax.sound.midi.MetaMessage, javax.sound.midi.ShortMessage, javax.sound.midi.SysexMessage.
  // Check it out here http://java.sun.com/j2se/1.5.0/docs/api/javax/sound/midi/package-summary.html
 /* println(); println("MidiMessage Data:"); println("--------"); println("Status Byte/MIDI Command:"+message.getStatus());*/ //uncomment this to print values to console
  for (int i = 1; i < message.getMessage().length; i++) {
    //println("Param "+(i+1)+": "+(int)(message.getMessage()[i] & 0xFF));
    newX = map(message.getMessage()[2], 0, 127, -img.width, width+img.width);
  }
}