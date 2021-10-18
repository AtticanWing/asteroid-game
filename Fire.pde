class Fire extends GameObject {
  
  int t; //transparency
  PVector nudge;
  
  
  Fire() {
    lives = 1;
    size = 10;
    t = int(random(200,255));
    location = myShip.location.copy();
    nudge = myShip.direction.copy();
    nudge.rotate(PI);
    nudge.setMag(25);
    location.add(nudge);
    velocity = myShip.direction.copy();
    velocity.rotate(PI+random(-0.8,0.8)); //180 degrees
    velocity.setMag(3);
  }
  
  void show() {
    rectMode(CENTER);
    noStroke();
    fill(crayonblue, t);
    square(location.x, location.y, size);
    
  }
  
  void act() {
    super.act();
    t -= 30;
    if (t <= 0) lives = 0;
  }
}
