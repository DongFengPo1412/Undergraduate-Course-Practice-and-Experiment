	/*สตั้1-2
#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
int main() {
	int sex,sport,habit;
	float faHight, moHight, hight;
	printf("MAN enter 1, WOMAN enter 0:");
	scanf("%d", &sex);
	printf("Enter your father's hight(cm):");
	scanf("%f", &faHight);
	printf("Enter your mother's hight(cm):");
	scanf("%f", &moHight);
	printf("LIKE SPORT enter 1, or enter 0:");
	scanf("%d", &sport);
	printf("GOOD EATING HABIT enter 1, or enter 0:");
	scanf("%d", &habit);
	if (sex == 1) {
		hight = (faHight + moHight) * 0.54;
	}
	else if (sex == 0) {
		hight = (faHight * 0.923 + moHight) / 2;
	}
	if (sport == 1 && habit == 1) {
		hight = hight * (1 + 0.02)*(1 + 0.015);
	}
	else if (sport == 1 && habit == 0) {
		hight = hight * (1 + 0.02);
	}
	else if (habit == 1 && sport == 0) {
		hight = hight * (1 + 0.015);
	}
	printf("Your hight is %.2f cm", hight);
	return 0;
}*/
