class Ball
{
    //Our class variables
    PVector position; //Ball position
    PVector velocity; //Ball direction
    float size;
    color c1 = color(204, 153, 0);
    float speed = 60;

    //Ball Constructor, called when we type new Ball(x, y);
    Ball(float x, float y, float s)
    {
        //Set our position when we create the code.
        position = new PVector(x, y);
        size = s;
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
        if(roundCollision()) {
            gameover = true;
        }
    }

    void draw()
    {
        fill(c1);
        ellipse(position.x, position.y, size, size);
    }

    private void collisionWalls() {
        if (position.x - size / 2 < 0 ) {

            velocity.x = velocity.x * -1;
            position.x = 0 + size / 2;
        }
        else if (position.x + size / 2> width) {
            velocity.x = velocity.x * -1; 
            position.x = width - size / 2;
        }
        if (position.y - size / 2 < 0) {
            velocity.y = velocity.y * -1; 
            position.y = 0 + size / 2;
        }
        else if (position.y + size / 2 > height) {
            
            velocity.y = velocity.y * -1; 
            position.y = height - size / 2;
        }
    }

    boolean roundCollision()
{
  float maxDistance = (size  + playerSize) / 2;

  //first a quick check to see if we are too far away in x or y direction
  //if we are far away we dont collide so just return false and be done.
  if(abs(position.x - circlePos.x) > maxDistance || abs(position.y - circlePos.y) > maxDistance)
  {
    return false;
  }
  //we then run the slower distance calculation
  //dist uses Pythagoras to get exact distance, if we still are to far away we are not colliding.
  else if(dist(position.x, position.y, circlePos.x, circlePos.y) > maxDistance)
  {
    return false;
  }
  //We now know the points are closer then the distance so we are colliding!
  else
  {
   return true;
  }
}
}