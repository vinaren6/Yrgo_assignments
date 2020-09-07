void setup()
{
  size(768, 432);
}

void draw()
{
  background(50, 166, 240);
  stroke(202, 25, 25);
  strokeWeight(2.5);
  noFill();
  drawV();
  drawI();
  drawK();
  drawT();
  drawO();
  drawR();

}
void drawV(){
  line(10, 10, 30, 50);
  line(30, 50, 50, 10);
}

void drawI(){
  line(70, 10, 70, 10);
  line(70, 20, 70, 50);
}

void drawK(){
  line(90, 10, 90, 50);
  line(90, 35, 105, 50);
  line(90, 35, 105, 20);
}
void drawT(){
arc(135, 35, 30, 30, HALF_PI, PI);
line(120, 10, 120, 35);
line(110, 20, 130, 20);
}
void drawO(){
ellipse(165, 30, 40, 40);
}
void drawR(){
line(200, 10, 200, 50);
arc(215, 45, 40, 60, PI+QUARTER_PI, TWO_PI-1.2);

}


