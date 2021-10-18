class UFO extends GameObject {
  int spawn, uBullet;
  float angle1, angle2; //didnt use

  //constructor
  UFO() {
    spawn = int(random(0, 4));
    lives = 1;
    velocity = new PVector (0, 1);
    uBullet = 60;
    threshold = 60;
    size = 50;

    //random spawning on 4 sides of screen
    pushMatrix();
    if (spawn == 0) {
      location = new PVector (random(0, width), -25); //top
      velocity.rotate(random(PI/4, -3*PI/4));
      println("top");
    } else if (spawn == 1) {
      location = new PVector (width+25, random(0, height)); //right
      velocity.rotate(random(PI/4, 7*PI/8));
      println("right");
    } else if (spawn == 2) {
      location = new PVector (random(0, width), height+25); //bottom
      velocity.rotate(random(5*PI/4, 7*PI/8));
      println("bot");
    } else {
      location = new PVector (-25, random(0, height)); //left
      velocity.rotate(random(-7*PI/8, -PI/4));
      println("left");
    }
    popMatrix();
    velocity.setMag(5); //faster speed
  }

  //ufo visual
  void show() {
    fill(purple);
    stroke(grey);
    ellipse(location.x, location.y, size, size);
    fill(#685C82);
    ellipse(location.x, location.y, size/2, size/2);
    //line(location.x, location.y, myShip.location.x, myShip.location.y); was used for testing
  }

  //behaviour method
  void act() {
    location.add(velocity); //didnt use super.act because needed to change the edge of screen code
    uBullet++; //timer

    //add new UFOBullet after certain amt of frames
    if (uBullet >= threshold*1.5) {
      myObjects.add(new UFOBullets(location.x, location.y));
      uBullet = 0;
    }
    
    //collision code w ship bullet
    int i = 0;

    while (i < myObjects.size()) {

      GameObject obj = myObjects.get(i);

      if (obj instanceof Bullet) {

        if (dist(location.x, location.y, obj.location.x, obj.location.y) <= size/2 + obj.size/2) { 
          obj.lives = 0;
          lives = 0;
          UFOtimer = 0;
          ufo = false;
          int num = 100;
          int n = 0;
          while (n < num) {
            myObjects.add(new Particles(int(random(0, 10)), location.x, location.y, purple));
            n++;
          }
        }
      }
      i++;
    }
    
    //collision w edge of screen
    if (location.x < -50 || location.x > width+50 || location.y < -50 || location.y > height+50) {
      lives = 0;
      UFOtimer = 0;
      ufo = false;
    }
  }
}
