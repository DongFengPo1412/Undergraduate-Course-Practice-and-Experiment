// ConsoleApplication13.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//

#include <stdio.h>

typedef int elemtype;
typedef int keytype;

/*二分查找*/
int binary_search(elemtype array[], keytype k, int n)
{
    int low, high, mid;
    low = 0;
    high = n - 1;
    while (low <= high)
    {
        mid = (low + high) / 2;
        printf("经历过中间值%d\n", mid);

        if (array[mid] == k)
        {
            printf("找到查询数据%d\n", k);
            return(mid);
        }
        else if (array[mid] < k)
            low = mid + 1;
        else
            high = mid - 1;
    }
    printf("没有找到查询数据\n");
    return(-1);
}


int main()
{
    elemtype a[100];
    int i;
    for (i = 0; i < 100; i++)
    {
        a[i] = i + 1;
    }

    binary_search(a, 100, 100); 
    return 0;
}

