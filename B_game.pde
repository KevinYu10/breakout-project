void game() {
  //background(0);
  image(introbackground, 0, 0, width, height);
  
  gametactile();
  fill(255);
  rect(540, 600, 120, 50);
  textSize(40);
  fill(0);
  text("Pause", 540, 635);

  //paddle
  stroke(0);
  strokeWeight(0);
  fill(255);
  circle(ballx, bally, balld);

  if (leftkey == true)  ballx = ballx - 5;
  if (rightkey == true) ballx = ballx + 5;

  if (ballx > width-balld/2) ballx = width-balld/2;
  if (ballx < balld/2) ballx = balld/2;

  //moving ball object
  fill(255);
  circle(mballx, mbally, mballd);

  mballx = mballx + mballvx;
  mbally = mbally + mballvy;

  if (mballx < mballd/2 || mballx > width-mballd/2) {
    mballvx = mballvx * -1;
  }
  if (mbally < mballd/2) {
    mballvy = mballvy * -1;
  }
  
  if (mbally >= height) {
    lives = lives - 1;
    mballx = width/2;
    mbally = height/1.5;
    mballvx = 0;
    mballvy = 2;
  }
  
  if (lives <= 0) {
    mode = GAMEOVER;
  }

  if (dist(ballx, bally, mballx, mbally) <= balld/2 + mballd/2) {
    mballvx = (mballx - ballx)/15;
    mballvy = (mbally - bally)/15;
  }

  

  //bricks
  int i = 0;
  while (i < n) {
    //println(bricky[i]);
    if (alive[i] == true) {
      manageBrick(i);
    }
    i++;
  }

  //score & lives
  textSize(40);
  fill(0);
  text("Score  " + score, 100, 600);
  text("Lives  " + lives, 100, 650);
  if (score >= 36) mode = GAMEOVER;
}

void gameClicks() {

  if (mouseX > 540 && mouseX < 660 && mouseY > 600 && mouseY < 650) {
    mode = PAUSE;
  }
}

void gametactile() {
  if (mouseX > 540 && mouseX < 660 && mouseY > 600 && mouseY < 650) {
    stroke(255, 0, 0);
    strokeWeight(5);
  } else {
    stroke(0);
    strokeWeight(0);
  }
}


void manageBrick(int i) {
  if (bricky[i] == 50)  fill(red);
  if (bricky[i] == 150) fill(yellow);
  if (bricky[i] == 250) fill(blue);
  if (bricky[i] == 350) fill(white);
  
  circle(brickx[i], bricky[i], brickd);
  if (dist(mballx, mbally, brickx[i], bricky[i]) <= mballd/2 + brickd/2) {
    coin.rewind();
    coin.play();
    mballvx = (mballx - brickx[i])/15;
    mballvy = (mbally - bricky[i])/15;
    alive[i] = false;
    score = score + 1;
  }
}
