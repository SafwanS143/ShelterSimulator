class House {
  // Fields
  String material;
  int foundationStrength;
  float overallStrength;
  color houseColour;
  
  
  House(String m, int fs) {
    this.material = m;
    this.foundationStrength = fs;
      
    this.overallStrength = 70.0 * 0.6 + this.foundationStrength * 0.4;
    
    this.houseColour = color(188, 74, 60);
  }
  
  
  // Methods 
  void drawHouse() {
    fill(this.houseColour);
    rect(200, 250, 200, 200);
    
  }
  
  void drawBrokenHouse() {}
  
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
