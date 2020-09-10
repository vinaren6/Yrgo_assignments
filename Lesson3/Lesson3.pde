
int value = 0;

float circleX = 300 ;
float circleY = 300;
PVector distance;
int ballSize = 50;
int[] colors = {0,0,0};

void setup(){
  frameRate(60);
  size(600, 600);
  distance = new PVector(0,0);  
}

void draw(){
  background(220,220,220);
  strokeWeight(2.5);
  stroke(colors[0], colors[1], colors[2]);
  fill(colors[0], colors[1], colors[2]);
  updatePosition();
  collisionDetection();

  if (mousePressed) {
  	drawLine();
  }
  ellipse(circleX, circleY, ballSize, ballSize); 
}

void mouseReleased() {
	 distance.set((float) circleX-mouseX, (float) circleY-mouseY );
	 value = 0;
}

void drawLine() {
	line(circleX, circleY, mouseX, mouseY);
}

void updatePosition() {
	circleX = circleX -  distance.x / 15;
	circleY = circleY -  distance.y / 15;
}	

void collisionDetection() {
 if (circleX < 0 + ballSize / 2 ) {	
  	circleX = 0 + ballSize / 2;
  	distance.x = distance.x * (-1);
  	changeColor();
  }
  else if (circleX > width - ballSize / 2 ) { 	
  	circleX = width - ballSize / 2;
  	distance.x = distance.x * (-1);
  	changeColor();
  }
  if (circleY < 0 + ballSize / 2 ) { 	
  	circleY = 0 + ballSize / 2;
  	distance.y = distance.y * (-1);
  	changeColor();
  }
  else if (circleY > height - ballSize / 2 ) {
  	circleY = height - ballSize / 2;
  	distance.y = distance.y * (-1);
  	changeColor();
  }
}

void changeColor() {	
	for (int i = 0; i < 3; i++) {
		colors[i] = (int) (Math.random() * (255 - 0));
	}
}
