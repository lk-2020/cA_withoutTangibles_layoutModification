// IMPORTS
import android.view.MotionEvent;

//VARIABLES MULTI TOUCH ANDROID
int TouchEvents;
float xTouch[], playX;
float yTouch[], playY;

float x1Touch[], x2Touch[];
float y1Touch[], y2Touch[];

int currentPointerId = 0;

public class xandy
{
  public double x;
  public double y;
}

int test = 0 ;

public boolean surfaceTouchEvent(MotionEvent event) {
  xandy centroid =  new xandy();
  xandy centroidInter =  new xandy();
  // Number of places on the screen being touched:
  TouchEvents = event.getPointerCount();
  //println("TouchEvents  "+TouchEvents);
  // If no action is happening, listen for new events else 
  for (int i = 0; i < TouchEvents; i++) {
    int pointerId = event.getPointerId(i);

    xTouch[pointerId] = event.getX(i); 
    yTouch[pointerId] = event.getY(i);
    
    if (TouchEvents == 1)
    {
      if (test%2==0)
      {
        x2Touch[pointerId] = event.getX(i); 
        y2Touch[pointerId] = event.getY(i);
      }
      else
      {
        x1Touch[pointerId] = event.getX(i); 
        y1Touch[pointerId] = event.getY(i);
      }
      test++;
      
      if(test > 1)
      {
        test = 0;
      }
    }
    
    
    float siz = event.getSize(i);
    //println("pointerId  "+pointerId);
  }

  // ACTION_DOWN 
  if (event.getActionMasked() == 0 ) {
    print("Initial action detected. (ACTION_DOWN)");
    print("Action index: " +str(event.getActionIndex()));
  } 
  // ACTION_UP 
  else if (event.getActionMasked() == 1) {
    print("ACTION_UP");
    print("Action index: " +str(event.getActionIndex()));
  }
  //  ACTION_POINTER_DOWN 
  else if (event.getActionMasked() == 5) {
    print("Secondary pointer detected: ACTION_POINTER_DOWN");
    print("Action index: " +str(event.getActionIndex()));
  }
  // ACTION_POINTER_UP 
  else if (event.getActionMasked() == 6) {
    print("ACTION_POINTER_UP");
    print("Action index: " +str(event.getActionIndex()));
  }
  // 
  else if (event.getActionMasked() == 4) {
  }

  // If you want the variables for motionX/motionY, mouseX/mouseY etc.
  // to work properly, you'll need to call super.surfaceTouchEvent().
  return super.surfaceTouchEvent(event);
}


