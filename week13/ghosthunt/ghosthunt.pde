import ddf.minim.*;
Minim minim;
AudioPlayer song;
AudioSample gunshot;
AudioSample over;

Ghost ghost;
Pinky pinky;
Inky inky;

void setup()
{
  size(500,500);
  ghost = new Ghost(width/2,height/2);
  pinky = new Pinky(width/2,height/2);
  inky = new Inky(width/2,height/2);
  
  minim = new Minim(this);
  song = minim.loadFile("fight2.mp3");
  gunshot = minim.loadSample("gunshot.wav",256);
  over = minim.loadSample("gameover.mp3",512);
  song.loop();
}
void draw()
{
  background(255);

  if (!ghost.isHitByMouse()) {
    ghost.move();
    ghost.draw();
  }
  else {
    over.trigger();
    ghost.dead();
  }

  if (!inky.isHitByMouse()) {
    inky.move();
    inky.draw();
  }
  else {
    over.trigger();
    inky.dead();
  }

  if (!pinky.isHitByMouse()) {
    pinky.randomSpeed();
    pinky.move();
    pinky.draw();
  }
  else {
    over.trigger();
    pinky.dead();
  }
}

void mousePressed(){
  gunshot.trigger();
}