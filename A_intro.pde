void intro() {
  
  //music
  theme.play();
  
  imageMode(CORNER);
  image(gif[F], 0, 0, width, height);
  F++;
  if (F == NumberOfFrames) F = 0; 
 
 //font
  //textFont(font1);

  //title
  textSize(80);
  fill(255, 255, 0);
  text("Brick Breaker", 115, 300);
  textSize(50);
  text("Click To Start", 200, 500);
  
  int i = 0;
  while(mode == INTRO && i < n) {
    alive[i] = true;
    i++;
  }
  
}

void introClicks() {
  if (mouseX > 0 && mouseX < width && mouseY > 0 && mouseY < height) {
    mode = GAME;
    score = 0;
    lives = 3;
    ballx = width/2;
    
    mballx = width/2;
    mbally = height/1.5;
    mballvx = 0;
    mballvy = 2;
        
  }
}
