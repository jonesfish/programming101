/* pixelize */
import processing.video.*;

int numPixelsWide, numPixelsHigh;
int blockSize = 10;
Movie mov;

void setup() {
 size(640, 360);
 noStroke();
 mov = new Movie(this, "bug.mp4");
 mov.loop();
 numPixelsWide = width / blockSize;
 numPixelsHigh = height / blockSize;
 noStroke();
}

// Display values from movie
void draw() {

 if (mov.available() == true) {
   background(255);

   mov.read();
   mov.loadPixels();
   for (int j = 0; j < numPixelsHigh; j++) {
     for (int i = 0; i < numPixelsWide; i++) {
       color col = mov.pixels[i*blockSize+j*blockSize*mov.width];
       fill(col);
       ellipse(i*blockSize, j*blockSize, blockSize, blockSize);
     }
   }
 }

}