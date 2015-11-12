void setup() {
  size(600, 600);
  frameRate(24); //24 frames per second
  background(255,255,255); // RGB, otherwise is gray scale
}

void draw(){
  
  println(mouseX, mouseY); 
  noStroke();
  
  if(mouseX < 300){  
    fill(255,0,0,128);
    ellipse(mouseX, mouseY, 100,100);
  } 
  
  if(mouseX > 300){  
    fill(0,0,255,128);
    rectMode(CENTER);
    rect(mouseX, mouseY, 100,100);
  } 
 
  
  fill(255);
  rectMode(CORNER);
  rect(0,0,200,30);
  fill(255,0,0);
  textSize(20);
  text("Press a,s,d or f", 10,20);
  
}

void keyPressed(){
  println(key);
  if(key == 'a'){
     background(255,0,0); // RGB, otherwise is gray scale
  }else if(key == 's'){
     background(0,255,0); // RGB, otherwise is gray scale
  }else if(key == 'd'){
     background(0,0,255); // RGB, otherwise is gray scale
  }else if(key == 'f'){
     background(255,255,255); // RGB, otherwise is gray scale
  } 
}