float x;
float y;
float speed = 5;

void setup() {
  size(500, 500);
  x = width/2;
  y = height/2;
}

void draw() {
  background(0);
  // UFO
  fill(151,37,210);
  ellipse(x, y, 50, 15);
  fill(186,0,255);
  stroke(255);
  arc(x, y, 25, 25, PI, TWO_PI);
} 

void keyPressed() {
  if (key == CODED) {  // detect special keys 
   switch (keyCode) {
     case UP:  // 38
       y -= speed;
       break;
     case DOWN:  //40
       y += speed;
       break;
     case LEFT:  //37
       x -= speed;
       break;
     case RIGHT:  //39
       x += speed;
       break;
   }
  }
}