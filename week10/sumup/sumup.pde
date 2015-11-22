int sum(int [] arr){
  int total = 0;
  for (int i=0; i<arr.length; i++){
    total += arr[i];
  }
  return total;
}

// function overloading
float sum(float [] arr){
  float total = 0;
  for (int i=0; i<arr.length; i++){
    total += arr[i];
  }
  return total;
}

void setup(){
  float [] numbers = {5,7,1,3.3,4,9,2};
  float total = sum(numbers);
  println(total);
}