//#include <stdio.h>
//#include <stdlib.h>
//#include <ctype.h>
//
//typedef struct Node {
//    int data;
//    struct Node* next;
//} Node;
//
//// 入栈
//void push(Node** top, int value) {
//    Node* newNode = (Node*)malloc(sizeof(Node));
//    newNode->data = value;
//    newNode->next = *top;
//    *top = newNode;
//}
//
//// 出栈
//int pop(Node** top) {
//    if (*top == NULL) {
//        printf("栈下溢\n");
//        return -1;
//    }
//    int value = (*top)->data;
//    Node* temp = *top;
//    *top = (*top)->next;
//    free(temp);
//    return value;
//}
//
//// 获取栈顶元素
//int peek(Node* top) {
//    if (top != NULL) {
//        return top->data;
//    }
//    return -1;
//}
//
//// 判定操作符优先级
//int precedence(char op) {
//    if (op == '+' || op == '-') return 1;
//    if (op == '*' || op == '/') return 2;
//    return 0;
//}
//
//// 执行运算
//int applyOperation(int a, int b, char op) {
//    switch (op) {
//    case '+': return a + b;
//    case '-': return a - b;
//    case '*': return a * b;
//    case '/': return a / b;
//    }
//    return 0;
//}
//
//// 计算表达式的值
//int evaluateExpression(const char* expression) {
//    Node* values = NULL;
//    Node* ops = NULL;
//
//    for (int i = 0; expression[i] != '\0'; i++) {
//        if (expression[i] == ' ') continue;
//
//        if (isdigit(expression[i])) {
//            int val = 0;
//            while (i < strlen(expression) && isdigit(expression[i])) {
//                val = (val * 10) + (expression[i] - '0');
//                i++;
//            }
//            push(&values, val);
//            i--;
//        }
//        else if (expression[i] == '(') {
//            push(&ops, expression[i]);
//        }
//        else if (expression[i] == ')') {
//            while (ops != NULL && peek(ops) != '(') {
//                int val2 = pop(&values);
//                int val1 = pop(&values);
//                char op = pop(&ops);
//                push(&values, applyOperation(val1, val2, op));
//            }
//            pop(&ops);
//        }
//        else {
//            while (ops != NULL && precedence(peek(ops)) >= precedence(expression[i])) {
//                int val2 = pop(&values);
//                int val1 = pop(&values);
//                char op = pop(&ops);
//                push(&values, applyOperation(val1, val2, op));
//            }
//            push(&ops, expression[i]);
//        }
//    }
//
//    while (ops != NULL) {
//        int val2 = pop(&values);
//        int val1 = pop(&values);
//        char op = pop(&ops);
//        push(&values, applyOperation(val1, val2, op));
//    }
//
//    return pop(&values);
//}
//
//int main() {
//    const char expression[] = "2 + 4 * (7 - 5)";
//    printf("链栈实现：表达式%s = %d\n", expression, evaluateExpression(expression));
//    return 0;
//}
