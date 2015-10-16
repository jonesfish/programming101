int count = 0;
int spacing = 20;

size(400,300);
noStroke();

for (float x = 0; x<width; x+=spacing){
  if (count % 3 == 0){ //<>//
    fill(255);
  }else{
    fill(0);
  }
  rect(x, 0, x+spacing, height);
  count++;
}