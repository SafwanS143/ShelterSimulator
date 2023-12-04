void naturalDisasters() {
  // Applies chosen natural disaster for 10 seconds
  if(play && !reset) {
    Play.setVisible(false);
    checkDestruction();
    if(naturalDisasterChosen == 1) {
      earthquake();
      timerEnd = 600;
    }
   
    else if(naturalDisasterChosen == 2) {
      tsunami();
      timerEnd = 200;
    }
   
    else if(naturalDisasterChosen == 3) {
      tornado();
      timerEnd = 200;
    }
   
    timer++;
   
    if(timer == timerEnd) {
      play = false;
      reset = true;
      Play.setVisible(true);
    }
  }
}

void earthquake() {
  if(true) {
    // shakes the ground and selected building by a randomly generated value
    PVector randomShake = new PVector(int(random(-3, 3)), int(random(-2, 2)));
    ground.add(randomShake);
   
    if(shelterChosen == 0) {
      tent.pos.add(randomShake);
    }
   
    else if(shelterChosen == 1) {
      house.pos.add(randomShake);
    }
   
    else if(shelterChosen == 2) {
      threeStory.pos.add(randomShake);
    }
   
    else {
      skyscraper.pos.add(randomShake);
    }
  }
}


void tsunami() {
  image(tsunami, xTsunami, -5);

  xTsunami += 12; 
}

void tornado() {
  image(tornado, xTornado, yTornado);
  
  xTornado += 10;
  yTornado += random(-8, 8);
}

void checkDestruction() {
  if (shelterChosen == 0){}
  
  else if (shelterChosen == 1){
    if (xTsunami + 800 > house.pos.x || xTornado + 300 > house.pos.x)
      shelterSurvive = false;
  }
  else if (shelterChosen == 2) {
    if (xTsunami + 800 > threeStory.pos.x || xTornado + 300 > threeStory.pos.x)
      shelterSurvive = false;
  }
  else {
    if (xTsunami + 800 > skyscraper.pos.x || xTornado + 300 > skyscraper.pos.x) 
      shelterSurvive = false;
  }
}
