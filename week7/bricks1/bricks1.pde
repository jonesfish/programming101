// draw bricks
int brickWidth = 80;
int brickHeight = 40;

size(400,360);
fill(128,64,0);
stroke(255,0,0);

for (int y=0; y<height; y+=brickHeight){
 for (int x=0; x<width; x+=brickWidth){
   if ( y % (2*brickHeight) == 0){ 
     rect(x,y,brickWidth, brickHeight);
   }else{
     rect(x-brickWidth/2,y,brickWidth, brickHeight);
   } //<>//
 }
} //<>//