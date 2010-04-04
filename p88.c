//Brute force, 26s.
#include <stdio.h>
#include <stdlib.h>
#define len 100000000LL
typedef unsigned long long Long;
int main(){
    char* s=malloc(20);
    char* m=malloc(len);
    for(Long i=0; i<len; i++)m[i]=1;
    Long z=0;
    for(Long a=2; a<len; a++){
        if(m[a]){
            for(Long d=2; d<len/a+1; d++){
                m[d*a]=0;
            }
            int l=sprintf(s, "%lld", a);
            int f=l/2,r=l/2,p=1;
            if(l%2==0)f--;
            for(; f>=0&&r<l; f--,r++){
                if(s[f]!=s[r]){
                    p=0;
                    break;
                }
            }
            if(p)
                z+=a;
        }
    }
    printf("%lld", z);
    return 0;
}
