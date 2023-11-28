class House extends Shelter{
  
  
  House(String m, int fs) {
    super(m, fs);

    //Broken house pieces
    for (int i = 0; i < numPieces; i++) { 
      pieces[i] = new PVector(random(200, 350), random(180, 380));
      size[i] = random(40, 55);
      velocity[i] = new PVector(0, random(10, 15));
    }
  }
  
  
  // Methods 
  void drawHouse() {
    fill(this.colour);
    rect(200, 300, 200, 150);
    triangle(170, 300, 300, 200, 430, 300);
    
    //Door
    fill(209, 121, 56);
    rect(270, 350, 60, 100);
    fill(250, 181, 20);
    circle(280, 400, 10);
    
    //Windows
    fill(199, 242, 240);
    rect(215, 350, 40, 60);
    rect(345, 350, 40, 60);
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
