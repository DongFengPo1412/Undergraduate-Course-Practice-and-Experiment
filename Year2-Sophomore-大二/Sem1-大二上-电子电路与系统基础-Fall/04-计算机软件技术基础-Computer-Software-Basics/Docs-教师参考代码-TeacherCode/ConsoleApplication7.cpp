// ConsoleApplication7.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <stdio.h>
#define MAXNUM 50

typedef int elemtype;

typedef struct queuetype
{
    elemtype queue[MAXNUM + 1];
    int front; //队头位置标记
    int rear; //队尾位置标记
} queuetype;

/*入队*/
int enter_queue(queuetype* q, elemtype x)
{
    if (q->rear >= MAXNUM)  return false; // 队列已满
    else 
    {
        q->rear++;
        q->queue[q->rear] = x;
        return true;
    }
}

/*出队*/
int delete_queue(queuetype* q, elemtype& x)
{
    if (q->front ==q-> rear) return  false; //队列已空
    else 
    {
        //由于一开始队头的位置是0，所以需要先自加
        q-> front++;
        x = q->queue[q->front];
        return true;
    }
}

/*循环队列入队*/
int  enter_circular_queue(queuetype* q, elemtype x)
{
    if ((q-> rear + 1)%MAXNUM == q->front)  return false;   // 队列已满
    else
    {
        q->rear = (q->rear) % MAXNUM + 1;    //与书上不一样
        q->queue[q->rear] = x;
        return true;
    }
}

/*循环队列出队*/
int delete_circular_queue(queuetype* q, elemtype& x)
{
    if (q->front == q->rear) return false; // 队列已空
    else
    {
        q->front = (q->front) % MAXNUM + 1;
        x = q->queue[q->front];
        return true;
    }
}

/*杨辉三角形*/
void yanghui(int n)
{
    queuetype my_queue;
    int s, t;
    int i, j;

    my_queue.front = 0;
    my_queue.rear = 0;
   
    //三角形的第1行
    enter_circular_queue(&my_queue, 1);
    enter_circular_queue(&my_queue, 1);
  
    for (i = 1; i <= n; i++)
    {
        s = 0;
        enter_circular_queue(&my_queue, 0); //在队列插入第一行系数的结束标志数
        printf("\n"); //换行处理
        for (j = 1; j <= i + 2; j++)
        {
            delete_circular_queue(&my_queue, t); //从队列读出一数来打印
            if(j!=i+2) printf(" %d", t);
            enter_circular_queue(&my_queue, s+t); // 计算下一行系数并插入队列
            s = t;
        }
    }
}

int main()
{
    yanghui(6);
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
