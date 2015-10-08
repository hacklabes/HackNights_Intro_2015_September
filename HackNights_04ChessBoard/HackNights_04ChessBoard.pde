size(500, 500);
background(255);
noStroke();
fill(0);

int RECTANGLE_WIDTH = 60;
int RECTANGLE_HEIGHT = 60;
int SPACE_BETWEEN = 60;

int drawnRows = 0;

pushMatrix();
while (drawnRows < 4) {
  pushMatrix();
  int drawnRects = 0;
  while (drawnRects < 4) {
    pushMatrix();
    rotate(radians(random(-5, 5)));
    rect(10, 10, RECTANGLE_WIDTH, RECTANGLE_HEIGHT);
    popMatrix();
    translate(RECTANGLE_WIDTH+SPACE_BETWEEN, 0);
    drawnRects = drawnRects + 1;
  }
  popMatrix();
  translate(0, RECTANGLE_HEIGHT+SPACE_BETWEEN);
  drawnRows = drawnRows + 1;
}
popMatrix();

translate(RECTANGLE_WIDTH, RECTANGLE_HEIGHT);

drawnRows = 0;

while (drawnRows < 4) {
  pushMatrix();
  int drawnRects = 0;
  while (drawnRects < 4) {
    pushMatrix();
    rotate(radians(random(-5, 5)));
    rect(10, 10, RECTANGLE_WIDTH, RECTANGLE_HEIGHT);
    popMatrix();
    translate(RECTANGLE_WIDTH+SPACE_BETWEEN, 0);
    drawnRects = drawnRects + 1;
  }
  popMatrix();
  translate(0, RECTANGLE_HEIGHT+SPACE_BETWEEN);
  drawnRows = drawnRows + 1;
}