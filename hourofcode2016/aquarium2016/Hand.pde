class Hand{
  float x,y;
  PImage openImg, closeImg;
  boolean grabbed;
  
  Hand(){
    openImg = loadImage("img/hand_open.png") ;
    closeImg = loadImage("img/hand_grab.png") ;
    grabbed = false;
  }
  // 閉手
  void close(){
  
  }
  // 張手
  void open(){

  }
  // 移動
  void move(){

  }
  // 顯示
  void display(){
    if (grabbed){
      image(closeImg, x, y);
    }else{
      image(openImg, x, y);
    }
  }
}