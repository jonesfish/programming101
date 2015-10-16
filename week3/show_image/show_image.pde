PImage shipImage;
PImage backgroundImage;

int x, y;

void setup(){
  size(640,480);
  x = 0;
  y = 200;
  shipImage = loadImage("img/ship.png");
  backgroundImage = loadImage("img/background1.png");
}

void draw(){
  image(backgroundImage,0,0);
  image(shipImage,x,y);
  x++;
}