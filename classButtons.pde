int corners = 15;
int buttonInnerHeight = 25;

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
    stroke(0);
    strokeWeight(3);
    noFill();
    //ellipseMode(CORNER); 
    rect(buttonX, buttonY, buttonWidth, buttonHeight, 50);
    //ellipse(buttonX + buttonWidth/2, buttonY + buttonHeight/2, buttonWidth, buttonWidth);
    fill(0);
    textSize(0.7* buttonHeight/2);
    text(buttonText, buttonX + 12, buttonY + (float) 0.65* buttonHeight);
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


  //  public boolean isStopClicked() {
  //
  //    if ((xTouch[0] > buttonX) && (xTouch[0] < (buttonX + buttonWidth))
  //      && (yTouch[0] > buttonY)
  //      && (yTouch[0] < (buttonY + buttonHeight))) {
  //      //if ((x1Touch[0] > x2Touch[0]+5)&&(x1Touch[0] < x2Touch[0]-5)&&(y1Touch[0] < y2Touch[0]-5)&&(y1Touch[0] > y2Touch[0]+5))
  //      if (inHere == true)
  //      {
  //        inHere = false;
  //        return true;
  //      }
  //    }
  //    return false;
  //  }

  public boolean isStopClicked() {

    if ((xTouch[0] > buttonX - buttonHeight) && (xTouch[0] < (buttonX + buttonHeight))
      && (yTouch[0] > buttonY - buttonHeight)
      && (yTouch[0] < (buttonY + buttonHeight))) {
      //if ((x1Touch[0] > x2Touch[0]+5)&&(x1Touch[0] < x2Touch[0]-5)&&(y1Touch[0] < y2Touch[0]-5)&&(y1Touch[0] > y2Touch[0]+5))
      if (inHere == true)
      {
        inHere = false;
        return true;
      }
    }
    return false;
  }

  public boolean isRspClicked() {

    if ((xTouch[0] > buttonX - buttonHeight) && (xTouch[0] < (buttonX + buttonHeight))
      && (yTouch[0] > buttonY - buttonHeight)
      && (yTouch[0] < (buttonY + buttonHeight))) {
      return true;
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
    ellipseMode(CORNER);
    if (buttonClicked == true)
    {
      strokeWeight(3);
      stroke(255, 0, 0);
      
    }
    if (buttonClicked == false)
    {
      strokeWeight(3);
      stroke(0);
      
    }
    fill(animColor[tColor]);
    //rect(buttonX, buttonY, buttonWidth, buttonHeight, corners, corners, corners, corners);
    ellipse(buttonX, buttonY, buttonWidth, buttonHeight);
    if (buttonClicked == true)
    {
      fill(180,110);
      
      ellipse(buttonX, buttonY, buttonWidth, buttonHeight);
    }
  }


  //  public void rp_Draw() {
  //    rectMode(CORNER);
  //    noStroke();
  //    fill(255);
  //    rect(buttonX, buttonY, buttonWidth, buttonHeight, corners, corners, corners, corners);
  //    //ellipse(buttonX + buttonWidth/2, buttonY + buttonWidth/2, buttonWidth, buttonWidth);
  //
  //    fill(0);
  //    textSize(0.5* buttonHeight);
  //    text(buttonText, buttonX + 5, buttonY + (float) 0.65* buttonHeight);
  //  }

  public void rp_Draw() {
    rectMode(CORNER);
    strokeWeight(3);
    if (buttonClicked == true)
      stroke(255, 0, 0);
    if (buttonClicked == false)
      stroke(0);
    fill(255);
    rect(buttonX, buttonY, buttonWidth, buttonHeight, 50);
    //ellipse(buttonX + buttonWidth/2, buttonY + buttonWidth/2, buttonWidth, buttonWidth);

    fill(0);
    textSize(0.4 * buttonHeight);
    text(buttonText, buttonX + 12, buttonY + (float) 0.65* buttonHeight);
  }

  public void drawRoundButtons(int i) {
    ellipseMode(CENTER);
    strokeWeight(3);
    if (buttonClicked == true)
      stroke(255, 0, 0);
    if (buttonClicked == false)
      stroke(0);
    fill(255);
    ellipse(buttonX, buttonY, buttonHeight, buttonHeight);

    noStroke();
    fill(0);
    if (i == 0)
    {
      ellipse(buttonX, buttonY, buttonInnerHeight, buttonInnerHeight); //record
    }
    else if (i == 1)
    {
      rectMode(CENTER);
      rect(buttonX, buttonY, buttonInnerHeight/2 + buttonInnerHeight/4, buttonInnerHeight/2 + buttonInnerHeight/4); //stop
    }
    else if (i == 2)
    {
      triangle(buttonX - buttonInnerHeight/2 + 5, buttonY - buttonInnerHeight/2, buttonX - buttonInnerHeight/2 + 5, buttonY + buttonInnerHeight/2, buttonX + buttonInnerHeight/2+3, buttonY);
      //ellipse(buttonX, buttonY, buttonHeight, buttonHeight); //play
    }
  }
}

