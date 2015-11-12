float posx;
float posy;
float scaleValue = 1;
color backColor;

void setup() {
  size(800, 500);
  frameRate(24);
  posx = random(0, width);
  posy = random(0, height);
  backColor = color(255);

}

void draw() {
  
  background(255);
  drawRobot(scaleValue, 1, posx, posy); //calling the function with fixed parameters
  
  //posx = posx + 10;
 // posy = posy + 10;

  if(posx > width){
      posx = random(0, width);
      scaleValue = random(0.5,5);
  }
  if(posy > height){
      posy = random(0, height);
      scaleValue = random(0.5,5);
  }
  
  pushStyle();
    fill(0);
    noStroke();
    textSize(20);
    text("Press the arrows to move, q and w to random", 10,20);
  popStyle();
}

void keyPressed() {
  if (key == 'q') {
    posx = random(0, width);
    posy = random(0, height);
  }else if(key == 'w'){
    scaleValue = random(0.5,5);
  }else if(key == CODED){
    //arrow keys tests
    if(keyCode == UP){
      posy = posy - 10;
    }else if(keyCode == DOWN){
      posy = posy + 10;
    }else if(keyCode == LEFT){
      posx = posx - 10;
    }else if(keyCode == RIGHT){
      posx = posx + 10;
    }
  }

}


//function to draw my shape
void drawRobot(float scaleValue, int blink, float posx, float posy) {
  pushMatrix();
  //translate to given parameters
 
  translate(posx, posy);
  scale(scaleValue);
  ellipse(0, 0, 50, 50);
  ellipse(-10, 0, 10, 10);
  ellipse(-10, 0, 3, 3);

  ellipse(10, 0, 10, 10);
  ellipse(10, 0, 3, 3);

  arc(0, 10, 20, 20, radians(30), radians(150)); //randians convert degrees

  popMatrix();
}