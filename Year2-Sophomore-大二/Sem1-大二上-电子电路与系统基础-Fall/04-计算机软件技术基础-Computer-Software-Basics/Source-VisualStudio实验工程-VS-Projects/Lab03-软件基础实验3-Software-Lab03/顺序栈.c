//#include <stdio.h>
//#include <stdlib.h>
//#include <ctype.h>
//
//#define MAX 100
//
//// 定义顺序栈
//typedef struct {
//    int data[MAX];
//    int top;
//} Stack;
//
//// 初始化栈
//void initStack(Stack* stack) {
//    stack->top = -1;
//}
//
//// 判断栈是否为空
//int isEmpty(Stack* stack) {
//    return stack->top == -1;
//}
//
//// 入栈
//void push(Stack* stack, int value) {
//    if (stack->top < MAX - 1) {
//        stack->data[++stack->top] = value;
//    }
//    else {
//        printf("栈上溢\n");
//    }
//}
//
//// 出栈
//int pop(Stack* stack) {
//    if (!isEmpty(stack)) {
//        return stack->data[stack->top--];
//    }
//    else {
//        printf("栈下溢\n");
//        return -1;
//    }
//}
//
//// 获取栈顶元素
//int peek(Stack* stack) {
//    if (!isEmpty(stack)) {
//        return stack->data[stack->top];
//    }
//    return -1;
//}
//
//// 判断操作符优先级
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
//    Stack values, ops;
//    initStack(&values);
//    initStack(&ops);
//
//    for (int i = 0; expression[i] != '\0'; i++) {
//        // 忽略空格
//        if (expression[i] == ' ') continue;
//
//        // 如果是数字，推入数值栈
//        if (isdigit(expression[i])) {
//            int val = 0;
//            while (i < strlen(expression) && isdigit(expression[i])) {
//                val = (val * 10) + (expression[i] - '0');
//                i++;
//            }
//            push(&values, val);
//            i--;  // 退回一步，因为外层循环会增加i
//        }
//        // 左括号直接推入运算符栈
//        else if (expression[i] == '(') {
//            push(&ops, expression[i]);
//        }
//        // 右括号则计算直到左括号
//        else if (expression[i] == ')') {
//            while (!isEmpty(&ops) && peek(&ops) != '(') {
//                int val2 = pop(&values);
//                int val1 = pop(&values);
//                char op = pop(&ops);
//                push(&values, applyOperation(val1, val2, op));
//            }
//            pop(&ops);  // 弹出左括号
//        }
//        // 遇到操作符
//        else {
//            while (!isEmpty(&ops) && precedence(peek(&ops)) >= precedence(expression[i])) {
//                int val2 = pop(&values);
//                int val1 = pop(&values);
//                char op = pop(&ops);
//                push(&values, applyOperation(val1, val2, op));
//            }
//            push(&ops, expression[i]);
//        }
//    }
//
//    // 计算栈中剩余的值
//    while (!isEmpty(&ops)) {
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
//    printf("顺序栈实现：表达式%s = %d\n", expression, evaluateExpression(expression));
//    return 0;
//}
