class House {
  // Fields
  String material;
  int foundationStrength;
  float overallStrength;
  color houseColour;

  int numPieces = 18; //Fields for broken house
  float[] size = new float[numPieces];
  PVector[] pieces = new PVector[numPieces];
  PVector[] velocity = new PVector[numPieces];
  
  House(String m, int fs) {
    this.material = m;
    this.foundationStrength = fs;
      
    this.overallStrength = 70.0 * 0.6 + this.foundationStrength * 0.4;
    
    this.houseColour = color(188, 74, 60);
    
    for (int i = 0; i < numPieces; i++) { //Broken house pieces
      pieces[i] = new PVector(random(200, 350), random(180, 380));
      size[i] = random(40, 55);
      velocity[i] = new PVector(0, random(10, 15));
    }
  }
  
  
  // Methods 
  void drawHouse() {
    fill(this.houseColour);
    rect(200, 300, 200, 150);
    triangle(170, 300, 300, 200, 430, 300);
    
    //Door
    fill(209, 121, 56);
    rect(270, 350, 60, 100);
    fill(250, 181, 20);
    circle(280, 400, 10);
    
    //Windows
    fill(199, 242, 240);
    rect(215, 350, 40, 60);
    rect(345, 350, 40, 60);
  }
  
  void drawBrokenHouse() {
    for (int i = 0; i < numPieces; i++){ //Draws broken pieces
      fill(this.houseColour);
      square(pieces[i].x, pieces[i].y, size[i]);  
    }
    for (int i = 0; i < numPieces; i++) { //Animates broken pieces collapsing
      if (pieces[i].y < 425) {
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
      this.houseColour = color(197);
    }
      
    else if (material.equals("Concrete")) {
      s = 80.0;
      this.houseColour = color(105);
    }
    
    else if (material.equals("Brick")) {
      s = 70.0;
      this.houseColour = color(188, 74, 60);
    }      
    
    else if (material.equals("Wood")) {
      s = 50.0;
      this.houseColour = color(202, 164, 104);
    }
    
    // Must be drywall
    else {
      s = 40.0;
      this.houseColour = color(196, 164, 132);
    }
      
    this.overallStrength = s * 0.6 + this.foundationStrength * 0.4;
  }
}
