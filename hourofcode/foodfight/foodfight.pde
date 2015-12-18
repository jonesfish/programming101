import ddf.minim.*;
Minim minim ;


final int BANANA = 1;
final int HAMI = 2;
final int GAMESTART = 0;
final int GAMERUN = 1;
final int GAMEOVER = 2;
final int GAMEWIN = 3;

PImage bg;
PImage bgStart;
PImage bgOver;
PImage bgWin;
int wallet;
int currFruit;
int gameState;

GameAudio audio ;

Button hami;
Button banana;

Money money;
FruitMgr fruitMgr;

int zombieNum;
int zombieCount;
int zombieInterval;
Timer zombieTimer;
ArrayList<Milk> milks;

void restart(){
  wallet = 0; // assignment operator
  currFruit = BANANA;
  zombieCount = 0;
  
  money = new Money(3000);  // delay 3000ms
  
  fruitMgr = new FruitMgr(true);
  
  zombieTimer = new Timer(zombieInterval);

  milks = new ArrayList<Milk>();
}

void setup(){
  size(640,480);
  
  minim = new Minim(this);
  audio = new GameAudio () ; 
  
  bg = loadImage("img/bg_play.jpg");  // initialize
  bgStart = loadImage("img/bg_start.jpg");
  bgOver = loadImage("img/bg_lose.jpg");
  bgWin = loadImage("img/bg_win.jpg");

  hami = new Button("hami_btn", 235,10);
  banana = new Button("banana_btn",300,10);

  zombieInterval = 2000;  //ms
  zombieNum = 10;

  gameState = GAMESTART;
}

void draw(){
  switch (gameState){
    case GAMESTART:
      image(bgStart,0,0);
      showStartText();
      
      break;
    case GAMERUN:
      image(bg,0,0);  // use
      
      textSize(20);
      textAlign(RIGHT);
      fill(0);  // fill color 0-255: grey scale
      text(wallet, 210,50);
      
      if (currFruit == BANANA){
        hami.on = false;
        banana.on = true;
      }else{
        hami.on = true;
        banana.on = false;
      }
      hami.display();
      banana.display();
      
      textSize(15); 
      fill (0);
      text("50", banana.x + 50 , banana.y +25) ;
      text("100", hami.x + 50, hami.y +25);
      
      
      // hit detection
      println( money.x ,  money.y ,money.w , money.h ) ; 
      if (mouseX > money.x && mouseY > money.y &&
          mouseX < money.x+money.w && mouseY < money.y+money.h){
        wallet += 50;
        money.restart();
        audio.playMoneyEaten();
        //println (mouseX,mouseY) ;
      }
      
      fruitMgr.display();

      // zombie milks
      if (zombieTimer.isEnd() && zombieCount < zombieNum){
        int x = Util.getXbyCol(7);
        int y = Util.getYbyRow(int(random(4)));
        milks.add(new Milk(x,y));
        zombieTimer.start();
        zombieCount ++;
      }
      for (int i=0; i < milks.size(); i++){
        Milk m = milks.get(i);
        m.move();
        // hit detection          
        if (fruitMgr.isHitFruit(m.x,m.y,m.w,m.h)) {
          //println("hit fruit");
          fill(0);
          noStroke();
          audio.playFruitDie();
          rect(m.x,m.y,m.w,m.h);
        }
        if (fruitMgr.isHitBullet(m.x,m.y,m.w,m.h)) {
          m.hurt();
          if (m.isDead()){
            milks.remove(i);
          }
        }
        // pass the line
        if (m.x < 0){
          gameState = GAMEOVER;
        }
      }

      money.drop();
      
      if (isWin()){
        gameState = GAMEWIN;
        zombieInterval -=200;
        zombieNum +=10;
      }
      
      break;
    case GAMEOVER:
      image(bgOver,0,0);
      showStartText();
      break;
      
    case GAMEWIN:
      image(bgWin,0,0);
      showStartText();
      break;
  }


}

void showStartText(){
  textSize(20);
  textAlign(CENTER);
  fill(255,0,0);  // fill red color
  text("Press 's' to Start", width/2,height*4/5);
}

boolean isWin(){
  return (milks.size() == 0 && zombieCount == zombieNum);
}

void keyPressed(){
  // for practice 
  switch (gameState){
    case GAMEWIN:
    case GAMESTART:
    case GAMEOVER:
      if (key == 's'){
        restart();
        gameState = GAMERUN;
      }
      break;
  }

  if (key == 'e'){
    gameState = GAMEOVER;
  }
}


void mousePressed(){
  // for practice 
  if (gameState == GAMERUN){
    if (mouseX > hami.x && mouseY > hami.y &&
        mouseX < hami.x+hami.w && mouseY < hami.y+hami.h){
          // hit hami
          currFruit = HAMI;
    }
    if (mouseX > banana.x && mouseY > banana.y &&
        mouseX < banana.x+banana.w && mouseY < banana.y+banana.h){
          // hit banana
          currFruit = BANANA;
    }
    if (Util.isXYInGrid(mouseX,mouseY)){
      int col = Util.getColbyX(mouseX);
      int row = Util.getRowbyY(mouseY);
      //println(col,row);

      if (wallet >= 100 && currFruit == HAMI){
        boolean ok = fruitMgr.add(HAMI, col, row);
        if (ok) wallet -= 100;
      }else if (wallet >= 50 && currFruit == BANANA){
        boolean ok = fruitMgr.add(BANANA, col, row);
        if (ok) wallet -= 50;
      }
    }
  }
}