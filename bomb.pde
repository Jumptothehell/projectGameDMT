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
    pushMatrix();
    bombImg = loadImage("bomb.png");
    bombImg.resize(50, 50);
    translate(xPos, yPos);
    rotate(angle);
    image(bombImg,-bombImg.width / 2, -bombImg.height / 2);
    popMatrix();
  }
  
  void dropBomb(){
    yPos += speed;
    angle += 0.1;
  }
  
  boolean isOffscreen(){
    return (yPos > height);
  }
  
  boolean checkHitPlayer(players player){
    float distance = dist(this.xPos, this.yPos, player.posX, player.posY);
    return distance < player.size * 300; // Adjust the collision threshold as needed
  }
}
