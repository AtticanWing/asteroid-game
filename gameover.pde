void gameover() {
  textFont(stamp); //custom font
  
  if (score == 42) { //if you beat the game by destroying all asteroids
    background(255);
    image(gameover2, -175,0, width+200,height); //
    fill(lightblue);
    textSize(60);
    text("you win! :d", 400,100);
    textSize(30);
    text("press 'r'", 550,300);
    text("to play again", 550, 400);
    
  } else { //if you lose by losing all your lives
    
    background(0);
    image(gameover1, -150,0, width+300,height);
    fill(purple);
    textSize(50);
    text("you lose :c", 400,100);
    textSize(35);
    text("press 'r'", 400, 600);
    text("to try again", 400,700);
  }
  if (rkey) { //if retry key pressed, game resets
    setup();
    mode = INTRO;
    score = 0;
    ufo = false;
  }
}

void gameoverClicks() {
    //nothing cuz no buttons to press
  
}
