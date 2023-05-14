players player1;

int numEnemy = 10;
int enemyIndex = 0; // keep track of which enemy to spawn next
int lastSpawnTime = 0; // keep track of when the last enemy was spawned
int spawnDelay = 1000; // delay between spawning enemies (in milliseconds)
enemy[] enemies = new enemy [numEnemy];
  
void setup(){
  size(1080,560);
  player1 = new players(width/2,height,0.5,25);
  
  lastSpawnTime = millis();
}
void draw(){
  background(255);
  player1.Draw();
  player1.Move();
  player1.UpdateBullet();
  
  if(millis() - lastSpawnTime > spawnDelay){
    for(int i = 0; i < numEnemy; i++){
      enemies[enemyIndex] = new enemy();
    }
  }
  //draw and move all enemies
  for (int i = 0; i < numEnemy; i++) {
    if (enemies[i] != null) {
      enemies[i].spawnEnemy();
      println(enemies[i].xPos);
      enemies[i].move();
    }
  }
}
void mousePressed(){
  player1.GunFire();
}
