class Particles extends GameObject {
  
  int t; //transparency
  color colour;
  
  Particles(int s, float x, float y, color c) {
    
    lives = 1;
    size = s;
    colour = c;
    t = int(random(180,255));
    location = new PVector (x, y);
    velocity = new PVector (0,1);
    velocity.rotate(random(-PI, PI)); //180 degrees
    velocity.setMag(random(-2,2));
  }
  
  void show() {
    rectMode(CENTER);
    stroke(colour, t);
    noFill();
    square(location.x, location.y, size);
    
  }
  
  void act() {
    super.act();
      
    t -= 10;
    if (t <= 0) lives = 0;
  }
  
}
