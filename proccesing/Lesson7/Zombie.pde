class Zombie extends Character{

	Zombie(){

	super();

	size = 20;
	c1 = color(0, 255, 0);
	speed = 10;
	}
	Zombie(Character human){

	this.position.set(human.position);
	this.velocity.set(human.velocity);
	c1 = color(0, 255, 0);
	speed = 10;
	
	}
	  void draw()
    {
        fill(c1);
        ellipse(position.x, position.y, size, size);
    }
}