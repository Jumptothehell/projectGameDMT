PImage img;

class players{
 float theta = 0;
 float posX,posY,size,upSpace,
 playerPosX,playerPosY,
 wheel1PosX,wheel1PosY,
 wheel2PosX,wheel2PosY,
 gunPosX,gunPosY;
 ArrayList<Bullet> bullets = new ArrayList<Bullet>();
 players(float x,float y,float s,float u){
   posX = x;
   posY = y;
   size = s;
   upSpace = u;
 }

//Draw
  void Draw(){
    DrawPlayer();
    DrawWheel();
    DrawGun();
  }
  void DrawPlayer(){
    fill(#055814);
    playerPosX = posX-256*size/2;
    playerPosY = posY-size*256-upSpace;
    img = loadImage("sleepRockyNoBG.png");
    rect(playerPosX,playerPosY,256*size,256*size);
    image(img,playerPosX,playerPosY,256*size,256*size);
    
  }
  void DrawWheel(){
    DrawWheel1();
    DrawWheel2();
  }
  void DrawWheel1(){
    wheel1PosX = posX-256*size/2-50*size;
    wheel1PosY = posY-size*50*2;
    img = loadImage("pizza2.png");
    pushMatrix();
    translate(wheel1PosX + 50 * size, wheel1PosY + 50 * size);
    
    if (posX < mouseX) {
      // Player is moving to the right, rotate the wheel normally
      rotate(theta);
    } else {
      // Player is moving to the left, rotate the wheel by adding PI to the rotation angle
      rotate(theta + PI);
    }
    
    image(img, -50 * size, -50 * size, 100 * size, 100 * size);
    popMatrix();
  }
  void DrawWheel2(){
    wheel2PosX = posX+256*size/2-50*size;
    wheel2PosY = posY-size*50*2;
    img = loadImage("pizza2.png");
    pushMatrix();
    translate(wheel2PosX + 50 * size, wheel2PosY + 50 * size);
    
    if (posX < mouseX) {
      // Player is moving to the right, rotate the wheel normally
      rotate(theta);
    } else {
      // Player is moving to the left, rotate the wheel by adding PI to the rotation angle
      rotate(theta + PI);
    }
    
    image(img, -50 * size, -50 * size, 100 * size, 100 * size);
    popMatrix();
  }
  void DrawGun(){
    gunPosX = posX;
    gunPosY = posY-80*size-256*size;
    GunMove();
  }
  //Move
  void Move(){
    posX = lerp(posX, mouseX, 0.1);
  }
  void GunMove(){
    translate(gunPosX,gunPosY);
    float angleToMouse = atan2(mouseY - gunPosY, mouseX - gunPosX);
    theta = angleToMouse;
    if(theta<=0 && theta >= -4){
        
    }
    if(theta>0 && theta<1.5){
      theta = 0;
    }
    else if(theta>0&& theta<3){
      theta = -3.15;
    }
    fill(#055814);
    rotate(theta);
    beginShape();
    vertex(14,20);
    vertex(14,-20);
    vertex(80,-20);
    vertex(80,20);
    endShape(CLOSE);
    ellipseMode(CENTER);
    ellipse(0,0,50,50);
  }
  void GunFire()
  {
      Bullet bullet = new Bullet(0, 0, 100,0);
      bullets.add(bullet);
  }
  void UpdateBullet(){
      for (Bullet bullet : bullets) {
      bullet.update();
      bullet.display();
    }
  }
}
