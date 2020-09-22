PVector circlePos = new PVector(100, 100);
float ballSize = 10;
boolean moveLeft;
boolean moveRight;
boolean moveUp;
boolean moveDown;
PVector v = new PVector(0, 0);
PVector acc = new PVector(0, 0);
float deltaTime;
float speed = 3;

float maxSpeed = 50;
float time;
void setup() {
	frameRate(200);
	size(800, 500);
	
 
	
}

void draw() {
	long currentTime = millis();

	deltaTime = (currentTime - time) * 0.001f;
	time = currentTime;
	background(0);
	circle(circlePos.x, circlePos.y, ballSize);
	updatePosition();

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


void updatePosition() {
	acc.set(0,0);

	if (moveLeft) {
		acc.x -= 1;
	}
	if (moveRight) {
		acc.x += 1;
	}
	if (moveUp) {	
	
		acc.y -= 1;
	}
	if (moveDown) {
		
		acc.y += 1;
	}
	acc.normalize();
	acc.mult(deltaTime);
	acc.mult(speed);
	if (acc.x == 0) {
		acc.x -= v.x  * speed * 0.8 *  deltaTime;
		if (acc.x * 1800 < 1 && acc.x * 1800 > -1) {

			v.x = 0;
			acc.x = 0;	
		}		
		
	}
	if (acc.y == 0) {
		acc.y -= v.y * speed * 0.7 * deltaTime;
		if (acc.y * 1800 < 1 && acc.y * 1800 > -1) {

			v.y = 0;
			acc.y = 0;	
		}	
	}


	v.add(acc);
	v.limit(maxSpeed);
	 PVector move = v.copy();

	//println(acc);
	circlePos.add(move.mult(speed));


}