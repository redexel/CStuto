#include "stdio.h"
#include "stdlib.h"
#include "string.h"

#define UP_TO 1000000

int digsum(int i){
	int sum=0;
	char* str = malloc(6);
	sprintf(str, "%d", i);
	for(int j=0; j<strlen(str); j++)
		sum+=str[j]-'0';
	free(str);
	return sum;
}

int main(){
	char* sv = malloc(UP_TO);
	int s=0;
	for(int i=0; i<UP_TO; i++)
		sv[i] = 1;
	for(int i=2; i<UP_TO; i++){
		if(sv[i]==1){
			if(digsum(i)==14)
				s++;
			for(int k=2; k<=(UP_TO/i); k++){
				sv[i*k] = 0;
			}
		}
	}
	free(sv);
	printf("%d\n", s);
	return 0;
}
