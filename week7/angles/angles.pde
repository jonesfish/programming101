void setup(){
  size(300,300);
}
void draw() {
  background(204);
  pushMatrix();
  translate(width/2, height/2);
  float a = atan2(mouseY-height/2, mouseX-width/2);
  rotate(a);
  println(degrees(a));

  rectMode(CENTER);
  rect(0, 0, width/2, 20);
  popMatrix();
}