void setup(){
  size(400,400);
}

void draw(){
  background(255);
  fill(204, 102, 0);
  noStroke();
  
  int nbrCircles = 8;
  float spacing = width/nbrCircles;
  float minSize = spacing*1/5;
  float maxSize = spacing*4/5;
  
  for(int i = 0; i< nbrCircles; i++){
    for(int j = 0; j< nbrCircles; j++){

      float x = spacing/2 + i*spacing;
      float y = spacing/2 + j*spacing;
      float distance = dist(mouseX,mouseY,x,y);
      // version 1
      //float circleSize = map(distance, 0, width, maxSize, minSize);
      // version 2
      float circleSize = constrain(1/distance*1000, minSize,maxSize);
      
      ellipse( x, y, circleSize, circleSize);
    }
  }
}