#include <stdio.h>

int main(){
    char* s = malloc(100);
    int mj=0;
    for(int i=1; i<=10000000; i++){
        int d=i, h=0, cnt=0;
        while(d>0){
            s[h++]=d%2;
            d/=2;
        }
        s[h]=0;
        int last=0;
        for(int k=0; k<h; k++){
            if(s[k]&&last)
                cnt++;
            last=s[k];
        }
        if(cnt==5)
            mj++;
    }
    printf("%d", mj);
    return 0;
}
