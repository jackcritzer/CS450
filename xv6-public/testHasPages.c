#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"

int
main(void) {

    haspages(getpid());

    int *array = (int *)malloc(sizeof(int) * 100);

    haspages(getpid());

    free(array);

    sbrk(10000);

    haspages(getpid());

    exit();
}