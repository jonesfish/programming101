class Monkey extends Mammal{
  Monkey(){
    super("monkey.png");
  }
  
  void climb(){
    y += -0.5;
  }
}