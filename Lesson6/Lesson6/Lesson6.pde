
PVector acc1 = new PVector(0, 0);
boolean gameover = false;
boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;
float deltaTime;
float time;
float playerSize = 20;
Player Player = new Player(20);
int numberOfBalls = 10;
Ball[] balls;

void setup() {
	frameRate(200);
	size(800, 500);
	balls = new Ball[10];

	   for(int i = 0; i < balls.length; i++){
      balls[i] = new Ball(300, 300, 20);
   }
}

void draw() {
	long currentTime = millis();

	deltaTime = (currentTime - time) * 0.001f;

	background(0);
if (gameover) {
	fill(255,255,255);
	textSize(100);
	textAlign(CENTER);
	text("Game over!", width/2 , height/2); 
	
}
else{
	

	updatePlayerPosition();

	for(int i = 0; i < balls.length; i++){
      balls[i].update();
      balls[i].draw();
  }
}
		time = currentTime;
}
void updatePlayerPosition() {
	acc1.set(0,0);
	if (moveLeft) {
		acc1.x -= 1;
	}
	if (moveRight) {
		acc1.x += 1;
	}
	if (moveUp) {	
	
		acc1.y -= 1;
	}
	if (moveDown) {
		
		acc1.y += 1;
	}
	acc1.normalize();
	Player.updatePosition(acc1.x, acc1.y);
}

void keyPressed() {
	if (keyCode == LEFT || key == 'a'){
		moveLeft = true;
	}
	else if (keyCode == RIGHT || key == 'd'){
		moveRight = true;
	}
	if (keyCode == UP || key == 'w'){
		moveUp = true;
	}
	else if (keyCode == DOWN || key == 's') {
		moveDown = true;
	}
}

void keyReleased() {
	if (keyCode == LEFT || key == 'a'){
		moveLeft = false;
	}
	else if (keyCode == RIGHT || key == 'd'){
		moveRight = false;
	}
	if (keyCode == UP || key == 'w') {
		moveUp = false;
	}
	else if (keyCode == DOWN || key == 's') {
		moveDown = false;
	}
}


