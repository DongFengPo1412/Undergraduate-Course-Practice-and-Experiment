	/*สตั้2-2
#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
#define MAXLINE 80
int main() {
	int a[MAXLINE][MAXLINE], b[MAXLINE][MAXLINE];
	int line, column;
	printf("Input line:\n");
	scanf("%d", &line);
	printf("Input column:\n");
	scanf("%d", &column);
	printf("Enter a %d*%d matrix:\n",line,column);
	for (int i = 0; i < line; i++) {
		for (int j = 0; j < column; j++) {
			scanf("%d", &a[i][j]);
		}
	}
	for (int i = 0; i < line; i++) {
		for (int j = 0; j < column; j++) {
			b[j][i] = a[i][j];
		}
	}
	printf("Transposed matrix:\n");
	for (int i = 0; i < column; i++) {
		for (int j = 0; j < line; j++) {
			printf("%d ", b[i][j]);
		}
		printf("\n");
	}
	return 0;
}*/