class Bullet extends GameObject{

  PVector nudge;
  
  Bullet() {
    lives = 1;
    location = new PVector(myShip.location.x, myShip.location.y); // ship.location.copy();
    nudge = myShip.direction.copy();
    nudge.rotate(PI);
    nudge.setMag(-20);
    location.add(nudge);
    velocity = new PVector(myShip.direction.x, myShip.direction.y); //ship.direction.copy();
    velocity.setMag(12);
    velocity.add(myShip.velocity);
    size = 8;
  }
  
  void show() {
    stroke(lightblue);
    fill(lightblue);
    ellipse(location.x, location.y, size,size);
  }
  
  void act() { //if touches edge of screen, deleted from list
    location.add(velocity);
    if (location.x < -50 || location.x > width+50 || location.y < -50 || location.y > height+50) {
      lives = 0;
    }
    
  }
}
