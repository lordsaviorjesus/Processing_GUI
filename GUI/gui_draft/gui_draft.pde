// Need G4P library
import processing.core.PApplet;
import g4p_controls.*;
// You can remove the PeasyCam import if you are not using
// the GViewPeasyCam control or the PeasyCam library.

import java.awt.Font;

String typing = "";
String saved = "";
String sentence = "";
float pi = 3.141526535;
boolean startDraw = false;
StringList animals;


float drawDegree = 270;

public void setup()
  {
    animals = new StringList();

    size(720, 540, JAVA2D); //maybe java 2d better?
    surface.setResizable(true);

   
    createGUI();
    customGUI();
  }

public void draw()
  {
   background(200,200,200);
   runningTimer();
   fill(255,255,255);
   rect(100,250,270,270);
   drawArrow(235,385,120,drawDegree);
  }


public String timer()
  {
    String my_string = "";
    int s = second(); 
    int m = minute(); 
    int h = hour(); 
    my_string = h+":"+m+":"+s;
    return my_string;
  }


public void runningTimer()
  {
    int s = second(); 
    int m = minute(); 
    int h = hour(); 
    fill(0);
    text("System time: " + h + ":" + m + ":" + s, 550,25);
  }


public void drawArrow(int cx, int cy, int len, float angle)
{
  pushMatrix();
  translate(cx, cy);
  rotate(radians(angle));
  line(0,0,len, 0);
  line(len, 0, len - 8, -8);
  line(len, 0, len - 8, 8);
  popMatrix();
}

public void customGUI()
  {
  // Use this method to add additional statements
  // to customise the GUI controls
  arrowWindow.setVisible(false); //pop up window, controlled in button event handler

  }
