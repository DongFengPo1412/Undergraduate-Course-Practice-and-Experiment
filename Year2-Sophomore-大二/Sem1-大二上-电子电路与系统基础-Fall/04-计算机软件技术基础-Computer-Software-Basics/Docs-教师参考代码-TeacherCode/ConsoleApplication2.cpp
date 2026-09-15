#include <stdio.h>
#include <stdlib.h>

#define NULL 0

typedef struct  student
{
    int id = 0;
    char name[20] = ""; //初始为空字符串
    // int classes;
    float score[4] = {}; //初始化所有元素为0
} elemtype;

struct node
{
    elemtype data;
    struct node* next;
};

/*新增单链表初始化方法*/
void  initiate_singly_linked_list(struct node** h)
{
    // malloc函数分配一个大小为sizeof(struct node)
    // 的内存空间，这个函数的返回值是指向这个
    // 分配的内存空间的首地址的指针。
    // (struct node*)则实现了强制类型转换
    // *h是一个指向
    *h = (struct node*) malloc(sizeof(struct node));
    (*h) -> next = NULL;
}

struct node* initiate_singly_linked_list()
{
    // malloc函数分配一个大小为sizeof(struct node)
    // 的内存空间，这个函数的返回值是指向这个
    // 分配的内存空间的首地址的指针。
    // (struct node*)则实现了强制类型转换
    struct node* h = (struct node*)malloc(sizeof(struct node));
    h->next = NULL;
    return h;
}

int  access_singly_linked_list(node* head, int i, elemtype& elem)
{
    //由于只有一个返回值，所以将结果存放到elem(引用)中
    //而返回值为true或者false
    node* p;
    int j;
    p = head; j = 0;
    while (p->next != NULL && j < i)
    {
        p = p->next;
        j++;
    }

    if (p != NULL && j == i)
    {
        elem = p->data;
        return true;
    }
    else
    {
        elemtype ele;//定义一个elemtype类型变量
        elem = ele;
        return false;
    }
}

void  print_singly_linked_list(node* head)
{
    node* p;
    p = head;
    while (p->next != NULL)
    {
        p = p->next;
        printf("%d\t%s\t%f %f %f %f\n", p->data.id, p->data.name,
            p->data.score[0], p->data.score[1], p->data.score[2], p->data.score[3]);
    }
    printf("\n");
}

void insert_singly_linked_list(struct node* head, int i, elemtype new_element)
{
    struct node* p, * t;
    int j;
    p = head; //p指向列表首节点
    j = 0;
    while (p->next != NULL && j < i - 1)
    {
        p = p->next; j++;
    }

    if (j != (i - 1))  /* 插入位置i 不合理 */
    {
        printf("i is invalid"); return;
    }
    //现在p指向第(i-1)个节点
    t = (node*)malloc(sizeof(struct node)); //为新节点分配内存空间
    t->data = new_element; /*结点数据赋值*/

    //原先第(i-1)个节点的下一个节点是第i个节点( p->next)
    //但由于第(i-1)个节点和第i个节点之间新插入了一个节点t
    //所以新节点t的下一个节点才是 p-> next
    t->next = p->next;
    p->next = t; /*现在第(i-1)个节点的下一个节点是t */
}

void delete_singly_linked_list(struct node* head, int i)
{
    struct node* p, * q;
    int j;
    p = head; j = 0;
    /*寻找第i -1个节点 */
    while (p->next != NULL && j < i - 1)
    {
        p = p->next;
        j++;
    }

    if (j != i - 1)
    {
        printf("i is invalid");
        return;
    }
    //q是原先第(i-1)个节点的下一个节点，即第i个节点
    q = p->next;
    //q->next则是第(i+1)个节点
    p->next = q->next; //第(i-1)个节点现在指向原先的第(i+1)个节点
    free(q);           /*释放被删结点空间*/
}

struct node* create_singly_linked_list(elemtype students[], int num_nodes)
{
    //通过elemtype students[]数组创建单链表
    //num_nodes是students[]数组元素的个数
    struct node* p, * s;
    int j;
    
    //第1种方式
    // struct node* head = initiate_singly_linked_list(); //初始化单链表

    //第2种方式
    struct node* head = NULL;
    initiate_singly_linked_list(&head); //初始化单链表

    p = head;
    for (j = 0; j < num_nodes; j++)
    {
        s = (struct node*)malloc(sizeof(struct node));
        s->data = students[j];
        p->next = s;
        p = s;
    }
    p->next = NULL;
    return head;
}



int main()
{
    printf("sizeof node is %d\n", sizeof(struct node));
    elemtype students[4] = { { 1, "John Wick", {90, 93, 78, 39} }, { 2, "Kung Fu Panda", {99, 92, 100, 99} }, { 3, "Grayman", {88, 97, 96, 66} },  { 4, "Mulan", {82, 92, 90, 96} } };
    elemtype student = { 5, "Ip Man", {100, 99, 98, 97} };

    struct node* head = create_singly_linked_list(students, 4);
    print_singly_linked_list(head);

    elemtype accessed_data;
    int success;
    success = access_singly_linked_list(head, 3, accessed_data);
    success = access_singly_linked_list(head, 5, accessed_data);



    insert_singly_linked_list(head, 4, student);
    print_singly_linked_list(head);

    delete_singly_linked_list(head, 4);
    print_singly_linked_list(head);

    return 0;
}
