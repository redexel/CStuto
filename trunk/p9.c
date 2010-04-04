#include "stdio.h"
#include "stdlib.h"

#define UP_TO 10000000

int main(){
    char* sv = malloc(UP_TO);
    int s=0;
    for(int i=0; i<UP_TO; i++)
        sv[i] = 1;
    for(int i=2; i<UP_TO; i++){
        if(sv[i]==1){
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
