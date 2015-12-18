class Bullet {
  PImage img ; 
  float speed ; 
  float x ; 
  float y ; 
  float w ; 
  float h ;
  
  Bullet (float x ,float y, float speed, PImage image){
    this.x = x ; 
    this.y = y ; 
    this.speed = speed ; 
    this.img = image ;
    this.w = image.width ;
    this.h = image.height ;
  }
  
  void fly (){
    x += speed ;
    display();
  }
  
  void display (){
    image (img,x,y) ; 
  }
  
}