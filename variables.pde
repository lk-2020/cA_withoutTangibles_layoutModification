int shiftAnimatingX = 100;

float x0, y0, x1, y1;
double yellow_x[], yellow_xL[];
double yellow_y[], yellow_yL[];
double jYellow_x[], jYellow_xL[];

double yellow_x1[][], yellow_xL1[][];
double yellow_y1[][], yellow_yL1[][];
double jYellow_x1[][], jYellow_xL1[][];
float angle11[][],angle21[][],angle111[][];
boolean touchEvent_1[][];

char charColor[];
char charColor1[][];
//boolean first = true;
boolean touchEvent = false;
boolean touchEvent1 = false, touchEvent2 = false;
boolean touchEvent_[];

//face
int yellowFaceSize = 300;

//WHITE SKELETON 
int whiteSkeletonXincr = 150;

int whiteSkeletonX = 200+whiteSkeletonXincr;
int whiteSkeletonY = 720/2;

int whiteRightHandJointX = 250+whiteSkeletonXincr;
int whiteRightHandJointY = 304;
int whiteLeftHandJointX = whiteRightHandJointX-110;
int whiteLeftHandJointY = whiteRightHandJointY;
int whiteRightHandEndX = 300+200;
int whiteRightHandEndY = 200;
int whiteLeftHandEndX = 300-100;
int whiteLeftHandEndY = 200;



//ANIMATING CHAR
int animatingFaceX = 700 + shiftAnimatingX;
int animatingFaceY = 720/2;

int yellowJointX;
int jointYellow_x, jointYellow_xL;

int jRx; // joint right hand
int it=0, iter=0;

int bufferArea = 75;

float yellow_x_ = (whiteRightHandEndX-whiteRightHandJointX)+(animatingFaceX+whiteSkeletonXincr)+ shiftAnimatingX;
float yellow_y_ = whiteRightHandEndY-15;

float yellow_xL_ = (animatingFaceX-whiteSkeletonXincr) - (whiteLeftHandJointX - whiteLeftHandEndX) + shiftAnimatingX;
float yellow_yL_ = whiteRightHandEndY-15;

int jYellow_x_ = animatingFaceX-whiteSkeletonXincr+yellowFaceSize;
int jYellow_xL_ = animatingFaceX-whiteSkeletonXincr;






int whiteHandLength = 150;
int yellowHandLength = 200;

float dx1 = whiteRightHandEndX - whiteRightHandJointX;
float dy1 = whiteRightHandEndY - whiteRightHandJointY;
float dx2 = whiteLeftHandEndX - whiteLeftHandJointX;
float dy2 = whiteLeftHandEndY - whiteLeftHandJointY;
float angle1_ = atan2(dy1, dx1);  
float angle2_ = atan2(dy2, dx2);  
float angle[], angle1[], angle2[];




int dWidth=1280;
int dHeight=720;
int numRcordings=0;

int[] iterations;
int rec = 0;

color skeletonColor = 50;
boolean first;

boolean buttonSetup = true;

MyButton recordButton;
MyButton stopButton;
MyButton playButton;

MyButton template1Button;
MyButton template2Button;
MyButton template3Button;

MyButton doneRp_Button;

MyButton resetButton;


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
int template1ButtonWidth = 50;
int template1ButtonHeight = 50;

int template2ButtonX;
int template2ButtonY;
int template2ButtonWidth = template1ButtonWidth;
int template2ButtonHeight = template1ButtonHeight;

int template3ButtonX;
int template3ButtonY;
int template3ButtonWidth = template1ButtonWidth;
int template3ButtonHeight = template1ButtonHeight;

int doneRp_ButtonX;
int doneRp_ButtonY;
int doneRp_ButtonWidth = 100;
int doneRp_ButtonHeight = 80;

int resetButtonX = 10;
int resetButtonY = dHeight-70;
int resetButtonWidth = 100;
int resetButtonHeight = 60;

int num;

MyButton[] rp_Button;
int[] rp_ButtonX;
int[] rp_ButtonY;
int rp_ButtonWidth = 70;
int rp_ButtonHeight = 45;
String[] recording = {
  "REC 1", "REC 2", "REC 3", "REC 4", "REC 5", "REC 6", "REC 7", "REC 8", "REC 9", "REC 10",
};

MyButton[] templateButton;
int[] templateButtonX;
int[] templateButtonY;
int templateButtonWidth = 50;
int templateButtonHeight = 50;

color[] templateColor = {
  color(255, 255, 0)/*yellow*/, color(125, 193, 255)/*pink*/, color(184, 20, 103)/*blue*/
};

boolean inHere = false;


int jYellow_x1___;//=animatingFaceX-whiteSkeletonXincr+yellowFaceSize;
int jYellow_xL1___;//=animatingFaceX-whiteSkeletonXincr;
float angle111___;// = angle1_;
float angle21___;// = angle2_;
int num___ = 0;
int iter___ = 0;



