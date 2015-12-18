class Fruit{
  static final int BANANA = 1;
  static final int HAMI = 2;
  int col;
  int row;
  float x ;
  float y ;
  float w ;
  float h ;
  PImage normalImage ; 
  PImage shootImage ;
  PImage currImage;
  PImage bulletImg;
  float bulletSpeed;
  int cost ;
  int elapse;
  Timer t;
  FruitMgr fruitMgr;
  
  int type ; 
  
  Fruit (int type , int col , int row, FruitMgr fruitMgr){
    switch (type){
      case BANANA:
        normalImage = loadImage("img/banana_smile.png");
        shootImage = loadImage("img/banana_angry.png");
        bulletImg = loadImage("img/banana_bullet.png");
        cost = 50;
        elapse = 2000;
        bulletSpeed = 2;
        break;
      case HAMI:
        normalImage = loadImage("img/hami_smile.png");
        shootImage = loadImage("img/hami_angry.png");
        bulletImg = loadImage("img/hami_bullet.png");
        cost = 100;
        elapse = 1000;
        bulletSpeed = 3;
        break;
    }
    this.type = type ; 
    this.col = col;
    this.row = row;
    x = Util.getXbyCol(col);
    y = Util.getYbyRow(row);
    w = normalImage.width;
    h = normalImage.height;
    t = new Timer(elapse);
    currImage = normalImage;
    this.fruitMgr = fruitMgr;
  }
  
  void fire(){
    currImage = shootImage;
    
    t.start();
    fruitMgr.addBullet(x+w/2,y+h/2,bulletSpeed,bulletImg);
    
    switch (type){
      case BANANA:
        audio.playBananaShoot() ; 
        break ;
      case HAMI : 
        audio.playHamiShoot();
        break ;
    }
  }
  
  void display(){
    if (t.isHalf()){
      // back to normal
      currImage = normalImage;
    }
    if (t.isEnd()){
      // fire
      fire();
    }
    // show fruit
    image(currImage, x,y);
  }
}