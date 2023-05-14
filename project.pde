
players player1;

void setup(){
  size(1080,560);
  player1 = new players(width/2,height,0.5,25);
}
void draw(){
  background(255);
  player1.Draw();
  player1.Move();
  player1.UpdateBullet();
}
void mousePressed(){
  player1.GunFire();
}
