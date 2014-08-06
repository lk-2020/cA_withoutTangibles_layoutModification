void drawAnimatingChar()
{ellipseMode(CENTER);
  rectMode(CENTER);
  noStroke();
  if (template1Button.buttonClicked == true)
    fill(animColor[0]);
  if (template2Button.buttonClicked == true)
    fill(animColor[1]);
  if (template3Button.buttonClicked == true)
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

void ifTouchEventIs1_drawAnimatingHand_L(int rec1, int itIncr, float angle) {
  strokeWeight(25);
  if (template1Button.buttonClicked == true)
  {
    charColor1[rec1][itIncr] = 'y';
    stroke(animColor[0]);
  }
  if (template2Button.buttonClicked == true)
  {
    charColor1[rec1][itIncr] = 'p';
    stroke(animColor[1]);
  }
  if (template3Button.buttonClicked == true)
  {
    charColor1[rec1][itIncr] = 'b';
    stroke(animColor[2]);
  }
  //line((int)jYellow_x[itIncr], whiteRightHandJointY-15, (float)yellow_x[itIncr], (float)yellow_y[itIncr]);// hand
  segment((int)jYellow_xL1[rec1][itIncr], whiteRightHandJointY-15, angle, yellowHandLength);
}

void ifTouchEventIs1_drawAnimatingHand_R(int rec1, int itIncr, float angle) {
  strokeWeight(25);
  if (template1Button.buttonClicked == true)
  {
    charColor1[rec1][itIncr] = 'y';
    stroke(animColor[0]);
  }
  if (template2Button.buttonClicked == true)
  {
    charColor1[rec1][itIncr] = 'p';
    stroke(animColor[1]);
  }
  if (template3Button.buttonClicked == true)
  {
    charColor1[rec1][itIncr] = 'b';
    stroke(animColor[2]);
  }
  //line((int)jYellow_x[itIncr], whiteRightHandJointY-15, (float)yellow_x[itIncr], (float)yellow_y[itIncr]);// hand
  segment((int)jYellow_x1[rec1][itIncr], whiteRightHandJointY-15, angle, yellowHandLength);
}

void ifTouchEventIs2_drawAnimatingHand(int rec1, int itIncr, float yxx, float yyy, int join, float angle) {
  strokeWeight(25);
  if (template1Button.buttonClicked == true)
  {
    charColor1[rec1][itIncr] = 'y';
    stroke(animColor[0]);
  }
  if (template2Button.buttonClicked == true)
  {
    charColor1[rec1][itIncr] = 'p';
    stroke(animColor[1]);
  }
  if (template3Button.buttonClicked == true)
  {
    charColor1[rec1][itIncr] = 'b';
    stroke(animColor[2]);
  }
  strokeWeight(25);
  //line(join, whiteRightHandJointY-15, yxx, yyy); //hand
  segment(join, whiteRightHandJointY-15, angle, yellowHandLength);
}

