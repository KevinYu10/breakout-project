void keyPressed() {
  if (keyCode == LEFT)   leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (key == 'g' || key == 'G') mode = GAMEOVER;
  if (key == 'q' || key == 'Q') {
    mballx = mouseX;
    mbally = mouseY;
  }
}

void keyReleased() {
  if (keyCode == LEFT)   leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  //if (key == 'q' || key == 'Q') {
  //  mballx = mballx + mballvx;
  //  mbally = mbally + mballvy;
  //}
}

void mouseReleased() {
  if (mode == INTRO) {
    introClicks();
  } else if (mode == GAME) {
    gameClicks();
  } else if (mode == PAUSE) {
    pauseClicks();
  } else if (mode == GAMEOVER) {
    gameoverClicks();
  }
}
