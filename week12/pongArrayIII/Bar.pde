class Bar{
  float x,y,w,h;
  
  Bar(float length){
    w = length;
    h = 10;
    x = width/2;
    y = height/2;
  }
  
  void move(){
    x = mouseX;
  }
  
  void display(){
    rectMode(CENTER);
    rect(x,y,w,h);
  }
  
}