class Pigeon{
  float ballRadius;
  color ballColor;
  float speed = 4;
  PVector position;
  PVector velocity;
  String state = "walking";
  
  Pigeon(float radius, color col, PVector pos){
    ballRadius = radius;
    ballColor = col;
    position = new PVector(pos.x, pos.y, pos.z);
    velocity = new PVector(speed, 0, -speed);
  } 
  
  void display(){
    pushMatrix();
    stroke(ballColor);
    translate(position.x, position.y, position.z);
    sphere(ballRadius);
    popMatrix();
    //println("PositionZ: "+position.z+" VelocityZ: "+velocity.z);
  }
  
  void update(){
    switch(state){
      case "walking":
        walk();
        break;
      case "flying":
        fly();
        break;
      default:
        walk();
        break;
    }
  }
  
  void walk(){
    if(position.x >= width-ballRadius || position.x <= 0+ballRadius){
     velocity.x*=-1;
    }
    if(position.z >= -ballRadius || position.z <= -1000+ballRadius){
      velocity.z*=-1;
    }
    position.add(velocity);
  }
  
  void fly(){
    if(position.x >= width-ballRadius || position.x <= ballRadius){
      velocity.x*=-1;
    }
    if(position.y <= ballRadius){
      velocity.y*=-1;
    }
    if(position.y >= height-ballRadius){
      setState("walking");
    }
    if(position.z >= -ballRadius || position.z <= -1000+ballRadius){
      velocity.z*=-1;
    }
    
    position.add(velocity);
  }
  
  void setState(String newState){
    if(state != newState){
      switch(newState){
        case "flying":
          position.set(position.x, position.y-speed, position.z);
          velocity.set(speed, -speed, -speed);
          break;
        case "walking":
          velocity.set(speed, 0, -speed);
          break;
        default:
          velocity.set(speed, 0, -speed);
          break;
      }
    }
    state = newState;
  }
}