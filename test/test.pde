import controlP5.*;
ControlP5 button;
int count = 0;

PWindow win;

public void settings() {
  size(320, 240);
}

void setup() 

{ 
  //Button initialization
  button = new ControlP5(this);
  button.addButton("testing")
    .setValue(100)
    .setPosition(0,20)
    .setSize(80,30);
    
  surface.setLocation(20,20);
  win = new PWindow();
}
void testing()
  {
    count += 1;
    if (count == 2)
      {
      if(win == null) win = new PWindow();
      count = 1;
      }
    println("testing pressed");  
  }

void draw() 
  {
    background(255, 0, 0);
    fill(255);
  }

class PWindow extends PApplet 
{
  //No clue how this works, it just do
  PWindow() 
  {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }

  void settings() 
    {
      size(500, 200);
    }

  void setup() 
    {
      background(150);
    }

  void draw()
    {
      background(0);
      ellipse(mouseX, mouseY, 10, 10);
    }

  void mousePressed() 
    {
      println("mousePressed in secondary window");
    }
  
  void exit()
    {
      dispose();
      win = null;
    }
}
