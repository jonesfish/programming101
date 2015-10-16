PImage diamond = loadImage("img/diamond.png");;

size(400,400);

final int COUNT = 5; // 5 diamonds at a line

float spacingX = width/COUNT;
float spacingY = height/COUNT;

float x = 0, y1 = 0, y2 = height-spacingY;

for (int i=0; i<COUNT; i++){
  x = i*spacingX;
  image(diamond,x,y1);
  y1 += spacingY;
  
  image(diamond,x,y2);
  y2 -= spacingY;
}