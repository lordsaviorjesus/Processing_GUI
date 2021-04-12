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
    buttons.addButton("New Window")
    .setFont(font)
    .setValue(100)
    .setPosition(20,80)
    .setSize(200,25)
    ;
    
    buttons.addButton("Clear angles")
    .setFont(font)
    .setValue(100)
    .setPosition(20,120)
    .setSize(200,25)
    ;
    
    buttons.addButton("Clear Logs")
    .setFont(font)
    .setValue(100)
    .setPosition(20,160)
    .setSize(200,25)
    ;
    
     buttons.addButton("Reset arrow")
    .setFont(font)
    .setValue(100)
    .setPosition(20,200)
    .setSize(200,25)
    ;
    
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
  
    //INPUT TEXT
    angle_input.addTextfield("INPUT")
       .setPosition(20,20)
       .setSize(200,30) //x, y size
       .setFont(font)
       .setAutoClear(true) //auto set to true
       .setFocus(true) //no clue wtf this does
       .setColor(color(255,0,0))
       ;
       
       
    /*
     * A bang triggers an event that can be received by a function named after the bang.
     * By default a bang is triggered when pressed, this can be changed to 'release' 
     * using theBang.setTriggerEvent(Bang.RELEASE).

    angle_input.addBang("clear") //goes to clear function
       .setPosition(240,170)
       .setSize(80,40)
       .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER)
       ;    
     */

    textFont(font);
  }

void draw() 
  {
    background(0);
    fill(255);
    runningTimer();
  }

public void clear() 
  {
    angle_input.get(Textfield.class,"textValue").clear();
  }

