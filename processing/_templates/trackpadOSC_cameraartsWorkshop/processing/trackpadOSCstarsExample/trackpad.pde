class Trackpad {
  
}

// parse an OSC message from trackpadOSC
// returns true if a message was handled
void parseOSC(OscMessage m) {    
  // touches total

  if (m.checkAddrPattern("/touches/total")) {
    totalTouches = m.get(0).intValue();
  } 

  for (int i = 0; i < maxTouches; i++) {

    if (m.checkAddrPattern("/touches/ID")) {
      ID[i]= m.get(0).intValue();
    } 
   else if (m.checkAddrPattern("/touches/coordinates")) {
      //ID= m.get(0).intValue();
      coordinatesX[ID[i]] =m.get(0).floatValue() -100;
      coordinatesY[ID[i]] = m.get(1).floatValue() -100;
    } 
    else if (m.checkAddrPattern("/touches/majoraxis")) {
    //ID.get(0).intValue();
    majoraxis[ID[i]] = m.get(0).floatValue();
  } else if (m.checkAddrPattern("/touches/minoraxis")) {
    //ID.get(0).intValue();
    minoraxis[ID[i]] =m.get(0).floatValue();
  } else if (m.checkAddrPattern("/touches/pressure")) {
    //ID.get(0).intValue();
    pressure[ID[i]] =m.get(0).floatValue();
  } else if (m.checkAddrPattern("/touches/angle")) {
    //ID.get(0).intValue();
      angle[ID[i]] =m.get(0).floatValue();
  }
  else if (m.checkAddrPattern("/touches/down")) {
    //ID.get(0).intValue();
      down[ID[i]] = m.get(0).intValue();
  }
 /* String output = "totalTouches: " + totalTouches + "\n"
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