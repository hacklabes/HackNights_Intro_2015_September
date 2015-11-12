void setup() {
  size(800, 500);
  frameRate(24);
  smooth();
}

void draw() {
  background(255);
  drawRobot(1, 50,50); //calling the function with fixed parameters

 
}
//function to draw my shape
void drawRobot(int blink, float posx, float posy) {
    pushMatrix();
       //translate to given parameters
       translate(posx, posy);
       ellipse(0,0,50,50);
       ellipse(-10,0,10,10);
       ellipse(-10,0,3,3);

       ellipse(10,0,10,10);
       ellipse(10,0,3,3);

       arc(0, 10, 20, 20, radians(30),radians(150)); //randians convert degrees

    popMatrix();
}