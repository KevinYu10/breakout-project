import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//bricks-breaker project
//Kevin Yu
//May 6, 2022

//variables

//custom font
PFont font1, font2;

//music
Minim minim;
AudioPlayer theme, coin;

//gif variables
PImage[] gif;
int NumberOfFrames, F;

//mode
int mode;
final int INTRO    = 1;
final int GAME     = 2;
final int PAUSE    = 3;
final int GAMEOVER = 4;

//colour
color red      = #FF1414;
color blue     = #00FFFF;
color yellow   = #FFFF00;
color white    = #FFFFFF;

//image background
PImage introbackground, pausebackground;

//ball variables
int ballx, bally, balld;
boolean leftkey, rightkey;

//moving ball variables
float mballx, mbally, mballd, mballvx, mballvy;

//brick variables
int[] brickx;
int[] bricky;
int brickd;
int n;
boolean[] alive;

int patternx, patterny;

//score
int score, lives;


//setup
void setup() {
  size(800, 800);

  mode = INTRO;

  //font
  font1 = loadFont("CourierNewPS-BoldItalicMT-35.vlw");
  
  textFont(font1);

  //gif
  NumberOfFrames = 22;
  gif = new PImage[NumberOfFrames];

  int f = 0;
  while (f < NumberOfFrames) {
    gif[f] = loadImage("frame_"+f+"_delay-0.03s.gif");
    f++;
  }

  //images
  introbackground = loadImage("intro-background.jpeg");
  pausebackground = loadImage("pause-background.png");

  //ball object
  ballx = 400;
  bally = height;
  balld = 100;

  leftkey  = false;
  rightkey = false;

  //moving ball
  mballx = width/2;
  mbally = height/1.5;
  mballd = 20;

  mballvx = 0;
  mballvy = 2;

  //bricks
  n = 36; //number of wanted bricks
  brickx = new int[n];
  bricky = new int[n];
  alive = new boolean[n];
  brickd = 60;

  //brick identify
  patternx = 80;
  patterny = 50;


  int i = 0;
  while (i < n) {
    alive[i] = true;
    brickx[i] = patternx;
    bricky[i] = patterny;
    patternx = patternx + 80;
    if (patternx == width) {
      patternx = 80;
      patterny = patterny + 100;
    }
    i++;
  }

  //score
  score = 0;
  lives = 3;
  
  //music
  minim = new Minim(this);
  coin = minim.loadFile("score.wav");
  theme = minim.loadFile("theme.mp3");
}


void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode Error" + mode);
  }
}
