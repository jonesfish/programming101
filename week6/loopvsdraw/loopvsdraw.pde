int x = 0;

void setup(){
  size(400,300);
  frameRate(10);
  ellipseMode(CORNER);
}

// repeat all the time --> refresh the screen continuously
void draw(){
   // repeat within a single frame
   while ( x < width){
     ellipse(x,100,20,20); //<>//
     x += 20;
   }
}