import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.core.PApplet; 
import g4p_controls.*; 
import peasy.*; 
import java.awt.Font; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class gui_draft extends PApplet {

// Need G4P library


// You can remove the PeasyCam import if you are not using
// the GViewPeasyCam control or the PeasyCam library.




String typing = "";
String saved = "";
String sentence = "";
float pi = 3.141526535f;
boolean startDraw = false;
StringList animals;


float drawDegree = 270;

public void setup()
  {
    animals = new StringList();
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
/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

import processing.core.PApplet;

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void button1_click1(GButton source, GEvent event) { //_CODE_:button1:559662:
  arrowWindow.setVisible(true);
} //_CODE_:button1:559662:

public void textfield1_change1(GTextField source, GEvent event) { //_CODE_:textfield1:484934:
    //historyLog.appendText("textfield1 - GTextField >> GEvent." + event + " @ " + millis());keyPressed(); 
    if (event == GEvent.ENTERED)
    {
      //
      sentence = source.getText();
      float radian_value = Float.parseFloat(sentence);
      float degrees = radian_value * 180 / pi;
      
      //Trying to draw arrow
      drawDegree = degrees - 90;
      //startDraw = true;
      
      //Appending text to text areas
      historyLog.appendText(round(degrees) + " degrees");
      animalLog.appendText("Animal {ID} found. Time: " + timer());
      
      animals.append("Animal {ID} found. Time: " + timer());
      
      sentence = "";
      source.setText("");
    }
  } //_CODE_:textfield1:484934:

public void textarea_historyLog(GTextArea source, GEvent event) { //_CODE_:historyLog:505900:
    println("textarea1 - GTextArea >> GEvent." + event + " @ " + millis());
} //_CODE_:historyLog:505900:

public void textarea_animalLog(GTextArea source, GEvent event) { //_CODE_:animalLog:352168:
  println("textarea1 - GTextArea >> GEvent." + event + " @ " + millis());
} //_CODE_:animalLog:352168:

public void button_clearAngles(GButton source, GEvent event) { //_CODE_:clearAngles:645445:
  println("clearAngles - GButton >> GEvent." + event + " @ " + millis());
  historyLog.setText("");
} //_CODE_:clearAngles:645445:

public void button_clearLogs(GButton source, GEvent event) { //_CODE_:clearLogs:994499:
  println("clearLogs - GButton >> GEvent." + event + " @ " + millis());
  animalLog.setText("");
} //_CODE_:clearLogs:994499:

public void button_resetArrow(GButton source, GEvent event) { //_CODE_:resetArrow:902490:
  println("resetArrow - GButton >> GEvent." + event + " @ " + millis());
  drawDegree = 270;
} //_CODE_:resetArrow:902490:

synchronized public void arrow_Window(PApplet appc, GWinData data) { //_CODE_:arrowWindow:978758:
  } //_CODE_:arrowWindow:978758:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("GUI WIP");
  button1 = new GButton(this, 10, 40, 80, 30);
  button1.setTextAlign(GAlign.LEFT, GAlign.MIDDLE);
  button1.setText("New Window");
  button1.addEventHandler(this, "button1_click1");
  textfield1 = new GTextField(this, 10, 10, 120, 20, G4P.SCROLLBARS_NONE);
  textfield1.setOpaque(true);
  textfield1.addEventHandler(this, "textfield1_change1");
  historyLog = new GTextArea(this, 100, 40, 270, 193, G4P.SCROLLBARS_VERTICAL_ONLY | G4P.SCROLLBARS_AUTOHIDE);
  historyLog.setOpaque(true);
  historyLog.addEventHandler(this, "textarea_historyLog");
  label1 = new GLabel(this, 400, 10, 80, 20);
  label1.setText("Log");
  label1.setOpaque(false);
  animalLog = new GTextArea(this, 400, 40, 280, 485, G4P.SCROLLBARS_VERTICAL_ONLY | G4P.SCROLLBARS_AUTOHIDE);
  animalLog.setOpaque(true);
  animalLog.addEventHandler(this, "textarea_animalLog");
  clearAngles = new GButton(this, 9, 81, 80, 30);
  clearAngles.setText("Clear angles");
  clearAngles.addEventHandler(this, "button_clearAngles");
  clearLogs = new GButton(this, 10, 120, 80, 30);
  clearLogs.setText("Clear logs");
  clearLogs.addEventHandler(this, "button_clearLogs");
  resetArrow = new GButton(this, 10, 160, 80, 30);
  resetArrow.setText("Reset_arrow");
  resetArrow.addEventHandler(this, "button_resetArrow");
  arrowWindow = GWindow.getWindow(this, "New window", 0, 0, 540, 540, JAVA2D);
  arrowWindow.noLoop();
  arrowWindow.setActionOnClose(G4P.CLOSE_WINDOW);
  arrowWindow.addDrawHandler(this, "arrow_Window");
  arrowWindow.loop();
}

// Variable declarations 
// autogenerated do not edit
GButton button1; 
GTextField textfield1; 
GTextArea historyLog; 
GLabel label1; 
GTextArea animalLog; 
GButton clearAngles; 
GButton clearLogs; 
GButton resetArrow; 
GWindow arrowWindow;
  public void settings() {  size(720, 540, JAVA2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "gui_draft" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
