class Complex extends Shelter {
  //Broken building fields
  int numPieces = 40;
  float[] size = new float[numPieces];
  PVector[] pieces = new PVector[numPieces];
  PVector[] velocity = new PVector[numPieces];
  
  Complex(String m, int fs) {
    super(m, fs);
    c = 0.73; //Value that adjusts impact of foundation and overall strength

    this.pos = new PVector(200, 300);

   // Broken building pieces
    for (int i = 0; i < numPieces; i++) { 
      pieces[i] = new PVector(random(this.pos.x-100, this.pos.x+300), random(this.pos.y-200, this.pos.y+250));
      size[i] = random(35, 45);
      velocity[i] = new PVector(random(-3, 2),random(13, 18));
    }
  }
  
  //Methods
  void drawComplex() {
    // Pavement
    fill(175,175,175);
    rect(this.pos.x-100,this.pos.y+50,400,500);
    
    //Base
    fill(this.colour);
    rect(this.pos.x-100, this.pos.y-100, 400, 300);
    rect(this.pos.x-105, this.pos.y+50, 410, 15);
    line(this.pos.x+100, this.pos.y-100, this.pos.x+100, this.pos.y+200);

    //Roof
    quad(this.pos.x-120, this.pos.y-100, this.pos.x-100, this.pos.y-230, this.pos.x+300, this.pos.y-230, this.pos.x+320, this.pos.y-100);
    triangle(this.pos.x-90, this.pos.y-120, this.pos.x, this.pos.y-220, this.pos.x+90, this.pos.y-120);
    triangle(this.pos.x+110, this.pos.y-120, this.pos.x+200, this.pos.y-220, this.pos.x+290, this.pos.y-120);
  
    //Windows
    fill(199, 242, 240);
    rect(this.pos.x+120, this.pos.y+80, 60, 100); //Bottom
    rect(this.pos.x+20, this.pos.y+80, 60, 100);
    rect(this.pos.x-80, this.pos.y-70, 70, 100); //Top
    rect(this.pos.x+10, this.pos.y-70, 70, 100);
    rect(this.pos.x+120, this.pos.y-70, 70, 100);
    rect(this.pos.x+210, this.pos.y-70, 70, 100);
    circle(this.pos.x, this.pos.y-160, 40); //Roof
    circle(this.pos.x+200, this.pos.y-160, 40);
    
    //Awning
    fill(this.colour);
    quad(this.pos.x+110, this.pos.y+110, this.pos.x+120, this.pos.y+80, this.pos.x+180, this.pos.y+80, this.pos.x+190, this.pos.y+110);
    quad(this.pos.x+10, this.pos.y+110, this.pos.x+20, this.pos.y+80, this.pos.x+80, this.pos.y+80, this.pos.x+90, this.pos.y+110);
    
    //Doors
    fill(209, 121, 56);
    rect(this.pos.x-65, this.pos.y+100, 60, 100);
    rect(this.pos.x+205, this.pos.y+100, 60, 100);
    fill(250, 181, 20);
    circle(this.pos.x-55, this.pos.y+150, 10);
    circle(this.pos.x+215, this.pos.y+150, 10);
  }
  
  void drawBrokenComplex() {
    // Pavement
    fill(175,175,175);
    rect(this.pos.x-100,this.pos.y+50,400,500);
    
    for (int i = 0; i < numPieces; i++){ //Draws broken pieces
      fill(this.colour);
      square(pieces[i].x, pieces[i].y, size[i]);  
      if (pieces[i].y < 450) {
        pieces[i].add(velocity[i]); //Animates broken pieces falling   
      }
    }
  }
  
  void updateComplex(String m, int fs) { // Updates the Complex
    super.updateShelter(m, fs);
  }
  
  void resetComplex() { //Resets building back to original state
    this.pos = new PVector(200, 300);
    
    for (int i = 0; i < numPieces; i++) {
      pieces[i] = new PVector(random(this.pos.x-100, this.pos.x+300), random(this.pos.y-200, this.pos.y+250));
      size[i] = random(35, 45);
      velocity[i] = new PVector(random(-3, 2),random(13, 18));
    }
  }
}
