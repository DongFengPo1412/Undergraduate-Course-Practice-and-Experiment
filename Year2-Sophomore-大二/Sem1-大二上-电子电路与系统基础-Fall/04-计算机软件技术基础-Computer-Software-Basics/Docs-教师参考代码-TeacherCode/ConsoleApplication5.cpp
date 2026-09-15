// ConsoleApplication5.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//

#include <stdio.h>
#define MAXNUM 50

/*
typedef struct  student
{
    int id = 0;
    char name[20] = ""; //初始为空字符串
    // int classes;
    float score[4] = {}; //初始化所有元素为0
} elemtype;
*/

typedef int elemtype;

typedef struct stacktype
{
    elemtype stack[MAXNUM];
    int top;
} stacktype;

/*初始化*/
void initiate_stack(stacktype* s)
{
    s->top = -1;
}

/*判断栈是否满栈*/
int stack_is_full(stacktype* s)
{
    return(s->top == MAXNUM - 1);
}

/*判断栈是否空栈*/
int stack_is_empty(stacktype* s)
{
    return(s->top == -1);
}

/*顺序栈的元素插入*/
int push_stack(stacktype* s, elemtype x)
{
    if (stack_is_full(s))
    {
        return false; //满栈，无法再入栈
    }
    else
    {
        s->top++;
        s->stack[s->top] = x; //进栈 
        return true;
    }
}

/*顺序栈的元素删除*/
int pop_stack(stacktype* s, elemtype& x)
{
    if (stack_is_empty(s)) //
    {
        elemtype y = 0;
        x = y;
        return false;
    }
    else
    {
        x = s->stack[s->top]; //栈顶元素出栈
        s->top--;
        return true;
    }
}

void conversion_from_dec_2_oct(int dec)
{
    stacktype my_stack;
    initiate_stack(&my_stack);

    printf("The decimal is %d\n", dec);

    while (dec != 0)
    {
        push_stack(&my_stack, dec % 8);
        dec = dec / 8;
    }

    printf("The octal is ");
    while (!stack_is_empty(&my_stack))
    {
        int e;
        pop_stack(&my_stack, e);
        printf("%d", e);
    }
    printf("\n");
}


int main()
{
    conversion_from_dec_2_oct(1348);
    return 0;
}

// 运行程序: Ctrl + F5 或调试 >“开始执行(不调试)”菜单
// 调试程序: F5 或调试 >“开始调试”菜单

// 入门使用技巧: 
//   1. 使用解决方案资源管理器窗口添加/管理文件
//   2. 使用团队资源管理器窗口连接到源代码管理
//   3. 使用输出窗口查看生成输出和其他消息
//   4. 使用错误列表窗口查看错误
//   5. 转到“项目”>“添加新项”以创建新的代码文件，或转到“项目”>“添加现有项”以将现有代码文件添加到项目
//   6. 将来，若要再次打开此项目，请转到“文件”>“打开”>“项目”并选择 .sln 文件
