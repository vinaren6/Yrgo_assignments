
int frame = 0;
float multiplier = 0.002;
int numberOfPoints = 320;

void setup()
{
	frameRate(10);
	size(640, 480);
	strokeWeight(5);
}

void draw()
{

	background(255);

	


	 waves();
	//spiral();
	//circle();
}
void waves(){
	frame++;
	stroke(204, 102, 0);
	for (int i = 0; i <= 100; i++) {
		point(100 + i * 1.5, 240 + sin(frame + i * 0.08) * 100);

	}
	stroke(0, 0, 0);
	for (int i = 0; i <= 100; i++) {
		point(100 + i * 1.5, 240 + cos(frame + i * 0.08) * 100);

	}
}
void circle(){
	int count = 200;
	
	for (int i = 1; i <= count ; i++) {
		float angle = i * PI * 2 / count;
		float x = width / 2 + sin(angle) * count;
		float y = height / 2 + cos(angle)  * count;
		point(x, y);
	}

}
void spiral(){
int count = 100;
	
	for (int i = 1; i <= count ; i++) {
		
		float angle = i * PI * 2 / count;
		float x = width / 2 + sin(angle)  * i * 3;
		float y = height / 2 + cos(angle)   * i * 3;
		point(x, y);
	}
}