void controlEvent(ControlEvent theEvent) 
  {
    if(theEvent.isAssignableFrom(Textfield.class)) 
      {
        println("controlEvent: accessing a string from controller '"
                +theEvent.getName()+"': "
                +theEvent.getStringValue()
                );
      }
  }

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
/*
a list of all methods available for the Textfield Controller
use ControlP5.printPublicMethodsFor(Textfield.class);
to print the following list into the console.

You can find further details about class Textfield in the javadoc.

Format:
ClassName : returnType methodName(parameter type)


controlP5.Controller : CColor getColor() 
controlP5.Controller : ControlBehavior getBehavior() 
controlP5.Controller : ControlWindow getControlWindow() 
controlP5.Controller : ControlWindow getWindow() 
controlP5.Controller : ControllerProperty getProperty(String) 
controlP5.Controller : ControllerProperty getProperty(String, String) 
controlP5.Controller : ControllerView getView() 
controlP5.Controller : Label getCaptionLabel() 
controlP5.Controller : Label getValueLabel() 
controlP5.Controller : List getControllerPlugList() 
controlP5.Controller : Pointer getPointer() 
controlP5.Controller : String getAddress() 
controlP5.Controller : String getInfo() 
controlP5.Controller : String getName() 
controlP5.Controller : String getStringValue() 
controlP5.Controller : String toString() 
controlP5.Controller : Tab getTab() 
controlP5.Controller : Textfield addCallback(CallbackListener) 
controlP5.Controller : Textfield addListener(ControlListener) 
controlP5.Controller : Textfield addListenerFor(int, CallbackListener) 
controlP5.Controller : Textfield align(int, int, int, int) 
controlP5.Controller : Textfield bringToFront() 
controlP5.Controller : Textfield bringToFront(ControllerInterface) 
controlP5.Controller : Textfield hide() 
controlP5.Controller : Textfield linebreak() 
controlP5.Controller : Textfield listen(boolean) 
controlP5.Controller : Textfield lock() 
controlP5.Controller : Textfield onChange(CallbackListener) 
controlP5.Controller : Textfield onClick(CallbackListener) 
controlP5.Controller : Textfield onDoublePress(CallbackListener) 
controlP5.Controller : Textfield onDrag(CallbackListener) 
controlP5.Controller : Textfield onDraw(ControllerView) 
controlP5.Controller : Textfield onEndDrag(CallbackListener) 
controlP5.Controller : Textfield onEnter(CallbackListener) 
controlP5.Controller : Textfield onLeave(CallbackListener) 
controlP5.Controller : Textfield onMove(CallbackListener) 
controlP5.Controller : Textfield onPress(CallbackListener) 
controlP5.Controller : Textfield onRelease(CallbackListener) 
controlP5.Controller : Textfield onReleaseOutside(CallbackListener) 
controlP5.Controller : Textfield onStartDrag(CallbackListener) 
controlP5.Controller : Textfield onWheel(CallbackListener) 
controlP5.Controller : Textfield plugTo(Object) 
controlP5.Controller : Textfield plugTo(Object, String) 
controlP5.Controller : Textfield plugTo(Object[]) 
controlP5.Controller : Textfield plugTo(Object[], String) 
controlP5.Controller : Textfield registerProperty(String) 
controlP5.Controller : Textfield registerProperty(String, String) 
controlP5.Controller : Textfield registerTooltip(String) 
controlP5.Controller : Textfield removeBehavior() 
controlP5.Controller : Textfield removeCallback() 
controlP5.Controller : Textfield removeCallback(CallbackListener) 
controlP5.Controller : Textfield removeListener(ControlListener) 
controlP5.Controller : Textfield removeListenerFor(int, CallbackListener) 
controlP5.Controller : Textfield removeListenersFor(int) 
controlP5.Controller : Textfield removeProperty(String) 
controlP5.Controller : Textfield removeProperty(String, String) 
controlP5.Controller : Textfield setArrayValue(float[]) 
controlP5.Controller : Textfield setArrayValue(int, float) 
controlP5.Controller : Textfield setBehavior(ControlBehavior) 
controlP5.Controller : Textfield setBroadcast(boolean) 
controlP5.Controller : Textfield setCaptionLabel(String) 
controlP5.Controller : Textfield setColor(CColor) 
controlP5.Controller : Textfield setColorActive(int) 
controlP5.Controller : Textfield setColorBackground(int) 
controlP5.Controller : Textfield setColorCaptionLabel(int) 
controlP5.Controller : Textfield setColorForeground(int) 
controlP5.Controller : Textfield setColorLabel(int) 
controlP5.Controller : Textfield setColorValue(int) 
controlP5.Controller : Textfield setColorValueLabel(int) 
controlP5.Controller : Textfield setDecimalPrecision(int) 
controlP5.Controller : Textfield setDefaultValue(float) 
controlP5.Controller : Textfield setHeight(int) 
controlP5.Controller : Textfield setId(int) 
controlP5.Controller : Textfield setImage(PImage) 
controlP5.Controller : Textfield setImage(PImage, int) 
controlP5.Controller : Textfield setImages(PImage, PImage, PImage) 
controlP5.Controller : Textfield setImages(PImage, PImage, PImage, PImage) 
controlP5.Controller : Textfield setLabel(String) 
controlP5.Controller : Textfield setLabelVisible(boolean) 
controlP5.Controller : Textfield setLock(boolean) 
controlP5.Controller : Textfield setMax(float) 
controlP5.Controller : Textfield setMin(float) 
controlP5.Controller : Textfield setMouseOver(boolean) 
controlP5.Controller : Textfield setMoveable(boolean) 
controlP5.Controller : Textfield setPosition(float, float) 
controlP5.Controller : Textfield setPosition(float[]) 
controlP5.Controller : Textfield setSize(PImage) 
controlP5.Controller : Textfield setSize(int, int) 
controlP5.Controller : Textfield setStringValue(String) 
controlP5.Controller : Textfield setUpdate(boolean) 
controlP5.Controller : Textfield setValue(float) 
controlP5.Controller : Textfield setValueLabel(String) 
controlP5.Controller : Textfield setValueSelf(float) 
controlP5.Controller : Textfield setView(ControllerView) 
controlP5.Controller : Textfield setVisible(boolean) 
controlP5.Controller : Textfield setWidth(int) 
controlP5.Controller : Textfield show() 
controlP5.Controller : Textfield unlock() 
controlP5.Controller : Textfield unplugFrom(Object) 
controlP5.Controller : Textfield unplugFrom(Object[]) 
controlP5.Controller : Textfield unregisterTooltip() 
controlP5.Controller : Textfield update() 
controlP5.Controller : Textfield updateSize() 
controlP5.Controller : boolean isActive() 
controlP5.Controller : boolean isBroadcast() 
controlP5.Controller : boolean isInside() 
controlP5.Controller : boolean isLabelVisible() 
controlP5.Controller : boolean isListening() 
controlP5.Controller : boolean isLock() 
controlP5.Controller : boolean isMouseOver() 
controlP5.Controller : boolean isMousePressed() 
controlP5.Controller : boolean isMoveable() 
controlP5.Controller : boolean isUpdate() 
controlP5.Controller : boolean isVisible() 
controlP5.Controller : float getArrayValue(int) 
controlP5.Controller : float getDefaultValue() 
controlP5.Controller : float getMax() 
controlP5.Controller : float getMin() 
controlP5.Controller : float getValue() 
controlP5.Controller : float[] getAbsolutePosition() 
controlP5.Controller : float[] getArrayValue() 
controlP5.Controller : float[] getPosition() 
controlP5.Controller : int getDecimalPrecision() 
controlP5.Controller : int getHeight() 
controlP5.Controller : int getId() 
controlP5.Controller : int getWidth() 
controlP5.Controller : int listenerSize() 
controlP5.Controller : void remove() 
controlP5.Controller : void setView(ControllerView, int) 
controlP5.Textfield : String getText() 
controlP5.Textfield : String[] getTextList() 
controlP5.Textfield : Textfield clear() 
controlP5.Textfield : Textfield keepFocus(boolean) 
controlP5.Textfield : Textfield setAutoClear(boolean) 
controlP5.Textfield : Textfield setColor(int) 
controlP5.Textfield : Textfield setColorCursor(int) 
controlP5.Textfield : Textfield setFocus(boolean) 
controlP5.Textfield : Textfield setFont(ControlFont) 
controlP5.Textfield : Textfield setFont(PFont) 
controlP5.Textfield : Textfield setFont(int) 
controlP5.Textfield : Textfield setHeight(int) 
controlP5.Textfield : Textfield setInputFilter(int) 
controlP5.Textfield : Textfield setPasswordMode(boolean) 
controlP5.Textfield : Textfield setSize(int, int) 
controlP5.Textfield : Textfield setText(String) 
controlP5.Textfield : Textfield setValue(String) 
controlP5.Textfield : Textfield setValue(float) 
controlP5.Textfield : Textfield setWidth(int) 
controlP5.Textfield : Textfield submit() 
controlP5.Textfield : boolean isAutoClear() 
controlP5.Textfield : boolean isFocus() 
controlP5.Textfield : int getIndex() 
controlP5.Textfield : void draw(PGraphics) 
controlP5.Textfield : void keyEvent(KeyEvent) 
java.lang.Object : String toString() 
java.lang.Object : boolean equals(Object) 

created: 2015/03/24 12:21:31

*/
