PVector paddleSize;
PVector playerPosition;
PVector aiPosition;
PVector ballPosition;
PVector ballDirection;
int playerSpeed = 8;
int aiSpeed = 4;
int ballSize = 8;
boolean start = false;
int timerNumber = 3;
long startTime = second();
void setup() {
	frameRate(60);
	size(800, 500);
	paddleSize = new PVector(20,80);
	playerPosition = new PVector(20, height/2 - paddleSize.y/2);
	aiPosition = new PVector(width- 20 - 20, height/2 - paddleSize.y/2);
	ballPosition = new PVector(width/2, height/2);
	ballDirection = new PVector(-4, -4);
 
	
}

void draw() {
	

	background(0);
	rect(playerPosition.x, playerPosition.y, paddleSize.x, paddleSize.y);	
	rect(aiPosition.x, aiPosition.y, paddleSize.x, paddleSize.y);
	rect(ballPosition.x, ballPosition.y, ballSize, ballSize);
	if(!start) {
		println(millis() / 1000);
			text(3 - millis() / 1000, width/2, height/3);	
		if (millis() / 1000 == 3 ) {
			start = true;
		}
	
		

	}
	else {
		moveBall();
		aiMove();
		collisionDetection();
	}
	
	
}

void moveBall(){
	
	ballPosition.add(ballDirection);
}

void startTimer() {
	if (timerNumber != 0) {
		
		try{
   		 Thread.sleep(1000);
   		 timerNumber = timerNumber - 1;
    	
		}catch(InterruptedException e){
   
		}
	}
	else {
		start = false;
	}
}

void aiMove() {
	if (ballPosition.y + ballSize / 2 < aiPosition.y + paddleSize.y / 2 ) {
		if (aiPosition.y <= 0) {
			aiPosition.y = 0;
		}
		else {
		aiPosition.y = aiPosition.y - aiSpeed;
	}
	}
	else if (ballPosition.y + ballSize / 2 > aiPosition.y + paddleSize.y / 2 ) {
		if (aiPosition.y + paddleSize.y >= height) {
			aiPosition.y = height - paddleSize.y;
		}
		else {
		aiPosition.y = aiPosition.y + aiSpeed;
	}
	}
}

void collisionDetection() {
	if (ballPosition.y <= 0 ) {
		ballDirection.y = ballDirection.y * -1;
	}
	else if (ballPosition.y + ballSize >= height ) {
		ballDirection.y = ballDirection.y * -1;
	} 



	if (ballPosition.x < playerPosition.x + paddleSize.x && ballPosition.x + ballSize > playerPosition.x) {
		if (ballPosition.y < playerPosition.y + paddleSize.y && ballPosition.y + ballSize > playerPosition.y) {
			ballDirection.x = ballDirection.x * -1;
		}	
	}
	if (ballPosition.x + ballSize > aiPosition.x && ballPosition.x < aiPosition.x + paddleSize.x ) {
		if (ballPosition.y < aiPosition.y + paddleSize.y && ballPosition.y + ballSize > aiPosition.y) {
			ballDirection.x = ballDirection.x * -1;
		}	
	}


}

void keyPressed() {
	
	if (keyCode == UP) {
		if (playerPosition.y <= 0) {
			playerPosition.y = 0;
		}
		else{
			playerPosition.y = playerPosition.y - playerSpeed;
		}
		
	}
	else if (keyCode == DOWN) {
		if (playerPosition.y >= height - paddleSize.y) {
			playerPosition.y = height - paddleSize.y;
		}
		else{
			playerPosition.y = playerPosition.y + playerSpeed;
		}

		
	}
}