float btnX, btnY, btnW, btnH;

void setup(){
  size(320,200);
  btnX = 50;
  btnY = 50;
  btnW = 100;
  btnH = 100;
}

void draw(){
  if (mouseX >= btnX && mouseX <= btnX+btnW &&
      mouseY >= btnY && mouseY <= btnY+btnH){
      if (mousePressed){
        // click
        fill(255,0,0);
      }else{
        // hover
        fill(0,255,0);
      }
  }else {
    fill(0,0,255);
  }
  rect(btnX,btnY,btnW,btnH);
}