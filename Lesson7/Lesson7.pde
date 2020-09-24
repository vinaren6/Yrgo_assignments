

CharacterMangaer characterManager;
boolean gameover = false;
int gameoverTime = 0;
float deltaTime;
float time;
int textSize = 40;
void setup() {
	frameRate(60);
	size(800, 500);
	characterManager = new CharacterMangaer();
	characterManager.createCharacters(100);
	
	
	
}

void draw() {
	
	background(0);
	long currentTime = millis();
	deltaTime = (currentTime - time) * 0.001f;
	
	characterManager.updateCharacters();
	characterManager.collisionDetection();

	if (characterManager.charactersLeft == 0 && !gameover) {
		gameover = true;
		gameoverTime = millis() / 1000;
	} 
	if (gameover) {
		fill(255);
		textSize(textSize); 
		textAlign(CENTER);
		text("Game over", width/2, height/2);
		text("survived " + gameoverTime + " sec", width/2, height/2 + textSize);
	}

	
	time = currentTime;
}
