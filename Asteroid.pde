class Asteroid extends GameObject { //how many asteroids is required?

  //instance variables
  int hits;

  //constructor
  Asteroid() {
    lives = 1;
    hits = 6;
    location = new PVector (random(0, width), random(0, height));
    velocity = new PVector (0, 1);
    velocity.rotate(random(0, TWO_PI));
    size = 100;
  }

  //constructor
  Asteroid(int s, float x, float y, int h) {
    lives = 1;
    hits = h;
    location = new PVector (x, y);
    velocity = new PVector (0, 1);
    velocity.rotate(random(0, TWO_PI));
    velocity.setMag(2);
    size = s;
  }

  void show() {
    noFill();
    stroke(255);
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    super.act();

    int i = 0;

    while (i < myObjects.size()) {

      GameObject obj = myObjects.get(i);

      if (obj instanceof Bullet) {

        if (dist(location.x, location.y, obj.location.x, obj.location.y) <= size/2 + obj.size/2) { //collision w bullet
          obj.lives = 0;
          lives = 0;
          score++;
          int num = 100;
          int n = 0;
          while (n < num) {
            myObjects.add(new Particles(int(random(0, 10)), location.x, location.y, lightblue));
            n++;
          
          //bouncing code that I didn't manage to figure out
          //if (location.x != Particles[i].x && location.y != Particles[i].y) {   
          //  if (dist(location.x,location.y, obj.location.x, obj.location.y) < (myObjects.size)/2 + size/2) {
          //    velocity = (location.x - bouncers.x)/2;
          //  }
          //}
       }
          
          //if hasnt been hit more than 2 times, create 2 new asteroids
          if (hits >= 2) {
            myObjects.add(new Asteroid(size/2, location.x, location.y, hits/2));
            myObjects.add(new Asteroid(size/2, location.x, location.y, hits/2));
          }
        }
      }
     
      i++;
    }
  }
}
