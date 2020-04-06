#include "stdlib.h"
#include "stdio.h"

int
main(int argc, char *argv[]){

    int *i;

    *i = 10;

    printf("*i = %d", *i);
    free(i);
    return 1;
}