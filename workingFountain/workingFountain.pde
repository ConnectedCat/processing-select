int numDots = 10000;
PVector dot[] = new PVector[numDots];
PVector velocity[] = new PVector[numDots];
PVector direction[] = new PVector[numDots];
float speed = 2.5;
int mode = 0;
void setup(){
  size(1440, 900);
  for(int i = 0; i<numDots; i++){
    dot[i] = new PVector(0, 0);
    direction[i] = new PVector(random(-1, 1), random(-1, 1));
    velocity[i] = new PVector(direction[i].x*speed, direction[i].y*speed);
  }
}

void draw(){
  background(0);
  if(mode == 1){
    translate(mouseX, mouseY);
  }
  else{
    translate(width/2, height/2);
  }
  for(int i = 0; i<numDots; i++){
    PVector.mult(direction[i], speed, velocity[i]);
    dot[i].add(velocity[i]);
    if(mode == 1){
      if(dot[i].x > width-mouseX || dot[i].x < -mouseX || dot[i].y > height-mouseY || dot[i].y < -mouseY){
        direction[i].set(random(-1, 1), random(-1, 1));
        dot[i].set(0, 0);
      }
    }
    else {
      if(dot[i].x > width/2 || dot[i].x < -width/2 || dot[i].y > height/2 || dot[i].y < -height/2){
        direction[i].set(random(-1, 1), random(-1, 1));
        dot[i].set(random(0, 100), random(0, 100));
      }
    }
    stroke(0, 0, random(125, 255));
    point(dot[i].x, dot[i].y);
  }
  //fill(255, 255, 0);
  //ellipse(0, 0, 10, 10);
}

void mouseDragged(){
  mode = 1;
}

void mouseReleased(){
  mode = 0;
}