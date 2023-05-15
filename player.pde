class Player{
  PImage img;
  
  int rectSize = 130;
  int gunHeight = 80;
  
  float theta = 0;
  float posX ,posY,upSpace;
  float playerPosX, playerPosY, wheel1PosX,wheel1PosY, wheel2PosX,wheel2PosY;
  float gunPosX, gunPosY;
   
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
   
   Player (float x, float y, float u){
     posX = x;
     posY = y;
     upSpace = u;
   }

  //Draw
  void Draw(){
    DrawPlayer();
    DrawWheel();
    Gun();
  }
  
  void DrawPlayer(){
    fill(#055814);
    playerPosX = posX;
    playerPosY = 465; 
    
    rectMode(CENTER);
    rect(playerPosX, playerPosY, rectSize, rectSize);
    
    img = loadImage("sleepRockyNoBG.png");
    imageMode(CENTER);
    image(img, playerPosX - 19, playerPosY + 10 , 170, 120);
  }
  
  void DrawWheel(){
    int wheelSize = 65;
    DrawWheel1(wheelSize);
    DrawWheel2(wheelSize);
  }
  void DrawWheel1(int size){
    wheel1PosX = playerPosX  - rectSize / 2 ;
    wheel1PosY = playerPosY + rectSize / 2 ;
    img = loadImage("pizza2.png");
      pushMatrix();
      translate(wheel1PosX, wheel1PosY);
      if(posX < mouseX){
        rotate(theta);
      }
      else{
        rotate(theta + PI);
      }
      image(img, 0, 0, size, size);
      popMatrix();
  }
  void DrawWheel2(int size){
    wheel2PosX = playerPosX  + rectSize / 2 ;
    wheel2PosY = playerPosY + rectSize / 2 ;
    img = loadImage("pizza2.png");
      pushMatrix();
      translate(wheel2PosX, wheel2PosY);
      if(posX < mouseX){
        rotate(theta);
      }
      else{
        rotate(theta + PI);
      }
      image(img, 0, 0, size, size);
      popMatrix();
  }
  void Gun(){
    gunPosX = playerPosX;
    gunPosY = playerPosY - rectSize / 2;
      pushMatrix();
      translate(gunPosX,gunPosY);
      DrawGun();
      popMatrix();
    GunMove();
  }
  void GunMove() {
    float angleToMouse = atan2(mouseY - gunPosY, mouseX - gunPosX);
    theta = angleToMouse;
    if(theta <= 0 && theta >= -4){
        
    }
    if(theta > 0 && theta < 1.5){
      theta = 0;
    }
    else if(theta > 0&& theta<3){
      theta = -3.15;
    }
  }

  void DrawGun(){
    fill(#055814);
    beginShape();
    rotate(theta);
    vertex(14,20);
    vertex(14,-20);
    vertex(80,-20);
    vertex(80,20);
    endShape(CLOSE);
    
    ellipseMode(CENTER);
    ellipse(0,0,50,50);
  }
  
  //Move
  void Move(){
    posX = lerp(posX, mouseX, 0.1);
  }
  
  void FireBullet() {
    float bulletSpeed = 80;  // Adjust the bullet speed as needed
    float bulletAngle = theta;  // Use the current gun angle as the bullet angle
    
    // Calculate the bullet's initial position
    float bulletX = gunPosX;
    float bulletY = gunPosY;
    
    // Create a new Bullet object with the calculated values
    Bullet bullet = new Bullet(bulletX, bulletY, bulletSpeed, bulletAngle);
    
    // Add the bullet to the bullets list
    bullets.add(bullet);
  }
}
