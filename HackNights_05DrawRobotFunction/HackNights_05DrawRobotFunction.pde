void drawRobot() {
  rect(0, 0, 100, 50);
  ellipse(33, 10, 10, 10);
  ellipse(66, 10, 10, 10);
  fill(255,0,0);
  rect(33, 30, 33, 10);
  fill(255,255,255);
}

void setup() {
  size(300, 200);
  smooth();

  translate(10, 10);
  drawRobot();
  translate(-10, -10);

  translate(150, 10);
  drawRobot();
  translate(-150, -10);

  pushMatrix();
  translate(20, 80);
  rotate(radians(25));
  drawRobot();
  popMatrix();

  pushMatrix();
  translate(150, 150);
  rotate(radians(-45));
  drawRobot();
  popMatrix();
}

void draw() {
}