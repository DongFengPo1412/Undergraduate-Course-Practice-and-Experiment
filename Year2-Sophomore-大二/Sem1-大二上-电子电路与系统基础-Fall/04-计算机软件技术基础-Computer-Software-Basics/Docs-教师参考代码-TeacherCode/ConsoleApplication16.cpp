// ConsoleApplication16.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//

#include <stdio.h>
#include <stdlib.h>

//数据类型
#define elemtype int
#define NULL 0

//队列节点类型
typedef struct node
{
	elemtype data;          //数据域
	struct node* next; //指针域
}node;

//链式队列管理结构
typedef struct chain_queue
{
	node* front;  //队头指针
	node* rear;   //队尾指针
}chain_queue;

//初始化队列
void InitQueue(chain_queue* Q)
{
	//申请头节点内存空间
	node* s = (node*)malloc(sizeof(node));
	if (s == NULL) return;
	//初始化时，将头指针和尾指针都指向头节点
	Q->front = Q->rear = s;
	//将尾节点的下一节点赋空
	Q->rear->next = NULL;
}

//入队操作：在队尾执行插入操作
void EnQueue(chain_queue* Q, elemtype x)
{
	//申请队列节点
	node* s = (node*)malloc(sizeof(node));
	if (s == NULL) return;
	//为申请的队列节点赋值
	s->data = x;
	s->next = NULL;
	//将申请的队列节点插入到队尾
	Q->rear->next = s;
	//更改队列管理节点中尾指针的指向
	Q->rear = s;
}

//出队操作：删除队头的第一个有效节点
int DeQueue(chain_queue* Q, elemtype& x)
{
	//如果队中无有效节点，无需进行操作
	if (Q->front == Q->rear)
		return false;

	//获取队头的第一个有效节点
	node* p = Q->front->next;
	x = p->data;
	//将队头的第一个有效节点从队列中断开
	Q->front->next = p->next;
	//释放该节点
	free(p);
	//如果删除的节点是最后一个有效节点，需要更改尾指针的指向
	if (p == Q->rear)
		Q->rear = Q->front;
	return true;
}

//打印队列内的数据
void ShowQueue(chain_queue* Q)
{
	//获取队列中第一个有效节点
	node* p = Q->front->next;
	printf("Front:>");
	//将队列中每个有效节点中的数据打印
	while (p != NULL)
	{
		printf("%d ", p->data);
		p = p->next;
	}
	printf("<:rear.\n");
}

//获取队头元素
void GetHead(chain_queue* Q, elemtype* v)
{
	//如果队中无有效节点，无需进行操作
	if (Q->front == Q->rear)
		return;
	//获取队头的第一个有效节点
	node* p = Q->front->next;
	//返回队头第一个有效节点数据
	*v = p->data;
}

//求队列的长度
int Length(chain_queue* Q)
{
	int len = 0;//初始长度为0
	//获取队头的第一个有效节点
	node* p = Q->front->next;
	//遍历队列，获取一个节点，将队列长度加一
	while (p != NULL)
	{
		len++;
		p = p->next;
	}
	//返回长度值
	return len;
}

//清空队列：释放所有的有效节点
void ClearQueue(chain_queue* Q)
{
	//如果队中无有效节点，无需进行操作
	if (Q->front == Q->rear)
		return;
	//获取队头的第一个有效节点
	node* p = Q->front->next;
	//遍历队列中的有效节点
	while (p != NULL)
	{
		//移除节点
		Q->front->next = p->next;
		//释放节点
		free(p);
		//指向下一个节点
		p = Q->front->next;
	}
	Q->rear = Q->front;
}

//销毁队列
void DestroyQueue(chain_queue* Q)
{
	//清空队列
	ClearQueue(Q);
	//释放头节点
	free(Q->front);
	//将管理节点中的头指针和尾指针都指向空
	Q->front = Q->rear = NULL;
}

/*杨辉三角形*/
void yanghui(int n)
{
	chain_queue* my_queue = (chain_queue*)malloc(sizeof(my_queue));
	InitQueue(my_queue);
	int s, t;
	int i, j;
	//三角形的第1行
	EnQueue(my_queue, 1);
	EnQueue(my_queue, 1);

	for (i = 1; i <= n; i++)
	{
		s = 0;
		EnQueue(my_queue, 0); //在队列插入第一行系数的结束标志数
		printf("\n"); //换行处理
		for (j = 1; j <= i + 2; j++)
		{
			DeQueue(my_queue, t); //从队列读出一数来打印
			if (j != i + 2) printf(" %d", t);
			EnQueue(my_queue, s + t); // 计算下一行系数并插入队列
			s = t;
		}
	}
}


int main()
{
	yanghui(10);
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
