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
    triangle(this.pos.x, this.pos.y, this.pos.x+110, this.pos.y-200, this.pos.x+220, this.pos.y);
    strokeWeight(6);
    stroke(131, 39, 22);
    noStroke();
    fill(0,0,0);
    triangle(this.pos.x+90,this.pos.y,this.pos.x+110,this.pos.y-200,this.pos.x+130,this.pos.y);
    
    stroke(0);
    strokeWeight(1);
  }
  
  void updateTent(int fs) {
    
    this.foundationStrength = fs;
    
      
    this.overallStrength = this.foundationStrength * 0.4;
  }

  void resetTent() {
    this.pos = new PVector(50, 100);  
  }
}
