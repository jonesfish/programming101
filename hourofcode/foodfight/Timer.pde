class Timer{
  int startTime;
  int duration;
  
  Timer(int duration){  // ms
    this.duration = duration;
    start();
  }
  
  void start(){
    startTime = millis();
  }
  
  int elapse(){
    return (millis() - startTime);
  }
  
  boolean isHalf(){
    return ((millis() - startTime) >= duration/2) ? true: false;
  }
  
  boolean isEnd(){
    return ((millis() - startTime) >= duration) ? true: false;
  }
  
  
}