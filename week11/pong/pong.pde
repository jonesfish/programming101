Ball a,b;

void setup(){
  size(300,300);
  a = new Ball();
  b = new Ball();
}

void draw(){
  background(255);
  a.move();
  a.display();
  b.move();
  b.display();
}