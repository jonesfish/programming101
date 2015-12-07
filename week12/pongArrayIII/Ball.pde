class Ball{
  float x;
  float y;
  float xSpeed;
  float ySpeed;
  float size;
  
  Ball(float size, float xSpeed){
    x = random(width);
    y = random(height);
    this.xSpeed = xSpeed;
    this.ySpeed = size;
    this.size = size;
  }
  
  void display(){
    ellipse(x,y,size,size);
  }
  
  void move(){
    x+=xSpeed;
    y+=ySpeed;
    
    if (x<0 || x>width){
      xSpeed *= -1;
    }
    if (y<0 || y>height){
      ySpeed *= -1;
    }
    
    if (isHit(board)){
      ySpeed *= -1;
    }
  }
  
  boolean isHit(Bar b){
     /*
     http://stackoverflow.com/questions/401847/circle-rectangle-collision-detection-intersection
     */
     float radius = size/2;
     float circleDistanceX = abs(x - b.x);
     float circleDistanceY = abs(y - b.y);
   
     if (circleDistanceX > (b.w/2 + radius)) { return false; }
     if (circleDistanceY > (b.h/2 + radius)) { return false; }
   
     if (circleDistanceX <= (b.w/2)) { return true; }
     if (circleDistanceY <= (b.h/2)) { return true; }
   
     float cornerDistance_sq = pow(circleDistanceX - b.w/2, 2) +
                          pow(circleDistanceY - b.h/2, 2);
   
     return (cornerDistance_sq <= pow(radius,2));
  }
}