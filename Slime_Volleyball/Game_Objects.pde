void leftPlayer() {
  leftPlayer = new FCircle(width/12);
  leftPlayer.setPosition(width/4, height*3/4);

  //Visuals
  leftPlayer.setFillColor(violet);
  leftPlayer.setStrokeWeight(4);
  leftPlayer.setStrokeColor(darkViolet);

  //Properties
  leftPlayer.setStatic(false);
  leftPlayer.setRestitution(0.2);
  leftPlayer.setGrabbable(false);

  world.add(leftPlayer);
}//----------------------------------------------------------------------------

void rightPlayer() {
  rightPlayer = new FCircle(width/12);
  rightPlayer.setPosition(width*3/4, height*3/4);

  //Visuals
  rightPlayer.setFillColor(green);
  rightPlayer.setStrokeWeight(4);
  rightPlayer.setStrokeColor(darkGreen);

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
  ballColor = blue;
  ballStroke = darkBlue;
  ball.setStrokeWeight(3);

  //Properties
  ball.setStatic(false);
  ball.setRestitution(0.75);
  ball.setGrabbable(false);

  world.add(ball);
}//----------------------------------------------------------------------------
