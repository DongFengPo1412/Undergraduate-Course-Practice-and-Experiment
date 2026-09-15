/*刘超然-2023060904025-链队列*/
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

typedef struct Node {
    char data;
    struct Node* next;
} Node;

// 定义链队列
typedef struct {
    Node* front;
    Node* rear;
} LinkedQueue;

// 初始化队列
void initQueue(LinkedQueue* q) {
    q->front = q->rear = NULL;
}

// 判断队列是否为空
int isEmpty(LinkedQueue* q) {
    return q->front == NULL;
}

// 入队操作
void enqueue(LinkedQueue* q, char c) {
    Node* newNode = (Node*)malloc(sizeof(Node));
    if (!newNode) {
        printf("内存分配失败\n");
        return;
    }
    newNode->data = c;
    newNode->next = NULL;

    if (isEmpty(q)) {
        q->front = q->rear = newNode;
    }
    else {
        q->rear->next = newNode;
        q->rear = newNode;
    }
}

// 出队操作
char dequeue(LinkedQueue* q) {
    if (isEmpty(q)) {
        printf("队列为空，无法出队\n");
        return '\0';
    }
    else {
        Node* temp = q->front;
        char c = temp->data;
        q->front = q->front->next;
        free(temp);
        return c;
    }
}

// 打印队列中的元素
void displayQueue(LinkedQueue* q) {
    if (isEmpty(q)) {
        printf("队列为空\n");
        return;
    }

    Node* temp = q->front;
    printf("队列中的元素: ");
    while (temp != NULL) {
        printf("%c ", temp->data);
        temp = temp->next;
    }
    printf("\n");
}

// 处理输入字符
void processInput(char sequence[]) {
    LinkedQueue q;
    initQueue(&q);
    char dequeuedElements[100];
    int dequeueCount = 0;

    for (int i = 0; sequence[i] != '\0'; i++) {
        char ch = sequence[i];
        if (isdigit(ch)) {  // 如果是数字字符，进队
            enqueue(&q, ch);
        }
        else if (islower(ch)) {  // 如果是小写字母，出队
            char dequeued = dequeue(&q);
            if (dequeued != '\0') {
                dequeuedElements[dequeueCount++] = dequeued;
            }
        }
        else {  // 其他字符，结束输入
            break;
        }
    }

    // 输出队列中的元素
    displayQueue(&q);

    // 输出出队的元素
    printf("出队的元素: ");
    for (int i = 0; i < dequeueCount; i++) {
        printf("%c ", dequeuedElements[i]);
    }
    printf("\n");
}

int main() {
    char sequence[100];
    printf("请输入字符序列(以非数字和小写字母作为结束): ");
    fgets(sequence, 100, stdin);

    processInput(sequence);

    return 0;
}
