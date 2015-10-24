size(350,350);
background(0);

for (int i = 10; i < width; i = i + 50){
  pushMatrix();
  translate(i, i);
  // draw a house
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