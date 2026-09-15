// ConsoleApplication10.cpp : 此文件包含 "main" 函数。程序执行将在此处开始并结束。
//
#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <time.h>   //time用到的头文件
#include <stdlib.h> //随机数srand用到的头文件
#include <ctype.h>  //toascii()用到的头文件
#include <string.h> //查找姓名时比较字符串用的头文件

#define NAME_LEN 30 //姓名表的长度
#define HASH_LEN NAME_LEN //50 哈希表的长度
// #define P HASH_LEN //47        //小于哈希表长度的P


typedef struct //姓名表
{
    char* name;   //名字的拼音
    int hashCode; //拼音所对应的ASCII和
} NAME;

typedef struct //哈希表
{
    char* name; //名字的拼音
    int key;    //拼音所对应的ASCII总和，即关键字
    int si;     //查找长度
} HASH;

/**
 * 获取姓名的 ASCII 之和
 */
int gethashCode(char* name)
{
    int s = 0, j;
    for (j = 0; *(name + j) != '\0'; j++)
    {
        s += toascii(*(name + j));
    }
    return s;
}

/*姓名表的初始化*/
void InitName(NAME Name[], int name_len)
{ 
    int i;
    Name[0].name = "lvsongxian";
    Name[1].name = "yuanlei";
    Name[2].name = "daiziwen";
    Name[3].name = "chenyonghui";
    Name[4].name = "zhangliang";
    Name[5].name = "liubei";
    Name[6].name = "sunshangxiang";
    Name[7].name = "liyuanfang";
    Name[8].name = "huge";
    Name[9].name = "liuyifei";
    Name[10].name = "anyixuan";
    Name[11].name = "wangbaoqiang";
    Name[12].name = "yangyiming";
    Name[13].name = "hujing";
    Name[14].name = "guowen";
    Name[15].name = "xuyang";
    Name[16].name = "lilu";
    Name[17].name = "shenjinfeng";
    Name[18].name = "xuhui";
    Name[19].name = "huangjing";
    Name[20].name = "guanyu";
    Name[21].name = "chenlong";
    Name[22].name = "huangliang";
    Name[23].name = "liyan";
    Name[24].name = "haojian";
    Name[25].name = "zhangfei";
    Name[26].name = "shuxiang";
    Name[27].name = "sunyingjie";
    Name[28].name = "wangbo";
    Name[29].name = "zhaoqing";
    for (i = 0; i < name_len; i++) //将字符串的各个字符所对应的ASCII码相加，所得的整数做为哈希表的关键字
    {
        Name[i].hashCode = gethashCode(Name[i].name);
    }
}

/*建立哈希表*/
void CreateHash(NAME Name[], int name_len, HASH Hash[], int hash_len)
{   
    int i;
    for (i = 0; i < hash_len; i++) //清空哈希表，未经此操作将储存空数据
    {
        Hash[i].name = "\0";
        Hash[i].key = 0;
        Hash[i].si = 0;
    }

    for (i = 0; i < name_len; i++)
    {
        int si = 1;                       // 查找长度默认为1
        int adr = (Name[i].hashCode) % hash_len; //采用除留余数法H(name)=name%P计算地址

        if (Hash[adr].si != 0) //如果冲突，使用线性探测法处理冲突
        {
            int currAddr = adr;
            //从冲突下一个位置开始探测,到达最后一个再从第一个开始
            do
            {
                si++; // 查找长度+1
                adr = (adr + 1) % hash_len;
            } while (Hash[adr].si != 0 && adr != currAddr);

            // 直到回到当前位置时还没找到，说明哈希表已经满了
            if (adr == currAddr)
            {
                printf("哈希表已满\n");
                return;
            }
        }
        Hash[adr].key = Name[i].hashCode;
        Hash[adr].name = Name[i].name;
        Hash[adr].si = si; //表示Hash[adr]地址已被占用
    }
}

void DisplayName(NAME Name[], int name_len) //显示姓名表
{
    int i;
    printf("\n地址 \t\t 姓名 \t\t 关键字\n");
    for (i = 0; i < name_len; i++)
        printf("%2d %18s \t\t  %d  \n", i, Name[i].name, Name[i].hashCode);
}

