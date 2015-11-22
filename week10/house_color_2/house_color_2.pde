/*
   original code can be downloaded from
   https://github.com/jonesfish/programming101/week2/house_color
*/
void setup(){
  size(300,300);
  background(0);
  
  for (int i=0; i<5; i++){
    float spacing = width/5;
    float x = i*spacing;
    house(x, 100, (i+1)/5.0);
  }
}

void house(float x, float y, float s){
  pushMatrix();
  translate(x,y);
  scale(s);
  // roof
  stroke(255);  // white
  fill(#ff0000);  // red
  triangle(30,0,0,30,60,30);
  
  rectMode(CORNERS);
  
  // wall
  fill(#ffff00);
  rect(0,30,60,60);
  
  // door
  stroke(0);
  fill(255);
  rect(30,40,50,60);
  popMatrix();
}