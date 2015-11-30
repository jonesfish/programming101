Ball [] balls;

void setup(){
  size(640,480);
  balls = new Ball[50];
  for (int i=0; i<balls.length; i++){
    balls[i] = new Ball(random(10));
  }
}

void draw(){
  background(255);
  for (int i=0; i<balls.length; i++){
    balls[i].move();
    balls[i].display();
  }
}
