int corners = 15;

color clickedColor = color(255, 0, 0);
color unClickedColor = color(0, 255, 180);

color[] animColor = {
  color(255, 255, 0)/*yellow*/, color(125, 193, 255)/*pink*/, color(184, 20, 103)/*blue*/
};

public class MyButton {
  color cColor;
  float buttonX, buttonY, buttonWidth, buttonHeight;
  String buttonText;
  boolean buttonOn;
  boolean buttonClicked;
  boolean buttonEnabled = false;
  int colorPicker;
  int i;
  color tColor;
  // boolean clicked = false;

  public MyButton(float xx, float yy, float ww, float hh, String text) {
    buttonX = xx;
    buttonY = yy;
    buttonWidth = ww;
    buttonHeight = hh;
    buttonText = text;
    // Interactive.add(this); // add this to GUIDO manager, important!
  }

  public MyButton(float xx, float yy, float ww, float hh, int i) {
    buttonX = xx;
    buttonY = yy;
    buttonWidth = ww;
    buttonHeight = hh;
    tColor = i;
    // Interactive.add(this); // add this to GUIDO manager, important!
  }

  public void clicked() {
    buttonClicked = true;
    cColor = clickedColor;
  }

  public void unClicked() {
    buttonClicked = false;
    cColor = unClickedColor;
  }

  public void draw() {
    rectMode(CORNER);
    if (buttonClicked == true)
      fill(clickedColor);
    if (buttonClicked == false)
      fill(unClickedColor);
    noStroke();
    rect(buttonX, buttonY, buttonWidth, buttonHeight, corners, corners, corners, corners);

    fill(255);
    textSize(0.5* buttonHeight);
    text(buttonText, buttonX + 5, buttonY + (float) 0.65* buttonHeight);
  }

  public boolean isClicked() {

    if ((xTouch[0] > buttonX) && (xTouch[0] < (buttonX + buttonWidth))
      && (yTouch[0] > buttonY)
      && (yTouch[0] < (buttonY + buttonHeight))) {
      return true;
    }
    else 
      return false;
  }


  public boolean isStopClicked() {

    if ((xTouch[0] > buttonX) && (xTouch[0] < (buttonX + buttonWidth))
      && (yTouch[0] > buttonY)
      && (yTouch[0] < (buttonY + buttonHeight))) {
      //if ((x1Touch[0] > x2Touch[0]+5)&&(x1Touch[0] < x2Touch[0]-5)&&(y1Touch[0] < y2Touch[0]-5)&&(y1Touch[0] > y2Touch[0]+5))
      if (inHere == true)
      {
        inHere = false;
        println("IN STOP CLICKED");
        print(x1Touch[0] + "        ");
        print(x2Touch[0] + "        ");
        println(y1Touch[0] + "        ");
        print(y2Touch[0] + "        ");
        return true;
      }
    }
    return false;
  }


  public void templateClicked() {
    buttonClicked = true;
    //stroking = true;
  }

  public void templateUnClicked() {
    buttonClicked = false;
    //stroking = false;
  }

  public void templateDraw() {
    rectMode(CORNER);
    if (buttonClicked == true)
    {
      strokeWeight(5);
      stroke(255, 0, 0);
    }
    if (buttonClicked == false)
      noStroke();
    fill(animColor[tColor]);
    rect(buttonX, buttonY, buttonWidth, buttonHeight, corners, corners, corners, corners);
  }


  public void rp_Draw() {
    rectMode(CORNER);
    noStroke();
    fill(255);
    rect(buttonX, buttonY, buttonWidth, buttonHeight, corners, corners, corners, corners);

    fill(0);
    textSize(0.5* buttonHeight);
    text(buttonText, buttonX + 5, buttonY + (float) 0.65* buttonHeight);
  }
}

