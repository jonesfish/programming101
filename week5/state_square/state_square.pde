final int GO_RIGHT = 0;
final int GO_DOWN = 1;
final int GO_LEFT = 2;
final int GO_UP = 3;

float x, y;
float w, h;
float speed = 5;

int state = GO_RIGHT;

void setup() {
  size(500, 500);
  w = 50;
  h = 30;
  x = w/2;
  y = h/2;
}

void draw() {

  switch (state){
    case GO_RIGHT:
      x+= speed;
      if (x > width-w/2){
        x = width-w/2;
        state = GO_DOWN;
      }
      break;
    case GO_DOWN:
      y+=speed;
      if (y > height-h/2){
        y = height-h/2;
        state = GO_LEFT;
      }
      break;
    case GO_LEFT:
      x-=speed;
      if (x < w/2){
        x = w/2;
        state = GO_UP;
      }
      break;
    case GO_UP:
      y-=speed;
      if (y < h/2){
        y = h/2;
        state = GO_RIGHT;
      }
      break;
  }

  
  background(0);
  // UFO
  fill(151,37,210);
  ellipse(x, y, w, h/2);
  fill(186,0,255);
  stroke(255);
  arc(x, y, h*4/5, h*4/5, PI, TWO_PI);
} 