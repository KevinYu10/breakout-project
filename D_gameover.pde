void gameover() {
  theme.pause();
  
  textSize(70);
  fill(red);
  text("Gameover", 240, 300);
  
  textSize(50);
  fill(red);
  if (lives >= 1 ) {
    text("YOU WON", 290, 400);
  } else {
    text("YOU LOST", 300, 400);
  }
  
}

void gameoverClicks() {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    mode = INTRO;
  }
}
