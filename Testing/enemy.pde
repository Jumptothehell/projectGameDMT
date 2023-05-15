class Enemy{
  float firstPos;
  float xPos;
  float yPos;
  float speed;
  float size;
  
  Enemy(float fp, float x){
    firstPos = fp;
    xPos = x;
    yPos = randomPositionY();
    speed = randomSpeed();
    size = 50;
  }
  
  int randomPositionY(){
    int rndY = int(random(40, 120));
    return rndY;
  }
  
  float randomSpeed(){
    float speed = random(7, 10);
    return speed;
  }
  
  void displayEnemy(){
    fill(#4467CB);
    rect(xPos, yPos, size, size);
  }

  void move(){
    if(firstPos ==  0){
      xPos = xPos + speed;
    }
    else{
      xPos = xPos + (speed * -1);
    }
  }
  
  boolean isEnemyOffscreen() {
    return (xPos < 0 || xPos > width);
  }
}