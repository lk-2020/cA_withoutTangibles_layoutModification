void ifTouchEventIs2()
{
  touchEvent2 = true;
  touchEvent1 = false;
  int i, j;
  strokeWeight(25);
  stroke(skeletonColor);
  segment(whiteRightHandJointX, whiteRightHandJointY, angle1_, whiteHandLength);
  segment(whiteLeftHandJointX, whiteLeftHandJointY, angle2_, whiteHandLength);
  for (i=0;i<2;i++)
  {
    sqrtR[i] = sqrt(pow(xTouch[i]-(whiteRightHandEndX), 2) + pow(yTouch[i]-(whiteRightHandEndY), 2));
    if (sqrtR[i] < bufferArea)// check for right joint --- touchid[i] is the right joint
    {
      rightHandJoint1 = sqrt(pow(xTouch[i]-(whiteRightHandJointX), 2) + pow(yTouch[i]-(whiteRightHandJointY), 2));
      if ((rightHandJoint1<whiteHandLength+bufferArea)&&(rightHandJoint1>whiteHandLength-bufferArea))
      {
        jRx = i;
        touchEvent = true;
        touchEvent_1[rec][iterations[rec]] = false;
        whiteRightHandEndX = (int)xTouch[i];
        whiteRightHandEndY = (int)yTouch[i];
        dx1 = xTouch[i] - whiteRightHandJointX;
        dy1 = yTouch[i] - whiteRightHandJointY;
        angle111[rec][iterations[rec]] = atan2(dy1, dx1);
        yellow_x1[rec][iterations[rec]] = (whiteRightHandEndX-whiteRightHandJointX)+(animatingFaceX+whiteSkeletonXincr);
        yellow_y1[rec][iterations[rec]] = whiteRightHandEndY-15;
        jYellow_x1[rec][iterations[rec]] = animatingFaceX-whiteSkeletonXincr+yellowFaceSize;
        yellow_x_ = (float)yellow_x1[rec][iterations[rec]];
        yellow_y_ = (float)yellow_y1[rec][iterations[rec]];
        jYellow_x_ = (int)jYellow_x1[rec][iterations[rec]];
        angle1_ = angle111[rec][iterations[rec]];
        ifTouchEventIs2_drawAnimatingHand(rec, iterations[rec], (float)yellow_x1[rec][iterations[rec]], (float) yellow_y1[rec][iterations[rec]], (int)jYellow_x1[rec][iterations[rec]], (float)angle11[rec][iterations[rec]]);
      }
    }
  }


  for (i=0;i<2;i++)
  {
    if (i != jRx)
    {
      leftHandJoint1 = sqrt(pow(xTouch[i]-(whiteLeftHandJointX), 2) + pow(yTouch[i]-(whiteLeftHandJointY), 2));
      //sqrtL[i] = sqrt(pow(xTouch[i]-(whiteLeftHandJointX), 2) + pow(yTouch[i]-(whiteLeftHandJointY), 2));
      //if (sqrtL[i] < bufferArea)// check for right joint --- touchid[i] is the right joint
      if((leftHandJoint1<whiteHandLength+50)&&(leftHandJoint1>whiteHandLength-50))
      { 
        touchEvent = true;
        touchEvent_1[rec][iterations[rec]] = false;
        whiteLeftHandEndX = (int)xTouch[i];
        whiteLeftHandEndY = (int)yTouch[i];
        dx2 = xTouch[i] - whiteLeftHandJointX;
        dy2 = yTouch[i] - whiteLeftHandJointY;
        angle21[rec][iterations[rec]] = atan2(dy2, dx2);
        yellow_xL1[rec][iterations[rec]]  = (animatingFaceX-whiteSkeletonXincr) - (whiteLeftHandJointX - whiteLeftHandEndX);
        yellow_yL1[rec][iterations[rec]]  = whiteLeftHandEndY-15;
        jYellow_xL1[rec][iterations[rec]] = animatingFaceX-whiteSkeletonXincr;
        yellow_xL_ =(float)yellow_xL1[rec][iterations[rec]];
        yellow_yL_ = (float)yellow_yL1[rec][iterations[rec]];
        jYellow_xL_ = (int)jYellow_xL1[rec][iterations[rec]];
        angle2_ = angle21[rec][iterations[rec]];
        ifTouchEventIs2_drawAnimatingHand(rec, iterations[rec], (float)yellow_xL1[rec][iterations[rec]], (float) yellow_yL1[rec][iterations[rec]], (int)jYellow_xL1[rec][iterations[rec]], (float)angle21[rec][iterations[rec]]);
       if ((recordButton.buttonClicked == true))
        {
          it++;
          iterations[rec]++;
        }
      }
    }
  }
}

