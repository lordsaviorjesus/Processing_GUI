float deg = 0;

void setup(){
  size(400,400);
}

void draw(){
  background(255);
  strokeWeight(2);
  stroke(255,0,0);
  drawArrow(100,100,120,10);
  stroke(0,255,0);
  drawArrow(100,160,50,130);
  stroke(0,0,255);
  drawArrow(300,300,170,deg);
  deg += 1;
}

void drawArrow(int cx, int cy, int len, float angle){
  pushMatrix();
  translate(cx, cy);
  rotate(radians(angle));
  line(0,0,len, 0);
  line(len, 0, len - 8, -8);
  line(len, 0, len - 8, 8);
  popMatrix();
}
