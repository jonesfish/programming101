
class GameAudio {

  AudioPlayer bananaShoot ; 
  AudioPlayer hamiShoot ; 
  AudioPlayer money ; 
  AudioPlayer milkDie ; 
  AudioPlayer fruitDie ; 

  GameAudio () {

    bananaShoot  = minim.loadFile("data/bananaShoot.mp3", 1024);

    hamiShoot  = minim.loadFile("data/hamiShoot.mp3", 2048);

    money  = minim.loadFile("data/money.mp3", 2048);

    milkDie  = minim.loadFile("data/milkDie.mp3", 2048);

    fruitDie  = minim.loadFile("data/fruitDie.mp3", 2048);
  }
  void playBananaShoot() {
    bananaShoot.play(0) ;
  }
  void playHamiShoot() {
    hamiShoot.play(0) ;
  }
  void playMoneyEaten() {
    money.play(0);
    //money.rewind() ;
  }
  void playMilkDie() {
    milkDie.play(0);
  }
  void playFruitDie() {
    fruitDie.play(0) ;
  }
}