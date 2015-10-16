float ballX, ballY;
float speedX, speedY;

void setup(){
  size(320,200);
  ballX = width/2;
  ballY = height/2;
  
  speedX = random(-5,5);
  speedY = random(-5,5);
}

void draw(){
   background(255);
  // ball
  noStroke();
  fill(255,0,0);
  ellipse(ballX,ballY,15,15);
  
  ballX += speedX;
  ballY += speedY;
  
  // Boundary detection
  if (ballX < 0 || ballX > width){
    speedX *= -1;
  }
  if (ballY < 0 || ballY > height){
    speedY *= -1;
  }

}