    /*สตั้3
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define MAX 10
double compute(int a, int b, int op);
int main() {
    int a, b, op;
    char operator;
    double userAnswer, correctAnswer;
    int count = 0;
    srand(time(0));
    for (int i = 0; i < MAX; i++) {
        a = rand() % 100 + 1;
        b = rand() % 100 + 1;
        op = rand() % 4; 
        switch (op) {
        case 0: operator = '+'; break;
        case 1: operator = '-'; break;
        case 2: operator = '*'; break;
        case 3: operator = '/'; break;
        }
        printf("(Left two decimal)Question %d: \n%d %c %d = ", i + 1, a, operator, b);
        scanf("%lf", &userAnswer);
        correctAnswer = compute(a, b, op);
        if (userAnswer == correctAnswer) {
            printf("Correct!\n");
            count++;
        }
        else {
            printf("Wrong! The correct answer is %.2lf.\n", correctAnswer);
        }
    }
    printf("You answered %d out of %d questions correctly.\n", count, MAX);
    printf("Your score is: %d \n(full score is 10)\n", count);
    return 0;
}
double compute(int a, int b, int op) {
    double result;
    switch (op) {
    case 0: 
        result = a + b;
        break;
    case 1: 
        result = a - b;
        break;
    case 2: 
        result = a * b;
        break;
    case 3:
        if (b != 0) {
            result = ((double)a / (double)b);
            result = ((double)((int)((result + 0.005) * 100))) / 100;
        }
        else {
            printf("Division by zero is not allowed.\n");
            result = 0;
        }
        break;
    }
    return result;
}*/