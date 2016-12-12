//
//  Hour of Code { 彩虹水族箱 } - 每條魚都有在一起的權利 - Dec. 12, 2016
//
//
//  Created by Rosali Chang on 2016/12/08.
//  Revised by Jones Yu.
//  Special thanks to Radian Jheng.
//  Photo credit to Youga Chang.
//
/*
Background music:
「Kevin MacLeod」創作的「Beach Party - Islandesque」是根據「Creative Commons Attribution」(https://creativecommons.org/licenses/by/4.0/) 授權使用
來源：http://incompetech.com/music/royalty-free/index.html?isrc=USUAN1100613
演出者：http://incompetech.com/
*/

// 背景
PImage bgImg ;
// 手
Hand hand;

// 使用聲音相關函式
import      ddf.minim.* ;
Minim       minim ;
AudioPlayer bgMusic ;               // 背景音樂
AudioSample kiss ;                  // 接吻音效

// 管理動物
Aquatic fishes[];  // 水族箱裡的魚
int catchFishID;  // 被抓到魚的編號
final int MAX_FISH = 10;  // 最多十支魚

void setup() {
  size(800, 600) ;
  noCursor();  // 讓鼠標消失
  hand = new Hand();
  
  // 讀入背景圖
  bgImg     = loadImage("img/bgImage.png") ;

  // 背景音樂、相戀音效
  minim   =  new Minim(this) ;
  kiss    =  minim.loadSample("audio/kiss.mp3", 512) ;
  bgMusic =  minim.loadFile("audio/Beach_Party_Islandesque.mp3") ;
  bgMusic.play() ;
  bgMusic.loop() ;
  
  // 準備魚群陣列
  fishes = new Aquatic[MAX_FISH];
  catchFishID = -1;  // no catch
  
  // 加入魚群
  for (int i=0; i < MAX_FISH; i++){

        fishes[i] = new Salmon();

  }
}


void draw() {
  image(bgImg, 0, 0, width, height) ;
  
  // 讓水生動物移動並呈現在畫布上
  for (int i = 0; i < MAX_FISH; i++) {
      fishes[i].move() ;
      fishes[i].display() ;
  }
  
  hand.move();
  hand.display();
  
}

void mousePressed() {
  hand.close();
}

void mouseReleased() {
  hand.open();

}