/*
 * Gui by augustus soto
 * Github: 
 */
//More info about ControlP5 documentation on the GitHub.
import controlP5.*;
import processing.serial.*;

//=================================VARIABLES==================================//

//Processing definitions
StringList animals;
StringList degrees;
String update_text = "";
String update_degtext = "";
String textValue = "";
PrintWriter output;
int deg_angle;
int count = 0;
PWindow win;

//ControlP5 definitions
ControlP5 angle_input;
ControlP5 buttons;
ControlP5 logz;
Textarea displayLogs;
ControlP5 degValues;
Textarea displayDegrees;


//====================================SETUP===================================//
void setup() 
  {
    //PROCESSING 3 INITIALIZATIONS
    size(720,540);
    PFont font = createFont("arial",15);
    surface.setResizable(true);
    output = createWriter("degrees.txt"); //File I/O

    //INITIALIZING CONTROL P5
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
    buttons.addButton("Window")
      .setFont(font)
      .setValue(100) //this is for values to be assigned if desired
      .setPosition(20,240)
      .setSize(200,25)
      ;
   //INPUT TEXT
    angle_input.addTextfield("INPUT")
      .setPosition(20,20)
      .setSize(200,30) //x, y size
      .setFont(font)
      .setAutoClear(true) //auto set to true, not necessary to call
      .setFocus(true) //look up documentation
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

//====================================DRAW====================================//
void draw()
/*
 * Draw is a looping function that repeats over and over. The main important 
 * functions that are looping are update_degtext and update_text, which control
 * what text is shown in the textareas.
 */
  {
  //Basic Processing initializations
  background(0);
  fill(255);

  //System clock
  runningTimer(); //See GitHub for issues

  //Updating textareas
  displayLogs.setText(update_text);
  displayDegrees.setText(update_degtext);

  //Arrow on screen
  fill(130);
  rect(250,250,200,200);
  drawArrow(350,350, 80, deg_angle);
  }

//=============================CUSTOM FUNCTIONS===============================//
/* 
 * Detailed documentation is included in the GitHub wiki. Minor comments are 
 * made in each to give a brief synopsis. 
 *
 * Note:
 * float theValue can be inserted in function arguments. .setValue() in
 * initialization controls this.
 */

void Export()
  /*
  * Exports values stored in StringList degrees into a text file seperated by 
  * lines. 
  */
  {
  if (degrees.size() > 0) //Making sure list not 0
    {
    for (int i = 0; i < degrees.size(); i++) //All items in list
      {
      output.println(degrees.get(i)); //Write to each line in file
      }
    output.flush();
    output.close();
    exit(); //this is optional; exit() closes the GUI
    }
  }

void Window()
 /*
  * Opens a pop-up window. Pop up window properties are controlled in the class
  * located at the bottom of the sketch. See GitHub issues page for issues with
  * resizing the popup window.
  */
  {
  count += 1; //See GitHub issues page
  if (count == 2)
    {
    if(win == null) win = new PWindow();
    count = 1;
    }
  }

void Logs()
/* 
 * Clears text in logs textarea.
 *
 */
  {
  //Clears animal log and clears displayLogs textarea
  animals.clear();
  update_text = ("");
  displayLogs.setText(update_text);
  }

void Angles()
 /*
  * Clears text in degrees textarea and list.
  */
  {
    degrees.clear();
    update_degtext = ("");
    displayDegrees.setText(update_degtext);
  }

void Reset()
/*
 * Resets all textareas and StringLists.
 */
  {
    //Reset animal log
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
/*
 * Takes input from user and updates animal and degree list with radian angles.
 * 
 * Args:
 *     (String) raw_angle: raw angle in radians
 */
    {
      //deg_angle used for arrow
      float rad_angle = Float.valueOf(raw_angle);
      deg_angle = int((180/3.14) * rad_angle);

      //updating animal and degree lists
      updateAnimals(deg_angle);
      updateDegrees(deg_angle);
    }

void updateAnimals(Integer degree)
/*
 * Updates animals list with hypothetical animal id. Not implemented yet.
 *
 * Args:
 *     (Integer) degree: degree value of angle
 */ 
    {
      animals.append("Animal ID found at " + String.valueOf(degree));
      update_text = String.join(", ", animals);
    }

void updateDegrees(Integer degree)
/*
 * Updates degree list with degree value.
 *
 * Args:
 *     (Integer) degree: degree value of radian.
 */
    {
     degrees.append(String.valueOf(degree));
     update_degtext = String.join(", ", degrees);
    }
  
public void drawArrow(int cx, int cy, int len, float angle)
/*
 * Updates arrow that points in the direction of the animal.
 *
 * Args:
 *     (int) cx: initial x position.
 *     (int) cy: initial y position.
 *     (int) len: length of arrow.
 *     (float) angle: angle to rotate arrow.
 */
  {
    pushMatrix();
    translate(cx, cy);
    rotate(radians(angle));
    line(0,0,len, 0);
    line(len, 0, len - 8, -8);
    line(len, 0, len - 8, 8);
    popMatrix();
  }

public void runningTimer()
/*
 * Timer that runs in the top right corner. Runs off OS system clock.
 */
  {
    int s = second(); 
    int m = minute(); 
    int h = hour(); 
    fill(255);
    text("System time: " + h + ":" + m + ":" + s, 550,25);
  }

//==================================POP-UP WINDOW=============================//

 /* This class definition is copy/paste friendly.
  */

//----------------------------------------------------------------------------//
class PWindow extends PApplet
{
  PWindow()
  {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }
//----------------------------------------------------------------------------//
  Serial recvPort;
  int portValue;
  ControlP5 buttons;
  ControlP5 serialInfo;
  Textarea displaySerial;
  void setup() 
    {
      //Basic Setup
      PFont font = createFont("arial",15);
      buttons = new ControlP5(this);
      serialInfo = new ControlP5(this);

      displaySerial = serialInfo.addTextarea("Info")
        //.setText("Test")
        .setFont(font)
        .setPosition(150,20)
        .setSize(300,200)
        .setColor(color(128))
        .setColorBackground(color(255,100))
        .setColorForeground(color(255,100))
        ;
      buttons.addButton("demo")
        .setFont(font)
        .setPosition(20,20)
        .setSize(100,30)
        .setColorBackground(color(255,100))
        .setColorForeground(color(255,100))
        ;
    
      background(150);
      surface.setResizable(true);
  

      //Serial Port Information
      /*This generally opens COM1, which is where the device is connected. This
       * could potentially be different, so change [num] if necessary.    
       */
      String portName = Serial.list()[0]; //If nothing recieved, change [num] to 1,2,3, etc
      recvPort = new Serial(this, portName, 9600);
    }

  void draw()
    {
      background(0);
      ellipse(mouseX, mouseY, 10, 10); //Tracks mouse
      rect(20,60,100,30);
      recieveSerial();
    }

  void recieveSerial()
    {
     if (recvPort.available() > 0)      //If data is available...
        {
          portValue = recvPort.read();   //Read and store value
        }
      if (portValue == 0)
        {
          displaySerial.setText("Reading serial...");
          fill(0);
        }
      else
        {
          displaySerial.setText("Test working!");
          fill(255);
        }
    }
  void demo()
    {
      println("demo button was pressed");
      fill(255);
    }
  void exit()
  /*
   * This function makes it so when the window is closed, the main GUI window
   * does not close.
   */
    {
      dispose(); //basically means close()
      win = null; //prevents entire GUI from closing
    }
}
