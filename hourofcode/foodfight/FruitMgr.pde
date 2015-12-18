class FruitMgr{
  static final int EMPTY = 0;
  static final int BANANA = 1;
  static final int HAMI = 2;
  ArrayList<Fruit> fruits ;
  ArrayList<Bullet> bullets ;
  int [][] fMap;
  boolean enableFire;
  
  FruitMgr(boolean enanbleFire){
    fruits = new ArrayList<Fruit>();
    bullets = new ArrayList<Bullet>();
    this.enableFire = enanbleFire;
    
    fMap = new int[Util.colNum][Util.rowNum];
    for (int i=0; i<Util.colNum ; i++){
      for (int j=0; j<Util.rowNum; j++){
        fMap[i][j] = EMPTY;
      }
    }
  }
  
  boolean isHitFruit(float x, float y, float w, float h){
    for (Fruit f: fruits){
      // shift a distance: width/2 --> hit the center
      if (Util.isHit(x,y,w,h,f.x,f.y,f.w/2,f.h)){
        fruits.remove(f);
        fMap[f.col][f.row] = EMPTY;
        return true;
      }
    }
    return false;
  }
  
  boolean isHitBullet(float x, float y, float w, float h){
    for (Bullet b: bullets){
      if (Util.isHit(x,y,w,h,b.x,b.y,b.w,b.h)){
           
        bullets.remove(b);
        return true;
      }
    }
    return false;
  }
  
  boolean add(int type , int col , int row){
    if (fMap[col][row] == EMPTY){
      fruits.add(new Fruit(type, col, row, this));
      fMap[col][row] = type;
      return true;
    }else{
      return false;
    }
  }
  
  void addBullet(float x ,float y, float speed, PImage image){
    bullets.add(new Bullet(x,y,speed,image));
  }
  
  void display(){
    // show fruits
    for (Fruit f : fruits) {
      f.display();
    }
    // show bullets
    if (enableFire){
      for (Bullet b : bullets) {
        b.fly();
      }
    }
  }
}