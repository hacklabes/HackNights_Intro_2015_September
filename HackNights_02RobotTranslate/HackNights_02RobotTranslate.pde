size(300,200);
smooth();

translate(10,10);
rect(0,0, 100, 50);
ellipse(33,10, 10, 10);
ellipse(66,10, 10, 10);
rect(33,30,33,10);
translate(-10,-10);

translate(150,10);
rect(0,0, 100, 50);
ellipse(33,10, 10, 10);
ellipse(66,10, 10, 10);
rect(33,30,33,10);
translate(-150,-10);

pushMatrix();
translate(20, 80);
rotate(radians(25));
rect(0,0, 100, 50);
ellipse(33,10, 10, 10);
ellipse(66,10, 10, 10);
rect(33,30,33,10);
popMatrix();

pushMatrix();
translate(150, 150);
rotate(radians(-45));
rect(0,0, 100, 50);
ellipse(33,10, 10, 10);
ellipse(66,10, 10, 10);
rect(33,30,33,10);
popMatrix();