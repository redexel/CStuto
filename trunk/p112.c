#include "stdio.h"
#include "stdlib.h"

//Millionth prime.
#define UP_TO 15485864

int main(){

	char* str = malloc(10);
	char* sv = malloc(UP_TO);
	int s=0;

	for(int i=0; i<UP_TO; i++)
		sv[i] = 1;

	for(int i=2; i<UP_TO; i++){
		if(sv[i]==1){
			//check for consecutive digits.
			int len = sprintf(str, "%d", i);
			char noconsecs = 1;
			for(int a=0; a<len-1; a++)
				if(str[a] == str[a+1]){
					noconsecs = 0;
					break;
				}
			if(noconsecs)
				s++;

			for(int k=2; k<=(UP_TO/i); k++){
				sv[i*k] = 0;
			}
		}
	}

	printf("%d\n", s);
	return 0;
}

