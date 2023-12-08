void naturalDisasters() {
  // Applies chosen natural disaster
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
      tornado(timer);
      timerEnd = 200;
    }
   
    timer++;
   
    if(timer == timerEnd) {
      play = false;
      if(!shelterSurvive) 
        reset = true;
      else
        resetDisasters();
      Play.setVisible(true);
    }
  }
}

void earthquake() {
  if(true) {
    // shakes the ground and selected building by a randomly generated value
    float disasterSlider = (disasterStrength - 50) / 10;
    PVector randomShake = new PVector(int(random(-2 - disasterSlider/2, 2 + disasterSlider/2)), int(random(-2, 2)));
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
   
    else if(shelterChosen == 3) {
      skyscraper.pos.add(randomShake);
    }
    
    else {
      duplex.pos.add(randomShake);
    }
  }
}


void tsunami() {
  image(tsunami, xTsunami, yTsunami);

  xTsunami += 12; 
}

void tornado(int i) {
  if(i % 10 < 5)
    image(tornado, xTornado, -150);
  else
    image(tornadoFlipped, xTornado, -150);
  
  xTornado += 10;
}

void checkDestruction() {
  if (shelterChosen == 0) { //Tent
    if (disasterSelected) { //Tent will collapse during natural disaster
      if (xTsunami + 800 > house.pos.x || xTornado + 300 > house.pos.x || timer == 570) {
        shelterSurvive = false;  
        if(xTsunami + 800 > house.pos.x || xTornado + 300 > house.pos.x) {
          tent.pos.add(new PVector(10, -1.5));
        }
      }
    }
    else { //Checks if tent will collapse due to precipitation
      if (temp > 0) {
        if (tent.foundationStrength/2 < precipitationValue && timer == 570)
          shelterSurvive = false;
      }
      else {
        if (precipitationValue > 40 && tent.foundationStrength < 20 && timer == 570)  
          shelterSurvive = false;
      }
    }
  }
  
  else { //Checks destruction of every other building
    if (shelterChosen == 1) {
      if ((xTsunami + 800 > house.pos.x || xTornado + 300 > house.pos.x || timer == 570) && house.overallStrength < disasterStrength) {
        shelterSurvive = false;
      }
    }
    else if (shelterChosen == 2) {
      if ((xTsunami + 800 > threeStory.pos.x || xTornado + 300 > threeStory.pos.x || timer == 570) && threeStory.overallStrength < disasterStrength) {
        shelterSurvive = false;
      }
    }
    else if (shelterChosen == 3) {
      if ((xTsunami + 800 > skyscraper.pos.x || xTornado + 300 > skyscraper.pos.x || timer == 570) && skyscraper.overallStrength < disasterStrength) 
        shelterSurvive = false;
    }
    
    else {
      if ((xTsunami + 800 > duplex.pos.x || xTornado + 300 > duplex.pos.x || timer == 570) && duplex.overallStrength < disasterStrength) 
        shelterSurvive = false;
    }
  }
  
  if(!shelterSurvive)
    Play.setText("Reset");
}
