	/*สตั้1-1
#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
#include<math.h> 
int main() {
	int n;
	float rate, capital, deposit;
	printf("Enter the rate(%%):");
	scanf("%f", &rate);
	printf("Enter the year:");
	scanf("%d", &n);
	printf("Enter the capital:");
	scanf("%f", &capital);
	deposit = capital * pow(1 + rate / 100, n);
	printf("Pass %d years, the deposit is %.2f", n, deposit);
	return 0;
}*/