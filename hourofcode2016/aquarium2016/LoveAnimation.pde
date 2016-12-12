class LoveAnimation {

  // a struct to record an love event and its duration.
  private class Record { 
    private float x, y ;
    public int frameCount = 0 ;
    
    Record (float x, float y) {
      this.x = x ; 
      this.y = y ;
    }
  }

  private PImage img ;  
  private ArrayList<Record> records = new ArrayList<Record>() ;
  private int size ;
  public  int length ;  // in second. the animation time span.  
  private float frameLength() {  // a derived property, to fix frameRate issue.
    return length * round(frameRate) ; 
  } 

  LoveAnimation (float x, float y) {
    this.img    = loadImage("img/heart.png") ;
    this.length = 1 ;  // second
    this.size   = 50 ; // pixel
    this.add(x,y);
  }

  void add (float x, float y) {
    Record r = new Record(x, y) ;
    records.add(r) ;
  }
  
  void display () {
    for (Record r : records) {

      float animationProgress = r.frameCount / frameLength() ;
      float scale = animationProgress ;
      float w = scale * size ;
      float h = scale * size ;      
       
      float alpha ; 
      if (animationProgress < 0.6) {
        alpha = animationProgress / 0.6 * 255 ;
      } else if (animationProgress < 0.8) {
        alpha = 255 ;
      } else {
        alpha = (1 - (animationProgress - 0.8) / 0.2) * 255 ;
      }
      
      tint(255, alpha) ; 
      imageMode(CENTER) ;
      image(img, r.x, r.y, w, h) ;
      imageMode(CORNER) ;
      tint(255, 255) ;  // set tint to default.
      
      r.frameCount++ ;
    }
    
    // self clean finished animation.
    clean();
  }

  private void clean () {
    int i = 0 ; 
    while (i < records.size()) {
      if (records.get(i).frameCount > frameLength())
        records.remove(i) ;  
      else 
        i++ ;
    }
    //println(Records.size());
  }
}