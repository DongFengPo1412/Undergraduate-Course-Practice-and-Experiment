///*刘超然-2023060904025-循环队列*/
//#include <stdio.h>
//#include <stdlib.h>
//#include <ctype.h>
//
//#define MAX_SIZE 100  // 队列的最大容量
//
//// 定义循环队列
//typedef struct {
//    char data[MAX_SIZE];  // 队列数组
//    int front;            // 队头指针
//    int rear;             // 队尾指针
//} CircularQueue;
//
//// 初始化队列
//void initQueue(CircularQueue* q) {
//    q->front = 0;
//    q->rear = 0;
//}
//
//// 判断队列是否为空
//int isEmpty(CircularQueue* q) {
//    return q->front == q->rear;
//}
//
//// 判断队列是否已满
//int isFull(CircularQueue* q) {
//    return (q->rear + 1) % MAX_SIZE == q->front;
//}
//
//// 入队操作
//void enqueue(CircularQueue* q, char c) {
//    if (isFull(q)) {
//        printf("队列已满，无法进队\n");
//    }
//    else {
//        q->data[q->rear] = c;
//        q->rear = (q->rear + 1) % MAX_SIZE;
//    }
//}
//
//// 出队操作
//char dequeue(CircularQueue* q) {
//    if (isEmpty(q)) {
//        printf("队列为空，无法出队\n");
//        return '\0';
//    }
//    else {
//        char c = q->data[q->front];
//        q->front = (q->front + 1) % MAX_SIZE;
//        return c;
//    }
//}
//
//// 打印队列中的元素
//void displayQueue(CircularQueue* q) {
//    if (isEmpty(q)) {
//        printf("队列为空\n");
//        return;
//    }
//
//    int i = q->front;
//    printf("队列中的元素: ");
//    while (i != q->rear) {
//        printf("%c ", q->data[i]);
//        i = (i + 1) % MAX_SIZE;
//    }
//    printf("\n");
//}
//
//// 处理输入字符
//void processInput(char sequence[]) {
//    CircularQueue q;
//    initQueue(&q);
//    char dequeuedElements[MAX_SIZE];
//    int dequeueCount = 0;
//
//    for (int i = 0; sequence[i] != '\0'; i++) {
//        char ch = sequence[i];
//        if (isdigit(ch)) {  // 如果是数字字符，进队
//            enqueue(&q, ch);
//        }
//        else if (islower(ch)) {  // 如果是小写字母，出队
//            char dequeued = dequeue(&q);
//            if (dequeued != '\0') {
//                dequeuedElements[dequeueCount++] = dequeued;
//            }
//        }
//        else {  // 其他字符，结束输入
//            break;
//        }
//    }
//
//    // 输出队列中的元素
//    displayQueue(&q);
//
//    // 输出出队的元素
//    printf("出队的元素: ");
//    for (int i = 0; i < dequeueCount; i++) {
//        printf("%c ", dequeuedElements[i]);
//    }
//    printf("\n");
//}
//
//int main() {
//    char sequence[100];
//    printf("请输入字符序列(以非数字和小写字母作为结束): ");
//    fgets(sequence, 100, stdin);
//
//    processInput(sequence);
//
//    return 0;
//}
