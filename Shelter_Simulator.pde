import g4p_controls.*;

// Global Variables

House firstHouse = new House("Brick", 50);
//Skyscraper firstHouse = new Skyscraper("Brick", 50);

void setup() {
  size(600, 600);
  
  createGUI();
}

void draw() {
  background(135, 206, 235);
  fill(124, 252, 0);
  rect(-1, 350, 601, 600); //Ground
  
  firstHouse.drawHouse();
  //firstHouse.drawBrokenHouse();
  
  //firstHouse.drawSkyscraper();
  //firstHouse.drawBrokenSkyscraper();
}
