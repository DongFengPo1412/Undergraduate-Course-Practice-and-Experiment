// ConsoleApplication14.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <stdio.h>
typedef  long long keytype;
typedef struct
{
    keytype phone;      /*顺序码*/
    char* name;
} elemtype;

void print_residents(elemtype residents[], int n)
{
    printf("居民详细如下\n");
    int i;
    for (i = 0; i < n; i++)
    {
        printf("%lld\t%s\n", residents[i].phone, residents[i].name);
    }
    printf("\n");
}

/*复制居民信息*/
void copy_residents(elemtype residents_1[], elemtype residents_2[], int n)
{
    int i;
    for (i = 0; i < n; i++)
    {
        residents_2[i].phone = residents_1[i].phone;
        residents_2[i].name = residents_1[i].name;
    }
}

/*简单插入排序*/
insertsort(elemtype x[], int n)
{
    int i, j;
    elemtype a;
    for (i = 0; i < n - 1; i++) //对x[0]～x[n-1]排序
    {
        a = x[i + 1];     //要插入的元素
        j = i;        //有序部分起始位置
        while (j > -1 && a.phone < x[j].phone)  //寻找插入位置
        {
            x[j + 1] = x[j]; //当前元素后移    
            j--;
        }
        x[j + 1] = a;        //插入该元素
    }
}

/*简单选择排序*/
selectsort(elemtype x[], int n)
{
    int i, j, small;
    elemtype swap;
    for (i = 0; i < n - 1; i++) // n-1次循环 
    {
        small = i;  //无序部分第1个元素的位置 
        for (j = i + 1; j < n; j++) // 寻找最小值循环 
        {
            if (x[j].phone < x[small].phone)
                small = j;   //记录最小值的位置 
        }
        if (small != i)
        {
            swap = x[i];  //交换最小值与无序部分第1个元素位置
            x[i] = x[small];
            x[small] = swap;
        }
    }
}

/*冒泡排序*/
void bubblesort(elemtype x[], int n)
{
    int i, j, flag;
    elemtype swap;
    flag = 1;
    for (i = 0; i < n - 1 && flag == 1; i++)  // n-1趟的循环 
    {
        flag = 0;  //  设置交换标志 
        for (j = 0; j < n - i - 1; j++)  // n-1趟处理  
        {
            if (x[j].phone > x[j + 1].phone)  // 若逆序，则交换位置
            {
                flag = 1;       // 若有交换，则改变交换标志
                swap = x[j];
                x[j] = x[j + 1];
                x[j + 1] = swap;
            }
        }
        if (flag == 0) return;   // 若没有交换，则退出
    }
}

/*快速排序*/
void quicksort(elemtype x[], int left, int right)
{
    int i, j;
    elemtype swap;
    i = left;  j = right;
    swap = x[left];  //设置起点位置 
    while (i < j)
    {
        while (i < j && swap.phone <= x[j].phone) j--;  //从右向左扫描
        if (i < j)
        {
            x[i] = x[j];
            i++;
        }
        while (i<j && swap.phone>=x[i].phone)  i++;   //从左向右扫描
        if (i < j)
        {
            x[j] = x[i];
            j--;
        }
    }
    x[i] = swap;
    if (left < i)  quicksort(x, left, i - 1); // 对分割出的左子序列再排序
    if (i < right) quicksort(x, j + 1, right); // 对分割出的右子序列再排序
}

/*归并排序*/
merge(elemtype R[], elemtype x[], int k, int n)
{
    int i1, i2, l1, l2, r1, r2, j;  l1 = 0; j = 0;
    while (l1 + k < n)
    {
        l2 = l1 + k;
        r1 = l2 - 1;
        r2 = (l2 + k - 1 <= n - 1) ? l2 + k - 1 : n - 1;
        for (i1 = l1, i2 = l2; i1 <= r1 && i2 <= r2; j++)
        {
            if (R[i1].phone <= R[i2].phone)
            {
                x[j] = R[i1]; i1++;
            }
            else
            {
                x[j] = R[i2]; i2++;
            }
        }
        while (i1 <= r1)    // 将序列1中剩余元素顺序放回x中 
        {
            x[j] = R[i1]; i1++;   j++;
        }
        while (i2 <= r2)   //将序列2中剩余元素顺序放回x中  
        {
            x[j] = R[i2]; i2++;   j++;
        }
        l1 = r2 + 1;  //  改变子序列  
    }
    //将原始序列中剩余的、不足一组的记录顺序放到x中 
    for (i1 = l1; i1 < n; i1++, j++)       x[j] = R[i1];
}

mergesort(elemtype R[], elemtype x[], int n)
{
    int i, k = 1;
    while (k < n) // 步长从1到2*m的循环 
    {
        merge(R, x, k, n);
        for (i = 0; i < n; i++) R[i] = x[i]; // 将元素从x放回R中
        k = 2 * k; //序列长度加倍 
    }
}


int main()
{
    elemtype residents[30] = { {14538754513, "lvsongxian"}, {18820073369, "yuanlei"}, {13975963689, "daiziwen"},
        {15137387759, "chenyonghui"}, {15656168536, "zhangliang"}, {15251322299, "liubei"},
        {15966758914, "sunshangxiang"}, {13167708254, "liyuanfang"}, {19961766949, "huge"},
        {15394531042, "liuyifei"}, {17116015810, "anyixuan"}, {17852544143, "wangbaoqiang"},
        {13460422097, "yangyiming"}, {15738378491, "hujing"}, {13837922567, "guowen"},
        {17346769174, "xuyang"}, {15045541025, "lilu"}, {18966907260, "shenjinfeng"},
        {15631929679, "xuhui"}, {13054906710, "huangjing"}, {19949604748, "guanyu"},
        {14924324326, "chenlong"}, {18592289102, "huangliang"}, {13172275104, "liyan"},
        {13444483648, "haojian"}, {19958612710, "zhangfei"}, {17373597726, "shuxiang"},
        {17153785248, "sunyingjie"}, {13601258487, "wangbo"}, {13131142286, "zhaoqing"} };

    elemtype residents_copy[30], residents_temp[30];
    printf("排序前");
    print_residents(residents, 30);

    //简单插入排序
    copy_residents(residents, residents_copy, 30);
    printf("执行简单插入排序\n");
    insertsort(residents_copy, 30);
    printf("排序后");
    print_residents(residents_copy, 30);

    //简单选择排序
    copy_residents(residents, residents_copy, 30);
    printf("执行简单选择排序\n");
    selectsort(residents_copy, 30);
    printf("排序后");
    print_residents(residents_copy, 30);

    //冒泡排序
    copy_residents(residents, residents_copy, 30);
    printf("执行冒泡排序\n");
    bubblesort(residents_copy, 30);
    printf("排序后");
    print_residents(residents_copy, 30);

    //快速排序
    copy_residents(residents, residents_copy, 30);
    printf("执行快速排序\n");
    quicksort(residents_copy, 0, 29);
    printf("排序后");
    print_residents(residents_copy, 30);

    //归并排序
    copy_residents(residents, residents_copy, 30);
    printf("执行归并排序\n");
    mergesort(residents_copy, residents_temp, 30);
    printf("排序后");
    print_residents(residents_copy, 30);

    return 0;
}
