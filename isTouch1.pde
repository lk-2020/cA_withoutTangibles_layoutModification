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
  segment(jYellow_xL_, whiteLeftHandJointY-15, angle2_, yellowHandLength);

  if ((rightHandJoint0<bufferArea)&&(rightHandJoint1<whiteHandLength+bufferArea)&&(rightHandJoint1>whiteHandLength-bufferArea)) // right joint id touchId[0]
  {
    whiteRightHandEndX = (int)xTouch[0];
    whiteRightHandEndY = (int)yTouch[0];
    dx1 = xTouch[0] - whiteRightHandJointX;
    dy1 = yTouch[0] - whiteRightHandJointY;
    angle111[rec][iterations[rec]] = atan2(dy1, dx1);
    strokeWeight(25);
    stroke(skeletonColor);
    //segment(whiteRigh[rec][iterations[rec]]tHandJointX, whiteRightHandJointY, angle1, whiteHandLength);
    //  the ink cretaes 2 points at a predefined distance on the tangible and hence this distance will always remain const.
    touchEvent = true;
    touchEvent_1[rec][(iterations[rec])] = true;
    yellow_x1[rec][iterations[rec]] = (whiteRightHandEndX-whiteRightHandJointX)+(animatingFaceX+whiteSkeletonXincr);
    //x1 = xTouch[1]+animatingFaceX-whiteSkeletonXincr;
    yellow_y1[rec][iterations[rec]] = whiteRightHandEndY-15;
    jYellow_x1[rec][iterations[rec]] = animatingFaceX-whiteSkeletonXincr+yellowFaceSize;
    yellow_x_ = (float)yellow_x1[rec][iterations[rec]];
    yellow_y_ = (float)yellow_y1[rec][iterations[rec]];
    jYellow_x_ = (int)jYellow_x1[rec][iterations[rec]];
    //angle[it] = angle1[it];
    angle1_ = angle111[rec][iterations[rec]];
    ifTouchEventIs1_drawAnimatingHand_R(rec, iterations[rec], angle1_);
    //if ((recordButton.buttonClicked == true)||(record==true))
    if ((recordButton.buttonClicked == true))
    {
      it++;
      iterations[rec]++;
    }
  }

  else if ((leftHandJoint0<bufferArea)&&(leftHandJoint1<whiteHandLength+bufferArea)&&(leftHandJoint1>whiteHandLength-bufferArea)) // right joint id touchId[0]
  {
    whiteLeftHandEndX = (int)xTouch[0];
    whiteLeftHandEndY = (int)yTouch[0];
    dx2 = xTouch[0] - whiteLeftHandJointX;
    dy2 = yTouch[0] - whiteLeftHandJointY;
    angle21[rec][iterations[rec]] = atan2(dy2, dx2);
    //angle[it] = angle2[it];
    //segment(whiteLeftHandJointX, whiteLeftHandJointY, angle2, whiteHandLength);
    //  the ink cretaes 2 points at a predefined distance on the tangible and hence this distance will always remain const.
    touchEvent = true;
    touchEvent_1[rec][iterations[rec]] = true;
    yellow_xL1[rec][iterations[rec]] = (animatingFaceX-whiteSkeletonXincr) - (whiteLeftHandJointX - whiteLeftHandEndX);
    yellow_yL1[rec][iterations[rec]] = whiteLeftHandEndY-15;
    jYellow_xL1[rec][iterations[rec]] = animatingFaceX-whiteSkeletonXincr;
    yellow_xL_ =(float)yellow_xL1[rec][iterations[rec]];
    yellow_yL_ = (float)yellow_yL1[rec][iterations[rec]];
    jYellow_xL_ = (int)jYellow_xL1[rec][iterations[rec]];
    angle2_ = angle21[rec][iterations[rec]];
    ifTouchEventIs1_drawAnimatingHand_L(rec, iterations[rec], angle2_);
    //if ((recordButton.buttonClicked == true)||(record==true))
    if ((recordButton.buttonClicked == true))
    {
      it++;
      iterations[rec]++;
    }
  }
}

