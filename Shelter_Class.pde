class Shelter {
  // Fields
  String material;
  int foundationStrength;
  float overallStrength;
  color colour;
  PVector pos;

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
    
    else { //Wood
      s = 50.0;
      this.colour = color(191, 110, 48);
    }
      
    this.overallStrength = s * 0.6 + this.foundationStrength * 0.4;
  }
  
}
