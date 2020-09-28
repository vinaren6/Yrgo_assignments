int clickedX;
int clickedY;

PVector distance;
PVector randomVector;
PVector guess = new PVector();
boolean start = true;
PVector oldGuess = new PVector();
PVector oldRandom = new PVector();
boolean madeAGuess = false;
void setup(){
  frameRate(60);
  size(800, 800);
   distance = new PVector(0,0);  
   randomVector = new PVector(0,0);
}

void draw(){
  background(220,220,220);
  strokeWeight(2.5);
  

  if (start) {
  	randomVector.x = random(-800, 800);
  	randomVector.y = random(-800, 800);
  	start = false;
  }
	
	 if (mousePressed) {
  	drawLine();
  }
  printText();

}


void mouseReleased() {
	guess.set(mouseX - clickedX, mouseY - clickedY);
	println((int) guess.x + "  " + (int) guess.y);
	score();
	start = true;
	
}
void mousePressed() {
	clickedX = mouseX;
	clickedY = mouseY;
}

void drawLine() {
	stroke(180, 180, 180);
	line(clickedX, clickedY, mouseX, clickedY);
	line(mouseX, clickedY, mouseX, mouseY);
	stroke(0, 0, 0);
	line(clickedX, clickedY, mouseX, mouseY);
	

}
void score() {
	oldGuess.set(guess);
	oldRandom.set(randomVector);
	madeAGuess = true;
}

void printText(){
	textSize(30);
  	text("x: " + (int) randomVector.x + "  y: " + (int) randomVector.y , 10, 30); 
  	if (madeAGuess) {
  		textSize(15);
  		text("Old guess", 680, 20);
  		text("x: " + (int) oldGuess.x + "  y: " + (int) oldGuess.y , 665, 40); 
  		text("Old answer", 680, 60);
  		text("x: " + (int) oldRandom.x + "  y: " + (int) oldRandom.y , 665, 80); 
  	}
}