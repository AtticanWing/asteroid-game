class Ship extends GameObject {

  //1. Instance Variables
  PVector direction;


  //2. Constructor(s)
  Ship() {
    lives = 3;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    shotTimer = 0;
    tpTimer = 0;
    immune = 0;
    t = 0;
    threshold = 60;
  }

  //3. Behaviour Functions
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    noFill();

    stroke(green, t);
    ellipse(0, 0, 50, 50);

    if (immune >= threshold*3) {
      stroke(lightblue);
    } else {
      stroke(paleblue);
    }
    triangle(-15, -10, -15, 10, 15, 0);
    popMatrix();
  }
  
  
  void act() {
    super.act();

    if (velocity.mag() > 5) velocity.setMag(5); //max out speed

    shotTimer++; //bullet timer
    tpTimer++; //tp timer
    immune++; //immune timer

    //immune display
    if (immune >= threshold*3) { 
      c = 0;
      t = 0;
    } else {
      if (t <= 0) {
        c = 15;
      } else if (t >= 255) {
        c *= -1;
      }
      t += c;
      stroke(green, t);
      textSize(20);
      rectMode(CENTER);
      rect(650, 125, 100, 50);
      text("IMMUNE", 650, 125);
    }
    
    //mvt code
    if (upkey) {
      velocity.add(direction);
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
    }
    if (downkey) velocity.sub(direction);
    if (leftkey) direction.rotate(radians(-5));
    if (rightkey) direction.rotate(radians(5));
    if (spacekey && shotTimer > threshold/3) {
      myObjects.add(new Bullet());
      shotTimer = 0;
    }
    if (upkey == false) velocity.setMag(velocity.mag()*0.95);

    int i = 0;
    while (i < myObjects.size()) {

      GameObject obj = myObjects.get(i);

      if (obj instanceof Asteroid || obj instanceof UFO || obj instanceof UFOBullets) {

        if (immune >= threshold*3 && dist(location.x, location.y, obj.location.x, obj.location.y) <= 15 + obj.size/2) { //need to make size fix
          lives--;
          immune = 0;
        }

        if (ekey && tpTimer >= threshold*3) {
          location.x = int(random(0, width));
          location.y = int(random(0, height));
          tpTimer = 0;
          while (dist(location.x, location.y, obj.location.x, obj.location.y) <= 30 + obj.size/2) { //need to make size fix
            location.x = int(random(0, width));
            location.y = int(random(0, height));
          }
        }
      }
      i++;
    }
  }
}
