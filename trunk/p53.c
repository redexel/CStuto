#include <stdio.h>
#include <stdlib.h>

typedef struct adjpair {
    int a, b;
} Adjpair;

int count=0;

int pairs_raw[] = {
    0,1, 0,2, 0,3, 0,4, 1,3, 1,4, 1,5, 2,3, 2,6, 2,7, 3,4, 3,6, 3,7, 3,8, 4,5, 4,7, 4,8,
    4,9, 5,8, 5,9, 6,7, 6,10, 7,8, 7,10, 7,11, 8,9, 8,10, 8,11, 9,11, 10,11
};
int s_pairs = 30;
Adjpair *pairs;

int cur[12];
//every recursion step, check all combinations of cur[node] from 1
//to 12, then recurse only with those that haven't already been
//chosen or conflicts with something else.
void recurse(int node){
    //Here the array from [0..node-1] is already decided and everything after and
    //including [node] is undefined. So we should put the current choice at
    //cur[node] and recurse with node+1.
    
    //If node==12 everything before cur[11] has been decided and we're done!
    if(node==12){
        count++;
        return;
    }

    //i is the next-value being considered.
    for(int i=0; i<12; i++){
        //First check if our value is already used.
        char used=0;
        for(int k=0; k<node; k++)
            if(cur[k]==i){
                used=1;
                break;
            }
        
        if(used)
            continue;

        //Now try every combination that's still not used and check for
        //conflicts of +1 or -1.
        char isok=1;
        for(int k=0; k<s_pairs; k++){
            Adjpair tmp = pairs[k];
            //We only need to check for conflicts if our node is one of the pairs
            //and the other pair is smaller than the node.
            if(tmp.a == node || tmp.b == node){
                //Here at one and only one of a or b is == node.
                int sa;
                //Avoid ambiguity by letting sa = index that is not node.
                if(tmp.a==node)
                    sa=tmp.b;
                else sa=tmp.a;

                if(sa < node){
                    int diff = cur[sa] - i;

                    if(diff==1 || diff==-1){
                        //Busted.
                        isok=0;
                        break;
                    }
                }
            }
        }

        if(isok){
            //All clear. We have a suitable value for cur[node].
            cur[node]=i;
            recurse(node+1);
        }
    }
}

int main(){
    pairs = malloc(sizeof(Adjpair) * s_pairs);
    //Initialization.
    for(int i=0; i<s_pairs; i++){
        pairs[i].a = pairs_raw[i*2];
        pairs[i].b = pairs_raw[i*2+1];
    }
    recurse(0);
    free(pairs);
    printf("%d", count);
    return 0;
}

