size(500, 400); //<>//
background(255);
noStroke();
fill(0, 0, 150);

int RECTANGLE_WIDTH = 115;
int RECTANGLE_HEIGHT = 50;
int SPACE_BETWEEN = 5;

int drawnRows = 0;

while (drawnRows < 7) {
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