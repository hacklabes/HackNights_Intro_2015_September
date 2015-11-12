float posx;
float posy;
float incx = 5;
float incy = 5;


//cointains the pad position and width and height
float posXPad, posYPad;
float padW, padH;


float scaleValue = 1;
color backColor;
int blink = 2;

long lastTime = 0;

void setup() {
  size(800, 500);
  frameRate(60);
  posx = random(0, width);
  posy = random(0, height);
  backColor = color(255);

  posXPad = 100;
  posYPad = height/2;
  padW = 50; //width
  padH = 90; //height
}

void draw() {

  background(backColor);


  drawRobot(scaleValue, blink, posx, posy); //calling the function with fixed parameters
  drawPad(posXPad, posYPad);


  if (millis() - lastTime > 200 ) {
    blink = (int)random(0, 3);
    lastTime = millis();
  }

  float r = map(posx, 0, width, 0, 255);
  float b = map(posy, 0, width, 0, 255);

  backColor = color(r, b, 255);

  posx = posx + incx;
  posy = posy + incy;

  posYPad = mouseY;


  //--- try to make the dection here
  //  


  //-----


  //hit detection with the boudaries
  //   0 < posx < width
  if (posx > width) {
    incx = -incx;
  }
  if (posx < 0) {
    incx = -incx;
  }
  if (posy > height) {
    incy = -incy;
  }
  if (posy < 0) {
    incy = -incy;
  }
}

void drawPad(float padX, float padY) {

  pushMatrix();
  translate(padX, padY);
  pushStyle();
  //rectMode(CENTER);
  fill(255, 0, 0);
  noStroke();
  rect(0, 0, padW, padH);
  popStyle();
  popMatrix();
}

void keyPressed() {
  if (key == 'q') {
  } else if (key == 'w') {
    scaleValue = random(0.5, 5);
  } else if (key == CODED) {
    //arrow keys tests
    if (keyCode == UP) {
    } else if (keyCode == DOWN) {
    } else if (keyCode == LEFT) {
    } else if (keyCode == RIGHT) {
    }
  }
}


//function to draw my shape
void drawRobot(float scaleValue, int blink, float posx, float posy) {
  pushMatrix();
  //translate to given parameters

  translate(posx, posy);
  scale(scaleValue);
  if (blink == 0) {

    ellipse(0, 0, 50, 50);
    ellipse(-10, 0, 10, 10);
    ellipse(-10, 0, 3, 3);
    ellipse(10, 0, 10, 10);
    ellipse(10, 0, 3, 3);
  } else if (blink == 1) {

    ellipse(0, 0, 50, 50);

    ellipse(-10, 0, 10, 1);
    ellipse(-10, 0, 3, 3);

    ellipse(10, 0, 10, 1);
    ellipse(10, 0, 3, 3);
  } else if (blink == 2) {

    ellipse(0, 0, 50, 50);

    ellipse(-10, 0, 10, 15);
    ellipse(-10, 0, 3, 1);

    ellipse(10, 0, 10, 15);
    ellipse(10, 0, 3, 1);
  }

  arc(0, 10, 20, 20, radians(30), radians(150)); //randians convert degrees

  popMatrix();
}