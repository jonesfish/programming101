class Mammal{
  float x,y;
  PImage img;
  
  Mammal(){
    x = 0;
    y = 0;
  }
  Mammal(String filename){
    img = loadImage(filename);
    x = 0;
    y = 0;
  }
  void moveTo(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  void display(){
    image (img, x,y);
  }
}