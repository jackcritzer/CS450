#include <stdio.h>
#include <stdlib.h>

int main() {
	int i = 0;
	int *ptr;
    ptr = &i;

	if (ptr == NULL)
	{
		printf("Memory not allocated.");
		exit(0);
	}

	printf("%p", ptr);

    free(ptr);

	return 0;
} 
