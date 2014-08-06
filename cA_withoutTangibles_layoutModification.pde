
void setup() {

  jYellow_x1___=animatingFaceX-whiteSkeletonXincr+yellowFaceSize;
  jYellow_xL1___=animatingFaceX-whiteSkeletonXincr;
  first = true;
  //size(displayWidth, displayHeight);
  size(1280, 720);
  //size(2560,1600);
  orientation(LANDSCAPE);
  background(0);
  fill(0, 0, 244);
  //rect(100, 100, 100, 100);
  stroke(255);
  rectMode(CENTER);
  //ellipseMode(CORNERS);

  // Initialize Multitouch x y arrays
  xTouch = new float [10];
  yTouch = new float [10]; // Don't use more than ten fingers!
  x1Touch = new float [10];
  y1Touch = new float [10];
  x2Touch = new float [10];
  y2Touch = new float [10];
  yellow_x = new double[10000];
  yellow_xL = new double[10000];
  yellow_y = new double[10000];
  yellow_yL = new double[10000];
  jYellow_x = new double[10000];
  jYellow_xL = new double[10000];
  charColor = new char[10000];

  angle = new float[10000];
  angle1 = new float[10000];
  angle2 = new float[10000];

  yellow_x1 = new double[10][10000];
  yellow_xL1 = new double[10][10000];
  yellow_y1 = new double[10][10000];
  yellow_yL1 = new double[10][10000];
  jYellow_x1 = new double[10][10000];
  jYellow_xL1 = new double[10][10000];
  touchEvent_1 = new boolean[10][10000];
  angle11 = new float[10][10000];
  angle21 = new float[10][10000];
  angle111 = new float[10][10000];
  charColor1 = new char[10][10000];


  touchEvent_ = new boolean[10000];

  sqrtL = new float[4]; 
  sqrtR = new float[4];

  iterations = new int[10];

  recordButtonX = 50;
  recordButtonY = 50;
  stopButtonX = recordButtonX;// + recordButtonHeight + buttonSpacing;
  stopButtonY = recordButtonY + recordButtonHeight + buttonSpacing;
  playButtonX = stopButtonX;// + stopButtonHeight + buttonSpacing;
  playButtonY = stopButtonY + stopButtonHeight + buttonSpacing;



  template1ButtonX = recordButtonX - template1ButtonWidth/2; 
  template1ButtonY = dHeight/2 + dHeight/4 - 50;
  template2ButtonX = template1ButtonX; 
  template2ButtonY = template1ButtonY+template1ButtonWidth + buttonSpacing;
  template3ButtonX = template2ButtonX; 
  template3ButtonY = template2ButtonY+template2ButtonWidth + buttonSpacing;

  rp_Button = new MyButton[11];//10 recordings possible  (1-10)
  rp_ButtonX = new int[11];
  rp_ButtonY = new int[11];

  for (int ll = 0; ll <10 ; ll++)
  {
    iterations[ll] = 0;
  }

  doneRp_ButtonX = dWidth-100;
  doneRp_ButtonY = dHeight-100;

  doneRp_Button = new MyButton(doneRp_ButtonX, doneRp_ButtonY, doneRp_ButtonWidth, doneRp_ButtonHeight, "DONE");

  charColor1[0][0] = 'y';
}

//-----------------------------------------------------------------------------------------

