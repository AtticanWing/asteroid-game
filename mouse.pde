void mouseReleased() { //if mouse is released, which functions are run for each mode

  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == GAMEOVER) {
    gameoverClicks();
  } else  if (mode == PAUSE) {
    pauseClicks();
  }
}
