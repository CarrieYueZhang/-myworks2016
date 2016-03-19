
//0   1         2   3       4         5          6             7          8       9            10             11      12        13        14         15     16
//id~hotelName~stars~price~cityName~stateName~countryCode~countryName~address~location~url~tripadvisorUrl~latitude~longitude~latlong~propertyType~chainId~rooms~facilities~checkIn~checkOut~rating




void setup() {
  size(1278, 720, P3D);
  background(255);
  smooth();
  for (int n = 0; n <1278; n++) {
    stroke(0);
    strokeWeight(1);
    line(n, 0, n, 720);
    n = n*10;
    print(n);
  }
  loadHotels("hotelsbase.csv");
}

void draw() {
}

void loadHotels(String url) {
  String[] rows=loadStrings(url);
  for (int i = 0; i< rows.length; i++) {
    String row = rows[i];
    String[] cols = row.split("~");
    noStroke();
   


    if (cols.length > 12) {
      float lat = float(cols[12]);
      float lon = float(cols[13]);
      float price = float(cols[2]);



      float x = map(lon, -180, 180, 0, width);
      float y = map(lat, 90, -90, 0, height) ;
      fill(0, 10);
      ellipse(x, y, 1, 1);

     
    }
  }
}