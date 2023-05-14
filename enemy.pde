class enemy{
  float firstPos;
  float xPos;
  float yPos;
  float speed;
  
  enemy(float fp, float x){
    firstPos = fp;
    xPos = x;
    yPos = randomPositionY();
    speed = randomSpeed();
  }
  
  //int firstPositionSpawn(){
  //  int [] x = {0, width};
  //  int rndX = int(random(x.length));
  //  int rndXFirstPosition = x[rndX];
  //  return rndXFirstPosition;
  //}
  
  //int randomPositionX(){
  //  int rndX =  firstPositionSpawn();
  //  return rndX;
  //}
  
  int randomPositionY(){
    int rndY = int(random(40, 240));
    return rndY;
  }
  
  float randomSpeed(){
    float speed = random(7, 10);
    return speed;
  }
  
  void spawnEnemy(){
    //rectMode(CENTER);
    fill(#4467CB);
    rect(xPos, yPos, 50, 50);
  }
  
  void move(){
    if(firstPos ==  0){
      xPos = xPos + speed;
    }else{
      xPos = xPos + (speed * -1);
    }
  }
}
