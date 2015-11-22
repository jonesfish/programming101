int[] winningNumbers(){
  int[] lotteryNum = new int[6];
  int pickNum;
  for (int i=0; i<6; i++){
    do {
      pickNum = int(random(49)+1);
    }while ( isExist(pickNum, lotteryNum) );
    
    lotteryNum[i] = pickNum;
  }
  println(lotteryNum);
  return lotteryNum;
}

boolean isExist(int pickNum, int[] lotteryNum){
  for (int i=0; i< lotteryNum.length; i++){
    if (lotteryNum[i] == pickNum){
      return true;
    }
  }
  return false;
}

boolean isWin(int[] arr1, int[] arr2){
  int count = 0;
  for (int i=0; i<arr1.length; i++){
    if ( isExist(arr1[i], arr2) ){
      count++;
    }
  }
  
  if (count >=3){
    return true;
  }else{
    return false;
  }
  
}

void setup(){
  randomSeed(3);
  int [] myNum = {5,17,36,16,29,38};
  println( isWin( myNum, winningNumbers() ) ? "win" : "lose");
}