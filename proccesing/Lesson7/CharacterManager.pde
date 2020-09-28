class CharacterMangaer
	
{
	Character characters[];
	int charactersLeft;
	void createCharacters(int nummberOfCharacters) {
		characters = new Character[nummberOfCharacters];
		charactersLeft = nummberOfCharacters - 1;
		characters[0] = new Zombie();
	for (int i = 1; i < characters.length; i++) {
		characters[i] = new Human();
	}
	}

	void updateCharacters() {
		for (int i = 0; i < characters.length; i++) {
		if (characters[i] instanceof Zombie) {
			updateZombie(characters[i]);
		}
		else {
			updateHuman(characters[i]);
		}
	}

	}

	void updateHuman(Character human) {
		human.update();
		human.draw();
	}

	void updateZombie(Character zombie) {
		zombie.update();
		zombie.draw();
	}

	void collisionDetection() {
		for (int i = 0; i < characters.length ; i++) {
		if (characters[i] instanceof Zombie) {
			for (int j = 0; j < characters.length ; j++) {
				if(roundCollision(characters[i], characters[j])) {
					characters[j] = new Zombie(characters[j]);
					charactersLeft -= 1;
				}
			}
		}
		
	}
	}

	boolean roundCollision(Character char1, Character char2) {

 		float maxDistance = (char1.size  + char2.size) / 2;

		if (char1 instanceof Zombie && char2 instanceof Zombie) {
		 
		  	return false;
		}
		if (char1 instanceof Human && char2 instanceof Human) {
		 
		 	return false;
		}
		 //first a quick check to see if we are too far away in x or y direction
		 //if we are far away we dont collide so just return false and be done.
		if(abs(char1.position.x - char2.position.x) > maxDistance || abs(char1.position.y - char2.position.y) > maxDistance) {
		    return false;
		}
		//we then run the slower distance calculation
		//dist uses Pythagoras to get exact distance, if we still are to far away we are not colliding.
		else if(dist(char1.position.x, char1.position.y, char2.position.x, char2.position.y) > maxDistance) {
		    return false;
		}
		//We now know the points are closer then the distance so we are colliding!
		else {
		  return true;
		}
	}	
}