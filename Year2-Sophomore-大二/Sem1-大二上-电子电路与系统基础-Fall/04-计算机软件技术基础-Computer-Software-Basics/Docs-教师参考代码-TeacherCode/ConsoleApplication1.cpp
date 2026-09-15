// ConsoleApplication1.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <stdio.h>
#define MAXNUM 50

typedef struct  student
{
    int id = 0;
    char name[20] = ""; //初始为空字符串
    // int classes;
    float score[4] = {}; //初始化所有元素为0
} elemtype;

typedef struct list_type
{
    elemtype data[MAXNUM];
    int num;  /* 线性表表长 */
} listtype;

void initiate_list(listtype* list) /*list是一个指针变量*/
{
    list->num = 0;
}

int insert_list(listtype* list, int i, elemtype x)
{
    int j;
    if (list->num >= MAXNUM)
    {
        printf("The list is full, can not insert.");
        return false;
    }
    if (i<0 || i>list->num)
    {
        printf("i is invalid value");
        return  false;
    }
    for (j = list->num-1; j >= i; j--)
    {
        list->data[j +1] = list->data[j];
    }
        
    list->data[i] = x;  list->num++;
    return true;
}

int delete_list(listtype* list, int i)
{
    int j;
    if ((i<0) || (i > list->num - 1))
    {
        printf("Element to be deleted does not exist");
        return false;
    }
    for (j = i + 1; j < list->num; j++)
    {
        list->data[j - 1] = list->data[j];
    }
    list->num--;
    return true;
}


int main()
{
    listtype student_list;
    // printf("size of float is %d, size of int is %d, size of elemtype is %d\n", sizeof(float), sizeof(int), sizeof(elemtype));
    elemtype student_1 = { 1, "John Wick", {90, 93, 78, 39} };
    elemtype student_2 = { 2, "Kung Fu Panda", {99, 92, 100, 99} };
    elemtype student_3 = { 3, "Grayman", {88, 97, 96, 66} };
    elemtype student_4 = { 4, "Mulan", {82, 92, 90, 96} };
    
    initiate_list(&student_list); /*初始化*/
    insert_list(&student_list, 0, student_1);
    insert_list(&student_list, 1, student_2);
    insert_list(&student_list, 2, student_3);
    insert_list(&student_list, 2, student_4);

    delete_list(&student_list, 2);

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
