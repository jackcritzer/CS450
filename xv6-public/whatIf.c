#include "types.h"
#include "user.h"
#include "fcntl.h"

// Parsed command representation
#define MAXBUF 512

void
writetofile(int file, int fd){
	char buf[MAXBUF];

	while(1){
		int n = read(fd, buf, sizeof(buf));
		
		if(n <= 0) break;
		
		write(file, buf, n);
	}		
	close(file);
}


int
main(int argc, char *argv[]){
	int fd = 0;
	int child_file = open("child.txt", O_CREATE|O_WRONLY);
	int parent_file = open("parent.txt", O_CREATE|O_WRONLY);
	
	if(argc == 1){
		fd = 0;
	}
	else{
		fd = open(argv[1], O_RDONLY);
		if(fd == -1){
			printf(1, "no file named %s", argv[1]);
			exit();
		}
	}
		
	int pid = fork();
		
	if(pid < 0) {
		printf(1, "fork failed\n");
		exit();
	}
	else if (pid == 0){
		//write to child
		writetofile(child_file, fd);
	}
	else{
		//write to parent
		writetofile(parent_file, fd);
	}
	
	exit();
}




