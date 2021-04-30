/*
  Gui by augustus soto
*/


import controlP5.*;

StringList animals;
int deg_angle;
String update_text = "";

ControlP5 angle_input;
ControlP5 buttons;
ControlP5 logz;
Textarea displayLogs;
ControlP5 degValues;
Textarea displayDegrees;

String textValue = "";

void setup() 
  {
    //Size, fonts, window resize
    size(720,540);
    PFont font = createFont("arial",15);
    surface.setResizable(true);
 
    degValues = new ControlP5(this);
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
                    .setPosition(250,40)
                    .setSize(290,200)
                    .setFont(createFont("arial", 16))
                    .setColor(color(128))
                    .setColorBackground(color(255,100))
                    .setColorForeground(color(255,100))
                   // .setText(update_text);
                    ;
                    
    displayDegrees = degValues.addTextarea("degrees")
                    .setPosition(560, 40)
                    .setSize(140,200)
                    .setFont(createFont("arial", 16))
                    .setColor(color(128))
                    .setColorBackground(color(255,100))
                    .setColorForeground(color(255,100))
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
void draw() 
  {
    background(0);
    fill(255);
    runningTimer();
    displayLogs.setText(update_text);
    //displayLogs.setText(printAnimals(animals));
 
    
  }

//===========================Functions============================//
  void Window(float theValue) 
    {
      println("window pressed - ", theValue);
    }
  void Logs(float theValue)
    {
      println("Logs pressed - ", theValue);
    }
  void Angles(float theValue)
    {
      println("angles pressed - ", theValue);
    }
  void Reset(float theValue)
    {
      update_text = ("");
      displayLogs.setText(update_text);
      //println("reset pressed - ", theValue);
    }
  void INPUT(String raw_angle)
    {
      println("input registered", raw_angle);
      float rad_angle = Float.valueOf(raw_angle);
      //deg_angle used for arrow
      deg_angle = int((180/3.14) * rad_angle);
      println("degree int value is - ", deg_angle);
      updateAnimals(deg_angle);
    }

  void updateAnimals(Integer degree)
    {
      animals.append("Animal ID found at " + String.valueOf(degree));
      update_text = String.join(", ", animals);
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
