class enemy{
  float firstPos;
  float xPos;
  float yPos;
  float speed;
  
  enemy(){
    firstPos = firstPositionSpawn();
    xPos = randomPositionX();
    yPos = randomPositionY();
    speed = randomSpeed();
  }
  
  int firstPositionSpawn(){
    int [] x = {0, width};
    int rndX = int(random(x.length));
    int rndXFirstPosition = x[rndX];
    return rndXFirstPosition;
  }
  
  int randomPositionX(){
    int rndX =  firstPositionSpawn();
    return rndX;
  }
  
  int randomPositionY(){
    int rndY = int(random(40, 150));
    return rndY;
  }
  
  float randomSpeed(){
    float speed = random(1, 2);
    return speed;
  }
  
  void spawnEnemy(){
    rectMode(CENTER);
    rect(xPos, yPos, 30, 30);
  }
  
  void move(){
    if(firstPos ==  0){
      xPos = xPos + speed;
    }else{
      xPos = xPos + (speed * -1);
    }
  }
}
