size(400,300);

// setup variable
int x = 0;

// test condition
while ( x < width ){
  line(x,0,x,height);
  // change variable
  x += 50;
}

for (int y=0; y < height; y+=50){
  line (0,y,width,y);
}