players player1;

int [] x = {0, 1080};
enemy enemies;
  
void setup(){
  size(1080,560);
  player1 = new players(width/2,height,0.5,25);
  
  int rndX = int(random(x.length));
  float firstPos = x[rndX];
  float xPos = firstPos;
  enemies = new enemy(firstPos, xPos);
}
void draw(){
  background(255);
  pushMatrix();
  player1.Draw();
  player1.Move();
  player1.UpdateBullet();
  popMatrix();
  
  enemies.spawnEnemy();
  enemies.move();
}
void mousePressed(){
  player1.GunFire();
}
