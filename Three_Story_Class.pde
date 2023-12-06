class ThreeStory extends Shelter {
  int numPieces = 40;
  float[] size = new float[numPieces];
  PVector[] pieces = new PVector[numPieces];
  PVector[] velocity = new PVector[numPieces];
  
  ThreeStory(String m, int fs) {
    super(m, fs);
    this.pos = new PVector(50, 100);
    
    //Broken building pieces
    for (int i = 0; i < numPieces; i++) { 
      pieces[i] = new PVector(random(this.pos.x, this.pos.x+500), random(this.pos.y+50, this.pos.y+250));
      size[i] = random(35, 45);
      velocity[i] = new PVector(random(-3, 2),random(13, 18));
    }
  }
  
  void drawThreeStory() {
    fill(this.colour);
    rect(this.pos.x, this.pos.y, 500, 350);
    rect(this.pos.x-10, this.pos.y-10, 520, 10);
    fill(199, 242, 240);
    
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
    
    fill(209, 121, 56);
    rect(this.pos.x+210, this.pos.y+270, 80, 80);
    line(this.pos.x+250, this.pos.y+270, this.pos.x+250, this.pos.y+350);
    line(this.pos.x, this.pos.y+110, this.pos.x + 500, this.pos.y+110);
    line(this.pos.x, this.pos.y+220, this.pos.x + 500, this.pos.y+220);
    fill(250, 181, 20);
    circle(this.pos.x+240, this.pos.y+320, 10);
    circle(this.pos.x+260, this.pos.y+320, 10);
  }
  
  void drawBrokenThreeStory() {
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
