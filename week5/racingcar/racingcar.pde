final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_WIN = 2;
final int GAME_OVER = 3;

float car1X, car2X;
float carWidth;
float maxSpeed;

int gameState;

PImage car1, car2, start, win, lose;

void setup(){
  size (400,300);
  // load images
  car1 = loadImage("img/car1.png");
  car2 = loadImage("img/car2.png");
  start = loadImage("img/start.png");
  win = loadImage("img/win.png");
  lose = loadImage("img/lose.png");
  // init variables
  carWidth = 80;
  maxSpeed = 3;
  gameState = GAME_START;
}

void draw(){
  background(255);
  
  switch (gameState){
    case GAME_START:
      // reset x position
      car1X = car2X = 0;
      // mouse action
      if (mouseY > 10 && mouseY < 60){
        if (mousePressed){
          // click
          gameState = GAME_RUN;
        }else{
          // hover
          noStroke();
          fill(255,255,0,100);
          rect(0,10,width,60);
        }
      }
      // show message
      image(start,0,16);
      // show car
      image(car1, car1X, height/3);
      image(car2, car2X, height*2/3);
      break;
      
    case GAME_RUN:
      // move car
      car1X += random(0, maxSpeed);
      car2X += random(0, maxSpeed);
      // show car
      image(car1, car1X, height/3);
      image(car2, car2X, height*2/3);
      // show line
      stroke(255,0,0);
      line(width-carWidth,0,width-carWidth,height);
      // win or lose
      if (car1X >= width-carWidth){
        gameState = GAME_WIN;
      }else if (car2X >= width-carWidth){
        gameState = GAME_OVER;
      }
      break;
      
    case GAME_WIN:
      // mouse action
      if (mouseY > 100 && mouseY < 160){
        if (mousePressed){
          // click
          gameState = GAME_START;
        }else{
          // hover
          noStroke();
          fill(255,255,0,100);
          rect(0,100,width,60);
        }
      }
      // show message
      image(win,0,106);
      break;
      
    case GAME_OVER:
      // mouse action
      if (mouseY > 100 && mouseY < 160){
        if (mousePressed){
          // click
          gameState = GAME_START;
        }else{
          // hover
          noStroke();
          fill(255,255,0,100);
          rect(0,100,width,60);
        }
      }
      // show message
      image(lose,0,106);
      break;
  }
}