class Love {

  PImage img ;
  float x, y ;

  Love () {
    img = loadImage("img/heart.png") ;
  }

  void moveTo (float x, float y) {
    this.x = x ;
    this.y = y ;
  }

  void display () {
    image(img, x, y, 20, 20);
  }
}