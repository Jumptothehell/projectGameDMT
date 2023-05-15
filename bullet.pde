class Bullet {
  float x, y, vx, vy;

  Bullet(float x, float y, float speed, float angle) {
    this.x = x;
    this.y = y;
    this.vx = speed * cos(angle);
    this.vy = speed * sin(angle);
  }

  void update() {
    x += vx;
    y += vy;
  }

  void display() {
    fill(0);
    ellipse(x, y, 20, 20);
  }
  boolean isOffscreen(){
    return (this.x < 0 || this.x > width || this.y < 0 || this.y > height);
  }
  boolean checkHitEnemy(Enemy enemy) {
    float distance = dist(x, y, enemy.xPos, enemy.yPos);
    return distance < enemy.size * 2; // Adjust the collision threshold as needed
  }
}
