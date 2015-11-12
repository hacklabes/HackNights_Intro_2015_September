void setup() {
  size(600, 600);
  frameRate(24); //24 frames per second
  background(255,255,255); // RGB, otherwise is gray scale
}

void draw(){
  
  println(mouseX, mouseY); 
  noStroke();
  
  if(mouseX < 200){  // smaller than 200
    
    fill(255,0,0,128);
    ellipse(mouseX, mouseY, 100,100);
    
  }else if((mouseX > 200) && (mouseX < 400)){ // using the && operator to check interval
                                              // asking two questions at the same time
    fill(0,0,255,128);
    rectMode(CENTER); //draw the Rect from the CENTER
    rect(mouseX, mouseY, 100,100);
    
  } else if(mouseX > 400){ // asking if is bigger than 400
    fill(0,255,0,128);
    ellipse(mouseX, mouseY, 100,100);
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
     background(128,0,0); // RGB, otherwise is gray scale
  }else if(key == 's'){
     background(0,128,0); // RGB, otherwise is gray scale
  }else if(key == 'd'){
     background(0,0,128); // RGB, otherwise is gray scale
  }else if(key == 'f'){
     background(255,255,255); // RGB, otherwise is gray scale
  } 
}