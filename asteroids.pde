//Vanessa Lu
//Oct. 4, 2021
//Asteroid Game

//mode framework----------------------------------------------------------------------------------------------
final int INTRO = 0;
final int GAME  = 1;
final int GAMEOVER = 2;
final int PAUSE = 3;
int mode = INTRO;

//game variables
boolean upkey, downkey, leftkey, rightkey, spacekey, ekey, rkey, ufo;
Ship myShip;
ArrayList<GameObject> myObjects;
int score;
int titlex;
int mvt = 3;
int UFOtimer;
int shotTimer, tpTimer, immune, threshold, t, c;

//gif variables-------------------------------------------------------------------------------------------------
ArrayList<PImage> bg;
int nFrames = 0;
int frames;

ArrayList<PImage> intro;
int nFrames1 = 0;
int frames1;

ArrayList<PImage> pause;
int nFrames2 = 0;
int frames2;

PImage gameover1;
PImage gameover2;

//color variables-----------------------------------------------------------------------------------------------
color grey = #343A3B;
color bluegrey = #5D6F72;
color paleblue = #8AAAAF;
color crayonblue = #80CCD8;
color lightblue = #CEF5FB;
color purple = #918FB3;
color green = #5DFF8C;

//font variable-----------------------------------------------------------------------------------------------
PFont pixel;
PFont stamp;
PFont neon;

//pause variables---------------------------------------------------------------------------------------------
float xp = 750;
float yp = 125;

void setup() {
  //fullScreen(FX2D);
  //imageMode(CENTER);
  size(800, 800);
  rectMode(CENTER);
  
  //summoning ship and asteroids
  myShip = new Ship();
  myObjects = new ArrayList<GameObject>();
  myObjects.add(myShip);
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  
  //setting up various variables
  UFOtimer = 0;
  ufo = false;
  score = 0;
  titlex = 400;
  
//gif setup---------------------------------------------------------------------------------------------------
  bg = new ArrayList<PImage>();
  intro = new ArrayList<PImage>();
  pause = new ArrayList<PImage>();
  
  gameover1 = loadImage("gameover1.png");
  gameover2 = loadImage("gameover2.png");

  //text + font setup-------------------------------------------------------------------------------------------
  pixel = createFont("dogica.ttf", 50); //custom font
  stamp = createFont("stamp.TTF", 200);
  neon = createFont("NeonSans.ttf", 200);
  textAlign(CENTER, CENTER);
  
  //more gif setup
  int i = 0;
  int i1 = 0;
  int i2 = 0;
  while (i < 67) {
    bg.add(loadImage("frame_" + i + "_delay-0.05s.gif"));
    i++;
  }
  while (i1 < 8) {
    intro.add(loadImage("frame_" + i1 + "_delay-0.2s.png"));
    i1++;
  }
  while (i2 < 48) {
    pause.add(loadImage("frame_" + i2 + "_delay-0.12s.png"));
    i2++;
  }
}

void draw() {

  //mode framework------------------------------------------------------------------------------------------------
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == PAUSE) {
    pause();
  } else {
    println("?");
  }
}

//https://pa1.narvii.com/7321/54094fc9defabf10d79fcce9bfb08fa437f6f8c8r1-480-480_hq.gif
//https://www.colourlovers.com/palette/2030156/Floating_In_Space
//https://www.colourlovers.com/palette/1616282/Space_Travels
//https://www.dafont.com/neon-planet-display.font
