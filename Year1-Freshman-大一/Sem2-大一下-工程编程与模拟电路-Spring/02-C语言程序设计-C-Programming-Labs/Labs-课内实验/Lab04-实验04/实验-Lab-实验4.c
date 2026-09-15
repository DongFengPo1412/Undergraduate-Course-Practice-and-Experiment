	/*สตั้4
#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
#include <string.h>
struct student {
	int num;
	char name[20];
	int score[5];
};
int main()
{
	struct student stu1;
	struct student* p_stu1;
	float average = 0;
	p_stu1 = &stu1;
	printf("Enter the number:");
	scanf("%d", &p_stu1->num);
	printf("Enter the name:");
	scanf("%s", p_stu1->name);
	printf("Enter Math, Chinese, English, Physics, and Chemistry scores:\n");
	for (int i = 0; i < 5; i++) {
		scanf("%d", &p_stu1->score[i]);
	}
	for (int j = 0; j < 5; j++) {
		average += (float) (p_stu1->score[j])/5;
	}
	printf("Student Number: %d\n", p_stu1->num);
	printf("Student Name: %s\n", p_stu1->name);
	printf("Scores: Math is %d, Chinese is %d, English is %d, Physics is %d, Chemistry is %d\n",
		p_stu1->score[0], p_stu1->score[1], p_stu1->score[2], p_stu1->score[3], p_stu1->score[4]);
	printf("The average score is %.2f\n", average);
	return 0;
}*/