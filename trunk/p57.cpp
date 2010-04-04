#include <cstdio>
#include <algorithm>

int main(){
    char s[] = "abcdefghijklmno";
    for(int i=0; i<123456788; i++)
        //STD is sometimes really great :)
        std::next_permutation(s,s+15);
    printf("%s", s);
    return 0;
}
