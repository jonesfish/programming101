void setup() {
  size(300, 300);
  background(255);
}

void draw() {
  if (mousePressed){   
    if (mouseButton == LEFT){
      stroke(255,0,0);
    }else {
      stroke(0);
    }

    line(pmouseX,pmouseY, mouseX,mouseY);
  }
}