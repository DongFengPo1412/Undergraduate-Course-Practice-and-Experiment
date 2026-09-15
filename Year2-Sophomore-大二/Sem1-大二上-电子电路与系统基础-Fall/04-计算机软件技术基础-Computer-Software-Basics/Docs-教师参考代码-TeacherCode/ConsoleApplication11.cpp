// ConsoleApplication11.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//

#include <stdio.h>
#include <stdlib.h>

typedef int elemtype;

//定义二叉树的结构
typedef struct binary_tree
{
    elemtype data;   // 节点保存的数据
    binary_tree* left; // 定义左节点指针
    binary_tree* right; // 定义右节点指针
}node;


//初始化二叉树
void insert(node** tree, int gain) //指向指针变量的指针，结果是指针tree所指向的值
{
    //在主函数里面root是指向node类型的指针
    //并且在开始时设为NULL
    //但是尽管如此，root的地址(&root)并不为空指针
    node* temp = NULL;
    if (!(*tree)) //判断根节点是否存在
    {
        temp = (node*)malloc(sizeof(node));
        temp->left = temp->right = NULL; //左右节点为空
        temp->data = gain;
        *tree = temp;
        return;
    }

    if (gain < (*tree)->data) //判断是左子树
    {
        insert(&(*tree)->left, gain); //创建左子树
    }
    else if (gain >= (*tree)->data) //判断是右子树
    {
        insert(&(*tree)->right, gain);//创建右子树
    }
}

//释放节点内存
void deltree(node* tree)
{
    if (tree)
    {
        deltree(tree->left);//先往左子树一直寻找
        deltree(tree->right);//再往右子树一直寻找
        free(tree); //找不到了free返回上一级
    }
}

int found; //设置全局变量，表示是否找到
void my_search(node* tree, elemtype data)
{
    int search = 0;
    if (tree)
    {
        printf("已访问数据%d\n", tree->data);
        if (tree->data == data)
        {
            printf("找到所查询的数据%d\n", data);
            found = 1;
        }
        else if(tree->data >data) //在左子树寻找
        {
            my_search(tree->left, data);
        }
        else //在右子树寻找
        {
            my_search(tree->right, data);
        }
    }
}

int main()
{
    node* root = NULL;
    int i;

    //将值赋给二叉树

    int my_data[] = { 45, 24, 53, 12, 37, 95, 30, 40, 80};
    for (i = 0; i < 15; i++)
    {
        insert(&root, my_data[i]);
    }

    printf("--------------------------查找-------------------------------\n");
    found = 0;
    my_search(root, 37);
    if (found == 0)
    {
        printf("没找到所查询的数据\n");
    }

    //释放掉二叉树
    deltree(root);
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
