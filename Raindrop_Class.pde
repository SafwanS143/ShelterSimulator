class Raindrop {
  PVector pos;
  float d;
  color colour;
  
  Raindrop(color c) {
    int xStart, xEnd;
    if(temp > 0) {
      xStart = 100;
      xEnd = 1000;
    }
    else {
      xStart = 0;
      xEnd = 600;
    }
    this.pos = new PVector(random(xStart, xEnd), -300);
    this.d = random(3, 5);
    this.colour = c;
  }
  
  void drawRaindrop() {
    noStroke();
    fill(this.colour);
    if(temp > 0) {
      rotate(radians(30));
      ellipse(this.pos.x, this.pos.y, this.d, this.d + 7);
      resetMatrix();
    }
    else 
      circle(this.pos.x, this.pos.y, this.d);
    stroke(0);
  }
  
  void raindropColourUpdate(int r, int g, int b) {
    this.colour = color(r, g, b);
  }
}
