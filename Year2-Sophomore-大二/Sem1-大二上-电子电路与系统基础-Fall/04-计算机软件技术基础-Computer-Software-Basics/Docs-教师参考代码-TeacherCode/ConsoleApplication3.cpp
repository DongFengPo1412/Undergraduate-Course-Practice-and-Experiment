// ConsoleApplication3.cpp : This file contains the 'main' function. Program execution begins and ends there.
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
    struct node* prior;
    struct node* next;
};

struct DoubleList
{
    node* head;     //头节点
    node* tail;     //尾节点
    int size;    //链表长度
};

/*初始化双链表*/
void  initiate_doubly_linked_list(DoubleList* p_db_list)
{
    //尽管为头节点分配了内存，但不打算使用
    p_db_list->head = (struct node*)malloc(sizeof(struct node));
    p_db_list->tail = NULL;
    p_db_list->size = 0; //头节点不算在列表中
}

void create_doubly_linked_list(DoubleList* p_db_list, elemtype students[], int num_data)
{
    //通过elemtype students[]数组创建单链表
    //num_data是students[]数组元素的个数
    struct node* p, * s;
    int j;
    //elemtype x;

    p = p_db_list->head; //p指向头节点
    p->prior = NULL; //头节点没有前趋节点

    for (j = 0; j < num_data; j++)
    {
        s = (struct node*)malloc(sizeof(struct node));
        s->data = students[j];
        p->next = s; //p的后继节点
        s->prior = p; //s的前趋节点
        p = s;
        p_db_list->size++;
    }

    /*现在p已经指向链表的尾节点了*/
    p->next = NULL;
    p_db_list->tail = p;
}

/*显示双链表中的所有数据*/
void  print_doubly_linked_list(DoubleList* p_db_list)
{
    node* p;
    p = p_db_list->head;
    while (p->next != NULL)
    {
        p = p->next;
        printf("%d\t%s\t%f %f %f %f\n", p->data.id, p->data.name,
            p->data.score[0], p->data.score[1], p->data.score[2], p->data.score[3]);
    }
    printf("\n");
}

void insert_doubly_linked_list(DoubleList* p_db_list, int i, elemtype new_element)
{
    struct node* p, * t;
    int j;
    int half_way = (p_db_list->size + 1) / 2; //链表的中间位置

    if (i<1 || i>p_db_list->size)  /* 插入位置i 不合理 */
    {
        printf("i is invalid.\n"); return;
    }

    if (i < half_way) //从链表头节点开始搜索
    {
        p = p_db_list->head; //p指向列表首节点
        j = 0;
        while (j < i) { p = p->next; j++; }
    }
    else //从链表尾节点开始搜索
    {
        p = p_db_list->tail; //p指向列表尾节点
        j = p_db_list->size;
        while (j > i) { p = p->prior; j--; }
    }

    /*现在p指向链表中的第i个节点*/
    t = (node*)malloc(sizeof(struct node)); //为新节点分配内存空间
    t->data = new_element; /*节点数据赋值*/

    t->prior = p->prior; //在新的链表中，t的前趋节点是原先p的前趋节点p->prior
    p->prior->next = t; // 而p->prior的后继节点就是t
    t->next = p; // t的后继节点就是p 
    p->prior = t; // 重新设置p的前趋节点 

    p_db_list->size++; //增加链表的大小
}

void delete_doubly_linked_list(DoubleList* p_db_list, int i)
{
    struct node* p;
    int j;
    int half_way = (p_db_list->size + 1) / 2; //链表的中间位置

    if (i<1 || i>p_db_list->size)  /* 删除位置i 不合理 */
    {
        printf("i is invalid.\n"); return;
    }

    if (i < half_way) //从链表头节点开始搜索
    {
        p = p_db_list->head; //p指向列表首节点
        j = 0;
        while (j < i) { p = p->next; j++; }
    }
    else //从链表尾节点开始搜索
    {
        p = p_db_list->tail; //p指向列表尾节点
        j = p_db_list->size;
        while (j > i) { p = p->prior; j--; }
    }

    /*现在p指向链表中的第i个节点*/
    //原先p-> prior-> next就是p，由于它要被删除了
    //所以，应该指向p的后继节点
    p->prior->next = p->next;

    //原先p-> next-> prior就是p，由于它要被删除了
    //所以，应该指向p的原先的前趋节点
    p->next->prior = p->prior;
    free(p);
    p_db_list->size--; //减小链表的大小
}

int main()
{
    printf("sizeof node is %d\n", sizeof(struct node));
    elemtype students[4] = { { 1, "John Wick", {90, 93, 78, 39} }, { 2, "Kung Fu Panda", {99, 92, 100, 99} }, { 3, "Grayman", {88, 97, 96, 66} },  { 4, "Mulan", {82, 92, 90, 96} } };

    elemtype student = { 5, "Ip Man", {100, 99, 98, 97} };

    DoubleList* p_db_list = (DoubleList*)malloc(sizeof(DoubleList));
    initiate_doubly_linked_list(p_db_list);
    create_doubly_linked_list(p_db_list, students, 4);
    print_doubly_linked_list(p_db_list);

    insert_doubly_linked_list(p_db_list, 4, student);
    print_doubly_linked_list(p_db_list);

    delete_doubly_linked_list(p_db_list, 4);
    print_doubly_linked_list(p_db_list);

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
