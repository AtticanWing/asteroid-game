class UFOBullets extends GameObject {
  
  //constructor
  UFOBullets(float x, float y) {
    size = 8;
    lives = 1;
    location = new PVector(x, y);
    velocity = new PVector(myShip.location.x-x, myShip.location.y-y);
    velocity.setMag(12);
  }
  
  //visual of bullet
  void show() {
    stroke(purple);
    fill(purple);
    ellipse(location.x, location.y, size, size);
  }

  void act() { //if touches edge of screen, deleted from list
    location.add(velocity);
    if (location.x < -50 || location.x > width+50 || location.y < -50 || location.y > height+50) {
      lives = 0;
    }
  }
}
