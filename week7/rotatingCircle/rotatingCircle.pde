float angle=0;
float phi=0;
float spacing = 25;
float size = spacing*5/3;
void setup(){
  size(400,400);
}

void draw(){
  background(255);
  float ix = 0, iy = 0;
  for (int i = 0; i<20; i++){
    for (int j=0; j<20; j++){
      float x = ix+i*spacing;
      float y = iy+j*spacing;
      angle += 0.66; //<>//
      noFill(); //<>//
      ellipse(x,y,size,size);
      // satellite
      fill(0);
      float sx = x+cos(angle+phi)*size/2;
      float sy = y+sin(angle+phi)*size/2;
      ellipse(sx,sy,5,5);
    }
  }
  angle = 0;
  phi += 0.105;
}