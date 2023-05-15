PImage bombImg;

class Bomb{
  float xPos, yPos;
  float speed;
  float angle;
  
  Bomb (float x, float y){
    xPos = x;
    yPos = y;
    angle = 0;
    speed = 5;
  }
  
  void drawBomb(){
    //fill(#F50000);
    //ellipse(xPos, yPos, 50, 50);
    bombImg = loadImage("bomb.png");
    pushMatrix();
    imageMode(CENTER);
    translate(xPos, yPos);
    rotate(angle);
    image(bombImg, 0, 0, 50, 50);
    popMatrix();
  }
  
  void dropBomb(){
    yPos += speed;
    angle += 0.1;
  }
  
  boolean isOffscreen(){
    return (yPos > 700);
  }
  
  boolean checkHitPlayer(Player player) {
    float distance = dist(xPos, yPos, player.playerPosX, player.playerPosY);
    return distance < player.rectSize / 2 + bombImg.width / 5; // Adjust the collision threshold as needed
  }
}
