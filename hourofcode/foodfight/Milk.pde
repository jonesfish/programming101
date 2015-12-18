class Milk{
  float x;
  float y;
  float w;
  float h;
  float speed;
  int life;
  int walkImageIndex;
  int walkImageInterval;  //ms
  Timer t;
  boolean dead;
  PImage[] walkImage = new PImage[4];
  PImage imgHit;
  PImage imgDie;
  PImage currImage;
  
  Milk(float x, float y){
    this.x = x;
    this.y = y;
    speed = 3;
    life = 4;
    walkImageIndex = 0;
    walkImageInterval = 250;
    
    for (int i = 0 ; i < walkImage.length ; i++){
      walkImage[i] = loadImage("img/milk_0"+(i+1)+".png") ;
    }
    imgHit = loadImage("img/milk_05.png") ;
    imgDie = loadImage("img/milk_06.png") ;
    currImage = walkImage[0];
    t = new Timer(walkImageInterval);
    w = imgDie.width;
    h = imgDie.height;
    dead = false;
  }
  
  void move(){
    if (t.isEnd()){
      if (currImage == imgDie){
        dead = true;
      }else{
        x -= speed;
        currImage = walkImage[++walkImageIndex % walkImage.length];
        t.start();
      }
    }
    display();
  }
  
  boolean isDead(){
    return dead;
  }
  
  void hurt(){
    life --;
    if (life <= 0){
      //println("die");
      die();  
    }else{
      currImage = imgHit;
      t.start();
    }
  }
  
  void die(){
    currImage = imgDie;
    t.start();
    audio.playMilkDie();
    
  }
  
  void display(){
    image(currImage, x,y);
  }
}