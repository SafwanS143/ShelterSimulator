class Tent {
  //Fields
  int foundationStrength;
  float overallStrength;
  PVector pos;

  int numPieces = 15;
  float[] size = new float[numPieces];
  PVector[] pieces = new PVector[numPieces];
  PVector[] velocity = new PVector[numPieces];
  
  Tent(int fs) {
    this.foundationStrength = fs;  
    this.pos = new PVector(190, 450);
    
    //Broken tent pieces
    for (int i = 0; i < numPieces; i++) { 
      pieces[i] = new PVector(random(this.pos.x, this.pos.x + 150), random(this.pos.y - 250, this.pos.y - 80));
      size[i] = random(40, 55);
      velocity[i] = new PVector(random(-5, 5), random(10, 15));
    }
  }
  
  void drawTent() {
    fill(219, 7, 7);
    stroke(0,0,0);
    triangle(this.pos.x, this.pos.y, this.pos.x+110, this.pos.y-200, this.pos.x+220, this.pos.y);
    stroke(131, 39, 22);
    noStroke();
    stroke(0);
    triangle(this.pos.x+90,this.pos.y,this.pos.x+110,this.pos.y-200,this.pos.x+130,this.pos.y);
    line(this.pos.x-100,this.pos.y+50,this.pos.x+110,this.pos.y-200);
    line(this.pos.x+320,this.pos.y+50,this.pos.x+110,this.pos.y-200);
    line(this.pos.x-100,this.pos.y-50,this.pos.x+110,this.pos.y-200);
    line(this.pos.x+320,this.pos.y-50,this.pos.x+110,this.pos.y-200);
    
    
    fill(0);
    triangle(this.pos.x+110,this.pos.y-190,this.pos.x+100,this.pos.y-10,this.pos.x+120,this.pos.y-10);
  }
  
  void drawBrokenTent() {
    for (int i = 0; i < numPieces; i++){ //Draws broken pieces
      fill(219, 7, 7);
      square(pieces[i].x, pieces[i].y, size[i]);  
    }
    for (int i = 0; i < numPieces; i++) { //Animates broken pieces collapsing
      if (pieces[i].y < 425) {
        pieces[i].add(velocity[i]);   
      }
    }
  }
  
  void updateTent(int fs) {
    this.foundationStrength = fs;
    
    this.overallStrength = this.foundationStrength * 0.4;
  }

  void resetTent() {
    this.pos = new PVector(190, 450);  
    
    for (int i = 0; i < numPieces; i++) { 
      pieces[i] = new PVector(random(this.pos.x, this.pos.x + 150), random(this.pos.y - 250, this.pos.y - 80));
      size[i] = random(40, 55);
      velocity[i] = new PVector(random(-5, 5), random(10, 15));
    }
  }
}
