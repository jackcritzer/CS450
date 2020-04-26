#include "types.h"
#include "user.h"
#include "fcntl.h"
#include "fs.h"
#include "stat.h"


char *pfname = "ptrTxt.txt";
char *efname = "extTxt.txt";

// text written to file
char buf[512] = "0123456789";


char inbuf[512];

int testNum = 0;


#define PTR_FILE 1
#define EXT_FILE 2

void testFile(int type);
void printFile(int fd);
void testOffsetRead(int fd, int offset);
void testOffsetWrite(int fd, int offset);

int
main(void) {

    // test pointer-based file

    testFile(PTR_FILE);


    // test extent-based file

    /* testFile(EXT_FILE); */

    return 0;
}

void
testFile(int type) {
    int fd = -1;

    switch(type) {
        case PTR_FILE:
            fd = open(pfname, O_CREATE | O_RDWR);
            if (fd <= 0){
                printf(1, "file could not be opened\n");
                exit();
            }
            printf(1, "\nTESTING POINTER-BASED FILE:\n");

            write(fd, buf, sizeof(buf));
            printf(1, "\nText \"%s\" written to %s\n\n", buf, pfname);
            break;
        case EXT_FILE:
            /* fd = open(efname, O_CREATE | O_RDWR | O_EXTENT); */
            /* if (fd <= 0){
                printf(1, "file could not be opened\n");
                exit();
            } */
            printf(1, "TESTING EXTENT-BASED FILE:\n\n");

            //write(fd, buf, sizeof(buf));
            printf(1, "\nText \"%s\" written to %s\n\n", buf, efname);
            exit();
        }


    // test lseek with these offsets
    int offsetArr[5] = {-10, 525, 0, 5, 10};
    int i = 0;

    printf(1, "READ TEST\n\n");
    for(i = 0; i < 5; i++) {
        testOffsetRead(fd, offsetArr[i]);
    }

    printf(1, "WRITE TEST\n\n");
    for(i = 0; i < 5; i++) {
        testOffsetWrite(fd, offsetArr[i]);
    }

    close(fd);

    exit();
}

void
testOffsetRead(int fd, int offset) {
    
    //move offset to 'offset' and print file
    int result = -1;

    printf(1, "Test offset: %d\n", offset);

    if((result = lseek(fd, offset)) != -1) printFile(fd);
}

void testOffsetWrite(int fd, int offset) {

    //move offset to 'offset' and write, then move to beginning of file and print file
    int result = -1;
    printf(1, "Test offset: %d\n", offset);
    
    if((result = lseek(fd, offset)) != -1) {
        printf(1, "\nWriting to file\n");
        write(fd, "..", 2);
        lseek(fd, 0);
        printFile(fd);
    }
}


// prints contents of file from its current offset
void
printFile(int fd) {
    testNum++;

    printf(1, "\nPrint result: ");

    int n, i;
    while((n = read(fd, inbuf, sizeof(inbuf))) > 0) {
        for(i=0;i<=n ;i++){			//print the characters in the line 
            if(inbuf[i]!='\n'){			
      	        printf(1,"%c",inbuf[i]);
                
            }	
        }

        if(n<0){
            printf(1, "read error\n");
            exit();
        }
    }
    printf(1, "\n\n");
}