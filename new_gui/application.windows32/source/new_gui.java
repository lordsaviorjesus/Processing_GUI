import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class new_gui extends PApplet {

/*
  Gui by augustus soto
*/




StringList animals;
int deg_angle;

ControlP5 angle_input;
ControlP5 buttons;
ControlP5 logz;
Textarea displayLogs;



String textValue = "";

public void setup() 
  {
    //Size, fonts, window resize
    
    PFont font = createFont("arial",15);
    surface.setResizable(true);
 
    animals = new StringList();
    buttons = new ControlP5(this);
    angle_input = new ControlP5(this);
    logz = new ControlP5(this);

    //BUTTONS
    buttons.addButton("Window")
    .setFont(font)
    .setValue(100)
    .setPosition(20,80)
    .setSize(200,25)
    ;
    
    buttons.addButton("Angles")
    .setFont(font)
    .setValue(100)
    .setPosition(20,120)
    .setSize(200,25)
    ;
    
    buttons.addButton("Logs")
    .setFont(font)
    .setValue(100)
    .setPosition(20,160)
    .setSize(200,25)
    ;
    
     buttons.addButton("Reset")
    .setFont(font)
    .setValue(100)
    .setPosition(20,200)
    .setSize(200,25)
    ;

   //INPUT TEXT
    angle_input.addTextfield("INPUT")
       .setPosition(20,20)
       .setSize(200,30) //x, y size
       .setFont(font)
       .setAutoClear(true) //auto set to true, not necessary to call
       .setFocus(true) //no clue wtf this does
       .setColor(color(255,0,0))
       ;
  //Text Area
    displayLogs = logz.addTextarea("logs")
                    .setPosition(250,20)
                    .setSize(290,200)
                    .setFont(createFont("arial", 16))
                    .setColor(color(128))
                    .setColorBackground(color(255,100))
                    .setColorForeground(color(255,100));
                    ;
 
    textFont(font);
  }
/*
String printAnimals(StringList animals)
  {
    String mystring = "";
    for (int i = 0; i < animals.size(); i++)

      {
       mystring = mystring + " " + animals.get(i);
      }
    return mystring;
  }
*/
public void draw() 
  {
    background(0);
    fill(255);
    runningTimer();
    //displayLogs.setText(printAnimals(animals));
 
    
  }

//===========================Functions============================//
  public void Window(float theValue) 
    {
      println("window pressed - ", theValue);
    }
  public void Logs(float theValue)
    {
      println("Logs pressed - ", theValue);
    }
  public void Angles(float theValue)
    {
      println("angles pressed - ", theValue);
    }
  public void Reset(float theValue)
    {
      println("reset pressed - ", theValue);
    }
  public void INPUT(String raw_angle)
    {
      println("input registered", raw_angle);
      float rad_angle = Float.valueOf(raw_angle);
      deg_angle = PApplet.parseInt((180/3.14f) * rad_angle);
      println("degree int value is - ", deg_angle);
      updateAnimals(deg_angle);
    }

  public void updateAnimals(Integer degree)
    {
      animals.append("Animal ID found at " + String.valueOf(degree));
      println(animals);
    }

  
//=================================ARROW===============================//

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


//=================================TIMER===============================//

public void runningTimer()
  {
    int s = second(); 
    int m = minute(); 
    int h = hour(); 
    fill(255);
    text("System time: " + h + ":" + m + ":" + s, 550,25);
  }








//=================================IGNORE===============================//
  /*
    //from a button that clears clear button
public void clear() 
  {
    angle_input.get(Textfield.class,"textValue").clear();
  }

//Detects entire textfield class

void controlEvent(ControlEvent theEvent) 
  {
    if(theEvent.isAssignableFrom(Textfield.class)) 
      {
        println("controlEvent: accessing a string from da controller '"
                +theEvent.getName() + "': " + theEvent.getStringValue());
      }
  }
*/
  public void settings() {  size(720,540); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "new_gui" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
