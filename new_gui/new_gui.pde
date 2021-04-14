/*
  Gui by augustus soto
*/
import controlP5.*;

//Variable definitions and intializations
ControlP5 angle_input;
ControlP5 buttons;
String textValue = "";

void setup() 
  {
    //Size, fonts, window resize
    size(720,540);
    PFont font = createFont("arial",15);
    surface.setResizable(true);
    buttons = new ControlP5(this);
    angle_input = new ControlP5(this);
    
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
       .setAutoClear(true) //auto set to true
       .setFocus(true) //no clue wtf this does
       .setColor(color(255,0,0))
       ;
    textFont(font);

  }
  
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
      println("reset pressed - ", theValue);
    }
    
    
    
    /* example code
  import controlP5.*;
 
ControlP5 cp5;
 
void setup() {
  size(400, 600);
 
  cp5 = new ControlP5(this);
 
  cp5.addButton("Button")
    .setValue(1)
    .setPosition(100, 100)
    .setSize(200, 19)
    ;
}
void draw() {
  background(255);
}

void Button(float theValue) {
  println("got a button press",theValue);
}
    */



void draw() 
  {
    background(0);
    fill(255);
    runningTimer();
  }

//from a button that clears clear button
public void clear() 
  {
    angle_input.get(Textfield.class,"textValue").clear();
  }



void controlEvent(ControlEvent theEvent) 
  {
    if(theEvent.isAssignableFrom(Textfield.class)) 
      {
        println("controlEvent: accessing a string from da controller '"
                +theEvent.getName()+"': "
                +theEvent.getStringValue()
                );
      }
  }


//=================================TIMER===============================//
public void input(String theText) 
  {
    // automatically receives results from controller input
    println("a textfield event for controller 'input' : "+theText);
  }

public void runningTimer()
  {
    int s = second(); 
    int m = minute(); 
    int h = hour(); 
    fill(255);
    text("System time: " + h + ":" + m + ":" + s, 550,25);
  }
  
