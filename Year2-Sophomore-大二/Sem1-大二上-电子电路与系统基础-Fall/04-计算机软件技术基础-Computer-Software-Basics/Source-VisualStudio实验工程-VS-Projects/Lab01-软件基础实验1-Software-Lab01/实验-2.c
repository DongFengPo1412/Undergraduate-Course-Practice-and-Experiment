#define _CRT_SECURE_NO_WARNINGS
/*刘超然-2023060904025 - 题目2*/
#include <stdio.h>
#define MAX 100

// 定义顺序表结构
typedef struct {
    int data[MAX];       //存放集合元素
    int length;          //当前集合的长度
} set;

// 函数声明
void initList(set* list);            //初始化顺序表的函数
void printList(set list);            //输出顺序表元素的函数
void unionSet(set* A, set B);        //求A和B的并集的函数，将结果存放于A
void intersectSet(set* A, set B);    //求A和B的交集的函数，将结果存放于A

int main() {
    //定义集合 A 和 B
    set A, B;
    //输入 A B 集合元素个数
    int Anumber, Bnumber;
    printf("输入A集合元素个数:");
    scanf("%d", &Anumber);
    printf("输入B集合元素个数:");
    scanf("%d", &Bnumber);

    //初始化集合 A 和 B
    initList(&A);
    initList(&B);

    //令集合长度等于元素个数
    A.length = Anumber;   
    B.length = Bnumber;    

    //输入集合A的元素
    printf("输入整数集合A:\n");
    for (int i = 0; i < Anumber; i++) {
    	scanf("%d", &A.data[i]);
    }
    //输入集合B的元素
    printf("输入整数集合B:\n");
    for (int i = 0; i < Bnumber; i++) {
        scanf("%d", &B.data[i]);
    }

    //求并集，存放于 A 并输出
    unionSet(&A, B);
    printf("A 和 B 的并集: ");
    printList(A);

    //重新初始化集合 A 和 B
    initList(&A);
    initList(&B);    
    A.length = Anumber;
    B.length = Bnumber;

    // 求交集，存放于 A 并输出
    intersectSet(&A, B);
    printf("A 和 B 的交集: ");
    printList(A);

    return 0;
}

// 初始化顺序表
void initList(set* list) {
    list->length = 0;
}

// 输出顺序表
void printList(set list) {
    for (int i = 0; i < list.length; i++) {
        printf("%d ", list.data[i]);
    }
    printf("\n");
}

//求并集，结果存放于 A
void unionSet(set* A, set B) {
    for (int i = 0; i < B.length; i++) {
        int found = 0;
        //检查 B 的元素是否已经在 A 中
        for (int j = 0; j < A->length; j++) {
            if (B.data[i] == A->data[j]) {
                found = 1;
                break;
            }
        }
        //如果 B 中的元素不在 A 中，则将其插入 A 的末尾
        if (found == 0) {
            A->data[A->length] = B.data[i];
            A->length++;
        }
    }
}

//求交集，结果存放于 A
void intersectSet(set* A, set B) {
    int i = 0;
    while (i < A->length) {
        int found = 0;
        //检查 A 中的元素是否在 B 中
        for (int j = 0; j < B.length; j++) {
            if (A->data[i] == B.data[j]) {
                found = 1;
                break;
            }
        }
        //如果 A 中的元素不在 B 中，则从 A 中删除该元素
        if (found == 0) {
            //删除 A 中的第 i 个元素
            for (int k = i; k < A->length - 1; k++) {
                A->data[k] = A->data[k + 1];
            }
            A->length--;
        }
        else {
            i++;  //只有在元素不被删除的情况下才移动 i
        }
    }
}