void draw() {
  buttonSetup();

  if (playButton.buttonClicked == false)
  {
    iter=0;// variable to store the actions
    background(255);
    //resetButton.draw();
    //    if (resetButton.isClicked())
    //    {
    //      reInitializeTouchPoints();
    //      Reset();
    //    }
    firstTrue();
    if (recordButton.isRspClicked())
    {
      inHere = true;
      recordButton.buttonClicked = true;
    }
    if (playButton.isRspClicked())
    {
      playButton.buttonClicked = true;
      reInitializeTouchPoints();
    }
    if (template1Button.isClicked())
    {
      template1Button.buttonClicked = true;
      template2Button.buttonClicked = false;
      template3Button.buttonClicked = false;
    }
    else if (template2Button.isClicked())
    {
      template2Button.buttonClicked = true;
      template1Button.buttonClicked = false;
      template3Button.buttonClicked = false;
    }
    else if (template3Button.isClicked())
    {
      template3Button.buttonClicked = true;
      template1Button.buttonClicked = false;
      template2Button.buttonClicked = false;
    }
    recordButton.drawRoundButtons(0);
    stopButton.drawRoundButtons(1);
    playButton.drawRoundButtons(2);
    template1Button.templateDraw();
    template2Button.templateDraw();
    template3Button.templateDraw();

    drawAnimatingChar();

    //drawBlueCirclesOnTouch();
    if (TouchEvents != 0)
      first = false;
    if (TouchEvents == 1)
      ifTouchEventIs1();
    if (TouchEvents == 2)
      ifTouchEventIs2();

    if (stopButton.isStopClicked())
    {
      reInitializeTouchPoints();
      println("STOP CLICKED");
      rp_ButtonX[numRcordings] = dWidth-80;
      rp_ButtonY[numRcordings] = numRcordings * (rp_ButtonHeight+10);
      rp_Button[numRcordings] = new MyButton(rp_ButtonX[numRcordings], rp_ButtonY[numRcordings], rp_ButtonWidth, rp_ButtonHeight, recording[numRcordings]);
      rp_Button[numRcordings].rp_Draw();
      numRcordings++ ;
      rec++ ;
      recordButton.buttonClicked = false;
    }
  }

  else if (playButton.buttonClicked == true)
  {
    recordButton.buttonClicked = false;
    background(255);
    doneRp_Button.draw();
    //doneRp_Button.rp_Draw();
    whichIsClicked();

    drawAnimatedHand(num___, iter___, jYellow_x1___, angle111___);
    drawAnimatedHand(num___, iter___, jYellow_xL1___, angle21___);
    drawAnimatedChar(num___, iter___);

    if (iterations[num] != 0)
    {
      if (rp_Button[num].buttonClicked == true)
      {
        if (iter < iterations[num])
        {
          background(255);
          doneRp_Button.draw();

          drawAnimatedChar(num, iter);
          if ((yellow_x1[num][iter] != 0.0)&&(yellow_y1[num][iter] != 0.0))
          {
            drawAnimatedHand(num, iter, (int)jYellow_x1[num][iter], angle111[num][iter]);
            num___ = num;
            iter___ = iter;
            jYellow_x1___ = (int)jYellow_x1[num][iter];
            angle111___ = angle111[num][iter];
          }
          else if ((yellow_x1[num][iter] == 0.0)&&(yellow_y1[num][iter] == 0.0))
          {
            drawAnimatedHand(num___, iter___, jYellow_x1___, angle111___);
          }
          if ((yellow_xL1[num][iter] != 0.0)&&(yellow_yL1[num][iter] != 0.0))
          {
            drawAnimatedHand(num, iter, (int)jYellow_xL1[num][iter], angle21[num][iter]);
            num___ = num;
            iter___ = iter;
            jYellow_xL1___ = (int)jYellow_xL1[num][iter];
            angle21___ = angle21[num][iter];
          }
          else if ((yellow_xL1[num][iter] == 0.0)&&(yellow_yL1[num][iter] == 0.0))
          {
            drawAnimatedHand(num___, iter___, jYellow_xL1___, angle21___);
          }
          iter++;
        }
        else
        {
          iter = 0;
          rp_Button[num].buttonClicked = false;
        }
      }
    }
  }
  for (int l = 0;l< numRcordings;l++)
  {
    rp_Button[l].rp_Draw();
  }
  if (doneRp_Button.isClicked())
  {
    reInitializeTouchPoints();
    doneRp_Button.buttonClicked = true;
  }
  if (doneRp_Button.buttonClicked == true)
  {
    doneRp_Button.buttonClicked = false;
    playButton.buttonClicked = false;
  }
}

