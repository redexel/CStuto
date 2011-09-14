
#include <iostream>

int main()
{
  // initialize dp
  int dp[25][10];
  for(int i=0; i<25; i++)
    for(int j=0; j<10; j++)
      dp[i][j] = 0;
  for(int j=0; j<10; j++)
    dp[0][j] = j+1;

  // Fill up dp
  for(int i=1; i<25; i++){

    int sum = 0;
    for(int j=0; j<10; j++){

      // Fill with sum of previous row
      sum += dp[i-1][j];
      dp[i][j] = sum;

    }

  }

  std::cout << dp[24][9];

  return 0;
}

