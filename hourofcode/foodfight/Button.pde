class Button{
  float x;
  float y;
  float w;
  float h;
  PImage imgOn;
  PImage imgOff;
  boolean on;
  
  Button(String name, float x, float y){
    imgOn = loadImage("img/"+name+"_press.png");
    imgOff = loadImage("img/"+name+".png");
    this.x = x;
    this.y = y;
    w = imgOn.width;
    h = imgOn.height;
    on = false;
  }
  
  void display(){
    if (on){
      fill(255,0,0);
      noStroke();
      ellipse(x+w/2, y+h/2, w, h);
      image(imgOn, x,y);
    }else{   
      image(imgOff,x,y);
    }
  }
}