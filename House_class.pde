class House extends Shelter {
  int numPieces = 18;
  float[] size = new float[numPieces];
  PVector[] pieces = new PVector[numPieces];
  PVector[] velocity = new PVector[numPieces];
  
  House(String m, int fs) {
    super(m, fs);

    this.pos = new PVector(200, 300);

    //Broken house pieces
    for (int i = 0; i < numPieces; i++) { 
      pieces[i] = new PVector(random(this.pos.x, this.pos.x + 150), random(this.pos.y - 120, this.pos.y - 80));
      size[i] = random(40, 55);
      velocity[i] = new PVector(random(-3, 3), random(10, 15));
    }
  }
  
  
  // Methods 
  void drawHouse() {
    fill(this.colour);
    rect(this.pos.x, this.pos.y, 200, 150);
    triangle(this.pos.x-30, this.pos.y, this.pos.x+100, this.pos.y-100, this.pos.x+230, this.pos.y);
    
    //Door
    fill(209, 121, 56);
    rect(this.pos.x+70, this.pos.y+50, 60, 100);
    fill(250, 181, 20);
    circle(this.pos.x+80, this.pos.y+100, 10);
    
    //Windows
    fill(199, 242, 240);
    rect(this.pos.x+15, this.pos.y+50, 40, 60);
    rect(this.pos.x+145, this.pos.y+50, 40, 60);
    circle(this.pos.x+100, this.pos.y-40, 40);
  }
  
  void drawBrokenHouse() {
    for (int i = 0; i < numPieces; i++){ //Draws broken pieces
      fill(this.colour);
      square(pieces[i].x, pieces[i].y, size[i]);  
    }
    for (int i = 0; i < numPieces; i++) { //Animates broken pieces collapsing
      if (pieces[i].y < 425) {
        pieces[i].add(velocity[i]);   
      }
    }
  }
  
  void updateHouse(String m, int fs) {
    super.updateShelter(m, fs);
  }
}
