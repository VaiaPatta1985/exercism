#include "collatz_conjecture.h"

int steps(int start){
    if(start<=0){return ERROR_VALUE;}
    int s=0;
    while(!(start%2)){
        start>>=1;
        s++;
    }
    while(start!=1){
        start*=3;
        start++;
        s++;
        while(!(start%2)){
            start>>=1;
            s++;
        }
    }
    return s;
}
