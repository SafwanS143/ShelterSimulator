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
PVector ground = new PVector(-200, 350);
boolean play = false;
boolean reset = false;
int timer = 0;
int fps = 60;
int timerEnd = 600;
boolean shelterSurvive = true;

float xTsunami = -1000;
PImage tsunami;

float xTornado = -500;
float yTornado = -150;
PImage tornado;
PImage tornadoFlipped; 

Skyscraper skyscraper = new Skyscraper("Brick", 50);
House house = new House("Brick", 50);
ThreeStory threeStory = new ThreeStory("Brick", 50);
Tent tent = new Tent(50);
Complex townhouse = new Complex("Brick", 50);


void setup() {
  size(600, 600);
  frameRate(fps);
  
  tsunami = loadImage("tsunami.png");
  tsunami.resize(1150, 0);
  
  tornado = loadImage("tornado.png");
  tornado.resize(800, 0);
  tornadoFlipped = loadImage("tornadoFlipped.png");
  tornadoFlipped.resize(800, 0);
  
  
  createGUI();
}

void draw() {
  background(135, 206, 235);
  setVisibility();
  
  if(temp <= 0)
    fill(247, 245, 245); //Snowy ground
  else 
    fill(108, 209, 0);
  rect(ground.x, ground.y, 1000, 650); // Grass Ground
  
  drawBuilding();
  drawRain();
  naturalDisasters();
}

void updateBuilding(String a, int b) {
  
  if(shelterChosen == 0) {
    tent.updateTent(b);
  }
  
  else if(shelterChosen == 1) {
    house.updateHouse(a, b);
  }
  
  else if(shelterChosen == 2) {
    threeStory.updateThreeStory(a, b);
  }
  
  else if(shelterChosen == 3) {
    skyscraper.updateSkyscraper(a, b);
  }
  
  else {
    townhouse.updateComplex(a, b);
  }
}

void drawRain() {
  
  if(random(0, 50) <= precipitationValue) {
    for(int i = 0; i < 2; i ++)
      rain.add(new Raindrop(rainColour));
  }
  
  if(rain.size() > 0) {
    for(Raindrop r: rain) {
      if(temp > 0) {
        r.raindropColourUpdate(0,0,255);
        rainSpeed = new PVector(int(-(2 + precipitationValue/(100.0/3.0))), 10 + (precipitationValue / 5.0));
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
    label4.setText("Strength");
  }
  
  else {
    Material.setVisible(true);
    label2.setVisible(true);
    label4.setText("Foundation Strength");
  }
}

void drawBuilding() {
  // Draws selected building
  if(shelterChosen == 0) {
    if (shelterSurvive)
      tent.drawTent();
    //else
    //draw broken tent
  }
  
  else if(shelterChosen == 1) {
    if (shelterSurvive)
      house.drawHouse();
    else
      house.drawBrokenHouse();
  }
  
  else if(shelterChosen == 2) {
    if (shelterSurvive)
      threeStory.drawThreeStory();
    else
      threeStory.drawBrokenThreeStory();
  }
  
  else if (shelterChosen == 3) {
    if (shelterSurvive)
      skyscraper.drawSkyscraper();
    else
      skyscraper.drawBrokenSkyscraper();
  }
  
  else {
    if (shelterSurvive)
      townhouse.drawComplex();
    else
      townhouse.drawBrokenComplex();
  }
}

void reset() {
  shelterChosen = 1;
  naturalDisasterChosen = 0;
  disasterSelected = false;
  precipitationValue = 0;
  temp = 20;
  shelterSurvive = true;

  play = false;
  reset = false;

  timer = 0;
  xTsunami = -1000;
  xTornado = -500;
  
  //Resets structures
  house.resetHouse();
  threeStory.resetThreeStory();
  skyscraper.resetSkyscraper();
  tent.resetTent();
  townhouse.resetComplex();
  
  //Sets GUI sliders back to normal
  precipitation.setValue(0);
  FoundationStrength.setValue(50);
  temperature.setValue(20);
  disasterSeverity.setValue(1);
  Material.setSelected(2);
  shelterType.setSelected(1);
  naturalDisaster.setSelected(0);
}
