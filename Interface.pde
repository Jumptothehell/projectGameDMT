class Interfaces
{ 
  void CreateInterface() {
    rectMode(CENTER);
    if (isStart == false) {
      fill(#EDED5B);
      rect(width/2, height/2, 300, 100);
      fill(0);
      textAlign(CENTER, CENTER);
      textSize(72);
      text("Start", width/2, height/2-15);
    }
    rectMode(CORNER);
  }

  void StartButton() {
    if (mouseX>width/2-150 && mouseX<width/2+150 && mouseY>height/2-50 &&mouseY<height/2+50) {
      isStart = true;
    }
  }

  void EndScene() {
    rectMode(CENTER);
    fill(#EA2121);
    textAlign(CENTER, CENTER);
    textSize(144);
    text("Game Over", width/2, height/2-50);
    rectMode(CORNER);
  }
}
