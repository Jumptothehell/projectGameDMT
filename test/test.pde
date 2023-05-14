float rotationAngle = 0;
PImage img;

void setup() {
  size(400, 400);
  img = loadImage("up.png");
}

void draw() {
  background(255);
  translate(width/2, height/2);

  float angleToMouse = atan2(mouseY - height/2, mouseX - width/2);
  rotationAngle = lerp(rotationAngle, angleToMouse, 0.1);

  rotate(rotationAngle);
  image(img, -img.width/2, -img.height/2);
  rotate(-rotationAngle);
}
