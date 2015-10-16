float centerX, centerY;

void setup(){
  size(320,200);
  centerX = width/2;
  centerY = height/2;
  
  //nose
  ellipse(centerX, centerY, 50,50);
  // mouth
  noFill();
  arc(centerX, centerY, height, height, 0, PI);
  //eyes
  fill(255);
  ellipse(centerX-100, centerY-50, 10,10);
  ellipse(centerX+100, centerY-50, 10,10);
}

void draw(){
  line(centerX, 0, mouseX, mouseY);
}