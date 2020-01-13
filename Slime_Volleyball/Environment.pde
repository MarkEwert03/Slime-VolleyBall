void leftWall() {
  FBox leftWall = new FBox(100, height*2);
  leftWall.setPosition(-45, height/2);

  //Visuals
  leftWall.setFillColor(orange);
  leftWall.setNoStroke();

  //Properties
  leftWall.setStatic(true);

  world.add(leftWall);
}//----------------------------------------------------------------------------

void rightWall() {
  FBox rightWall = new FBox(100, height*2);
  rightWall.setPosition(width+45, height/2);

  //Visuals
  rightWall.setFillColor(orange);
  rightWall.setNoStroke();

  //Properties
  rightWall.setStatic(true);

  world.add(rightWall);
}//----------------------------------------------------------------------------

void leftGround() {
  leftGround = new FBox(width/2, height/8);
  leftGround.setPosition(width/4, height*15/16);

  //Visuals
  leftGround.setFillColor(yellow);
  leftGround.setNoStroke();

  //Properties
  leftGround.setStatic(true);

  world.add(leftGround);
}//----------------------------------------------------------------------------

void rightGround() {
  rightGround = new FBox(width/2, height/8);
  rightGround.setPosition(width*3/4, height*15/16);

  //Visuals
  rightGround.setFillColor(yellow);
  rightGround.setNoStroke();

  //Properties
  rightGround.setStatic(true);

  world.add(rightGround);
}//----------------------------------------------------------------------------

void net() {
  FBox net = new FBox(width/64, height/8);
  net.setPosition(width/2, height*4.075/5);

  //Visuals
  net.setFillColor(lime);
  net.setNoStroke();

  //Properties
  net.setStatic(true);

  world.add(net);
}//----------------------------------------------------------------------------
