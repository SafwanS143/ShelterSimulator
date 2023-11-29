class Shelter {
  // Fields
  String material;
  int foundationStrength;
  float overallStrength;
  color colour;
  int endHeight;
  PVector pos;

  // Broken Shelter Fields
  int numPieces = 18;
  float[] size = new float[numPieces];
  PVector[] pieces = new PVector[numPieces];
  PVector[] velocity = new PVector[numPieces];
  
  Shelter(String m, int fs) {
    this.material = m;
    this.foundationStrength = fs;
      
    this.overallStrength = 70.0 * 0.6 + this.foundationStrength * 0.4;
    
    this.colour = color(188, 74, 60);
    
  }
  
  void updateShelter(String m, int fs) {
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
      this.colour = color(191, 110, 48);
    }
    
    // Must be drywall
    else {
      s = 40.0;
      this.colour = color(196, 164, 132);
    }
      
    this.overallStrength = s * 0.6 + this.foundationStrength * 0.4;
  }
  
  
}
