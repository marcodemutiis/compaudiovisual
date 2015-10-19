String[] eyes = {"blue", "green", "brown"};
String[] nose = {"big", "medium", "small"};
String[] mouth = {"open", "closed", "bite"};

PImage[] imgEyes = new PImage[3];
PImage[] imgNose = new PImage[3];
PImage[] imgMouth = new PImage[3];

int eye, nos, mou;

boolean stopped;

void setup() {
  //frameRate(12);
  size(900, 900);

  for (int i = 0; i < 3; i++) {
    imgEyes[i] = loadImage(eyes[i] + ".jpg");
    imgNose[i] = loadImage(nose[i] + ".jpg");
    imgMouth[i] = loadImage(mouth[i] + ".jpg");
  }
}

void draw() {
  image(imgEyes[eye], 0, 0);
  image(imgNose[nos], 0, 300);
  image(imgMouth[mou], 0, 600);

  if (!stopped) {
    eye = int(random(0, 3));  
    nos = int(random(0, 3));
    mou = int(random(0, 3));
    delay(100);
  }
}

void mousePressed() {
  stopped = true;
}

void mouseReleased() {
  stopped = false;
}