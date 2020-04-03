#include "types.h"
#include "user.h"
#include "fcntl.h"

int
main(int argc, char *argv[]){

    int* ptr = (int*) malloc(10 * sizeof(int));

    if(!ptr) {
        printf(1, "Unable to allocate memory.");
        exit();
    }
    else{
        printf(1, "Memory allocated at %d", ptr);
        
        //memory not freed

        exit();

    }


}