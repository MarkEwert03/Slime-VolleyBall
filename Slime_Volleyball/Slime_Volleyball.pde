//Mark Ewert
// Jan 9

import fisica.*;
FWorld world;

//Basic Colours
color red             = #df2020;
color orange          = #df8020;
color yellow          = #dfdf20;
color lime            = #80df20;
color green           = #50df20;
color mint            = #20df50;
color cyan            = #20dfdf;
color blue            = #2080df;
color navy            = #2020df;
color purple          = #8020df;
color violet          = #df20df;
color pink            = #df2080;
color black           = #000000;
color grey            = #808080;
color white           = #ffffff;

//Strokes
color darkGreen       = #269900;
color darkMint        = #009926;
color darkBlue        = #004d99;
color darkPurple      = #4d0099;
color darkViolet      = #990099;

//Mode Franework
final int GAME = 1;
final int LEFT_WIN = 2;
final int RIGHT_WIN = 3;
int mode;

ArrayList<PImage> backgroundList;
String zero;
int i, n = 0;
PImage backgroundPic, groundPic, leftPlayerPic, rightPlayerPic;

//Players
FCircle leftPlayer, rightPlayer, ball;

//Environment
FBox leftGround, rightGround;

//Key Code
boolean wKey, aKey, sKey, dKey;
boolean up, left, down, right;
boolean leftCanJump, rJump;

//Game
int leftScore, rightScore;
int timer = 0;
color ballColor, ballStroke;

void setup() {
  //Basic
  fullScreen(FX2D);
  textSize(100);
  textAlign(CENTER);

  //Images
  backgroundList = new ArrayList<PImage>(50);
  for (int i = 0; i <= 49; i++) {
    if (i < 10) zero = "0";
    else zero = "";
    PImage tempImage = loadImage("Frames/frame_" + zero + i + "_delay-0.1s.gif");
    backgroundList.add(tempImage);
  }
  groundPic = loadImage("Ground.png");

  //Initialize world
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 750);

  //Environment
  leftWall();
  rightWall();
  leftGround();
  rightGround();
  ceiling();
  net();
  leftPlayer();
  rightPlayer();
  ball();

  //Initializes Variables
  timer = -1;
  mode = GAME;

  print(width, height);
}//----------------------------------------------------------------------------

void draw() {

  if (mode == GAME) {
    image(backgroundList.get(n), 0, 0, width, height*1.25);
    if ( frameCount % 5 == 0) n++;
    if (n > 49) n = 0;

    //left player move
    if (aKey) leftPlayer.addImpulse(-600, 0);
    if (dKey) leftPlayer.addImpulse(600, 0);
    //Jumps if it can
    if (leftCanJump && wKey) leftPlayer.addImpulse(0, -5000);   

    //right player move
    if (left)  rightPlayer.addImpulse(-600, 0);
    if (right) rightPlayer.addImpulse(600, 0);
    //Jumps if it can
    if (rJump && up) rightPlayer.addImpulse(0, -5000);

    //Ball
    if (ball.getX() > width/2 - 10 && ball.getX() < width/2 + 10) {
      ballColor = blue;
      ballStroke = darkBlue;
    }
    ball.setFillColor(ballColor);
    ball.setStrokeColor(ballStroke);

    //player and ball collisions
    collisions();

    //left score
    fill(white);
    text(leftScore, 50, 100);

    //right score
    fill(white);
    text(rightScore, width-50, 100);

    //leftPlayer wins
    if (leftScore == 5) mode = LEFT_WIN;
    if (rightScore == 5) mode = RIGHT_WIN;

    world.step(); //Calclates forces
    world.draw(); //Makes them in processing

    //Ground
    image(groundPic, 0, height*7/8);
  } else if (mode == LEFT_WIN) {
    background(darkViolet);
    fill(white);
    text("Violet player wins!", width/2, height/2);
  } else if (mode == RIGHT_WIN) {
    background(darkGreen);
    text("Green player wins!", width/2, height/2);
  }
}//----------------------------------------------------------------------------

void collisions() {
  //Sets leftCanJump variable
  leftCanJump = false;
  ArrayList<FContact> leftContactList = leftPlayer.getContacts();
  for (FContact tempContact : leftContactList) {
    if (tempContact.contains(leftGround)) leftCanJump = true;
  }

  //leftPlayer can't go past middle
  float leftX = leftPlayer.getX();
  if (leftX >= width/2 - width/64) {
    leftX = width/2 - width/64;
    leftPlayer.setPosition(leftX, leftPlayer.getY());
    leftPlayer.setVelocity(-50, leftPlayer.getVelocityY());
  }

  //Sets rightCanJump variable
  rJump = false;
  ArrayList<FContact> rightContactList = rightPlayer.getContacts();
  for (FContact tempContact : rightContactList) {
    if (tempContact.contains(rightGround)) rJump = true;
  }

  //rightPlayer can't go past middle
  float rightX = rightPlayer.getX();
  if (rightX <= width/2 + width/64) {
    rightX = width/2 + width/64;
    rightPlayer.setPosition(rightX, rightPlayer.getY());
    rightPlayer.setVelocity(50, rightPlayer.getVelocityY());
  }

  //Ball collisions
  ArrayList<FContact> ballContactList = ball.getContacts();
  //0. Contact list
  for (FContact tempContact : ballContactList) {
    //1. falls on left side
    if (tempContact.contains(leftGround)) {
      setup();
      ball.setPosition(width*3/4, height/2);
      rightScore++;
      timer = 120;
    }//1.
    //1. falls on left side
    if (tempContact.contains(rightGround)) {
      setup();
      ball.setPosition(width/4, height/2);
      leftScore++;
      timer = 120;
    }//1.

    //touches left player
    if (tempContact.contains(leftPlayer)) {
      ballColor = purple;
      ballStroke = darkPurple;
    }

    //touches right player
    if (tempContact.contains(rightPlayer)) {
      ballColor = mint;
      ballStroke = darkMint;
    }
  }//0.
}//----------------------------------------------------------------------------

void keyPressed() {
  //Left Player
  if (key == 'w' || key == 'W') wKey = true;
  if (key == 'a' || key == 'A') aKey = true;
  if (key == 's' || key == 'S') sKey = true;
  if (key == 'd' || key == 'D') dKey = true;

  //Right Player
  if (keyCode == UP)    up    = true;
  if (keyCode == LEFT)  left  = true;
  if (keyCode == DOWN)  down  = true;
  if (keyCode == RIGHT) right = true;
}//----------------------------------------------------------------------------

void keyReleased() {
  //Left Player
  if (key == 'w' || key == 'W') wKey = false;
  if (key == 'a' || key == 'A') aKey = false;
  if (key == 's' || key == 'S') sKey = false;
  if (key == 'd' || key == 'D') dKey = false;

  //Right Player
  if (keyCode == UP)    up    = false;
  if (keyCode == LEFT)  left  = false;
  if (keyCode == DOWN)  down  = false;
  if (keyCode == RIGHT) right = false;
}//----------------------------------------------------------------------------

void mouseReleased() {
  if (mode == LEFT_WIN || mode == RIGHT_WIN) {
    leftScore = 0;
    rightScore = 0;
    setup();
  }
}
