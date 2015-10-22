class Trackpad {
  
}

// parse an OSC message from trackpadOSC
// returns true if a message was handled
void parseOSC(OscMessage m) {    
  // touches total

  if (m.checkAddrPattern("/touches/total")) {
    totalTouches = m.get(0).intValue();
  } 

  for (int i = 0; i < totalTouches; i++) {

    if (m.checkAddrPattern("/touches/ID")) {
    } else if (m.checkAddrPattern("/touches/coordinates")) {
      //ID= m.get(0).intValue();
      coordinatesX[i] =m.get(0).floatValue();
      coordinatesY[i] = m.get(1).floatValue();
    } 
    else if (m.checkAddrPattern("/touches/majoraxis")) {
    //ID.get(0).intValue();
    majoraxis[i] = m.get(0).floatValue();
  } else if (m.checkAddrPattern("/touches/minoraxis")) {
    //ID.get(0).intValue();
    minoraxis[id] =m.get(0).floatValue();
  } else if (m.checkAddrPattern("/touches/pressure")) {
    //ID.get(0).intValue();
    pressure[i] =m.get(0).floatValue();
  } else if (m.checkAddrPattern("/touches/angle")) {
    //ID.get(0).intValue();
      angle[id] =m.get(0).floatValue();
  }
  /*String output = "totalTouches: " + totalTouches + "\n"
    + " id: " + ID[i] + "\n"
    + " coordinatesX: " + coordinatesX[i] + "\n"
    + " coordinatesY: " + coordinatesY[i] + "\n"
    + " majoraxis: " + majoraxis[i] + "\n"
    + " minoraxis: " + minoraxis[i] + "\n"
    + " pressure: " + pressure[i] + "\n"
    + " angle: " + angle[i] + "\n";

  println(output);*/
}
}
