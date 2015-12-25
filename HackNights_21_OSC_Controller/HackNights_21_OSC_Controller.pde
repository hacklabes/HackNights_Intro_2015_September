import oscP5.*;
import netP5.*;

String OSC_OUT_ADDR = "127.0.0.1";
int OSC_OUT_PORT = 12000;

NetAddress myRemoteLocation;
void setup() {
  size(400, 400);
  noStroke();
  fill(255);
  myRemoteLocation = new NetAddress(OSC_OUT_ADDR, OSC_OUT_PORT);
}

void draw() {
  background(0);
  ellipse(mouseX, mouseY, 32, 32);

  OscMessage myOscMessage = new OscMessage("/leftVolume");
  float v = map(mouseY, 0, height, 0, 128);
  myOscMessage.add(v);
  OscP5.flush(myOscMessage, myRemoteLocation);
}