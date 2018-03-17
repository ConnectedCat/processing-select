float px, py, zeroPX, zeroPY, ax, ay;
float angle = -80;
float radius = 100;
float frequency = 2;

PVector centerPoint;
void setup(){
  size(400, 400);
  background (127);
  
  centerPoint = new PVector(width/2, height/2);
  
  zeroPX = centerPoint.x + cos(0)*(radius); //cosine of 0 is 1, therefore <centerPoint.x + radius>
  zeroPY = centerPoint.y + sin(0)*(radius); //sine of 0 is 0, therefore <centerPoint.x + 0>
}

void draw(){
  background(127);
  
  // draw the main white circle
  noStroke();
  fill(255);
  ellipse(centerPoint.x, centerPoint.y, radius*2, radius*2);
  
  // Move the black rectangle around circle
  px = centerPoint.x + cos(radians(angle))*(radius);
  py = centerPoint.y + sin(radians(angle))*(radius);
  
  
  // draw the center point (green dot)
  fill(0, 255, 0);
  noStroke();
  ellipseMode(CENTER);
  ellipse(centerPoint.x, centerPoint.y, 5, 5);
  
  // draw the black rectangle
  fill(0);
  rectMode(CENTER);
  rect (px, py, 5, 5);
  stroke(100);
  
  // radius/hypothenuse:
  line(centerPoint.x, centerPoint.y, px, py);
  stroke(200);
  
  // radius/hypothenuse at 0 angle:
  stroke(255, 0, 0);
  line(centerPoint.x, centerPoint.y, zeroPX, zeroPY);
  
  
  
  // move the magenta point along the 0 degree radius:
  ax = centerPoint.x + cos(radians(angle))*(radius);
  ay = py - sin(radians(angle))*(radius); //or py + length of opposite
  
  // draw the magenta dot
  fill(255, 0, 255);
  ellipse(ax, ay, 5, 5);
  
  // opposite:
  stroke(0, 255, 255);
  line(px, py, ax, ay);
  noStroke();
  
  fill(0);
  // Output calculations to screen
  text("Radius = " + (px - centerPoint.x)/cos(radians(angle)), 10, height - 40); // Radius with X and cosine
  text("Radius = " + (py - centerPoint.y)/sin(radians(angle)), 10, height - 20); // Radius with Y and  sine
  // they should be the same
  
  text("Black Dot x = " + px, 100,  height - 40);
  text("Black Dot y = " + py, 100,  height - 20);
  
  text("Opposite length: " + (ay-py), 245, height-40);
  text("Adjacent length: " + (px-centerPoint.x), 245, height-20);
}