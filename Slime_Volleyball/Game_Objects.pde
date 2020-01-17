void leftPlayer() {
  leftPlayer = new FCircle(width/16);
  leftPlayer.setPosition(width/4, height*3.25/4);

  //Visuals
  leftPlayer.setFillColor(red);
  leftPlayer.setNoStroke();

  //Properties
  leftPlayer.setStatic(false);
  leftPlayer.setRestitution(0.2);
  leftPlayer.setGrabbable(false);

  world.add(leftPlayer);
}//----------------------------------------------------------------------------

void rightPlayer() {
  rightPlayer = new FCircle(width/16);
  rightPlayer.setPosition(width*3/4, height*3.25/4);

  //Visuals
  rightPlayer.setFillColor(cyan);
  rightPlayer.setNoStroke();

  //Properties
  rightPlayer.setStatic(false);
  rightPlayer.setRestitution(0.2);
  rightPlayer.setGrabbable(false);

  world.add(rightPlayer);
}//----------------------------------------------------------------------------

void ball() {
  ball = new FCircle(width/32);
  ball.setPosition(width/4, height/2);

  //Visuals
  ball.setFillColor(purple);
  ball.setNoStroke();

  //Properties
  ball.setStatic(false);
  ball.setRestitution(0.75);
  ball.setGrabbable(false);

  world.add(ball);
}//----------------------------------------------------------------------------
