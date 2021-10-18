void keyPressed() {
  if (keyCode == UP)    upkey = true;
  if (keyCode == DOWN)  downkey = true;
  if (keyCode == LEFT)  leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (keyCode == ' ')   spacekey = true;
  if (key == 'e' || key == 'E') ekey = true;
  if (key == 'r' || key == 'R') rkey = true;
}

void keyReleased() {
  if (keyCode == UP)    upkey = false;
  if (keyCode == DOWN)  downkey = false;
  if (keyCode == LEFT)  leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (keyCode == ' ')   spacekey = false;
  if (key == 'e' || key == 'E')  ekey = false;
  if (key == 'r' || key == 'R')  rkey = false;
}
