void game() {

  background(0);
  strokeWeight(2);
  rectMode(CENTER);

  //gif setup---------------------------------------------------------------------------------------
  PImage frame = bg.get(nFrames);
  image(frame, 0, 0, width, height);
  nFrames++;
  if (nFrames==67) nFrames = 0;

  //text setup---------------------------------------------------------------------------------------
  textFont(neon); //custom font running
  fill(lightblue);
  textSize(40);
  text("SCORE: " + score, 125, 50);
  text("LIVES: " + myShip.lives, 675, 50);

  //pause button---------------------------------------------------------------------------------------
  noStroke();
  circle(xp, yp, 45);
  fill(bluegrey);
  rect(740, 125, 10, 20);
  rect(760, 125, 10, 20);

  //ship is shown and acts---------------------------------------------------------------------------------------
  myShip.show();
  myShip.act();

  //timer visual---------------------------------------------------------------------------------------
  stroke(bluegrey);
  fill(bluegrey);
  circle(70, 125, 45);
  stroke(paleblue);
  fill(paleblue);
  if (tpTimer > 180) {
    stroke(lightblue);
    fill(lightblue);
    tpTimer = 180;
  } 
  circle(70, 125, tpTimer/4);

  //ufo timer---------------------------------------------------------------------------------------
  UFOtimer++;

  //getting GameObjects---------------------------------------------------------------------------------------
  int i = 0;
  while (i < myObjects.size()) {
    GameObject obj = myObjects.get(i);
    obj.show();
    obj.act();

    if (ufo == false && UFOtimer >= 1000) {
      myObjects.add(new UFO());
      ufo = true;
    }

    //removing GameObjects---------------------------------------------------------------------------------------
    if (obj.lives == 0) {
      myObjects.remove(i);
    } else {
      i++;
    }

    //switches to gameover-----------------------------------------------------------------------------------
    if (score == 42) {
      mode = GAMEOVER;
    }

    if (myShip.lives == 0) {
      mode = GAMEOVER;
    }
  }
}

void gameClicks() {
  //if pause button is pressed, mode switches to pause---------------------------------------------------
  if (dist(xp, yp, mouseX, mouseY) <= 22.5) {
    mode = PAUSE;
  }
}
