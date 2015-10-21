void drawRobot(int blink) {
  // draw hair
  fill(0, 0, 0);
  ellipse(64, 30, 125, 100);

  // draw face
  fill(255, 255, 0);
  ellipse(64, 60, 80, 100);

  // draw mouth
  fill(255, 0, 0);
  ellipse(64, 80, 30, 10);

  // draw white for both eyes
  fill(255);
  ellipse(45, 40, 28, 32);  
  ellipse(80, 40, 28, 32);

  if (blink > 5) {
    fill(0);
    ellipse(45, 40, 20, 22);
    ellipse(80, 40, 14, 14);
  } else {
    fill(0);
    ellipse(45, 40, 14, 14);
    ellipse(80, 40, 20, 22);
  }
}

void setup() {
  size(800, 300);
}

int robotLocationX = 10;
int robotVelocityX = 5;  // pixels per frame
int frameCounter = 0;

void draw() {
  background(255);
  translate(robotLocationX, 30);
  drawRobot(frameCounter);

  // updating variables for next frame
  robotLocationX = robotLocationX + robotVelocityX;
  frameCounter = frameCounter + 1;

  // check frameCounter value
  if (frameCounter > 10) {
    frameCounter = 0;
  }

  // detects running away on right-hand side
  if (robotLocationX > width) {
    // reverse direction by negating current velocity
    robotVelocityX = -robotVelocityX;
  }

  // detect running away on left-hand side
  if (robotLocationX < 0) {
    // reverse direction by negating current velocity
    robotVelocityX = -robotVelocityX;
  }
}