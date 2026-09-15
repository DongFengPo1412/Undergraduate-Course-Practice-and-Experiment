// ConsoleApplication9.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//

#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>

#define MAXSIZE 100 //最大顶点数
#define false 0
#define true 1

typedef int weighttype;
typedef int nodetype;

/*表节点*/
typedef struct struct_arc {
    nodetype adivex;
    struct struct_arc* nextarc;
    weighttype data;//权值，这里暂时没有用
}starc;

/*头节点*/
typedef struct {
    nodetype vexdata; //头节点的序号
    starc* firstarc;
}headnode;

/*以下代码与队列有关*/
typedef headnode elemtype;

typedef struct queuetype
{
    elemtype queue[MAXSIZE + 1];
    int front; //队头位置标记
    int rear; //队尾位置标记
} queuetype;

/*循环队列入队*/
int  enter_circular_queue(queuetype* q, elemtype x)
{
    if ((q->rear + 1) % MAXSIZE == q->front)  return false;   // 队列已满
    else
    {
        q->rear = (q->rear) % MAXSIZE + 1;    //与书上不一样
        q->queue[q->rear] = x;
        return true;
    }
}

/*循环队列出队*/
int delete_circular_queue(queuetype* q)
{
    if (q->front == q->rear) return false; // 队列已空
    else
    {
        q->front = (q->front) % MAXSIZE + 1;
        return true;
    }
}

/*循环队列出队*/
elemtype delete_circular_queue_2(queuetype* q)
{
    elemtype x;
    if (q->front == q->rear) // 队列已空
    {
        x.vexdata = -1;
        x.firstarc = NULL;
    }
    else
    {
        q->front = (q->front) % MAXSIZE + 1;
        x = q->queue[q->front];
    }
    return x;
}

/*取循环队列头元素，但不出列*/
elemtype get_front_circular_queue(queuetype* q)
{
     elemtype x;
     int front;
     if (q->front == q->rear) // 队列已空
     {
         x.vexdata = -1;
         x.firstarc = NULL;
     }
    else
    {
        front = (q->front) % MAXSIZE + 1;
        x = q->queue[front];
    }
     return x;
}


/*无向图的结构体*/
typedef struct {
    headnode head[MAXSIZE+1]; //头节点的数组，head[0]不用
    int vexnum, arcnum; //分别是图的顶点数目和边的数目
}Gragh;


/*建立无向图*/
void CreatGraph(Gragh* G, int vexnum, int arcnum)
{
    int i;
    G->vexnum = vexnum; 
    G->arcnum = arcnum;

    for (i = 1; i <= G->vexnum; i++)
    {
        G->head[i].vexdata = i ; //顶点的序号从1开始
        G->head[i].firstarc = NULL; //所有的firstarc均为空指针
    }

    for (i = 0; i < G->arcnum; i++)//有几条边，循环几次
    {
        int m, n;//用来接收两个顶点
        printf("请依次输入每一条边，格式为: m-n, 例如1-2, 3-4\n");
        scanf("%d-%d", &m, &n);
    
        starc* P1 = (starc*)malloc(sizeof(starc));
        P1->adivex = n;
        P1->nextarc = G->head[m].firstarc;
        G->head[m].firstarc = P1;

        //因为是无向图，所以还要建立一条反向的边
        starc* P2 = (starc*)malloc(sizeof(starc));
        P2->adivex =  m;
        P2->nextarc = G->head[n].firstarc;
        G->head[n].firstarc = P2;  
    }
}

/*深度遍历创建的无向图*/
void DepthFirstSearch(Gragh G, int v, int visited[])
{
    visited[v] = 1; //设置第v个节点被访问过
    printf("V%d\t", G.head[v].vexdata);
    starc* P = G.head[v].firstarc;
    
    while (P!=NULL)
    {
        if (!visited[P->adivex])
        { 
            DepthFirstSearch(G, P->adivex, visited);
        }
        P = P->nextarc;//指针指向该节点的下一个节点
    }
}

/*广度优先遍历创建的无向图*/
void BreadthFirstSearch(Gragh G, int v, int visited[], queuetype* Q)
{
    visited[v] = 1;//把传入的起点，设置为１
    enter_circular_queue(Q, G.head[v]); //把传入的顶点入队

    elemtype queue_front;
    while (Q->rear != Q->front)//如果队不为空，则循环
    {
        queue_front = get_front_circular_queue(Q);
        printf("%d", queue_front.vexdata);//访问队列最前面的数据
        starc* P = queue_front.firstarc;//把指针指向顶点对应的第一个表节点
        while (P!=NULL)//只要表节点不为空就循环
        {
            if (!visited[P->adivex])
                enter_circular_queue(Q, G.head[P->adivex]); //把没有访问过的顶点入队列
            visited[P->adivex] = 1;//把入了队列的顶点，在visited数组中设置为１
            P = P->nextarc;//指针指向下一条边
        }
        delete_circular_queue(Q);
    }
}

/*广度优先遍历创建的无向图*/
void BreadthFirstSearch_2(Gragh G, int v, int visited[], queuetype* Q)
{
    visited[v] = 1;//把传入的起点，设置为１
    printf("V%d\t", G.head[v].vexdata);//访问队列最前面的数据
    enter_circular_queue(Q, G.head[v]); //把传入的顶点入队

    elemtype queue_front;
    while (Q->rear != Q->front)//如果队不为空，则循环
    {
        queue_front = delete_circular_queue_2(Q);
        starc* P = queue_front.firstarc;//把指针指向顶点对应的第一个表节点
        
        while (P != NULL)//只要表节点不为空就循环
        {
            if (visited[P->adivex] == 0)
            {
                printf("V%d\t", G.head[P->adivex].vexdata);//访问队列最前面的数据
                visited[P->adivex] = 1;//把入了队列的顶点，在visited数组中设置为１
                enter_circular_queue(Q, G.head[P->adivex]); //把访问过的顶点入队列
            }
            P = P->nextarc;//指针指向下一条边
        }
    }
}


int main()
{
    Gragh* G = (Gragh*)malloc(sizeof(Gragh));
    int vexnum, arcnum;

    printf("请依次输入顶点数目和边的数目，格式为: m, n, 例如5,6\n");
    scanf("%d,%d", &vexnum, &arcnum);

    CreatGraph(G, vexnum, arcnum);

    queuetype my_queue;
    my_queue.front = 0;
    my_queue.rear = 0;
    
    int start_vertex;
    int visited[MAXSIZE+1] = { 0 };//创建数组，用来判断某一个顶点是否被访问过
    printf("请输入搜索的起始点V:");
    scanf("%d", &start_vertex);

   //printf("深度遍历创建的无向图\n");
    //DepthFirstSearch(*G, start_vertex, visited);
    //BreadthFirstSearch(*G, get_index(G->head, start_vertex), visited, &my_queue);

    printf("广度优先遍历创建的无向图\n");
    BreadthFirstSearch_2(*G, start_vertex, visited, &my_queue);
 
    //free(G);
    return 0;
}

