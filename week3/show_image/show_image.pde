PImage shipImg;
PImage backgroundImg;
int x;

void setup(){
  size(640,480);
  x = 0;
  shipImg = loadImage("img/ship.png");
  backgroundImg = loadImage("img/background1.png");
}

void draw(){
  image(backgroundImg,0,0);
  image(shipImg,x,200);
  x += 2;
}