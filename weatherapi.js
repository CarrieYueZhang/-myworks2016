var weatherUrlPart1 = "http://api.openweathermap.org/data/2.5/weather?q=";
var weatherUrlPart2 = "&appid=5b8a2613ab9c3533080ea401c419100c";
var city = "";
var formerCity = "";
var img1;
var img2;
var imgCloud;
var imgld;
var input;
var botton;
var myHumidity;
var imgBj;
var imgDh;
var imgClooud;
var particle = [];
var x = 0;
var y = 800;
var imgShadow;


function preload() {
  img1 = loadImage("image/80715429820139.5605340867540.jpg");
  img2 = loadImage("image/ny.png");
  imgCloud = loadImage("image/cloud.png");
  imgld = loadImage("image/ld.png");
  imgBj = loadImage("image/bj.png");
  imgDh = loadImage("image/dh.png");
  imgClooud = loadImage("image/clooud.png");
  imgShadow = loadImage("image/shadow.png");
  // loadJSON(weatherUrlPart1 + city + weatherUrlPart2, getWeather);

}



function setup() {
  input = createInput("beijing");
  button = createButton("display");
  button.mousePressed(setCity);
  createP("Try beijing, new york, delhi, london...");

  fill(0);
  createCanvas(1600, 800);
  image(img1, 0, 0);

  //loadJSON(weatherUrlPart1 + city + weatherUrlPart2, getWeather);
  print(myHumidity);

  for (var i = 0; i < myHumidity; i++) {
    particle[i] = new Particle(random(344, 344+508), random(178, 178+344));
  }

}

 function setCity() {
   formerCity != city;
   city = input.value();
   loadJSON(weatherUrlPart1 + city + weatherUrlPart2, getWeather);
 }


function getWeather(weatherData) {
  myHumidity = weatherData.main.humidity;
  particle = [];
  
  for (var i = 0; i < myHumidity; i++) {
    particle[i] = new Particle(random(344, 344+508), random(178, 178+344));
  }
 
}



function Particle(x, y) {
  this.transparent = random(50, 250);
  this.x = x;
  this.y = y;
  this.radius = random(0.5, 3);
  this.display = function() {
    fill(255, this.transparent);
    noStroke();
    var radius = random(0.5, 12);
    radius -= 1
    ellipse(this.x, this.y, radius, radius);
  }
  this.move = function() {
    this.y = this.y - random(0, 0.5);
  }
  
 
  
  this.transparency = function() {
    if (this.transparent > 0) {
      this.transparent -= 0.3;
    } else {
      this.transparent = random(100, 250);
    }
  }
  this.renew = function() {
    if (this.y < 220) {
      this.y = 522
    }
  }

}



function draw() {
 
  image(img1, 0, 0);



 if (city == "new york") {
  
  image(img2,344,178);
 
 } else if (city == "london") {
   image(imgld,344,178);
 } else if (city == "beijing") {
   image(imgBj,344,178);
 } else if (city == "delhi") {
   image(imgDh,344,178);
 }
 
 image(imgShadow,x+50,450,400,300);
  image(imgShadow,y+30,350,300,200);
 image(imgClooud,x,350);

 image(imgClooud,y,300,300,150);
 x+=0.1;
 y-=0.1;
 
  for (var i = 0; i < particle.length; i++) {
    particle[i].move();
    particle[i].transparency();
    particle[i].renew();
    particle[i].display();
  }
   
}