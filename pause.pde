void pause() {
  background(150);
  rectMode(CORNER);
  
//gif display------------------------------------------------------------------------------------------
  PImage frame2 = pause.get(nFrames2);
  image(frame2, 0, 0, width, height);
  nFrames2++;
  if (nFrames2==48) nFrames2 = 0;

pushMatrix();
  translate(titlex,225);

  if (titlex <= 220) {
    mvt *= -1;
  }
  if (titlex >= width-220) {
    mvt *= -1;
  }
  titlex = titlex+mvt;
  
//tactile resume button---------------------------------------------------------------------------------
  if (mouseX>300 && mouseY<600 && mouseX<500 && mouseY>500) {
    fill(lightblue);
  } else {
    fill(255);
  }
  textSize(150);
  text("PAUSE", 0,0);
  popMatrix();
  
  if (mouseX>300 && mouseY<600 && mouseX<500 && mouseY>500) {
    fill(255);
  } else {
    fill(lightblue);
  }
  rect(300, 500, 200, 100);
  if (mouseX>300 && mouseY<600 && mouseX<500 && mouseY>500) {
    fill(bluegrey);
  } else {
    fill(0);
  }
  textSize(50);
  text("RESUME", 400, 550);
}


void pauseClicks() {
  
  if (mouseX>300 && mouseY<600 && mouseX<500 && mouseY>500) { //if resume button pressed, mode switches back to game and framerate goes back to default
    mode = GAME;
  }
}
