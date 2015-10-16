void setup(){
  size(320,200);
}

void draw(){
  background(255);
  fill(255,0,0);
  
  if (mouseX > width/3){
    rect(width/3, 0, width/3, height);
  }else if (mouseX > width*2/3){
    rect(width*2/3, 0, width/3, height);
  }else {
    rect(0,0,width/3, height);
  }
 //<>//
  // dividing lines
  line(width/3, 0, width/3, height);
  line(width*2/3, 0, width*2/3, height);
}