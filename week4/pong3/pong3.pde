float ballX, ballY;
float ballSize;
float centerX, centerY;
float paddleW, paddleH;
float rightPaddleX, rightPaddleY;
float leftPaddleX, leftPaddleY;
float speedX, speedY;
int leftScore, rightScore;

boolean isPlaying = false;
  
void setup(){
  size(320,200);
  background(255);
  
  centerX = width/2;
  centerY = height/2;
  ballX = centerX;
  ballY = centerY;
  ballSize = 15;
  speedX = random(-5,5);
  speedY = random(-5,5);
  paddleW = 10;
  paddleH = 50;
  rightPaddleX = width-paddleW*2;
  rightPaddleY = centerY-paddleH/2;
  leftPaddleX = paddleW;
  leftPaddleY = centerY-paddleH/2;
  
  // middle line
  stroke(128);
  line(centerX, 0, centerX, height);
  
  // ball
  noStroke();
  fill(255,0,0);
  ellipse(centerX,centerY,ballSize,ballSize);
  
  // paddles
  fill(0,0,255);
  rect(rightPaddleX, rightPaddleY, paddleW, paddleH);
  rect(leftPaddleX, leftPaddleY, paddleW, paddleH);
}

void draw(){
  if (isPlaying){
    background(255);
  
    // middle line
    stroke(128);
    line(centerX, 0, centerX, height);
    
    // -------- ball
    // move
    ballX += speedX;
    ballY += speedY;
    // boundary detection
    if (ballX < leftPaddleX+paddleW){
     speedX *= -1;
    }
    if (ballY < 0 || ballY > height){
      speedY *= -1;
    }
    // hit detection
    if ((ballX+ballSize/2) >= rightPaddleX){ 
        if (ballY >= rightPaddleY && ballY <= rightPaddleY+paddleH){
          speedX *= -1;
        }else {
          leftScore ++;
          println(leftScore, rightScore);
          isPlaying=false;
        }
    }
    // draw
    noStroke();
    fill(255,0,0);
    ellipse(ballX,ballY,ballSize,ballSize);
    // -------- ball
    
    // paddles
    fill(0,0,255);
    // right
    rightPaddleY = mouseY-paddleH/2;
    rect(rightPaddleX, rightPaddleY, paddleW, paddleH);
    // left
    leftPaddleY = ballY-paddleH/2;
    rect(leftPaddleX, leftPaddleY, paddleW, paddleH);
  }
}

void keyPressed(){
  isPlaying = !isPlaying;
  
  // restart
  ballX = centerX;
  ballY = centerY;
  speedX = random(-5,5);
  speedY = random(-5,5);
}