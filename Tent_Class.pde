class Tent {
  //Fields
  int foundationStrength;
  PVector pos;
  float fallRate = 1;

  //Broken tent fields
  int numPieces = 18;
  float[] size = new float[numPieces];
  PVector[] pieces = new PVector[numPieces];
  PVector[] velocity = new PVector[numPieces];
  
  Tent(int fs) {
    this.foundationStrength = fs;  
    this.pos = new PVector(190, 450);
    
    //Broken tent pieces
    for (int i = 0; i < numPieces; i++) { 
      pieces[i] = new PVector(random(this.pos.x, this.pos.x + 150), random(this.pos.y - 250, this.pos.y - 80));
      size[i] = random(35, 50);
      velocity[i] = new PVector(random(-5, 5), random(8, 12));
    }
  }
  
  void drawTent() {
    fill(219, 7, 7);
    stroke(0);
    triangle(this.pos.x, this.pos.y, this.pos.x+110, this.pos.y-200, this.pos.x+220, this.pos.y);
    stroke(131, 39, 22);
    noStroke();
    stroke(0);
    triangle(this.pos.x+90,this.pos.y,this.pos.x+110,this.pos.y-200,this.pos.x+130,this.pos.y);
    
    //Tent lines
    line(this.pos.x-100,this.pos.y+50,this.pos.x+110,this.pos.y-200);
    line(this.pos.x+320,this.pos.y+50,this.pos.x+110,this.pos.y-200);
    line(this.pos.x-100,this.pos.y-50,this.pos.x+110,this.pos.y-200);
    line(this.pos.x+320,this.pos.y-50,this.pos.x+110,this.pos.y-200);
    
    fill(0);
    triangle(this.pos.x+110,this.pos.y-190,this.pos.x+100,this.pos.y-10,this.pos.x+120,this.pos.y-10);
  }
  
  void drawBrokenTent() { //Draws tent after being destroyed by natural disaster
    for (int i = 0; i < numPieces; i++){ //Draws broken pieces
      fill(219, 7, 7);
      square(pieces[i].x, pieces[i].y, size[i]);  
      if (pieces[i].y < 425) {
        pieces[i].add(velocity[i]); //Animates broken pieces falling
      }
    }
  }
  
  void drawTentCollapse() { //Draws tent when affected by precipitation
    fill(219, 7, 7);
    triangle(this.pos.x, 450, this.pos.x+110, this.pos.y-200, this.pos.x+220, 450);
    triangle(this.pos.x+90,450,this.pos.x+110,this.pos.y-200,this.pos.x+130,450);
    fill(0);
    triangle(this.pos.x+110,this.pos.y-190,this.pos.x+100,440,this.pos.x+120,440);
    line(this.pos.x-100,500,this.pos.x+110,this.pos.y-200);
    line(this.pos.x+320,500,this.pos.x+110,this.pos.y-200);
    line(this.pos.x-100,400,this.pos.x+110,this.pos.y-200);
    line(this.pos.x+320,400,this.pos.x+110,this.pos.y-200);
    
    if (this.pos.y-200 < 370)
      this.pos.y += 1.5*fallRate; //Tent sinks
      fallRate += 0.12; //Tent gradually falls faster
  }
  
  void updateTent(int fs) {
    this.foundationStrength = fs;
  }

  void resetTent() { //Resets tent back to original state
    fallRate = 1;
    this.pos = new PVector(190, 450);  
    
    for (int i = 0; i < numPieces; i++) { 
      pieces[i] = new PVector(random(this.pos.x, this.pos.x + 150), random(this.pos.y - 250, this.pos.y - 80));
      size[i] = random(40, 55);
      velocity[i] = new PVector(random(-5, 5), random(10, 15));
    }
  }
}
