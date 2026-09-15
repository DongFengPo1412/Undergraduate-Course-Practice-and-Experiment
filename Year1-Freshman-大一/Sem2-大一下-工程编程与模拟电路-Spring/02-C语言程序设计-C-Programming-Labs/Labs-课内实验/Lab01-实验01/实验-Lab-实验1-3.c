	/*สตั้1-3
#define _CRT_SECURE_NO_WARNINGS
#define MAX 10
#include<stdio.h>
#include<stdlib.h>
#include<time.h>
int main() {
	int magic, num, i;
	srand(time(NULL));
	magic = rand() % 100 + 1;
	for (i = 1; i <= MAX; i++) {
		printf("Please guess a number between 1 and 100:");
		scanf("%d", &num);
		if (num == magic) {
			printf("right!\n");
			return 0;
		}
		else if(num<magic)
		{
			printf("wrong! Too low\n");
		}
		else {
			printf("wrong! Too high\n");
		}
	}
	printf("GAME OVER!\n", magic);
	return 0;
}*/
