float cR = 100; // circle Radius
float miniCR = 50;

PVector blueCorner, redCorner, greenCorner;

void setup(){
  size(500, 500);
  
  blueCorner = new PVector(width/2, height/2+cR*2);
  redCorner = new PVector(width/2 + (cos(radians(30)) * cR*2), height/2 - (sin(radians(30)) * cR*2));
  greenCorner = new PVector(width/2 + (cos(radians(150)) * cR*2), height/2 - (sin(radians(150)) * cR*2));
}

void draw(){
  drawFrames();

  fill(75, 75, 125);
  triangle( greenCorner.x, greenCorner.y, greenCorner.x+miniCR, greenCorner.y, greenCorner.x + cos(radians(60)) * miniCR, greenCorner.y + sin(radians(60)) * miniCR );
}

void drawFrames(){
  noFill();
  stroke(125, 0, 125);
  rectMode(CENTER);
  rect(width/2, height/2, cR*2, cR*2);
  
  stroke(0, 125, 125);
  ellipse(width/2, height/2, cR*2, cR*2);
  
  stroke(125, 125, 0);
  triangle(blueCorner.x, blueCorner.y, redCorner.x, redCorner.y, greenCorner.x, greenCorner.y);
   
  noStroke();
  fill(0, 0, 255);
  ellipse(blueCorner.x, blueCorner.y, 5, 5);
  
  fill(255, 0, 0);
  ellipse(redCorner.x, redCorner.y, 5, 5);
  
  fill(0, 255, 0);
  ellipse(greenCorner.x, greenCorner.y, 5, 5);
  noFill();
}