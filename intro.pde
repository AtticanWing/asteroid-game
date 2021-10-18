void intro() {

  background(0);

//gif display----------------------------------------------------------------------------------
  frameRate(30);
  PImage frame1 = intro.get(nFrames1);
  image(frame1, 0, 0, width, height);
  nFrames1++;
  if (nFrames1==8) nFrames1 = 0; 

//game title moving--------------------------------------------------------------------------
  pushMatrix();
  translate(titlex,225);

  if (titlex <= 220) {
    mvt *= -1;
  }
  if (titlex >= width-220) {
    mvt *= -1;
  }
  titlex = titlex+mvt;
  
  //title is tactile when hover over start button
  if (mouseX>270 && mouseY<590 && mouseX<520 && mouseY>500) {
    stroke(255);
  } else {
    stroke(0);
  }
  strokeWeight(5);
  line(-240,40, 240,40);
  
  if (mouseX>270 && mouseY<590 && mouseX<520 && mouseY>500) {
    fill(lightblue);
  } else {
    fill(255);
  }
  textFont(pixel);
  text("ASTEROIDS", 0, 0);
  
  popMatrix(); //push + pop so other shapes don't translate as well
  
//tactile start button--------------------------------------------------------------------------
  if (mouseX>270 && mouseY<590 && mouseX<520 && mouseY>500) {
    stroke(0);
    fill(lightblue);
  } else {
    stroke(255);
    fill(0);
  }
  rect(395, 545, 260, 90);
  
  if (mouseX>270 && mouseY<590 && mouseX<520 && mouseY>500) {
    fill(0);
  } else {
    fill(255);
  }
  text("START", 400, 545); 
  
}


void introClicks() {
  
  if (mouseX>270 && mouseY<590 && mouseX<520 && mouseY>500) { //if start button pressed, mode switches to game
    mode = GAME;
  } 
}
