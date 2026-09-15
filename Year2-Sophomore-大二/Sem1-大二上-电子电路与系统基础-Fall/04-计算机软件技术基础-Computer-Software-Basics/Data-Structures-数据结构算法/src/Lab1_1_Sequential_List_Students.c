//#define _CRT_SECURE_NO_WARNINGS
///*刘超然-2023060904025-题目1*/
//#include<stdio.h>
//#include<string.h>
//#define MAX 5
//
////定义学生信息结构体
//typedef struct {
//	int ID;				//学号
//	char name[30];		//姓名
//	float mathValue;	//数学成绩
//}infor;
//
////函数声明
//void inputInformation(infor student[], int number);	    //输入学生信息的函数
//void outputFailStu(infor student[], int number);	    //输出不及格学生信息的函数
//
//int main() {
//	infor student[MAX];					//定义顺序表储存学生的信息
//	inputInformation(student, MAX);		//输入学生的信息
//	printf("成绩不及格学生的数据:\n");
//	outputFailStu(student, MAX);		//输出不及格学生的信息
//	return 0;
//}
//
////输入学生信息
//void inputInformation(infor student[], int number) {
//	for (int i = 0; i < number; i++) {
//		printf("请输入第%d个学生的信息:\n", i+1);
//		printf("学号:");
//		scanf("%d", &student[i].ID);
//		printf("姓名:");
//		scanf("%s", student[i].name);
//		printf("数学成绩:");
//		scanf("%f", &student[i].mathValue);
//	}	
//}
//
////输出不及格学生信息
//void outputFailStu(infor student[], int number) {
//	for (int i = 0; i < number; i++) {
//		if (student[i].mathValue < 60) {
//			printf("学号:%d\n姓名:%s\n数学成绩:%.2f\n", student[i].ID, student[i].name, student[i].mathValue);
//		}
//	}
//}
