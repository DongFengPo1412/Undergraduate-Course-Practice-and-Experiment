	/*สตั้2-1
#define _CRT_SECURE_NO_WARNINGS
#define MAXLINE 80
#include<stdio.h>
int main() {
	int i,n,j,k,temp;
	printf("Enter n:");
	scanf("%d", &n);
	printf("Enter %d integers:", n);
	int num[MAXLINE];
	for (i = 0; i < n; i++) { 
		scanf("%d", &num[i]);
	}
	for (j = 1; j < n; j++) {
		for (k = 0; k < n - 1; k++) {
			if (num[k] > num[k + 1]) {
				temp=num[k];
				num[k] = num[k + 1];
				num[k + 1] = temp;
			}
		}
	}
	printf("After sorted(from little to big):");
	for (i = 0; i < n; i++) {
		printf("%3d", num[i]);
	}
	return 0;
}*/