class Car{
  float x,y;
  float speed;
  PImage img;
  Mammal driver;
  
  Car(){
    img = loadImage("truck.png");
    x = width;
    y = 0;
    speed = 0;
    driver = new Mammal();
  }
  
  void forward(){
    x -= speed;
    if (x<-img.width){
      x = width;
    }
  }
  
  void display(){
    if (driver != null){
      driver.moveTo(x,y);
      driver.display();
    }
    image(img,x,y);
  }
  
  void setDriver(Mammal driver){
    this.driver = driver;
  }
  
}