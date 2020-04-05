#include <stdio.h>
#include <stdlib.h>

int main() {
	int i = 0;
	int arr[10];

	for (i = 1; i < 10; ++i)
	{
		arr[i] = arr[i - 1] + 1;
	}

	return 0;
} 
