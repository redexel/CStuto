#include <stdio.h>

typedef long long Long;

int main(){
	Long div = 232792560LL;
	Long s=0;
	for(Long i=1; i<100000000; i++){
		Long h = i * (2*i-1);
		if(h%div==0)
			s++;
	}
	printf("%d", s);
	return 0;
}
