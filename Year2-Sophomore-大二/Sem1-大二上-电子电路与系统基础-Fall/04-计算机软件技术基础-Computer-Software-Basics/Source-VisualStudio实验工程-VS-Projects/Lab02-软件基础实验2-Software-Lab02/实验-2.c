//#define _CRT_SECURE_NO_WARNINGS
///*刘超然-2023060904025-题目2*/
//#include <stdio.h>
//#include <stdlib.h>
//#include <string.h>
//#define MAX 5
//
//typedef struct student {
//    int ID;                 // 学号
//    char name[50];          // 姓名
//    float mathValue;        // 数学成绩
//    struct student* next;   // 指向下一个学生的指针
//} student;
//
//// 函数声明
//student* classList(int classNumber);
//student* classesConnect(student* class1, student* class2);
//float averageCalculate(student* head);
//
//int main() {
//    // 创建两个班级
//    student* class1 = classList(1);
//    student* class2 = classList(2);
//
//    // 连接两个班级的循环链表
//    student* allStudents = classesConnect(class1, class2);
//
//    // 统计数学平均成绩
//    float average = averageCalculate(allStudents);
//    printf("该年级数学平均成绩为: %.2f\n", average);
//
//    // 释放内存
//    student* current = allStudents;
//    if (current) {
//        student* temp;
//        do {
//            temp = current;
//            current = current->next;
//            free(temp);
//        } while (current != allStudents);
//    }
//
//    return 0;
//}
//
//// 为每个班级建立一个循环单链表，并输入成绩
//student* classList(int classNumber) {
//    student* head = NULL;
//    student* tail = NULL;
//    for (int i = 0; i < MAX; i++) {
//        student* newStudent = (student*)malloc(sizeof(student));
//        printf("请输入班级%d 第%d个学生的学号、姓名和数学成绩: ", classNumber, i + 1);
//        scanf("%d %s %f", &newStudent->ID, newStudent->name, &newStudent->mathValue);
//        newStudent->next = newStudent;         // 指向自己，初始化为循环链表
//
//        if (head == NULL) {
//            head = newStudent;                 // 第一个学生
//            tail = newStudent;                 
//        }                                      
//        else {                                 
//            tail->next = newStudent;           // 将新学生链接到链表
//            tail = newStudent;                 // 更新尾指针
//        }
//        tail->next = head;                     // 形成循环
//    }
//
//    return head;
//}
//
//// 实现两个循环单链表的连接
//student* classesConnect(student* class1, student* class2) {
//    if (class1 == NULL) return class2;         // 如果第一个班级为空，返回第二个班级
//    if (class2 == NULL) return class1;         // 如果第二个班级为空，返回第一个班级
//
//    student* class1Tail = class1;
//    student* class2Tail = class2;
//
//    // 找到第一个班级的尾节点
//    while (class1Tail->next != class1) {
//        class1Tail = class1Tail->next;
//    }
//
//    // 找到第二个班级的尾节点
//    while (class2Tail->next != class2) {
//        class2Tail = class2Tail->next;
//    }
//
//    // 连接两个班级
//    class1Tail->next = class2;                // 第一个班级的尾指针指向第二个班级的头
//    class2Tail->next = class1;                // 第二个班级的尾指针指向第一个班级的头
//
//    return class1;                            // 返回连接后的第一个班级
//}
//
//// 统计该年级的数学平均成绩
//float averageCalculate(student* head) {
//    if (head == NULL) return 0;
//
//    float totalScore = 0;
//    int count = 0;
//    student* current = head;
//
//    do {
//        totalScore += current->mathValue;
//        count++;
//        current = current->next;
//    } while (current != head);
//
//    return totalScore / count;                // 返回平均成绩
//}
