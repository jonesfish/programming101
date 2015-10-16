size(400,300);

colorMode(HSB);

float spacing = 20;

for (float x=0; x < width; x+=spacing){
  float hue = x/width * 255;
  noStroke();
  fill(hue, 255, 255);
  rect(x,0,spacing,height);
} //<>//