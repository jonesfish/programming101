String word = "Where is the banana line?";
String mistake = "banana";
String newWord;

int i = word.indexOf(mistake);

String front = word.substring(0,i);
String back = word.substring(i+mistake.length(),word.length());

newWord = front+"Bannan"+back;

println (newWord);