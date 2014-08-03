int dWidth=1280;
int dHeight=720;

color skeletonColor = 255;
boolean first;

boolean buttonSetup = true;

MyButton recordButton;
MyButton stopButton;
MyButton playButton;

MyButton template1Button;
MyButton template2Button;
MyButton template3Button;

int recordButtonX;
int recordButtonY;
int recordButtonWidth = 100;
int recordButtonHeight = 50;

int stopButtonX;
int stopButtonY;
int stopButtonWidth = 100;
int stopButtonHeight = 50;

int playButtonX;
int playButtonY;
int playButtonWidth = 100;
int playButtonHeight = 50;

int buttonSpacing = 20;

int template1ButtonX;
int template1ButtonY;
int template1ButtonWidth = 100;
int template1ButtonHeight = 100;

int template2ButtonX;
int template2ButtonY;
int template2ButtonWidth = template1ButtonWidth;
int template2ButtonHeight = template1ButtonHeight;

int template3ButtonX;
int template3ButtonY;
int template3ButtonWidth = template1ButtonWidth;
int template3ButtonHeight = template1ButtonHeight;


void setup() {
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
  yellow_x = new double[100000];
  yellow_xL = new double[100000];
  yellow_y = new double[100000];
  yellow_yL = new double[100000];
  jYellow_x = new double[100000];
  jYellow_xL = new double[100000];
  charColor = new char[100000];
  angle = new float[100000];
  angle1 = new float[100000];
  angle2 = new float[100000];

  touchEvent_ = new boolean[100000];

  sqrtL = new float[4]; 
  sqrtR = new float[4];
//
//  B = new Buttons();

  recordButtonX = 0;
  recordButtonY = 0;
  stopButtonX = recordButtonX + recordButtonWidth + buttonSpacing;
  stopButtonY = recordButtonY;
  playButtonX = stopButtonX + stopButtonWidth + buttonSpacing;
  playButtonY = recordButtonY;

  template1ButtonX = dWidth/2; 
  template1ButtonY = 0;
  template2ButtonX = template1ButtonX+template1ButtonWidth; 
  template2ButtonY = template1ButtonY;
  template3ButtonX = template2ButtonX+template2ButtonWidth; 
  template3ButtonY = template1ButtonY;
}

//-----------------------------------------------------------------------------------------

void draw() {
  buttonSetup();
  if (playButton.buttonClicked == false)
  {
    iter=0;// variable to store the actions
    background(0);
    firstTrue();
    if (recordButton.isClicked())
    {
      recordButton.buttonClicked = true;
    }
    if (stopButton.isClicked())
    {
      recordButton.buttonClicked = false;
    }
    if (playButton.isClicked())
    {
      playButton.buttonClicked = true;
      xTouch[0] = 0.0;
      yTouch[0] = 0.0;
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
    recordButton.draw();
    stopButton.draw();
    playButton.draw();
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
  }

  else if (playButton.buttonClicked == true)
  {
    recordButton.buttonClicked = false;

    if (it != 0)
    {
      background(255);
      iter++;
      if (!((yellow_x[iter] == 0.0)||(yellow_y[iter] == 0.0)))
      {
        drawAnimatedChar(iter);

        if (touchEvent_[iter] == true)
        {
          if ((yellow_x[iter] != 0.0)&&(yellow_y[iter] != 0.0))
            drawAnimatedHand(iter, (int)yellow_x[iter], (int)yellow_y[iter], (int)jYellow_x[iter], angle[iter]);
        }
        else if (touchEvent_[iter] == false)
        {
          if ((yellow_x[iter] != 0.0)&&(yellow_y[iter] != 0.0))
            drawAnimatedHand(iter, (int)yellow_x[iter], (int)yellow_y[iter], (int)jYellow_x[iter], angle1[iter]);
          if ((yellow_xL[iter] != 0.0)&&(yellow_yL[iter] != 0.0))
            drawAnimatedHand(iter, (int)yellow_xL[iter], (int)yellow_yL[iter], (int)jYellow_xL[iter], angle2[iter]);
        }
      }
      if (iter == it)
      {
        playButton.buttonClicked = false;
        it = 0;
      }
    }

    else if (it == 0)
    {
      playButton.buttonClicked = false;
    }
  }
}

void firstTrue() //white left body
{
  skeletonColor = 255;
  rectMode(CENTER);
  fill(skeletonColor);
  noStroke();
  rect(whiteSkeletonX, whiteSkeletonY, 160, 160, 15);

  if ((first == true))
  {
    strokeWeight(25);
    stroke(skeletonColor);
    line(whiteRightHandJointX, whiteRightHandJointY, 300+100, 200); //white right hand skeleton
    line(whiteLeftHandJointX, whiteRightHandJointY, 300-200, 200); //white left hand skeleton
    stroke(animColor[0]);
    segment(jYellow_x_, whiteRightHandJointY-15, angle1_, yellowHandLength);
    segment(jYellow_xL_, whiteRightHandJointY-15, angle2_, yellowHandLength);
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

    buttonSetup = false;
  }
}

