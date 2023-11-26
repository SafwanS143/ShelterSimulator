class Raindrop {
  PVector pos;
  float d;
  color colour;
  
  Raindrop(color c) {
    this.pos = new PVector(random(-100, 700), -100);
    this.d = random(3, 5);
    this.colour = c;
  }
  
  void drawRaindrop() {
    noStroke();
    fill(this.colour);
    circle(this.pos.x, this.pos.y, this.d);
    stroke(0);
  }
  
  void raindropColourUpdate(int r, int g, int b) {
    this.colour = color(r, g, b);
  }
}
