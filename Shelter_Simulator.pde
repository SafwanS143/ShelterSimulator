import g4p_controls.*;

// Global Variables
int shelterChosen = 1;
int naturalDisasterChosen = 0;
boolean disasterSelected = false;
float precipitationValue = 0;
int temp = 20;
color rainColour = color(0, 0, 255);
ArrayList<Raindrop> rain = new ArrayList();
PVector rainSpeed = new PVector(-5, 20);

Skyscraper skyscraper = new Skyscraper("Brick", 50);
House firstHouse = new House("Brick", 50);
ThreeStory threeStory = new ThreeStory("Brick", 50);
Tent tent = new Tent(50);


void setup() {
  size(600, 600);
  
  createGUI();
}

void draw() {
  background(135, 206, 235);
  setVisibility();
  
  if(temp <= 0)
    fill(247, 245, 245); //Snowy ground
  else 
    fill(108, 209, 0);
  rect(-1, 350, 601, 600); //Ground
  
  if(shelterChosen == 0) {
    tent.drawTent();
  }
  
  else if(shelterChosen == 1) {
    firstHouse.drawHouse();
    //firstHouse.drawBrokenHouse();
  }
  
  else if(shelterChosen == 2) {
    threeStory.drawThreeStory();
    //threeStory.drawBrokenThreeStory();
  }
  
  else {
    skyscraper.drawSkyscraper();
    //skyscraper.drawBrokenSkyscraper();
  }
  
  drawRain();
  
}

void updateBuilding(String a, int b) {
  
  if(shelterChosen == 0) {
    
  }
  
  else if(shelterChosen == 1) {
    firstHouse.updateHouse(a, b);
  }
  
  else if(shelterChosen == 2) {
    threeStory.updateThreeStory(a, b);
  }
  
  else {
    skyscraper.updateSkyscraper(a, b);
  }
}

void drawRain() {
  
  if(random(0, 50) <= precipitationValue) {
    rain.add(new Raindrop(rainColour));
  }
  
  if(rain.size() > 0) {
    for(Raindrop r: rain) {
      if(temp > 0) {
        r.raindropColourUpdate(0,0,255);
        rainSpeed = new PVector(-5, 20);
      }
      
      else {
        r.raindropColourUpdate(255,255,255);
        rainSpeed = new PVector(random(-2, 2), 3);
      }
      r.pos.add(rainSpeed);
      r.drawRaindrop();
    }
    
    for(int i = 0; i < rain.size(); i++) {
      if(rain.get(i).pos.y >= 610)
        rain.remove(i);
    }
  }
}

void setVisibility() { //Sets visibility of GUI buttons
  if (disasterSelected) {
    disasterSeverity.setVisible(true);  
    label9.setVisible(true);
  }
  
  else {
    disasterSeverity.setVisible(false);  
    label9.setVisible(false);
  }
  
  if (shelterChosen == 0) {
    Material.setVisible(false);
    label2.setVisible(false);
  }
  
  else {
    Material.setVisible(true);
    label2.setVisible(true);
  }

}
