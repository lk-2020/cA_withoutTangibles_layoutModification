float rightHandJoint0, rightHandJoint1, leftHandJoint0, leftHandJoint1;
float sqrtL[], sqrtR[];

void ifTouchEventIs1()
{
  rightHandJoint0 = sqrt(pow(xTouch[0]-(whiteRightHandEndX), 2) + pow(yTouch[0]-(whiteRightHandEndY), 2));
  leftHandJoint0 = sqrt(pow(xTouch[0]-(whiteLeftHandEndX), 2) + pow(yTouch[0]-(whiteLeftHandEndY), 2));
  rightHandJoint1 = sqrt(pow(xTouch[0]-(whiteRightHandJointX), 2) + pow(yTouch[0]-(whiteRightHandJointY), 2));
  leftHandJoint1 = sqrt(pow(xTouch[0]-(whiteLeftHandJointX), 2) + pow(yTouch[0]-(whiteLeftHandJointY), 2));
  strokeWeight(25);
  stroke(skeletonColor);
  segment(whiteRightHandJointX, whiteRightHandJointY, angle1_, whiteHandLength);
  segment(whiteLeftHandJointX, whiteLeftHandJointY, angle2_, whiteHandLength);

  if (template1Button.buttonClicked == true)
    stroke(animColor[0]);
  if (template2Button.buttonClicked == true)
    stroke(animColor[1]);
  if (template3Button.buttonClicked == true)
    stroke(animColor[2]);
  segment(jYellow_x_, whiteRightHandJointY-15, angle1_, yellowHandLength);
  segment(jYellow_xL_, whiteRightHandJointY-15, angle2_, yellowHandLength);

  if ((rightHandJoint0<bufferArea)&&(rightHandJoint1<whiteHandLength+bufferArea)&&(rightHandJoint1>whiteHandLength-bufferArea)) // right joint id touchId[0]
  {
    whiteRightHandEndX = (int)xTouch[0];
    whiteRightHandEndY = (int)yTouch[0];
    dx1 = xTouch[0] - whiteRightHandJointX;
    dy1 = yTouch[0] - whiteRightHandJointY;
    angle[it] = atan2(dy1, dx1);
    strokeWeight(25);
    stroke(skeletonColor);
    //segment(whiteRightHandJointX, whiteRightHandJointY, angle1, whiteHandLength);
    //  the ink cretaes 2 points at a predefined distance on the tangible and hence this distance will always remain const.
    touchEvent = true;
    touchEvent_[it] = true;
    yellow_x[it] = (whiteRightHandEndX-whiteRightHandJointX)+(animatingFaceX+whiteSkeletonXincr);
    //x1 = xTouch[1]+animatingFaceX-whiteSkeletonXincr;
    yellow_y[it] = whiteRightHandEndY-15;
    jYellow_x[it] = animatingFaceX-whiteSkeletonXincr+yellowFaceSize;
    yellow_x_ = (float)yellow_x[it];
    yellow_y_ = (float)yellow_y[it];
    jYellow_x_ = (int)jYellow_x[it];
    //angle[it] = angle1[it];
    angle1_ = angle[it];
    ifTouchEventIs1_drawAnimatingHand(it, angle1_);
    //if ((recordButton.buttonClicked == true)||(record==true))
    if ((recordButton.buttonClicked == true))
    {
      println("RECORDING R");
      it++;
    }
  }

  else if ((leftHandJoint0<bufferArea)&&(leftHandJoint1<whiteHandLength+50)&&(leftHandJoint1>whiteHandLength-50)) // right joint id touchId[0]
  {
    whiteLeftHandEndX = (int)xTouch[0];
    whiteLeftHandEndY = (int)yTouch[0];
    dx2 = xTouch[0] - whiteLeftHandJointX;
    dy2 = yTouch[0] - whiteLeftHandJointY;
    angle[it] = atan2(dy2, dx2);
    //angle[it] = angle2[it];
    //segment(whiteLeftHandJointX, whiteLeftHandJointY, angle2, whiteHandLength);
    //  the ink cretaes 2 points at a predefined distance on the tangible and hence this distance will always remain const.
    touchEvent = true;
    touchEvent_[it] = true;
    yellow_x[it] = (animatingFaceX-whiteSkeletonXincr) - (whiteLeftHandJointX - whiteLeftHandEndX);
    yellow_y[it] = whiteLeftHandEndY-15;
    jYellow_x[it] = animatingFaceX-whiteSkeletonXincr;
    yellow_xL_ =(float)yellow_x[it];
    yellow_yL_ = (float)yellow_y[it];
    jYellow_xL_ = (int)jYellow_x[it];
    angle2_ = angle[it];
    ifTouchEventIs1_drawAnimatingHand(it, angle2_);
    //if ((recordButton.buttonClicked == true)||(record==true))
    if ((recordButton.buttonClicked == true))
    {
      println("RECORDING L");
      it++;
    }
  }
}

