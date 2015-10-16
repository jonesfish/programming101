boolean white = true;
int spacing = 20;

size(400,300);
noStroke();

for (float x = 0; x<width; x+=spacing){
  if (white){ //<>//
    fill(255);
  }else{
    fill(0);
  }
  rect(x, 0, x+spacing, height);
  white = !white;
}