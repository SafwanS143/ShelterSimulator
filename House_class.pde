class House extends Shelter {
  //Broken building fields
  int numPieces = 18;
  float[] size = new float[numPieces];
  PVector[] pieces = new PVector[numPieces];
  PVector[] velocity = new PVector[numPieces];
  
  House(String m, int fs) {
    super(m, fs);
    c = 0.75; //Value that adjusts impact of foundation strength

    this.pos = new PVector(200, 300);

    //Broken building pieces
    for (int i = 0; i < numPieces; i++) { 
      pieces[i] = new PVector(random(this.pos.x, this.pos.x + 150), random(this.pos.y - 250, this.pos.y - 80));
      size[i] = random(40, 55);
      velocity[i] = new PVector(random(-5, 5), random(10, 15));
    }
  }
  
  //Methods 
  void drawHouse() {
    //Base
    fill(this.colour);
    rect(this.pos.x-50, this.pos.y-100, 300, 250);

    //Roof
    triangle(this.pos.x-80, this.pos.y-100, this.pos.x+100, this.pos.y-250, this.pos.x+280, this.pos.y-100);
    triangle(this.pos.x+50, this.pos.y-100, this.pos.x+165, this.pos.y-195, this.pos.x+280, this.pos.y-100);

    //Driveway
    fill(175,175,175);
    rect(this.pos.x+65,this.pos.y+150,180,500);
    
    //Door
    fill(209, 121, 56);
    rect(this.pos.x-35, this.pos.y+20, 60, 100);
    fill(250, 181, 20);
    circle(this.pos.x-25, this.pos.y+70, 10);
    
    //Porch
    fill(120,120,120);
    rect(this.pos.x-60,this.pos.y+120,120,30);
    
    //Garage Door
    fill(50, 50, 50);
    rect(this.pos.x+65, this.pos.y+50, 180, 100);
    fill(120, 120, 120);
    rect(this.pos.x+70, this.pos.y+55, 170, 20);
    
    //Windows
    fill(199, 242, 240);
    circle(this.pos.x+170, this.pos.y-135, 25);
    circle(this.pos.x+100, this.pos.y-200, 40);
    rect(this.pos.x+85, this.pos.y-70, 150, 60);
    rect(this.pos.x-30, this.pos.y-80, 50, 70);
  }
  
  void drawBrokenHouse() {
    // Draws pavement
    fill(175,175,175);
    rect(this.pos.x+65,this.pos.y+150,180,500);
    
    for (int i = 0; i < numPieces; i++){ //Draws broken pieces
      fill(this.colour);
      square(pieces[i].x, pieces[i].y, size[i]);  
      if (pieces[i].y < 425) {
        pieces[i].add(velocity[i]); //Animates broken pieces falling
      }
    }
  }
  
  void updateHouse(String m, int fs) {
    super.updateShelter(m, fs);
  }
  
  void resetHouse() { //Resets building back to original state
    this.colour = color(188, 74, 60); 
    this.pos = new PVector(200, 300);
    
    for (int i = 0; i < numPieces; i++) { 
      pieces[i] = new PVector(random(this.pos.x, this.pos.x + 150), random(this.pos.y - 250, this.pos.y - 80));
      size[i] = random(40, 55);
      velocity[i] = new PVector(random(-5, 5), random(10, 15));
    }
  }
}
