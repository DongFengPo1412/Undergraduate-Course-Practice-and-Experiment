// ConsoleApplication4.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <stdio.h>
#include <stdlib.h>

#define NULL 0

typedef struct  student
{
    int id = 0;
    char name[20] = ""; //初始为空字符串
    // int classes;
    float score[4] = {}; //初始化所有元素为0
} elemtype;

struct node
{
    elemtype data;
    struct node* next;
};

struct node* initiate_circular_singly_linked_list()
{
    // malloc函数分配一个大小为sizeof(struct node)
    // 的内存空间，这个函数的返回值是指向这个
    // 分配的内存空间的首地址的指针。
    // (struct node*)则实现了强制类型转换
    struct node* head = (struct node*)malloc(sizeof(struct node));
    head->next = NULL;
    return head;
}

/*创建循环链表*/
struct node* create_circular_singly_linked_list(elemtype students[], int num_data)
{
    //通过elemtype students[]数组创建单链表
    //num_data是students[]数组元素的个数
    struct node* p, * s;
    int j;
    struct node* head = initiate_circular_singly_linked_list(); //初始化单链表
    struct node* rear;
    p = head;
    for (j = 0; j < num_data; j++)
    {
        s = (struct node*)malloc(sizeof(struct node));
        s->data = students[j];
        p->next = s;
        p = s;
    }
    p->next = head;
    rear = p;
    return rear;
}

/*显示所有节点数据*/
void  print_circular_singly_linked_list(node* rear)
{
    node* p;
    p = rear->next;
    while (p->next != rear)
    {
        p = p->next;
        printf("%d\t%s\t%f %f %f %f\n", p->data.id, p->data.name,
            p->data.score[0], p->data.score[1], p->data.score[2], p->data.score[3]);
    }
    p = rear;
    printf("%d\t%s\t%f %f %f %f\n", p->data.id, p->data.name,
        p->data.score[0], p->data.score[1], p->data.score[2], p->data.score[3]);
    printf("\n");
}

/*连接两个链表*/
void connect_two_circular_singly_linked_lists(node* rear_1, node* rear_2)
{
    struct node* p;
    p = rear_2->next; // 第2个链表的头节点地址
    rear_2->next = rear_1->next; // 第2个链表的尾节点与第1个链表的头节点相连
    rear_1->next = p->next; //第1个链表的尾节点与第2个链表的头节点相连
    free(p);
}


int main()
{
    elemtype students[4] = { { 1, "John Wick", {90, 93, 78, 39} }, { 2, "Kung Fu Panda", {99, 92, 100, 99} }, { 3, "Grayman", {88, 97, 96, 66} },  { 4, "Mulan", {82, 92, 90, 96} } };
    elemtype students_2[2] = { { 5, "Ip Man", {100, 99, 98, 97} }, { 6, "Puss In Boots", {79, 80, 81, 82} } };

    struct node* rear = create_circular_singly_linked_list(students, 4);
    print_circular_singly_linked_list(rear);

    struct node* rear_2 = create_circular_singly_linked_list(students_2, 2);
    print_circular_singly_linked_list(rear_2);

    connect_two_circular_singly_linked_lists(rear_2, rear);
    print_circular_singly_linked_list(rear);

    return 0;
}

// Run program: Ctrl + F5 or Debug > Start Without Debugging menu
// Debug program: F5 or Debug > Start Debugging menu

// Tips for Getting Started: 
//   1. Use the Solution Explorer window to add/manage files
//   2. Use the Team Explorer window to connect to source control
//   3. Use the Output window to see build output and other messages
//   4. Use the Error List window to view errors
//   5. Go to Project > Add New Item to create new code files, or Project > Add Existing Item to add existing code files to the project
//   6. In the future, to open this project again, go to File > Open > Project and select the .sln file
