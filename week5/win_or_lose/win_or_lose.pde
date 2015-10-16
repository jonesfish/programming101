  int rnd;
  rnd = (int)random(6)+1; //1,2,3,4,5,6
  println(rnd);
  
  switch (rnd){
    case 1:
    case 2:
    case 3:
      println("win");
      break;
    default:
      println("lose");
      break;
  }
  