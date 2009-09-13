#include <stdio.h>
#include <stdlib.h>

//Big mess of 1-letter-variables.
//8 seconds with -O3.
int main(){
	//all binary strings use the same 27 bytes
	//27 because 2^27 > 100000000.
	char* s = malloc(27);
	int r,j,i,p,o,h,q,z=0,c=0;
	for(; c<=100000000; c++){
		j=0;
		q=c;
		while(q>0){
			r=q%2;
			q/=2;
			s[j++]=r+'0';
		}
		p=1;
		o=j%2==0?-1:0;
		//actually doesn't even bother to reverse
		//the binary string since we're not printing it.
		for(i=0, h=j/2; i<=h; i++){
			if(s[h-i]!=s[h+i+o]){
				p=0;
				break;
			}
		}
		if(p) z++;
	}
	free(s);
	//result is 1 off because program doesn't account for
	//0 being a palindrome.
	printf("%d", z+1);
	return 0;
}
