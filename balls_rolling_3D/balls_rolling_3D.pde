int pNumber = 5;
Pigeon pigeons[] = new Pigeon[pNumber];
PVector positions[] = new PVector[pNumber];
float rad = 50;

void setup(){
  size(620, 480, P3D);
  for(int i = 0; i < pigeons.length; i++ ){
    positions[i] = new PVector(random(rad*2, width-rad*2), height-rad, random(-900, -100));
    pigeons[i] = new Pigeon(rad, color(random(0, 255), random(0, 255), random(0, 255)), positions[i]);
  }
  perspective();
  smooth();
  
}

void draw(){
  background(255);
  noFill();
  stroke(255, 0, 0);
  line(0, 0, 0, 0, 0, -1000);
  line(width, 0, 0, width, 0, -1000);
  line(width, height, 0, width, height, -1000);
  line(0, height, 0, 0, height, -1000);
  stroke(255, 0, 255);
  pushMatrix();
  translate(0, 0, -1000);
  rect(0, 0, width, height);
  popMatrix();
  for(int i = 0; i < pigeons.length; i++ ){
    pigeons[i].update();
    pigeons[i].display();
  }
}

void mouseClicked(){
  pigeons[int(random(0, pigeons.length))].setState("flying");
}