class Aquatic{
  // static var
  final float PROPOSING_DISTANCE = 60;  // 求偶相距距離
  // public var 
  float x, y, xSpeed, ySpeed;
  float w, h, size; 
  int gender; // 0:male, 1:female
  boolean dragable; // 是否可被抓
  boolean isCatched;  // 是否被抓住
  boolean isProposing; // 是否正在求偶
  boolean isMarried; // 是否已結婚
  Aquatic partner;   // 跟隨對象 
  
  // private var
  float hitX, hitY;  // 被抓住時的 x,y
  PImage img;
  // 標示愛心
  Love heart;
  // 相戀動畫
  LoveAnimation loveAnimation; 
  
  Aquatic(String filename){
    isCatched = false;
    isProposing = false;
    isMarried = false;
    dragable = true;
    gender = floor(random(2));  // 0 or 1
    filename = (gender == 0) ? "img/"+filename+"_xx.png" : "img/"+filename+"_xy.png";
    img = loadImage( filename );
    
    setSize( random(0.5, 0.8) );  // 0.5x to 0.8x
    x = random(width-w);
    y = random(height-h);
    xSpeed = random(3)+1;
    ySpeed = random(3)+1;
  }
  
  // 設定大小（依倍率）
  void setSize(float s){
    this.size = s;
    w = img.width * size;
    h = img.height * size;
  }
  
  // 游泳
  void swim() {
    x += xSpeed;
    y += ySpeed;
    
    if(x<0 || x>width- w ){ 
      xSpeed *=-1;
    }
    if(y<0 || y>height- h){ 
      ySpeed *=-1; 
    }
  }
  
  // 移動
  void move(){
    if (isCatched){
      
    }else if (isProposing){
      
    }else if (partner != null){
      
    }else {
      swim();
    }
  }
  
  // 顯示
  void display() { 
    // change the horizontal direction
    boolean hDirection = (xSpeed > 0) ? true : false;
    if (hDirection){
      pushMatrix();
      translate(x,y);
      scale(1, 1);
      if (isCatched) {
        tint(0,128); // shadow
        image(img, 0, 0, w, h);
        noTint();    // pick up
        image(img, -10, -10, w, h);
      }else{
        image(img, 0, 0, w, h);
      }
      popMatrix();      
    }else{
      pushMatrix();
      translate(x,y);
      scale(-1, 1);
      if (isCatched) {
        tint(0,128); // shadow
        image(img, -w-10, 10, w, h);
        noTint();    // pick up
        image(img, -w, 0, w, h);
      }else{
        image(img, -w, 0, w, h);
      }
      popMatrix();
    }
    
  }
  
  // 是否被滑鼠點中？
  boolean isHit(){
    hitX = mouseX-x;
    hitY = mouseY-y;
    return (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) ? true : false; 
  }
  
  // 是否碰到另一支魚？
  boolean isHit(Aquatic a){
    return (a.x+a.w > x && a.x < x+w && a.y+a.h > y && a.y < y+h);
  }

}