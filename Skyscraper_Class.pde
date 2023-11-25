class Skyscraper {
  // Fields
  String material;
  int foundationStrength;
  float overallStrength;
  color colour;
  
  int numPieces = 25; //Fields for broken building
  float[] size = new float[numPieces];
  PVector[] pieces = new PVector[numPieces];
  PVector[] velocity = new PVector[numPieces];
  
  
  Skyscraper(String m, int fs) {
    this.material = m;
    this.foundationStrength = fs;
      
    this.overallStrength = 70.0 * 0.6 + this.foundationStrength * 0.4;
    
    this.colour = color(188, 74, 60);
    
    
    for (int i = 0; i < numPieces; i++) { //Broken building pieces
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
    
    //Windows
    int y = 195;
    int y2 = 110;
    
    for (int i = 0; i < 10; i++) {
      int x = 262;
      for (int j = 0; j < 3; j++) {
        fill(199, 242, 240);
        square(x, y, 20);  
        x += 35;
      }
     y += 35;
    }
    
    //Windows for top part
    for (int i = 0; i < 2; i++) {
      int x2 = 270;
      for (int j = 0; j < 3; j++) {
        fill(199, 242, 240);
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
      if (pieces[i].y < 500) {
        pieces[i].add(velocity[i]);   
      }
    }
  
  }
  
  void updateHouse(String m, int fs) {
    this.material = m;
    this.foundationStrength = fs;
    
    float s;
    if(material.equals("Metal")) {
      s = 90.0;
      this.colour = color(197);
    }
      
    else if (material.equals("Concrete")) {
      s = 80.0;
      this.colour = color(105);
    }
    
    else if (material.equals("Brick")) {
      s = 70.0;
      this.colour = color(188, 74, 60);
    }
      

    else if (material.equals("Wood")) {
      s = 50.0;
      this.colour = color(202, 164, 104);
    }
    
    else { // Drywall
      s = 40.0;
      this.colour = color(196, 164, 132);
    }
      
    this.overallStrength = s * 0.6 + this.foundationStrength * 0.4;
  }
  
}
