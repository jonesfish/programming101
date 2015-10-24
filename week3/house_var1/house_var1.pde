
size(300,300);
background(0);

int x;
int y;

x = 80;
y = 50;

// roof
stroke(255);  // white
fill(#ff0000);  // red
triangle(x+30,y,x,y+30,x+60,y+30);

rectMode(CORNERS);

// wall
fill(#ffff00);
rect(x,y+30,x+60,y+60);

// door
stroke(0);
fill(255);
rect(x+30,y+40,x+50,y+60);