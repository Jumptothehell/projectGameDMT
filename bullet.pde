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
}
