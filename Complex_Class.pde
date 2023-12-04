class Complex extends Shelter {
  int numPieces = 18;
  float[] size = new float[numPieces];
  PVector[] pieces = new PVector[numPieces];
  PVector[] velocity = new PVector[numPieces];
  
  Complex(String m, int fs) {
    super(m, fs);

    this.pos = new PVector(200, 300);

   // Broken building pieces
    for (int i = 0; i < numPieces; i++) { 
      pieces[i] = new PVector(random(this.pos.x, this.pos.x+500), random(this.pos.y+50, this.pos.y+250));
      size[i] = random(35, 45);
      velocity[i] = new PVector(random(-3, 2),random(13, 18));
    }
  }
  
  void drawComplex() {
    // Haseeb's Code
  }
  
  void drawBrokenComplex() {
    for (int i = 0; i < numPieces; i++){ //Draws broken pieces
      fill(this.colour);
      square(pieces[i].x, pieces[i].y, size[i]);  
    }
    for (int i = 0; i < numPieces; i++) { //Animates broken pieces collapsing
      if (pieces[i].y < 450) {
        pieces[i].add(velocity[i]);   
      }
    }
  }
  
  void updateComplex(String m, int fs) {
    super.updateShelter(m, fs);
  }
  
  void resetComplex() {
    this.pos = new PVector(200, 300);
    this.colour = color(188, 74, 60); 
    
    for (int i = 0; i < numPieces; i++) { 
      pieces[i] = new PVector(random(this.pos.x, this.pos.x+500), random(this.pos.y+50, this.pos.y+250));
      size[i] = random(35, 45);
      velocity[i] = new PVector(random(-3, 2),random(13, 18));
    }
  }
}
