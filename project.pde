players player1;

int [] x = {0, 1080};
enemy enemy1;
ArrayList <enemy> enemies; //store enemies
int spawnDelay = 1000;
int lastSpawnTime = 0;
  
void setup(){
  size(1080,560);
  player1 = new players(width/2,height,0.5,25);
  
  lastSpawnTime = millis();
  enemies = new ArrayList<enemy>();
}
void draw(){
  background(255);
  pushMatrix();
  player1.Draw();
  player1.Move();
  player1.UpdateBullet();
  popMatrix();
  
  if(millis() - lastSpawnTime > spawnDelay){
    spawnEnemy();
    lastSpawnTime = millis();
  }
  
  for (int i = enemies.size() - 1; i >= 0; i--){
    enemy enemy = enemies.get(i);
    enemy.move();
    enemy.spawnEnemy();
    
    if (enemy.isOffscreen()) {
      enemies.remove(i);
    }
  }

}

void mousePressed(){
  player1.GunFire();
}

void spawnEnemy() {
  int rndX = int(random(2));
  float firstPos = rndX * width;
  float xPos = firstPos;
  enemy enemy1 = new enemy(firstPos, xPos);
  enemies.add(enemy1);
}
