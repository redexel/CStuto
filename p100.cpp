#include <cstdlib>
#include <cstring>
#include <cstdio>
#include <algorithm>

// I'm too lazy to debug a next_permutation routine. As again I'm using
// the std routine instead.
int main(){
	FILE *f = fopen("p100.txt", "r");
	int sum=0;
	char *s = (char*) malloc(10);
	for(int i=0; i<10000; i++){
		fscanf(f, "%s\n", s);
		int len = strlen(s);
		
		//Check that it's not already in biggest permutation.
		bool sorted=true;
		for(int i=0; i<len-1; i++)
			if(s[i] < s[i+1]){
				sorted=false;
				break;
			}

		if(sorted)
			continue;

		std::next_permutation(s, s+len);
		printf("%s\n", s);
		sum += atoi(s);
	}
	printf("%d", sum);
	return 0;
}
