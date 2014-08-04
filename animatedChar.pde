void drawAnimatedChar(int num1, int iter)
{
  rectMode(CENTER);
  noStroke();
  if (charColor1[num1][iter] == 'y')
    fill(animColor[0]);
  if (charColor1[num1][iter] == 'p')
    fill(animColor[1]);
  if (charColor1[num1][iter] == 'b')
    fill(animColor[2]);
  rect(animatingFaceX, animatingFaceY, 300, 300, 15);// animating face

  fill(0); 
  ellipse(animatingFaceX-75, animatingFaceY+25, 30, 40);//eye left
  ellipse(animatingFaceX+75, animatingFaceY+25, 30, 40);//eye right

  //mouth
  noFill();
  strokeWeight(5);
  stroke(0);
  arc(animatingFaceX-75+75, animatingFaceY+25+25, 75, 75, 0, PI, OPEN);
}

void drawAnimatedHand(int num1, int iter, float yxx, float yyy, int join, float angle)
{
  if (charColor1[num1][iter] == 'y')
    stroke(animColor[0]);
  if (charColor1[num1][iter] == 'p')
    stroke(animColor[1]);
  if (charColor1[num1][iter] == 'b')
    stroke(animColor[2]);

  strokeWeight(25);
  //line(join, whiteRightHandJointY-15, yxx, yyy); //hand
  segment(join, whiteRightHandJointY-15, angle, yellowHandLength);
}
