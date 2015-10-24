// draw bricks
int brickWidth = 80;
int brickHeight = 40;

size(400,360);
fill(128,64,0);
stroke(255,0,0); //<>//

int ix = 50, iy = 100;  // ver2
int spacing = 5;
for (int row = 0; row < 4; row++){
  for (int col = 0; col < 4; col++){
    int x = ix + col * (brickWidth + spacing); //<>//
    int y = iy + row * (brickHeight + spacing);
    if ( row % 2 == 0){ 
      rect(x,y,brickWidth, brickHeight);
    }else{
      rect(x-brickWidth/2,y,brickWidth, brickHeight);
    }
  }
} 