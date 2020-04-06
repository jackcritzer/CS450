#include <stdio.h>
#include <stdlib.h>

int main() {
	int i;
	int *ptr = (int *)malloc(4 * sizeof(int));

	if (ptr == NULL)
	{
		printf("Memory not allocated.");
		exit(0);
	}

	printf("Memory allocated.");

	for (i = 0; i < 4; ++i)
	{
		ptr[i] = i + 1;
	}

    free(ptr);

    ptr[1] = 3;

	return 0;
} 
