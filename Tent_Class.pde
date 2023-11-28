class Tent {
  //Fields
  int foundationStrength;
  float overallStrength;
  
  Tent(int fs) {
    this.foundationStrength = fs;  
  }
  
  void drawTent() {
    fill(219, 7, 7);
    triangle(190, 450, 300, 250, 410, 450);
    strokeWeight(6);
    stroke(131, 39, 22);
    line(300, 250, 300, 448);
    
    stroke(0);
    strokeWeight(1);
  }
  
}
