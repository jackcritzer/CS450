#include "types.h"
#include "stat.h"
#include "user.h"

int 
main(int argc, char *argv[]) 
{
	
	int sleeptime = atoi(argv[1]);
	
	sleep(10);
	
	printf(1, "slept for %d seconds", sleeptime);
	exit();
}
