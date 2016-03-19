class Vein {
  // variables
  float x, y;
  float noiseX, noiseY;
  float noiseSpdX, noiseSpdY; 
  


  // constructor
  Vein(float _x, float _y) {
    x = _x;
    y = _y;
    noiseSpdX = random(0.005, 0.05); //*
    noiseSpdY = random(0.005, 0.05); //*
  }
 

 void mousePressed() {
  createVein( mouseX, mouseY );
}


void createVein( float x, float y ) {
  lines.add( new Vein( x, y ) );
}