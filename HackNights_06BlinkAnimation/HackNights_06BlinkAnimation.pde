void drawRobot(int blink) {
  fill(0, 0, 0);
  ellipse(64, 40, 130, 100);

  fill(255, 255, 0);
  ellipse(64, 64, 100, 100);

  fill(255);
  ellipse(45, 40, 35, 30);
  fill(0);
  ellipse(45, 40, 18, 20);

  if (blink == 1) {
    fill(255);
    ellipse(80, 40, 35, 50);
    fill(0);
    ellipse(80, 40, 18, 30);
    fill(255, 0, 0);
    ellipse(64, 84, 30, 15);
  } else {
    fill(255);
    ellipse(80, 40, 34, 46);
    fill(0);
    ellipse(80, 40, 18, 20);
    fill(255, 0, 0);
    ellipse(64, 84, 20, 10);
  }
}

void setup() {
  size(800, 300);
  frameRate(15);
}

int robotLocationX = 10;
int zeroOne = 0;

void draw() {
  fill(255, 255, 255, 20);
  rect(0, 0, 800, 300);
  fill(255);

  translate(robotLocationX, 0);
  drawRobot(zeroOne);

  if (zeroOne == 1) {
    zeroOne = 0;
  } else {
    zeroOne = 1;
  }
  robotLocationX = robotLocationX + 1;
}