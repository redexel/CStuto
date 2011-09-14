
#include <iostream>

bool ps[201];

int fill(int a, int b){
  for(int i=a; i<=b; i++) ps[i] = true;
}

int main()
{
  for(int i=1; i<=200; i++) ps[i] = false;

  //100-150,25-28,8-14,113-120,1,8-81,47-48,99-109,149-102,66-34,5,123-125,80-87
  fill(100,150);
  fill(25,28);
  fill(8,14);
  fill(113,120);
  fill(1,1);
  fill(8,81);
  fill(47,48);
  fill(99,109);
  fill(149,102);
  fill(66,34);
  fill(5,5);
  fill(123,125);
  fill(80,87);

  int pgs = 0;
  for(int i=1; i<=200; i++) if(ps[i]) pgs++;
  std::cout << pgs;

  return 0;
}

