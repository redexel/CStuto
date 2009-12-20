// Haskell version is too slow.
#include <stdlib.h>
#include <stdio.h>

int main(){
	int stplayers = 100000;
	char players[stplayers];
	int position = 0;
	int nplayers = stplayers;
	
	// 0: out, 1: in
	for(int i=0; i<stplayers; i++)
		players[i]=1;

	// Game loop.
	while(nplayers>1){
		for(int k=0; k<3;){
			position++;
			if(position==stplayers) position=0;
			if(players[position]) k++;
		}
		players[position] = 0;
		nplayers--;
		while(players[position]!=1){
			if(position < stplayers)
				position++;
			else position=0;
		}
	}

	// Find last remaining.
	int result;
	for(result=0; result<stplayers; result++)
		if(players[result]) break;

	printf("%d\n", result+1);

	return 0;
}
