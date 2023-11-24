import g4p_controls.*;

// Global Variables

House firstHouse = new House("Brick", 50);

void setup() {
  size(600, 600);
  
  createGUI();
}

void draw() {
  background(135, 206, 235);
  fill(124, 252, 0);
  rect(-1, 350, 601, 600);
  
  firstHouse.drawHouse();
}
