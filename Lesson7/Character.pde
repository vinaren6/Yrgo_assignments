class Character
{
    //Our class variables
    PVector position; //Ball position
    PVector velocity; //Ball direction
    float size = 20;
    color c1 = color(204, 153, 0);
    float speed = 30;

    //Ball Constructor, called when we type new Ball(x, y);
    Character()
    {
        //Set our position when we create the code.
        position = new PVector(random(0 + size / 2, width - size / 2), random(0 + size / 2, width - size / 2));
  
        //Create the velocity vector and give it a random direction.
        velocity = new PVector();
        velocity.x = random(11) - 5;
        velocity.y = random(11) - 5;
    }

    //Update our ball
    void update()
    {
    
        position.x += velocity.x * speed * deltaTime;
        position.y += velocity.y * speed * deltaTime;
        collisionWalls();
      
    }

    void draw()
    {
        fill(c1);
        ellipse(position.x, position.y, size, size);
    }

    private void collisionWalls() {
        if (position.x - size / 2 < 0 ) {

           
            position.x = width - size / 2;
        }
        else if (position.x + size / 2> width) {
            
            position.x = 0 + size / 2;
        }
        if (position.y - size / 2 < 0) {
         
            position.y = height - size / 2;
        }
        else if (position.y + size / 2 > height) {
            
            
            position.y = 0 + size / 2;
        }
    }


}