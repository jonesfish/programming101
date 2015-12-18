class Money{
  float x;
  float y;
  float w;
  float h;
  float speed;
  int elapse;
  Timer t;
  PImage img;
  
  Money(int e){
    img = loadImage("img/money.png");
    w = img.width;
    h = img.height;
    speed = 1;
    elapse = e;  //ms
    t = new Timer(elapse);
    
    restart();
  }
  
  void restart(){
    x = random(width-img.width);
    y = -img.height;
    t.start();
  }
  
  void drop(){
    if (t.isEnd()){
      y+=speed;
      // boundary
      if (y > height){
        restart();
      }
      display();
    }
  }
  
  void display(){
    image(img, x,y);
  }
}