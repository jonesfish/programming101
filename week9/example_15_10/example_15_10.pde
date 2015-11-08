// Learning Processing
// Daniel Shiffman
// http://www.learningprocessing.com

// Example 15-10: Brightness threshold

PImage source;      // Source image

void setup() {
  size(200,200);
  source = loadImage("sunflower.jpg");
}

void draw() {
  float threshold = 127;
  
  // We are going to look at both image's pixels
  loadPixels();
  
  for (int x = 0; x < source.width; x++ ) {
    for (int y = 0; y < source.height; y++ ) {
      int loc = x + y*source.width;
      // Test the brightness against the threshold
      if (brightness(source.pixels[loc]) > threshold){
        pixels[loc] = color(255); // White
      } else {
        pixels[loc] = color(0);   // Black
      }
    }
  }
  
  // We changed the pixels in destination
  updatePixels();
}