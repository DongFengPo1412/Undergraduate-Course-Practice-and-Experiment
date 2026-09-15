// ConsoleApplication21.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//

// ConsoleApplication6.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <stdio.h>
#include <stdlib.h>

typedef int elemtype;
#define NULL 0

struct node
{
    elemtype data;
    struct node* next;
};

/*链栈的元素插入*/
node* push_linked_stack(node* top, elemtype x)
{
    node* p;
    p = (node*)malloc(sizeof(node));
    p->data = x;
    p->next = top;
    return p; //top指向当前元素
}

int push_linked_stack(node** top, elemtype x)
{
    node* p;
    p = (node*)malloc(sizeof(node));
    p->data = x;
    p->next = *top;
    *top = p; //top指向当前元素
    return true;
}

/*链栈的元素删除*/
node* pop_linked_stack(node* top, elemtype& x)
{
    node* p;
    if (top == (node*)NULL)
    {
        printf("stack is underflow");
        return  (node*)NULL;
    }
    x = top->data;
    p = top->next;
    free(top);
    return p;
}

int pop_linked_stack(node** top, elemtype& x)
{
    node* p;
    if (*top == (node*)NULL)
    {
        printf("stack is underflow");
        return  false;
    }
    x = (*top)->data;
    p = *top;
    *top = (*top)->next;
    free(p);
    return true;
}

/*
void conversion_from_dec_2_oct(int dec)
{
    printf("The decimal is %d\n", dec);
    node* top = (node*)NULL;
    while (dec != 0)
    {
        top = push_linked_stack(top, dec % 8);
        dec = dec / 8;
    }

    printf("The octal is ");
    while (top != (node*)NULL)
    {
        int e;
        top = pop_linked_stack(top, e);
        printf("%d", e);
    }
    printf("\n");
}
*/

void conversion_from_dec_2_oct(int dec)
{
    printf("The decimal is %d\n", dec);
    node* top = (node*)NULL;
    while (dec != 0)
    {
        push_linked_stack(&top, dec % 8);
        dec = dec / 8;
    }

    printf("The octal is ");
    while (top != (node*)NULL)
    {
        int e;
        pop_linked_stack(&top, e);
        printf("%d", e);
    }
    printf("\n");
}


int main()
{
    conversion_from_dec_2_oct(1348);
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


// 运行程序: Ctrl + F5 或调试 >“开始执行(不调试)”菜单
// 调试程序: F5 或调试 >“开始调试”菜单

// 入门使用技巧: 
//   1. 使用解决方案资源管理器窗口添加/管理文件
//   2. 使用团队资源管理器窗口连接到源代码管理
//   3. 使用输出窗口查看生成输出和其他消息
//   4. 使用错误列表窗口查看错误
//   5. 转到“项目”>“添加新项”以创建新的代码文件，或转到“项目”>“添加现有项”以将现有代码文件添加到项目
//   6. 将来，若要再次打开此项目，请转到“文件”>“打开”>“项目”并选择 .sln 文件
