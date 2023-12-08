class Skyscraper extends Shelter {
  //Broken building fields
  int numPieces = 20;
  float[] size = new float[numPieces];
  PVector[] pieces = new PVector[numPieces];
  PVector[] velocity = new PVector[numPieces];
  
  Skyscraper(String m, int fs) {
    super(m, fs);
    c = 0.7; //Value that adjusts impact of foundation strength
    
    this.pos = new PVector(270, 75);

    //Broken building pieces
    for (int i = 0; i < numPieces; i++) { 
      pieces[i] = new PVector(random(this.pos.x-20, this.pos.x+95), random(this.pos.y-50, this.pos.y+325));
      size[i] = random(35, 45);
      velocity[i] = new PVector(random(-3, 2),random(13, 18));
    }      
  }
  
  // Methods 
  void drawSkyscraper() {
    // Pavement
    fill(175);
    ellipse(this.pos.x+38, this.pos.y + 450, 300, 125);
    
    //Base
    fill(this.colour);
    triangle(this.pos.x+20, this.pos.y, this.pos.x+55, this.pos.y, this.pos.x+38, this.pos.y-70);
    rect(this.pos.x, this.pos.y, 75, 25);
    rect(this.pos.x-10, this.pos.y+25, 95, 75);
    rect(this.pos.x-20, this.pos.y+100, 115, 375);
    fill(199, 242, 240);
    
    //Windows
    int y = int(this.pos.y+120);
    int y2 = int(this.pos.y+35);
    
    for (int i = 0; i < 10; i++) {
      int x = int(this.pos.x-8);
      for (int j = 0; j < 3; j++) {
        square(x, y, 20);  
        x += 35;
      }
     y += 35;
    }
    
    //Windows for top part
    for (int i = 0; i < 2; i++) {
      int x2 = int(this.pos.x);
      for (int j = 0; j < 3; j++) {
        rect(x2, y2, 16, 20);  
        x2 += 30;
      }
     y2 += 35;
    }
  }
  
  void drawBrokenSkyscraper() {
    fill(175); //Pavement
    ellipse(this.pos.x+38, this.pos.y + 450, 300, 125);
    
    for (int i = 0; i < numPieces; i++){ //Draws broken pieces
      fill(this.colour);
      square(pieces[i].x, pieces[i].y, size[i]); 
      if (pieces[i].y < 500) {
        pieces[i].add(velocity[i]); //Animates broken pieces falling   
      }
    }
  }
  
  void updateSkyscraper(String m, int fs) { // Updates the Skyscraper
    super.updateShelter(m, fs);
  }
 
  void resetSkyscraper() { //Resets building back to original state
    this.pos = new PVector(270, 75);
    
    for (int i = 0; i < numPieces; i++) { 
      pieces[i] = new PVector(random(this.pos.x-20, this.pos.x+95), random(this.pos.y-50, this.pos.y+325));
      size[i] = random(35, 45);
      velocity[i] = new PVector(random(-3, 2),random(13, 18));
    }  
  }
}
