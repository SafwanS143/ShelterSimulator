import g4p_controls.*;

// Global Variables
int shelterChosen = 1;
int naturalDisasterChosen = 0;
int temp = 20;
int timer = 0;
int timerEnd = 600;
int fps = 60;

boolean shelterSurvive = true;
boolean disasterSelected = false;
boolean play = false;
boolean reset = false;

color rainColour = color(0, 0, 255);
ArrayList<Raindrop> rain = new ArrayList();
PVector rainSpeed = new PVector(-5, 20);
PVector ground = new PVector(-200, 350);

float disasterStrength = 0;
float precipitationValue = 0;
float xTsunami = -1000;
float yTsunami = -5;
float xTornado = -500;
PImage tsunami, tornado, tornadoFlipped;

// Creating shelter objects with initial values
Skyscraper skyscraper = new Skyscraper("Brick", 55);
House house = new House("Brick", 55);
ThreeStory threeStory = new ThreeStory("Brick", 55);
Tent tent = new Tent(55);
Complex duplex = new Complex("Brick", 55);

void setup() {
  size(600, 600);
  frameRate(fps);
  
  // Loading images
  tsunami = loadImage("tsunami.png");
  tsunami.resize(1150, 0);
  
  tornado = loadImage("tornado.png");
  tornado.resize(800, 0);
  tornadoFlipped = loadImage("tornadoFlipped.png");
  tornadoFlipped.resize(800, 0);
  
  createGUI();
  
  // Required so that intial building functions properly
  house.updateHouse("Brick", 55);
}

void draw() {
  background(135, 206, 235);
  
  //Sets the visibility of GUI buttons
  setVisibility(); 
  
  if(temp <= 0)
    fill(247, 245, 245); //Snowy ground
  else 
    fill(108, 209, 0);
  rect(ground.x, ground.y, 1000, 650); // Grass Ground
  
  // Draws structures, rain/snow, and natural disasters
  drawBuilding();
  drawRain();
  naturalDisasters();
}

void updateBuilding(String a, int b) {
  
  // Updates each shelter object accordingly (Used in GUI)
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
    duplex.updateComplex(a, b);
  }
}

void drawRain() {
  // Makes a new raindrop based on the precipitation value
  if(random(0, 50) <= precipitationValue) {
    for(int i = 0; i < 2; i ++)
      rain.add(new Raindrop(rainColour));
  }
  
  // Sets color and adds velocity to each raindrop
  if(rain.size() > 0) {
    for(Raindrop r: rain) {
      
      if(temp > 0) { // Rain
        r.raindropColourUpdate(0,0,255);
        rainSpeed = new PVector(int(-(2 + precipitationValue/(100.0/3.0))), 10 + (precipitationValue / 5.0));
      }
      
      else {  // Snow
        r.raindropColourUpdate(255, 255, 255);
        rainSpeed = new PVector(random(-2, 2), 3);
      }
      
      r.pos.add(rainSpeed);
      r.drawRaindrop();
    }
    
    // Deletes raindrop if rain is off the screen
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
    else
      if (disasterSelected && naturalDisasterChosen != 2 && naturalDisasterChosen != 3)
        tent.drawBrokenTent(); //Draws detroyed tent after natural disaster
      
      else if(naturalDisasterChosen == 2 || naturalDisasterChosen == 3) {  // Draws tent being blown away
        tent.drawTent();
      }  
      
      else
        tent.drawTentCollapse(); //Draws tent collapsing due to precipitation
  }
  
  
  // Draws building or broken building
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
      duplex.drawComplex();
    else
      duplex.drawBrokenComplex();
  }
}

void reset() { //Resets program to original state
  shelterChosen = 1;
  naturalDisasterChosen = 0;
  disasterSelected = false;
  disasterStrength = 0;
  precipitationValue = 0;
  temp = 20;
  shelterSurvive = true;

  play = false;
  reset = false;

  timer = 0;
  timerEnd = 600;
  xTsunami = -1000;
  yTsunami = -5;
  xTornado = -500;
  
  //Resets structures
  house.resetHouse();
  threeStory.resetThreeStory();
  skyscraper.resetSkyscraper();
  tent.resetTent();
  duplex.resetComplex();
  
  //Sets GUI sliders back to normal
  precipitation.setValue(0);
  FoundationStrength.setValue(55);
  temperature.setValue(20);
  disasterSeverity.setValue(1);
  Material.setSelected(2);
  shelterType.setSelected(1);
  naturalDisaster.setSelected(0);
}

void resetDisasters() { // Resets disasters for when the building survives
  timer = 0;
  timerEnd = 600;
  xTsunami = -1000;
  yTsunami = -5;
  xTornado = -500;
}
