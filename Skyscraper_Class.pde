class Skyscraper extends Shelter {

  Skyscraper(String m, int fs) {
    super(m, fs);
    
    //Broken building pieces
    for (int i = 0; i < numPieces; i++) { 
      pieces[i] = new PVector(random(250, 365), random(25, 400));
      size[i] = random(35, 45);
      velocity[i] = new PVector(random(-3, 2),random(13, 18));
    }  
  }
  
  
  // Methods 
  void drawSkyscraper() {
    //Building
    fill(this.colour);
    triangle(290, 75, 325, 75, 308, 5);
    rect(270, 75, 75, 25);
    rect(260, 100, 95, 75);
    rect(250, 175, 115, 375);
    fill(199, 242, 240);
    
    //Windows
    int y = 195;
    int y2 = 110;
    
    for (int i = 0; i < 10; i++) {
      int x = 262;
      for (int j = 0; j < 3; j++) {
        square(x, y, 20);  
        x += 35;
      }
     y += 35;
    }
    
    //Windows for top part
    for (int i = 0; i < 2; i++) {
      int x2 = 270;
      for (int j = 0; j < 3; j++) {
        rect(x2, y2, 16, 20);  
        x2 += 30;
      }
     y2 += 35;
    }
  }
  
  void drawBrokenSkyscraper() {
    for (int i = 0; i < numPieces; i++){ //Draws broken pieces
      fill(this.colour);
      square(pieces[i].x, pieces[i].y, size[i]);  
    }
    for (int i = 0; i < numPieces; i++) { //Animates broken pieces collapsing
      if (pieces[i].y < 475) {
        pieces[i].add(velocity[i]);   
      }
    }
  }
  
  void updateSkyscraper(String m, int fs) {
    super.updateShelter(m, fs);
  }
  
}
