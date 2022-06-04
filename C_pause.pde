void pause() {
  image(pausebackground, 0, 0, width, height);
  textSize(40);
  fill(255);
  text("Click To Resume", 230, 535);
}

void pauseClicks() {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) mode = GAME;
}