void DisplayHash(HASH Hash[], int hash_len, int name_len) // 显示哈希表
{
    int i;
    float asl = 0.0;
    printf("\n\n 地址 \t\t 姓名 \t\t 关键字 \t 搜索长度\n"); //显示的格式
    for (i = 0; i < hash_len; i++)
    {
        printf("%2d %18s \t\t  %d \t\t  %d\n", i, Hash[i].name, Hash[i].key, Hash[i].si);
        asl += Hash[i].si;
    }
    asl /= name_len; //求得ASL
    printf("\n\n平均查找长度：ASL(%d)=%f \n", hash_len, asl);
}

// 查询
void FindName(HASH Hash[], int hash_len, char name[20])
{
    // char name[20] = { 0 };
    int hashCode = 0, si = 1;

    hashCode = gethashCode(name); //求出姓名的拼音所对应的ASCII作为关键字
    int adr = hashCode % hash_len;       //除留余数法去地址
    int j = 0;

    // 如果hash地址为空，则直接认为不存在
    if (Hash[adr].key == 0)
    {
        printf("\n没有想要查找的人!\n");
        return;
    }
    // 如果hashCode和name都相等
    if (Hash[adr].key == hashCode && 0 == strcmp(Hash[adr].name, name))
    {
        printf("\n姓名:%s   关键字:%d   地址:%d   查找长度为: 1\n", Hash[adr].name, hashCode, adr);
    }
    // 如果不相等，则进行线性探测搜索
    else
    {
        int currAddr = adr;
        //从冲突下一个位置开始探测,到达最后一个再从第一个开始
        do
        {
            si++; // 查找长度+1
            adr = (adr + 1) % hash_len;
            // 如果找到，直接break跳出循环
            if (Hash[adr].key == hashCode && 0 == strcmp(Hash[adr].name, name))
            {
                printf("\n姓名:%s   关键字:%d   地址:%d   查找长度为:%d\n", Hash[adr].name, hashCode, adr, si);
                break;
            }
        } while (adr != currAddr);

        // 直到回到当前位置时还没找到，说明不存在
        if (adr == currAddr)
        {
            printf("\n没有想要查找的人!\n");
            return;
        }
    }
}

void view() //交互界面
{
    printf("=======================================================\n");
    printf("=                                                     =\n");
    printf("=                   人名哈希表                        =\n");
    printf("=                                                     =\n");
    printf("=  A: 打印姓名表                 B: 打印哈希表        =\n");
    printf("=                                                     =\n");
    printf("=  C: 查找                       D: 退出程序          =\n");
    printf("=                                                     =\n");
    printf("=======================================================\n");
}

int main() //主函数
{
    char c;
    int a = 1, i;
    NAME Name[NAME_LEN]; //全局定义姓名表,最大长度为50
    HASH Hash[HASH_LEN]; //全局定义哈希表，最大长度为50

    InitName(Name, NAME_LEN);   //调用初始化姓名表函数
    CreateHash(Name, NAME_LEN, Hash, HASH_LEN); //调用创建哈希表函数
    view();       //调用交互界面函数
    char name[20] = { 0 }; // 姓名长度不超过20
    while (a)
    {
        printf("\n输入选项:");
        scanf("%c", &c);
        getchar();
        switch (c) //根据选择进行判断，直到选择退出时才可以退出
        {
        case 'A':
        case 'a':
            DisplayName(Name, NAME_LEN);
            break; //打印姓名表
        case 'B':
        case 'b':
            DisplayHash(Hash, HASH_LEN, NAME_LEN);
            break; //打印哈希表
        case 'C':
        case 'c':
            for (i = 0; i < 20; i++) name[i] = 0; //对name数组清零
            printf("\n请输入想要查找的姓名的拼音:");
            scanf("%s", name);
            getchar();
            FindName(Hash, HASH_LEN, name);
            break; //调用查找函数
        case 'D':
        case 'd':
            a = 0;
            break; //退出循环，终止程序
        default:
            printf("\n请输入正确的选择!\n");
            break;
        }
    }
    return 0;
}


