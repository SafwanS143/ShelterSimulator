class ThreeStory extends Shelter {
  
  ThreeStory(String m, int fs) {
    super(m, fs);
    
    //Broken building pieces
    for (int i = 0; i < numPieces; i++) { 
      pieces[i] = new PVector(random(150, 450), random(150, 350));
      size[i] = random(35, 45);
      velocity[i] = new PVector(random(-3, 2),random(13, 18));
    }
  }
  
  void drawThreeStory() {
    fill(this.colour);
    rect(50, 100, 500, 350);
    rect(40, 90, 520, 10);
    fill(199, 242, 240);
    
    int xW;
    int yW;
    for(int i = 0; i < 7; i++) {
      xW = 75 + 70 * i;
      for(int j = 0; j < 3; j++) {
        yW = 125 + 110 * j;
        if(i != 3 || j != 2)
          rect(xW, yW, 30, 50);
      }
    }
    
    fill(209, 121, 56);
    rect(260, 370, 80, 80);
    line(300, 370, 300, 450);
    line(50, 210, 550, 210);
    line(50, 320, 550, 320);
    fill(250, 181, 20);
    circle(290, 420, 10);
    circle(310, 420, 10);
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
}
