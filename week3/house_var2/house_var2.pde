
size(300, 300);
background(0);

int x, y, w, h;
// 1st house
x = 80;
y = 50;
w = 40;
h = 30;

// roof
stroke(255);  // white
fill(#ff0000);  // red
triangle(x+ w/2, y, x, y+ h/2, x+w, y+h/2);

rectMode(CORNERS);

// wall
fill(#ffff00);
rect(x, y+h/2, x+w, y+h);

// door
stroke(0);
fill(255);
rect(x+w/2, y + 4.0/6*h, x+ 5.0/6*w, y+h);
//println(x+w/2, y + 4.0/6*h, x+ 5.0/6*w, y+h);
//println( 4.0/6*h, 5.0/6*w);

// 2nd house
x = 180;
y = 150;
w = 80;
h = 60;

// roof
stroke(255);  // white
fill(#ff0000);  // red
triangle(x+ w/2, y, x, y+ h/2, x+w, y+h/2);

rectMode(CORNERS);

// wall
fill(#ffff00);
rect(x, y+h/2, x+w, y+h);

// door
stroke(0);
fill(255);
rect(x+w/2, y + 4.0/6*h, x+ 5.0/6*w, y+h);
//println(x+w/2, y + 4.0/6*h, x+ 5.0/6*w, y+h);
//println( 4.0/6*h, 5.0/6*w);