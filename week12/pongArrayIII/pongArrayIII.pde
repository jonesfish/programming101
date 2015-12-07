Ball [] balls;
Bar board;

void setup(){
  size(300,480);
  balls = new Ball[50];
  for (int i=0; i<balls.length; i++){
    balls[i] = new Ball(random(10), random(-5,5));
  }
  
  board = new Bar(100);
}

void draw(){
  background(255);
  for (int i=0; i<balls.length; i++){
    balls[i].move();
    balls[i].display();
  }
  
  board.move();
  board.display();
}