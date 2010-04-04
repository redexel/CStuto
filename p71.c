#include <stdio.h>
#include <stdlib.h>

//Basically copy & paste from p69.
//40 seconds with -O3.
int main(){
    char* s = malloc(10);
    int r,j,i,p,o,h,q,z=0,c=0;
    for(; c<=1000000000; c++){
        j=0;
        q=c;
        while(q>0){
            r=q%8;
            q/=8;
            s[j++]=r+'0';
        }
        p=1;
        o=j%2==0?-1:0;
        for(i=0, h=j/2; i<=h; i++){
            if(s[h-i]!=s[h+i+o]){
                p=0;
                break;
            }
        }
        if(p) z++;
    }
    free(s);
    printf("%o", z+1);
    return 0;
}
