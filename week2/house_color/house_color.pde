/*
   draw a small house
   author: Jones
   update: 2015/08/15
*/
size(300,300);
background(0);

// roof
stroke(255);  // white
fill(#ff0000);  // red
triangle(30,0,0,30,60,30);

rectMode(CORNERS);

// wall
fill(#ffff00);
rect(0,30,60,60);

// door
stroke(0);
fill(255);
rect(30,40,50,60);