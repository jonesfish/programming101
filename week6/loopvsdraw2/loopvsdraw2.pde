void setup(){
  size(400,300);
  colorMode(HSB);
}

// repeat all the time --> refresh the screen continuously
void draw(){
  background(0);
  float spacing = 20;
  for (float x=0; x < width; x+=spacing){
    if (x > mouseX){
      break;
    }
    //if (x < mouseX){
    //  continue;
    //}
    float hue = x/width * 255;
    noStroke();
    fill(hue, 255, 255);
    rect(x,0,spacing,height);
  }
}