static class Util{
  static final int colNum = 8 ;
  static final int rowNum = 4 ;
  static final int left = 95 , right = 625 , top = 90 , bottom = 470 ;  
  static final int w = right - left ;
  static final int h = bottom - top ;
  static final float wSpacing = w / colNum ;
  static final float hSpacing = h / rowNum ;  
  
  static boolean isHit(float ax, float ay, float aw, float ah, float bx, float by, float bw, float bh) {
    return (
      ax+aw > bx       &&
      ax    < bx + bw  &&
      ay+ah > by       &&
      ay    < by + bh  );
  } 
  
  static boolean isXYInGrid (int mouseX, int mouseY){
    return  (mouseX > left && mouseX < right && mouseY > top && mouseY < bottom ) ;  
  }
  static int getColbyX (int mouseX){
    return floor((mouseX -left )  / wSpacing ); 
  }
  static int getXbyCol (int colIndex){
    return int(left + colIndex * wSpacing);
  }
  static int getRowbyY (int mouseY){
    return  floor((mouseY - top) / hSpacing ); 
  }
  static int getYbyRow (int rowIndex){
    return int(top + rowIndex * hSpacing) ;
  }
}