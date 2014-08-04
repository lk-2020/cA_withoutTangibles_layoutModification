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
int whiteRightHandJointX = 150+whiteSkeletonXincr;
int whiteRightHandJointY = 304;
int whiteLeftHandJointX = whiteRightHandJointX-110;
int whiteLeftHandJointY = 304;
int whiteRightHandEndX = 300+100;
int whiteRightHandEndY = 200;
int whiteLeftHandEndX = 300-200;
int whiteLeftHandEndY = 200;

int whiteSkeletonX = 100+whiteSkeletonXincr;
int whiteSkeletonY = 720/2;

//ANIMATING CHAR
int animatingFaceX = 700;
int animatingFaceY = 720/2;

int yellowJointX;
int jointYellow_x, jointYellow_xL;

int jRx; // joint right hand
int it=0, iter=0;

int bufferArea = 75;

float yellow_x_ = (whiteRightHandEndX-whiteRightHandJointX)+(animatingFaceX+whiteSkeletonXincr);
float yellow_y_ = whiteRightHandEndY-15;

float yellow_xL_ = (animatingFaceX-whiteSkeletonXincr) - (whiteLeftHandJointX - whiteLeftHandEndX);
float yellow_yL_ = whiteRightHandEndY-15;

int jYellow_x_ = animatingFaceX-whiteSkeletonXincr+yellowFaceSize;
int jYellow_xL_ = animatingFaceX-whiteSkeletonXincr;






int whiteHandLength = 150;
int yellowHandLength = 200;

float dx1 = 300+100 - whiteRightHandJointX;
float dy1 = 200 - whiteRightHandJointY;
float dx2 = 300-200 - whiteLeftHandJointX;
float dy2 = 200 - whiteLeftHandJointY;
float angle1_ = atan2(dy1, dx1);  
float angle2_ = atan2(dy2, dx2);  
float angle[], angle1[], angle2[];




