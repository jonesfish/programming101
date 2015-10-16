void Setup() {    // logic error
  println("setup is running");
  size(500, 500);
  background(0);
}

void draw() {
   ellipse(mouseX, mouseY, 10, 10);
}