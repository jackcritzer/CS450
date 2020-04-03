#include "types.h"
#include "stat.h"
#include "user.h"

int main(void) {

    if(fork() ==0) {
        // child
        alsonice(100);
        for(int i = 0; i<400; i++) {
            printf(1, "*", i);
        }
        alsonice(-100);
        for(int i = 0; i<400; i++) {
            printf(1, "*", i);
        }
    }
    else{
        // parent
        alsonice(10);
        for(int i = 0; i<200; i++) {
            printf(1, ".", i);
        }
        alsonice(100);
        for(int i = 0; i<200; i++) {
            printf(1, "$", i);
        }
    }
    exit();
}