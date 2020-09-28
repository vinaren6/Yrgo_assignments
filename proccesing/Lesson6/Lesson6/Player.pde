
public PVector circlePos = new PVector(100, 100);
class Player {

float size;

PVector v = new PVector(0, 0);
PVector acc = new PVector(0, 0);
float speed = 3;

float maxSpeed = 50;
	
	Player(float s){
		size = s;
	}


void updatePosition(float x, float y) {
	acc.set(x, y);

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
		acc.y -= v.y * speed * 0.8 * deltaTime;
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
	fill(255,255,255);
	circle(circlePos.x, circlePos.y, size);
}


}

