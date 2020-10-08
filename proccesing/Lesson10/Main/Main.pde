Cell[][]  cell;
int gridX = 25;
int gridY = 25;
int cellSize = 20;
int textSize = 30;
boolean start;
void setup() {
	size(500,500);
	frameRate(10);
	cell = new Cell[gridX][gridY];
	
	for (int x = 0; x < gridX; x++) {
		for (int y = 0; y < gridY; y++) {
			cell[x][y] = new Cell(x, y, cellSize);
		}
	}
	strokeWeight(0.5);
	stroke(122);
	textAlign(CENTER);
	textSize(textSize);
}

void draw() {
	turnCellAndDraw();
	
	if (!start) {
		fill(100, 100, 100);
		text("Click on box to change color", width / 2, height / 4 - textSize * 2);
		text("R for random", width / 2, height / 4 - textSize);
		 text("Space to start", width / 2, height / 4);
		
	 	if (key == ' ') {
	 	start = true;
	 	}
	}
	
	if (start) {
		update();
	}
}
	

	

void turnCellAndDraw() {
	for (int x = 0; x < gridX; x++) {
		 for (int y = 0; y < gridY; y++) {
		 	if (cell[x][y].turn) {
			 	cell[x][y].alive = !cell[x][y].alive;
			 	cell[x][y].turn = false;
			 }
		 	if (cell[x][y].alive == false) {
		 		fill(255);
		 	}
		 	else {
		 		fill(0);		
		 	}	
		 	rect(cell[x][y].position.x, cell[x][y].position.y, cell[x][y].size, cell[x][y].size);		
		}
	}
}

void randomize() {
	for (int x = 0; x < gridX; x++) {
		for (int y = 0; y < gridY; y++) {
			if ((int) random(5) == 1) {
				cell[x][y].alive = true;
			}
			else {
				cell[x][y].alive = false;
			}

		}
	}
}


void update() {
	
	for (int x = 0; x < gridX; x++) {
		 for (int y = 0; y < gridY; y++) {
		 	int neighbour = 0;
		 	if (x != 0) {
		 		if(cell[x - 1][y].alive){
		 			neighbour++;
		 		}
		 		if (y != 0) {
		 			if(cell[x -1][y - 1].alive){
		 			neighbour++;
		 			}
		 		}
		 		if (y < gridY - 1) {
		 			if(cell[x -1][y + 1].alive){
		 			neighbour++;
		 			}
		 		}
		 		}


		 	if (y != 0) {
		 		if(cell[x][y - 1].alive){
		 			neighbour++;
		 		}
		 	}
		 	if (y < gridY - 1) {
		 		if(cell[x][y + 1].alive){
		 			neighbour++;
		 		}
		 	}

		 	if (x < gridX - 1) {
		 		if(cell[x + 1][y].alive){
		 			neighbour++;
		 		}

		 		if (y != 0) {
		 		if(cell[x + 1][y - 1].alive){
		 			neighbour++;
		 		}
		 	}
		 	if (y < gridY - 1) {
		 		
		 		if(cell[x + 1][y + 1].alive){
		 			neighbour++;
		 		}
		 	
		 	}

		 }
		 if (cell[x][y].alive) {
		 	if (neighbour < 2 || neighbour > 3) {
		 		cell[x][y].turn = true;
		 	}
		 }
		 if (cell[x][y].alive == false) {
		 	if (neighbour == 3) {
				cell[x][y].turn = true;
		 	}
		 }
		 		
		}
		
	}

}
 void mouseClicked() { 
 	if (!start) {
 		cell[mouseX / cellSize][mouseY / cellSize].alive = !cell[mouseX / cellSize][mouseY / cellSize].alive;
 	}
 	
 }   
 void keyPressed() { 
 	if (!start) {
 		if (key == 'r' || key == 'R') {
		 	println("hello");
	 		randomize();
	 	}
 	}
 	
 }