void firstTrue() //white left body
{
  rectMode(CENTER);
  fill(skeletonColor);
  noStroke();
  rect(whiteSkeletonX, whiteSkeletonY, 160, 160, 15);

  if ((first == true))
  { 
    dx1 = whiteRightHandEndX - whiteRightHandJointX;
    dy1 = whiteRightHandEndY - whiteRightHandJointY;
    dx2 = whiteLeftHandEndX - whiteLeftHandJointX;
    dy2 = whiteLeftHandEndY - whiteLeftHandJointY;
    angle1_ = atan2(dy1, dx1);  
    angle2_ = atan2(dy2, dx2);  
    strokeWeight(25);
    stroke(skeletonColor);
    line(whiteRightHandJointX, whiteRightHandJointY, whiteRightHandEndX, whiteRightHandEndY); //white right hand skeleton
    line(whiteLeftHandJointX, whiteRightHandJointY, whiteLeftHandEndX, whiteLeftHandEndY); //white left hand skeleton
    stroke(animColor[0]);
    segment(jYellow_x_, whiteRightHandJointY-15, angle1_, yellowHandLength);
    segment(jYellow_xL_, whiteRightHandJointY-15, angle2_, yellowHandLength);
    angle111___ = angle1_;
    angle21___ = angle2_;
  }
}

void drawBlueCirclesOnTouch()
{
  if ((xTouch[0]!=0)&&(yTouch[0]!=0)) 
  {
    for (int i = 0; i < xTouch.length; i++) {
      ellipse(xTouch[i], yTouch[i], 150, 150);
    }
  }
}

void segment(float x, float y, float a, int handLength) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, handLength, 0);
  popMatrix();
}

void buttonSetup()
{
  if ((buttonSetup == true))
  {
    recordButton = new MyButton(recordButtonX, recordButtonY, recordButtonWidth, recordButtonHeight, "RECORD");
    stopButton = new MyButton(stopButtonX, stopButtonY, stopButtonWidth, stopButtonHeight, "STOP");
    playButton = new MyButton(playButtonX, playButtonY, playButtonWidth, playButtonHeight, "PLAY");
    recordButton.unClicked();
    playButton.unClicked();
    stopButton.unClicked();
    template1Button = new MyButton(template1ButtonX, template1ButtonY, template1ButtonWidth, template1ButtonHeight, 0);
    template2Button = new MyButton(template2ButtonX, template2ButtonY, template2ButtonWidth, template2ButtonHeight, 1);
    template3Button = new MyButton(template3ButtonX, template3ButtonY, template3ButtonWidth, template3ButtonHeight, 2);
    template1Button.templateClicked();
    template2Button.templateUnClicked();
    template3Button.templateUnClicked();
    resetButton = new MyButton(resetButtonX, resetButtonY, resetButtonWidth, resetButtonHeight, "RESET");

    buttonSetup = false;
  }
}

void whichIsClicked()
{
  for (int kk=0;kk<numRcordings;kk++)
  {
    if (rp_Button[kk].isClicked())
    {
      reInitializeTouchPoints();
      num = kk;
      rp_Button[num].buttonClicked = true;
    }
  }
}

void reInitializeTouchPoints()
{
  xTouch[0] = 0.0;
  yTouch[0] = 0.0;
}


void Reset()
{
  buttonSetup = true;
  buttonSetup();
  playButton.buttonClicked = false;
  first = true;
  firstTrue();
  dx1 = whiteRightHandEndX - whiteRightHandJointX;
  dy1 = whiteRightHandEndY - whiteRightHandJointY;
  dx2 = whiteLeftHandEndX - whiteLeftHandJointX;
  dy2 = whiteLeftHandEndY - whiteLeftHandJointY;
  angle1_ = atan2(dy1, dx1);  
  angle2_ = atan2(dy2, dx2);  
  strokeWeight(25);
  stroke(skeletonColor);
  line(whiteRightHandJointX, whiteRightHandJointY, whiteRightHandEndX, whiteRightHandEndY); //white right hand skeleton
  line(whiteLeftHandJointX, whiteRightHandJointY, whiteLeftHandEndX, whiteLeftHandEndY); //white left hand skeleton
  stroke(animColor[0]);
  segment(jYellow_x_, whiteRightHandJointY-15, angle1_, yellowHandLength);
  segment(jYellow_xL_, whiteRightHandJointY-15, angle2_, yellowHandLength);
  println("RESET %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%");
}

