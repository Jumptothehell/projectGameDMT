boolean isStart = false, isEnd = false;
// isEnd = false, make game over
Interfaces startInterface1;

Player player1;
Enemy enemy1;
int  score = 0;

int [] x = {0, 1080};

ArrayList <Enemy> enemies; //store enemies
ArrayList <Bomb> bombs; //store bombs

int maxEnemiesPerScreen = 5;
int EnemiesIndex = 0;

int spawnDelay = 1000;
int lastSpawnTime = 0;

void setup() {
  size(1080, 560);
  player1 = new Player(width/2, height, 25);
  startInterface1 = new Interfaces();
  
  lastSpawnTime = millis();
  enemies = new ArrayList<Enemy>();
  bombs = new ArrayList<Bomb>();
}

void draw() {
  background(255);
  startInterface1.CreateInterface();
  
  if (isStart == true && isEnd == false){
    if (millis() - lastSpawnTime > spawnDelay) {
      spawnEnemy();
      lastSpawnTime = millis();
    }
    
    for (int i = enemies.size() - 1; i >= 0; i--) {
      Enemy enemy = enemies.get(i);
      //println(enemy.yPos);
      enemy.move();
      enemy.displayEnemy();

      if (enemy.isEnemyOffscreen()) {
        enemies.remove(i);
      }
      else{
        for (int j = player1.bullets.size() - 1; j >= 0; j--) {
          Bullet bullet = player1.bullets.get(j);
          //println(bullet.y);
          bullet.update();
          bullet.display();
      
          // Remove bullets that are off-screen
          if (bullet.isOffscreen()) {
            player1.bullets.remove(j);
          } else{
            if(bullet.checkHitEnemy(enemy)){
              player1.bullets.remove(j);
              enemies.remove(i);
              score++;
              println(score);
            }
          }
        }
      }
    }
    for (int i = bombs.size() - 1; i >= 0; i--) {
      Bomb bomb = bombs.get(i);
      bomb.drawBomb();
      bomb.dropBomb();
    
      if (bomb.isOffscreen()) {
        bombs.remove(i);
        //println("remove");
      } else if (bomb.checkHitPlayer(player1)) {
        bombs.remove(i);
        println("Player hit by bomb"); //change this to go game over interface
        isEnd = true;
      }
    }
    //PLAYER
    player1.Draw();
    player1.Move();
  }
  if (isEnd == true) {
    startInterface1.EndScene();
  }
}

void mousePressed() {
   startInterface1.StartButton();
  if (isStart == true) {
      player1.FireBullet();
  }
}

void spawnEnemy() {
  if (enemies.size() < maxEnemiesPerScreen) {
    int rndX = int(random(2));
    float firstPos = x[rndX];
    float xPos = firstPos;
    Enemy enemy1 = new Enemy(firstPos, xPos);
    enemies.add(enemy1);
    EnemiesIndex++;
  }

  if (EnemiesIndex >= maxEnemiesPerScreen) {
    EnemiesIndex = 0;
    lastSpawnTime = millis() + spawnDelay;
  }

  for (int i = 0; i < enemies.size(); i ++) {
    Enemy enemy = enemies.get(i);

    float enemyX = enemy.xPos;
    float enemyY = enemy.yPos;

    if (random(1) < 0.05) {
      Bomb bomb = new Bomb(enemyX, enemyY);
      bombs.add(bomb);
    }
  }
}