import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
AudioOutput out;

final int STATE_START = 0;
final int STATE_PLAYING = 1;
final int STATE_UPDATE_LEVEL = 2;
final int STATE_OVER = 3;

final int MAX_SCORE = 10;



int currentState;
int currentScore = 5;

float posx;
float posy;
float incx = 10;
float incy = 10;


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
  padW = 20; //width
  padH = 120; //height

  minim = new Minim(this);
  out = minim.getLineOut(Minim.MONO, width);
  surface.setResizable(true); //comment if you don't want a resizable window

  currentState = STATE_START;
  currentScore = 5;
}

void draw() {

  background(255);

  if (currentState == STATE_START) {
    textSize(45);
    fill(255, 0, 0);
    textAlign(CENTER);
    textSize(10+frameCount%100);
    text("Click to Start..", width/2, height-100);
    if(frameCount%5==0){
      playFreq(100 + frameCount%100);
    }
    if (mousePressed == true) {
      currentState = STATE_PLAYING;
    }
  } else if (currentState == STATE_PLAYING) {
    background(backColor);

    mainGame();
    textSize(50);
    fill(255);
    text(currentScore, width/2, height/2);

    if (currentScore <= 0) {
      currentState = STATE_OVER;
      lastTime = millis();
      
    } else if (currentScore >= MAX_SCORE) {
      currentState = STATE_UPDATE_LEVEL;
      lastTime = millis();
    }
  } else if (currentState == STATE_UPDATE_LEVEL) {
    
    long cTimer = millis() - lastTime;

    background(255);
    textSize(45);
    fill(255, 0, 0);
    text("NEXT LEVEL", width/2, height/2);
    text((2 - int(cTimer/1000)), width/2, height/2 + 100);
    
    if (cTimer> 2000) {
      currentScore = 5;
      currentState = STATE_PLAYING;
      padH -=10;
      lastTime = millis();
    }
    

    
  } else if (currentState == STATE_OVER) {
    long cTimer = millis() - lastTime;

    background(255);
    textSize(45);
    fill(255, 0, 0);
    text("GAME OVER", width/2, height/2);
    text((5 - int(cTimer/1000)), width/2, height/2 + 100);
    
    if(frameCount%60==0){
      playFreq(100 + (500-int(cTimer/1000)*100));
    }
    if (cTimer> 5000) {

      currentState = STATE_START;
      currentScore = 5;
      lastTime = millis();
    }
  }
}

void mainGame(){
  
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
  if (posx < (posXPad + padW)) {
    if (posx > posXPad) { //testing for X

      if (posy > posYPad) {//testing for Y
        if (posy < (posYPad + padH)) {

          incx = -incx; //change both directions
          incy = -incy;//change both directions
          
           playFreq(posYPad);

        }
      }
    }
  }



  //-----


  //hit detection with the boudaries
  //   0 < posx < width
  if (posx > width) {
    incx = -incx;
    playFreq(posy);
    currentScore = currentScore + 1;
  }
  if (posx < 0) {

    currentScore = currentScore - 1;
    posx = random(0, width);
    posy = random(0, height);    
    
    playFreq(posy);
  }
  if (posy > height) {
    incy = -incy;
    playFreq(posx);
  }
  if (posy < 0) {
    incy = -incy;
    playFreq(posx);
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

void playFreq(float freq){
     out.playNote(0, 0.2, new ToneInstrument(max(100, freq), 0.8));
}

class ToneInstrument implements Instrument {
  Oscil sineOsc;
  ADSR  adsr;

  ToneInstrument(float frequency, float amplitude) {
    sineOsc = new Oscil(frequency, amplitude, Waves.TRIANGLE);
    adsr = new ADSR(0.8, 0.01, 0.01, 0.8, 0.1);
    sineOsc.patch(adsr);
  }

  void noteOn(float dur) {
    adsr.patch(out);
    adsr.noteOn();
  }

  void noteOff() {
    adsr.unpatchAfterRelease(out); 
    adsr.noteOff();
  }
}