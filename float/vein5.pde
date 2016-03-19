  float px;
  float py;



  // functions
  void update() {
    noiseX = (noise(frameCount*noiseSpdX)-0.3) * 3; //*
    noiseY = (noise(frameCount*noiseSpdY)-0.3) * 3; //*
    //noiseX = sin(frameCount*noiseSpdX) * 2; //*
    //noiseY = sin(frameCount*noiseSpdY) * 2; //*
    // sin( freq, time, angle ) * amplitude
    //x = x + noiseX;
    //y = y + noiseY;
    x = x +(mouseX-x)*0.008 + noiseX - 0.5;
    y = y + (mouseY-y)*0.008 + noiseY - 0.5;
    
    
    //if ( frameCount % 40 == 0 && preCount != frameCount){
    // update();
    // println(0);
    // preCount = frameCount ;
    //}
  }

  void display() {
    update();
    fill(255, 0, 0);
    stroke(255, 255, 255, 50);
    //ellipse(x, y, 2, 2);
    line(x, y, px,py);
    px=x;
    py =y;
  }
} 

ArrayList<Vein> lines = new ArrayList<Vein>();


void setup() {
  size(800, 500);
  fill(255,100);
  noStroke();
  background(0);

  //lines.add( new Vein( mouse, height/2 ) );
}

void draw() {
  
  fill(0,0,0, 8);
  rect(0,0,800,500);
  for (int i=0; i<lines.size(); i++) {
    Vein l = lines.get(i);
    l.update();
    l.display();
  }
  if (frameCount % 30 == 0 && lines.size() > 0 ) {
    Vein l = lines.get( lines.size()-1 );
    lines.add( new Vein( l.x, l.y ) );
  }
  
  fill(50);
  rect(0,0, 50, 30);
  fill(255);
  text( frameCount, 10, 20);
  //background(0,0,0,10);
}

void mousePressed() {
  createVein( mouseX, mouseY );
}


void createVein( float x, float y ) {
  lines.add( new Vein( x, y ) );
}