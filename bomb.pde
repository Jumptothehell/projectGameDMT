class Bomb{
  float xPos, yPos;
  float firstBombPosition;
  float speed;
  
  Bomb (float x, float y){
    xPos = x;
    yPos = y;
    speed = 5;
  }
  
  void drawBomb(){
    fill(#F50000);
    ellipse(xPos, yPos, 50, 50);
  }
  
  void dropBomb(){
    yPos += speed;
  }
  
  boolean isOffscreen(){
    return (yPos > height);
  }
}
