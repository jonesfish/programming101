int x, y;
int speedX, speedY;

void setup(){
  size(300,300);
  x = 150;
  y = 150;
  speedX = floor(random(-5,5));
  speedY = floor(random(-5,5));
}

void draw(){
  background(0);
  ellipse(x,y,15,15);
  x += speedX;
  y += speedY;
}