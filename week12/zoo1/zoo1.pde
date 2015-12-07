Mammal tiger;
Mammal dog;
Monkey monkey;
Car truck;

void setup(){
  size(400,400); 
  tiger = new Mammal("tiger.png");
  dog = new Mammal("dog.png");
  truck = new Car();
  truck.setDriver(tiger);
  monkey = new Monkey();
  monkey.moveTo(width/2, height/2);
}

void draw(){
  background(255);
  monkey.climb();
  monkey.display();
  truck.speed = 1;
  truck.forward();
  truck.display();
}