
#include <iostream>

int maxPowTwo(int n){
  int t = 1;
  while(t*2 <= n) t *= 2;
  return t;
}

int binaryOnes(int n){
  if(n==0) return 0;
  return 1 + binaryOnes(n - maxPowTwo(n));
}

int kval(int n){
  if(n==1) return 0;
  return 1 + kval(binaryOnes(n));
}

int main()
{

  int m = 0;
  for(int i=10; i<=1000; i++)
    if(kval(i)==3) m++;

  std::cout << m;


  return 0;
}

