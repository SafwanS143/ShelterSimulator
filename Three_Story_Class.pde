class ThreeStory extends Shelter {
  //Broken building fields
  int numPieces = 40;
  float[] size = new float[numPieces];
  PVector[] pieces = new PVector[numPieces];
  PVector[] velocity = new PVector[numPieces];
  
  ThreeStory(String m, int fs) {
    super(m, fs);
    c = 0.725; //Value that adjusts impact of foundation strength
    
    this.pos = new PVector(50, 100);
    
    //Broken building pieces
    for (int i = 0; i < numPieces; i++) { 
      pieces[i] = new PVector(random(this.pos.x, this.pos.x+500), random(this.pos.y+50, this.pos.y+250));
      size[i] = random(35, 45);
      velocity[i] = new PVector(random(-3, 2),random(13, 18));
    }
  }
  
  void drawThreeStory() {
    // Pavement
    fill(175,175,175);
    rect(this.pos.x,this.pos.y+250,500,500);
    
    //Base
    fill(this.colour);
    rect(this.pos.x, this.pos.y, 500, 350);
    rect(this.pos.x-10, this.pos.y-10, 520, 10);
    fill(199, 242, 240);
    
    //Windows
    int xW;
    int yW;
    for(int i = 0; i < 7; i++) {
      xW = int((this.pos.x + 25) + 70 * i);
      for(int j = 0; j < 3; j++) {
        yW = int((this.pos.y + 25) + 110 * j);
        if(i != 3 || j != 2)
          rect(xW, yW, 30, 50);
      }
    }
    
    //Door
    fill(209, 121, 56);
    rect(this.pos.x+210, this.pos.y+270, 80, 80);
    fill(250, 181, 20);
    circle(this.pos.x+240, this.pos.y+320, 10);
    circle(this.pos.x+260, this.pos.y+320, 10);
    
    //Story separation
    line(this.pos.x+250, this.pos.y+270, this.pos.x+250, this.pos.y+350);
    line(this.pos.x, this.pos.y+110, this.pos.x + 500, this.pos.y+110);
    line(this.pos.x, this.pos.y+220, this.pos.x + 500, this.pos.y+220);
  }
  
  void drawBrokenThreeStory() {
    for (int i = 0; i < numPieces; i++){ //Draws broken pieces
      fill(this.colour);
      square(pieces[i].x, pieces[i].y, size[i]);  
      if (pieces[i].y < 450) {
        pieces[i].add(velocity[i]);   
      }
    }
    
    // Pavement
    fill(175,175,175);
    rect(this.pos.x,this.pos.y+250,500,500);
  }
  
  void updateThreeStory(String m, int fs) {
    super.updateShelter(m, fs);
  }
  
  void resetThreeStory() {
    this.colour = color(188, 74, 60); 
    this.pos = new PVector(50, 100);

    for (int i = 0; i < numPieces; i++) { 
      pieces[i] = new PVector(random(this.pos.x, this.pos.x+500), random(this.pos.y+50, this.pos.y+250));
      size[i] = random(35, 45);
      velocity[i] = new PVector(random(-3, 2),random(13, 18));
    }
  }
}
