// global variables
float x, y, size;
float startY, endY;
float laneGap;
float [] carSpeed;
float [] carX;

int nbrCar = 5;
int life = 3;

final int GAME_START = 1;
final int GAME_WIN = 2;
final int GAME_LOSE = 3;
final int GAME_RUN = 4;
final int DIE = 5;
int gameState;

// Sprites
PImage imgChicken, imgGhost, imgEgg;
PImage [] imgCars;
PImage imgWin, imgLose;

void setup(){
  size(400,400);
  textFont(createFont("font/Square_One.ttf", 20));  
  textAlign(CENTER);
  
  carX = new float[nbrCar];
  carSpeed = new float[nbrCar];
  
  size = 40;
  laneGap = size+10;
  x = width/2;
  y = 0;  
  startY = 0;
  endY = laneGap*(nbrCar+1);
  
  imgCars = new PImage[nbrCar];
  for (int i=0; i<nbrCar; i++){
    imgCars[i] = loadImage("data/car"+i+".png");
    carX[i] = width;
    carSpeed[i] = random(1,5);
  }
  imgChicken = loadImage("data/chicken.png");
  imgGhost = loadImage("data/ghost.png");
  imgEgg = loadImage("data/egg.png");
  imgWin = loadImage("data/win.png");
  imgLose = loadImage("data/lose.png");

  // start game
  gameState = GAME_START;
}

void showSafeArea(){
   fill(4,13,78);
   rect(0,startY,width,laneGap);
   rect(0,endY, width, laneGap);
}

void showLife(){
   for(int i=0;i<life;i++){
       image(imgEgg,i*size,height-laneGap);
   }  
}

void checkDest(){
    if (y >= endY){
      // increase car speed
      for (int i=0; i<nbrCar; i++){
        carSpeed[i] ++;
      }
      gameState = GAME_WIN;
   }
}

// Need to redesign this function: too many jobs inside one function
void showCars(){
   for (int i=0; i<nbrCar; i++){
     float carY = (i+1)*laneGap;
     carX[i] -= carSpeed[i];
     // boundary detection
     if (carX[i] < 0){
       carX[i] = width;
     }
     // show cars
     image(imgCars[i],carX[i],carY);
     // hit Test
     if (x+size > carX[i] && x < carX[i]+size &&
         y+size > carY && y < carY+size){
         // decrease life
         life--;
         gameState = DIE;
     }
    }   
}

void draw(){
  switch (gameState){
   case GAME_START:
       background(10,110,16);
       text("Press Enter", width/2, height/2);    
       break;
   case GAME_RUN:
       background(10,110,16);
       
       // start and end area
       showSafeArea();
       
       // show life
       showLife();
       // show chicken
       image(imgChicken, x, y);
       
       // check destination 
       checkDest();
       
       showCars();     
       break;
   case DIE:
       // check life
       if (life <= 0){
          // reset car speed
          for (int i=0; i<nbrCar; i++){
            carSpeed[i] = random(1,5);
          }
         gameState = GAME_LOSE;
       }
       image(imgGhost, x, y);
       break;
   case GAME_WIN:
       background(0);
       display(imgWin, "You win!!");
       break;
   case GAME_LOSE:
       background(0);
       display(imgLose, "You lose!!");   
       break;
  }
}

void display(PImage img, String message){
   image(img,width/4,height/4);
   fill(255);
   text(message,width/2,height/4);
}

void keyPressed() {
    if (key == CODED && gameState == GAME_RUN) {
     switch(keyCode) {
     case UP:
       y -= laneGap;
       break;
     case DOWN:
       y += laneGap;
       break;
     case LEFT:
       x -= laneGap;
       break;
     case RIGHT:
       x += laneGap;
       break;  
     }
    }
    
    // boundary
    x = (x<0) ? 0 : x;
    x = (x>width-laneGap) ? width-laneGap : x;
    y = (y<0) ? 0 : y;
    y = (y>height) ? height : y;
    
    if(key==ENTER && gameState != GAME_RUN){
      if (gameState == GAME_LOSE){
         // restart the game
         life=3; 
      }
      
       x = width/2;
       y = startY;
       gameState = GAME_RUN;
    }
}