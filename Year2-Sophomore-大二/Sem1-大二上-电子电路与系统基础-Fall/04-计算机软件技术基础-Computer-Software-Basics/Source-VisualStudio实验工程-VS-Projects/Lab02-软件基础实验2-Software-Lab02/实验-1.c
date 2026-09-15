//#define _CRT_SECURE_NO_WARNINGS
///*刘超然-2023060904025-题目1*/
//#include <stdio.h>
//#include <stdlib.h>
//#include <string.h>
//#define MAX 5
//
//typedef struct student {
//	int ID;                   // 学号
//	char name[50];            // 姓名
//	float mathValue;          // 数学成绩
//	struct student* prior;    // 指向下一个学生的指针
//	struct student* next;     // 指向前一个学生的指针
//}student;
//
//student* doubleList();                  // 创建双向链表
//void printFailStudents(student* head);  // 通过next指针输出不及格学生信息
//void printPassStudents(student* tail);  // 通过prior指针输出及格学生信息
//
//int main() {
//	// 动态建立双链表，输入5个学生的数据
//	student* head = doubleList();
//
//	// 通过next指针输出双链表中不及格同学的数据
//	printf("不及格的学生信息:\n");
//	printFailStudents(head);
//
//	student* tail = head;
//	while (tail->next != NULL) {
//		tail = tail->next;
//	}
//
//	// 通过prior指针输出双链表中及格同学的数据
//	printf("\n及格的学生信息:\n");
//	printPassStudents(tail);
//
//	return 0;
//}
//
//// 函数1：动态建立双链表，输入5个同学的数据
//student* doubleList() {
//	student* head = NULL, * tail = NULL;
//	for (int i = 0; i < MAX; i++) {
//		student* newStudent = (student*)malloc(sizeof(student));
//		printf("请输入第%d个学生的学号、姓名和数学成绩:", i + 1);
//		scanf("%d %s %f", &newStudent->ID, newStudent->name, &newStudent->mathValue);
//
//		newStudent->next = NULL;        // 初始化next指针为NULL
//		newStudent->prior = tail;       // prior指向前一个学生
//
//		if (tail != NULL) {
//			tail->next = newStudent;    // 上一个学生的next指针指向新学生
//		}
//		else {
//			head = newStudent;          // 第一个学生，作为头节点
//		}
//		tail = newStudent;              // 更新尾指针
//	}
//	return head;
//}
//
//// 函数2：通过next指针输出双链表中不及格同学的数据
//void printFailStudents(student* head) {
//	student* current = head;
//	while (current != NULL) {
//		if (current->mathValue < 60) {
//			printf("学号: %d, 姓名: %s, 数学成绩: %.2f\n", current->ID, current->name, current->mathValue);
//		}
//		current = current->next; // 使用next指针遍历
//	}
//}
//
//// 函数3：通过prior指针输出双链表中及格同学的数据
//void printPassStudents(student* tail) {
//	student* current = tail;
//	while (current != NULL) {
//		if (current->mathValue >= 60) {
//			printf("学号: %d, 姓名: %s, 数学成绩: %.2f\n", current->ID, current->name, current->mathValue);
//		}
//		current = current->prior; // 使用prior指针遍历
//	}
//}
