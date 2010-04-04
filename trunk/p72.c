#include <stdio.h>
#include <stdlib.h>

char hex[] = "0123456789abcdef";

//Very similar to p69 and p71.
//30 seconds with -O3.
//The really big upper limit renders anything but C impractical
//for this sort of problem.
int main(){
    char* s = malloc(10);
    int r,j,i,p,o,h,q,z=0,c=0;
    for(; c<=1000000000; c++){
        j=0;
        q=c;
        while(q>0){
            r=q%16;
            q/=16;
            s[j++]=hex[r];
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
    printf("%x", z+1);
    return 0;
}
