players player1;

int [] x = {0, 1080};
Enemy enemy1;
ArrayList <Enemy> enemies; //store enemies
ArrayList <Bomb> bombs; //store bombs
int maxEnemiesPerScreen = 5;
int EnemiesIndex = 0;

int spawnDelay = 1000;
int lastSpawnTime = 0;
  
void setup(){
  size(1080,560);
  player1 = new players(width/2,height,0.5,25);
  
  lastSpawnTime = millis();
  enemies = new ArrayList<Enemy>();
  bombs = new ArrayList<Bomb>();
}

void draw(){
  background(255);
  if(millis() - lastSpawnTime > spawnDelay){
    spawnEnemy();
    lastSpawnTime = millis();
  }
  
  for (int i = enemies.size() - 1; i >= 0; i--){
    Enemy enemy = enemies.get(i);
    enemy.move();
    enemy.displayEnemy();
    
    if (enemy.isEnemyOffscreen()) {
      enemies.remove(i);
    }
  }
  
  for (int i = bombs.size() - 1; i >= 0; i--) {
    Bomb bomb = bombs.get(i);
    bomb.drawBomb();
    bomb.dropBomb();

    if (bomb.isOffscreen()) {
      bombs.remove(i);
    }else if(bomb.checkHitPlayer(player1)){
      bombs.remove(i);
      println("Player hit by bomb"); //change this to go game over interface
    }
  }
    
  player1.Draw();
  player1.Move();
  player1.UpdateBullet();
}

void mousePressed(){
  player1.GunFire();
}

void spawnEnemy() {
  if(enemies.size() < maxEnemiesPerScreen){
    int rndX = int(random(2));
    float firstPos = x[rndX];
    float xPos = firstPos;
    Enemy enemy1 = new Enemy(firstPos, xPos);
    enemies.add(enemy1);
    EnemiesIndex++;
  }

  if(EnemiesIndex >= maxEnemiesPerScreen){
    EnemiesIndex = 0;
    lastSpawnTime = millis() + spawnDelay;
  }
  
  for (int i = 0; i < enemies.size(); i ++){
    Enemy enemy = enemies.get(i);
    
    float enemyX = enemy.xPos;
    float enemyY = enemy.yPos;
    
    if(random(1) < 0.05){
      Bomb bomb = new Bomb(enemyX, enemyY);
      bombs.add(bomb);
    }
  }
}
