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
        touchEvent_[it] = false;
        whiteRightHandEndX = (int)xTouch[i];
        whiteRightHandEndY = (int)yTouch[i];
        dx1 = xTouch[i] - whiteRightHandJointX;
        dy1 = yTouch[i] - whiteRightHandJointY;
        angle1[it] = atan2(dy1, dx1);
        yellow_x[it] = (whiteRightHandEndX-whiteRightHandJointX)+(animatingFaceX+whiteSkeletonXincr);
        yellow_y[it] = whiteRightHandEndY-15;
        jYellow_x[it] = animatingFaceX-whiteSkeletonXincr+yellowFaceSize;
        yellow_x_ = (float)yellow_x[it];
        yellow_y_ = (float)yellow_y[it];
        jYellow_x_ = (int)jYellow_x[it];
        angle1_ = angle1[it];
        ifTouchEventIs2_drawAnimatingHand(it, (float)yellow_x[it], (float) yellow_y[it], (int)jYellow_x[it], (float)angle1[it]);
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
        touchEvent_[it] = false;
        whiteLeftHandEndX = (int)xTouch[i];
        whiteLeftHandEndY = (int)yTouch[i];
        dx2 = xTouch[i] - whiteLeftHandJointX;
        dy2 = yTouch[i] - whiteLeftHandJointY;
        angle2[it] = atan2(dy2, dx2);
        yellow_xL[it]  = (animatingFaceX-whiteSkeletonXincr) - (whiteLeftHandJointX - whiteLeftHandEndX);
        yellow_yL[it]  = whiteLeftHandEndY-15;
        jYellow_xL[it] = animatingFaceX-whiteSkeletonXincr;
        yellow_xL_ =(float)yellow_xL[it];
        yellow_yL_ = (float)yellow_yL[it];
        jYellow_xL_ = (int)jYellow_xL[it];
        angle2_ = angle2[it];
        ifTouchEventIs2_drawAnimatingHand(it, (float)yellow_xL[it], (float) yellow_yL[it], (int)jYellow_xL[it], (float)angle2[it]);
       // if ((record == true)||(recordButton.buttonClicked == true))
       if ((recordButton.buttonClicked == true))
        {
          it++;
        }
      }
    }
  }
}

