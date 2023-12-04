class Tent {
  //Fields
  int foundationStrength;
  float overallStrength;
  PVector pos;
  
  Tent(int fs) {
    this.foundationStrength = fs;  
    this.pos = new PVector(190, 450);
  }
  
  void drawTent() {
    fill(219, 7, 7);
    stroke(0,0,0);
    triangle(this.pos.x, this.pos.y, this.pos.x+110, this.pos.y-200, this.pos.x+220, this.pos.y);
    line(this.pos.x-100,this.pos.y,this.pos.x+110,this.pos.y-200);
    line(this.pos.x+320,this.pos.y,this.pos.x+110,this.pos.y-200);
    
  }
  
  void updateTent(int fs) {
    
    this.foundationStrength = fs;
    
      
    this.overallStrength = this.foundationStrength * 0.4;
  }

  void resetTent() {
    this.pos = new PVector(50, 100);  
  }
}
