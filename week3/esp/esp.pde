/*
[1]首先，隨意挑一個數字（0～9）。
[2]把這個數字乘上2。
[3]然後加上5。
[4]再乘以 50。
[5]把得到的數目，加上1765。
[6]最後一個步驟，用這個數目減去你出生的西元年份。
現在你會有一個三位數的數字。
第一個位數：是你一開始選擇的數目。
接下來的二個位數：就是你的年齡。
*/

int guess = 3;
int birthYear = 1988;
int result;

result = (guess*2 + 5)*50 + 1765 - birthYear;
/* How does it work?
   result = (guess*100) + (2015-birthYear);
*/
println(result);