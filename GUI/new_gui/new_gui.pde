/*
 * Gui by augustus soto
 */

import controlP5.*;

//Processing definitions
StringList animals;
StringList degrees;
int deg_angle;
String update_text = "";
String update_degtext = "";
PrintWriter output;
String textValue = "";

//ControlP5 definitions
ControlP5 angle_input;
ControlP5 buttons;
ControlP5 logz;
Textarea displayLogs;
ControlP5 degValues;
Textarea displayDegrees;


//========================SETUP==========================//
void setup() 
  {
    size(720,540);
    PFont font = createFont("arial",15);
    surface.setResizable(true);
    
    output = createWriter("degrees.txt");
    
    //INITIALIZE
 
    animals = new StringList();
    degrees = new StringList();
    buttons = new ControlP5(this);
    angle_input = new ControlP5(this);
    logz = new ControlP5(this);
    degValues = new ControlP5(this);

    //BUTTONS
    buttons.addButton("Export")
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
   
   //LOG TEXT
    displayLogs = logz.addTextarea("logs")
                    .setPosition(250,40)
                    .setSize(290,200)
                    .setFont(createFont("arial", 16))
                    .setColor(color(128))
                    .setColorBackground(color(255,100))
                    .setColorForeground(color(255,100))
                   // .setText(update_text);
                    ;
    
    //DEGREE TEXT   
    displayDegrees = degValues.addTextarea("my_degrees")
                    .setPosition(560, 40)
                    .setSize(140,200)
                    .setFont(createFont("arial", 16))
                    .setColor(color(128))
                    .setColorBackground(color(255,100))
                    .setColorForeground(color(255,100))
                    .setText("test")
                    ;
    textFont(font);
  }
  
//========================DRAW==========================//
void draw() 
  {
    background(0);
    fill(255);
    
    //System clock
    runningTimer();
    
    //Text area updates
    displayLogs.setText(update_text);
    displayDegrees.setText(update_degtext);
    
    //Arrow on screen
    fill(130);
    rect(250,250,200,200);
    drawArrow(350,350, 80, deg_angle);
  }

//===========================FUNCTIONS============================//
/* Every function activates when the button correseponding with it's name is
 * pressed. This is how ControlP5 works.
 *
 */
  void Export(float theValue) 
    {
      if (degrees.size() > 0)
        {
        for (int i = 0; i < degrees.size(); i++)
          {
            output.println(degrees.get(i));
          }
          output.flush();
          output.close();
          exit();
        }
    }

  void Logs(float theValue)
    {
      //reset animal log
      animals.clear();
      update_text = ("");
      displayLogs.setText(update_text);
    }

  void Angles(float theValue)
    {
      degrees.clear();
      update_degtext = ("");
      displayDegrees.setText(update_degtext);
    }
  void Reset(float theValue)
    {
      println("reset pressed");
      
      //reset animal log
      animals.clear();
      update_text = ("");
      displayLogs.setText(update_text);
      
      //Reset degrees
      degrees.clear();
      update_degtext = ("");
      displayDegrees.setText(update_degtext);
      
      //Reset arrow
      deg_angle = 0;
      drawArrow(350,350, 80, deg_angle);
    }
  void INPUT(String raw_angle)
    {
      //deg_angle used for arrow
      float rad_angle = Float.valueOf(raw_angle);
      deg_angle = int((180/3.14) * rad_angle);
      
      //updating animal and degree lists
      updateAnimals(deg_angle);
      updateDegrees(deg_angle);
      
      //println("degree int value is - ", deg_angle);
      //println("input registered", raw_angle);
      //println(update_degtext);
    }

  void updateAnimals(Integer degree)
    {
      animals.append("Animal ID found at " + String.valueOf(degree));
      update_text = String.join(", ", animals);
    }

  void updateDegrees(Integer degree)
    {
     degrees.append(String.valueOf(degree));
     update_degtext = String.join(", ", degrees);
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