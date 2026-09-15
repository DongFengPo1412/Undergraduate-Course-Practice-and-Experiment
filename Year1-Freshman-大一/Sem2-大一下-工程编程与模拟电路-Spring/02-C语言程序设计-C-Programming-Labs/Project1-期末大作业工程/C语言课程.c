#define _CRT_SECURE_NO_WARNINGS
//#define MAXLINE 80
//#include<math.h>
//#include<stdlib.h>
#include<stdio.h>
//int main() 
//{	
	/*第一节课*/
	/*int chinesevalue;
	int mathvalue;
	char name;
	chinesevalue = 90;
	mathvalue = 95;
	name = 'B';
	printf("name:%c\nchinesevalue=%d\nmathvalue=%d\n",name,chinesevalue,mathvalue);
	return 0;*/
	/*int data1;
	int data2;
	int a;
	scanf("%d%d", &data1, &data2);
	a = data1 + data2;
	printf("结果是%d", a);*/
    #pragma region 关系运算符号
    /*< > <= >= == !=*/
    #pragma endregion	
    #pragma region 逻辑运算符
    /*&& || !*/
    #pragma endregion
	/*switch语句*/
	/*switch (i)
	{
		case1:
		break;
		case2:
		break;
	    default:
		break;
	}*/
	/*常量#define PASSLEVEL 60*/	
	/*练习3-2*/
	/*int x;
	printf("请输入一个数：");
	scanf_s("%d",&x);
	if (x < 0) {
		printf("-1\n");
	}
	else if (x == 0) {
		printf("0\n");
    }
	else {
		printf("1\n");
	}*/
	/*int x;
	printf("请输入一个数：");
	scanf_s("%d", &x);
	switch (x)
	{
	    case'x<0':
			printf("-1\n");
			break;
		case'x==0':
			printf("0\n");
			break;
		default:
				printf("1\n");
			break;
			}*/
	/*第一次作业-刘超然-2023060904025*/
    /*#include<stdio.h>
	int main()
	{
		int a, b, c, t;
	printf("请输入三个整数：");
	scanf("%d%d%d",&a,&b,&c);
	if (a >= b)
	{
		t = a; a = b; b = t;
	}
	if (a >= c)
	{
		t = a; a = c; c = t;
	}
	if (b >= c)
	{
		t = b; b = c; c = t;
	}
	printf("%d %d %d", a, b, c);*/
    /*第一次作业-刘超然-2023060904025*/
    /*#include<stdio.h>
	int main()
	{   
		int t;
		float a, b, v;
		printf("请输入车速：");
		scanf("%f",&v);
		printf("请输入限速：");
		scanf("%d",&t);
		a = 1.1 * t;
		b = 1.5 * t;
		if (v > a && v < b)
		{
			printf("处200元罚款");
		}else if (v > b)
			{
			printf("吊销驾驶证");
			}
		else
		{
			printf("不处罚");
		}*/
    #pragma region 数组
    int math[29] = {20,55,30};
    #pragma endregion
    /*循环*/
	/*while
	do......while
	for
		1.while (i < 29)
	{
		printf("%s %d",namelist[i],scorelist[i]);
		i++;//i=i+1
	}
	    2.do
	{
		printf();
		i++;
		} while (i < 29)
		3.for (i = 0; i < 30; i++)
	{
			printf();
		};
		break; 跳出循环
		continue; 进入下一个循环*/      
	/*练习4-3*/
    /*int fenmu, fuhao, i;
    double jingdu, bianliang, he;
    printf("请输入精度：");
    scanf("%lf", &jingdu);
    i = 1;
	fuhao = 1;
	fenmu = 1;
	bianliang = 1.0;
	he = 0;
	while(fabs(bianliang) >= jingdu) {
		he = he + bianliang;
		i++;
		fuhao = -fuhao;
		fenmu = fenmu + 3;
		bianliang = fuhao * 1.0 / fenmu;
	}
	he = he + bianliang;
	printf("结果是：%lf\n", he);
	printf("i=%d", i);*/
    /* 练习4-11*/
    /*int m, n;
    printf("请输入两个正整数：");
    scanf("%d %d", &m, &n); */
    /*第二次作业-刘超然-2023060904025*/
    /*#include<stdio.h>
    int main()
    {
	int i, sum=0;
	printf("请输入一批正整数(以零或负数为结束标志)：");
	while (scanf("%d", &i))
	{
		if (i > 0)
		{
			if (i % 2 != 0)
			{
				sum = sum + i;
			}
		}
		else
		{
			break;
		}
	}
	printf("奇数和%d", sum); */
	/*第二次作业-刘超然-2023060904025*/
    /*#include<stdio.h>
    int main()
    {
    int n,m,t;
	float sum, i, x, y;
	x = 2;
	y = 1;
	sum = 2;
	i = x/y;
	printf("请输入正整数n:");
	scanf("%d", &n);
	if (n == 1)
	{		
		printf("序列和是%.2f", sum);
	}
	if (n >= 2) 
	{
		for (m = 1; m < n; m++)
		{  
			t = x;
			x = x + y;
			y = t;
			i = x / y;
			sum = sum + i;
		}
		printf("序列和%.2f", sum);
	}*/
    /*int m, n, t, i, j;
	printf("请输入两个正整数：");
	scanf("%d %d", &m, &n);
	if (m > 1000 || n > 1000) {
		printf("Invalid.\n");
	}
	if (m > n) {
		i = n;
	}
	else {
		i = m;
	}
	for (t = i; t > 0; t--) {
		if (n % t == 0 && m % t == 0) {
			printf("最大公约数%d", t);
			break;
			}
		}
	for (j = 1; j <= m * n; j++) {
		if (j % m == 0 && j % n == 0) {
			printf("最小公倍数%d", j);
			break;
		}
	}*/
	/*第三次作业-刘超然-2023060904025*/
    /*#include<stdio.h>
    int main()
    {
    int a, b, c, d, sum;
	printf("请输入零钱（大于8分，小于1元）：");
	scanf("%d", &d);
	sum = 0;
	if(d<=8||d>=100){
		printf("出错！");
	}
	else {
		for (a = 1; a < 93; a++)
		for (b = 1; b < 47; b++)
		for (c = 1; c < 20; c++)
		if (a + b * 2 + c * 5 == d) {
			sum = a + b + c;
			printf("1分硬币=%d\n2分硬币=%d\n5分硬币=%d\n总数=%d\n", a, b, c, sum);
			}
	}
	return 0;
    }*/
    /*int a, b, c, d, sum;
    printf("请输入零钱（大于8分，小于1元）：");
    scanf("%d", &d);
    sum = 0;
	if(d<=8||d>=100){
		printf("出错！");
	}
	else {
    for (a = d/5; a > 0; a--)
	for (b = (d-5*a)/2; b > 0; b--)
	for (c = d - 5 * a - b * 2; c > 0; c--)
	if (a * 5 + b * 2 + c == d) {
		sum = a + b + c;
		printf("5分硬币=%d\n2分硬币=%d\n1分硬币=%d\n总数=%d\n", a, b, c, sum);
			}	
    }*/
	/*第三次作业-刘超然-2023060904025*/
	/*#include<stdio.h>
	int main()
	{
		int n, i;
		float height, sum, h;
		printf("请输入高度：");
		scanf("%f", &height);
		printf("请输入落地次数：");
		scanf("%d", &n);
		sum = height;
		if (n == 1) {			
			h = 0.5 * height;
			printf("在空中经过的距离%.1f\n第n次反弹的高度%.1f", sum, h);
		}
		else {
			for (i = 2; i <= n; i++) {
				height = 0.5 * height;
				h = 0.5 * height;
				sum = sum + height * 2;				
			}
			printf("在空中经过的距离%.1f\n第n次反弹的高度%.1f", sum, h);
		}*/ 
	/*函数*/
    /*类型名 函数名（形式参数列表）;//函数声明（放在main函数之前）
    类型名 函数名（形式参数列表）//函数实现（定义）（放在return0之后）
   {
	   函数体
   }*/    
    /*#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
int gcd(int m, int n);
int main()
{

	return 0;
}
int gac(int m, int n)
{
	int r, temp;
	if (m < n) {
		temp = m;
		m = n;
		n = temp;
	}
	r = m % n;
	while (r != 0) {
		m = n;
		n = r;
		r = m % n;
	}
	return n;
}*/
    /* 练习5-1*/
    /*#define _CRT_SECURE_NO_WARNINGS
#include<stdio.h>
int sum(int n);
int main()
{
	int n;
	printf("请输入一个正整数n：");
	scanf("%d", &n);
	n = sum(n);
	printf("1~n之和为：%d", n);
	return 0;
}
int sum(int n)
{
	int i, sum = 0;
	for (i = 0; i <= n; i++) {
		sum += i;
	}
	return sum;
}*/
    /*第四次作业-刘超然-2023060904025*/
    /*#include<stdio.h>
int sign(float n);
int main()
{
	int i;
	float x;
	printf("输入x:");
	scanf("%f", &x);
	i = sign(x);
	printf("函数值为%d", i);
	return 0;
}
int sign(float n)
{
	if (n > 0) {
		n = 1;
	}
	else if (n < 0) {
		n = -1;
	}
	else {
		n = 0;
	}
	return n;
}*/
    /*第四次作业-刘超然-2023060904025*/
    /*#include<stdio.h>
#include<math.h>
double dist(double f1, double e1, double f2, double e2);
int main()
{
	double distance, x1, y1, x2, y2;
	printf("请给定两点的坐标：");
	scanf("%lf %lf %lf %lf", &x1, &y1, &x2, &y2);
	distance = dist(x1, y1, x2, y2);
	printf("两点间的距离是%.2lf", distance);
	return 0;
}
double dist(double f1, double e1, double f2, double e2)
{
	double d1, d2, d;
	d1 = (f1 - f2) * (f1 - f2);
	d2 = (e1 - e2) * (e1 - e2);
	d = sqrt(d1 + d2);
	return d;
}*/
    /* 作用域和生存期
	局部变量（动态变量）和全局变量（一直存在）
	static int n;(静态局部变量)*/
    /*#include<stdio.h>
    double fact_s(int n);
    int main() 
    {	
    int i, n;
	printf("Input n:");
	scanf("%d",&n);
	for (i = 1; i <= n; i++) {
		printf("%3d!=%.0f\n", i, fact_s(i));
	}
	return 0;
    }
    double fact_s(int n) {
	static double f = 1;
	f = f * n;
	return(f);
}*/
    /*第五次作业-刘超然-2023060904025*/
    /*#include<stdio.h>
int countdigit(int number,int digit);
int main()
{
	int number, digit, n;
	printf("请输入一个整数：");
	scanf("%d", &number);
	printf("请输入想要统计的数字：");
	scanf("%d", &digit);
	n = countdigit(number, digit);
	printf("想要统计的数字的个数：%d",n);
	return 0;
}
int countdigit(int number, int digit)
{
	int sum = 0;
	while (number != 0) {
		if (number % 10 == digit) 
			sum++;
			number = number / 10;				
	}		
	return sum;
}*/
    /*第五次作业-刘超然-2023060904025*/
    /*#include<stdio.h>
    #include<math.h>
    double funcos(double e, double x);
	int main()
	{
		double e, x;
		printf("输入精度（不大于1）：");
		scanf("%lf", &e);
		printf("输入一个数：");
		scanf("%lf", &x);
		if (e > 1) {
			printf("出错！");
		}
		else {
            x = funcos(e, x);
		    printf("cosx=%lf", x);
		}		
		return 0;
	}
	double funcos(double e, double x)
	{
		double sum = 0, n = 1, i = 0, s = 1;	
		int k, l = 1;
		while (fabs(n) >= e) 
		{
			for (k = 1; k < i; k++) {
				l = l * (l + 1);
			}
			n = pow(x,i) / l;
			sum = sum + n * s;
			s = -s;
			i += 2;
		}
		return sum;
	}*/
    #pragma region 二维数组
    //类型符 数组名[元素个数][元素个数]
//二维数组中的元素的存放按照行优先排列
//char nameList[36][10];
//二维数组的引用
//data[0][1];
//二维数组的初始化
//int a[3][3] = { {1,2,3}，{}，{} }；
	#pragma endregion
    #pragma region 字符数组
	//字符数组：类型为字符的数组
//字符串：存放在字符数组中的一串字符
//char name[10] = { 'T','O','M' };
//char name[10] = { "TOM" };
//字符串结束标志 \0
//数组名的意义：数组的起始位置
//scanf("%s", name);
//一维数组：
//strcpy(name, "TOM");
//二维数组
//strcpy(&nameList[0][0], "TOM");
	#pragma endregion
    /*练习7-11*/
    /*int i, k, temp;
	char str[MAXLINE];
	printf("Enter a string:");
	i = 0;
	while ((str[i] = getchar()) != '\n') {
		i++;
	}
	str[i] = '\0';
	k = i - 1;
	for (i = 0; i < k; i++) {
		temp = str[i];
		str[i] = str[k];
		str[k] = temp;
		k--;
	}
	for (i = 0; str[i] != '\0'; i++)
		putchar(str[i]);*/
    /*第六次作业-刘超然-2023060904025*/
	/*#include<stdio.h>
int main() 
{	
	int m, n, i, k;	
	double sum;
	double a[6][6];
	printf("请输入两个不大于6的正整数：");
	scanf("%d%d", &m, &n);	
	if (m >= 1 && m <= 6 && n >= 1 && n <= 6) {	
		printf("请依次输入矩阵中的元素：%d\n", m * n);	
		for (i = 0; i < m; i++) {
			for (k = 0; k < n; k++) {
				scanf("%lf", &a[i][k]);
			}
		}
	}
	else {
		printf("出错！");
	}
	for (i = 0; i < m; i++) {
		sum = 0;
		for (k = 0; k < n; k++) {
			sum += a[i][k];
		}
		printf("%lf\n",sum);
	}
	return 0;
}*/
	/*第六次作业-刘超然-2023060904025*/
	/*#include<stdio.h>
	#define MAXLINE 80
	int main()
	{	
		int i, sum;
		char str[MAXLINE];
		printf("输入一串字符串：");
		i = 0;
		while ((str[i] = getchar()) != '\n') {
			 i++;
		}
		str[i] = '\0';
		sum = 0;
		for (i = 0; str[i] != '\0'; i++) {
			if (str[i] <= 'Z' &&
				str[i] > 'A'  &&
				str[i] != 'E' &&
				str[i] != 'I' &&
				str[i] != 'O' &&
				str[i] != 'U')
				sum++;									
		}
		printf("大写辅音字母一共有%d个", sum);	
		return 0;
	}*/
	#pragma region 指针
//指针就是地址
//char name = "A";
//&name;//地址
//name;//值
//指针变量
//类型*变量名
//int* p;
//int a = 5;
//p = &a;
//*p = 8;//等价于a
#pragma endregion
	#pragma region 指针的作用
//指针作为函数参数
//函数参数-传值和传址
#pragma endregion
	/*例5-7*/
	/*#include<stdio.h>
void complex_add(double real1, double image1, double real2, double image2, double* realSum, double* imageSum);
void complex_prod(double real1, double image1, double real2, double image2, double product);
int main()
{
	double real1, image1, real2, image2;
	double realSum, imageSum;
	printf("Enter 1st complex number:");
	scanf("%lf%lf", &real1, &image1);
	printf("Enter 2nd complex number:");
	scanf("%lf%lf", &real2, &image2);
	complex_add(real1, image1, real2, image2, &realSum, &imageSum);
	printf("addition of complex is %lf+%lfi\n", realSum, imageSum);
	return 0;
}
void complex_add(double real1, double image1, double real2, double image2, double* realSum, double* imageSum) {
	*realSum = real1 + real2;
	*imageSum = image1 + image2;
	return;
}*/
	/*练习8-3*/
	/*#include<stdio.h>
double sum_diff(double op1, double op2, double* psum, double* pdiff);
int main()
{
	double op1, op2;
	double psum, pdiff;
	printf("请输入第一个数：");
	scanf("%lf", &op1);
	printf("请输入第二个数：");
	scanf("%lf", &op2);
	sum_diff(op1, op2, &psum, &pdiff);
	printf("两个数的和是：%lf\n两个数的差是：%lf", psum, pdiff);
	return 0;
}
double sum_diff(double op1, double op2, double* psum, double* pdiff) {
	*psum = op1 + op2;
	*pdiff = op1 - op2;
	return;
}*/	
	/*第七次作业-刘超然-2023060904025*/
	/*#include<stdio.h>	
#include<math.h>
void splitfloat(float x, int* intpart, float* fracpart);
int main() 
{
	float x, fracpart;
	int intpart;
	printf("请输入一个实数：");
	scanf("%f", &x);
	splitfloat(x, &intpart, &fracpart);
	printf("这个数的整数部分是：%d\n这个数的小数部分是：%f", intpart, fracpart);
	return 0;
}
void splitfloat(float x, int* intpart, float* fracpart) {
	*intpart = floor(x);
	*fracpart = x - *intpart;
	return;
}*/
	/*第七次作业-刘超然-2023060904025*/
	/*#include<stdio.h>
int search(int list[], int n, int x);
int main()
{
	int i, n, res, x;
	int a[10];
	printf("请输入一个正整数n（1<n<=10）：");
	scanf("%d", &n);
	printf("请输入n个整数：");
	for (i = 0; i < n; i++) {
		scanf("%d", &a[i]);
	}
	printf("请输入一个整数x：");
	scanf("%d", &x);
	res = search(a, n, x);
	if (res != -1)
	{
		printf("元素x的下标=%d", res);
	}
	else { 
		printf("Not found"); 
	}
	return 0;
}
int search(int list[], int n, int x)
{
	int i;
	for (i = 0; i < n; i++) 
		if (list[i] == x) {
			return i;
		}
	return -1;
}*/
	#pragma region 指针引用数组
//int a[10];
//int* p;
//p = a;//初始地址
//p = &a[0];
//p + 1 = &a[1];
//p - 1; p++; ++p; p--; --p;
//a[5]; *(a + 5); *(p + 5); p[5];
#pragma endregion
	#pragma region 数组作为函数参数
//数组元素作为实参，不能用作形参
//数组名作为参数（形参和实参）
//void fun(int x, int y); 调用fun(a[0], a[1]);
//void fun(int arr[], int n);
//等价于 void fun(int *arr,int n)
#pragma endregion
	/*练习7-5*/
	/*#include<stdio.h>
#define MAXN 10
void swap(int* px, int* py);
void bubble(int a[], int n);
int main()
{
	int n, i;
	int a[MAXN];
	printf("Enter n:");
	scanf("%d", &n);
	printf("Enter %d integers:", n);
	for (i = 0; i < n; i++) {
		scanf("%d", &a[i]);
	}
	bubble(a, n);
	printf("After sorted:");
	for (i = 0; i < n; i++) {
		printf("%d", a[i]);
	}
	return 0;
}
void swap(int* px, int* py) {
	int t;
	t = *px;
	*px = *py;
	*py = t;
}
void bubble(int a[], int n) {
	int k, i, index;
	for (k = 0; k < n - 1; k++) {
		index = k;
		for (i = k + 1; i < n; i++) {
			if (a[i] < a[index]) {
				index = i;
			}
		}
		swap(&a[index], &a[k]);
	}
}*/
	#pragma region 指针引用字符串
//char name[10] = {"Tom"};
//char* p = "hello";
//p = name;
//p = name; p[2] = 'a';
//scanf("%s", name);
//scanf()gets()
//printf()puts()
//strcpy
//strcat
//strlen
//strcmp
#pragma endregion
	#pragma region 存储空间的动态分配
//int* p;
//int a;
//p = &a;
//int arr[10];
//p = arr;
//p = malloc(100 * sizeof(int));
//free(p); 
#pragma endregion
	/*练习8-8*/
	/*void moves(char* s) {
	char ch;
	int n, i, j;
	n = strlen(s);
	for (i = 0; i < 3; i++) {
		ch = s[0];
		for (j = 0; j < n - 1; j++) {
			s[i] = s[j + 1];
		}
		s[j] = ch;
	}
	}*/
	/*统计字符*/ 
	/*char ch;
int i, n, letter = 0, digit = 0, other = 0;
printf("请输入要统计的字符个数：");
scanf("%d", &n);
printf("请输入要统计的字符：");
for (i = 1; i <= n; i++) {
	ch = getchar();
	if ((ch >= 'a' && ch <= 'z') || (ch >= 'A' && ch <= 'Z')) {
		letter++;
	}
	else if (ch >= '0' && ch <= '9') {
		digit++;
	}
	else {
		other++;
	}
}
printf("letter=%d,digit=%d,other=%d", letter, digit, other);*/
	/*第八次作业-刘超然-2023060904025*/
	/*#include<stdio.h>
#include<string.h>
#define MAXLINE 80
void strmcpy(char* s, char* t, int m);
int main()
{
	char s[MAXLINE],t[MAXLINE];
	printf("请输入一个字符串：");
	gets(t);
	int m;
	printf("请输入一个正整数m：");
	scanf("%d", &m);
	strmcpy(s,t,m);
	puts(s);
	return 0;
}
void strmcpy(char* s, char* t, int m)
{
	char *p=s,*q=t;
	q += m - 1;
	while (*q != '\0') {
		*p++ = *q++;
	}
	*p = '\0';
}*/
	/*第八次作业-刘超然-2023060904025*/
	/*#include<stdio.h>
#include<string.h>
#define MAXLINE 100
int main() 
{
	int i=0, sumCap=0, sumSma=0, sumSpa=0, sumNum=0, sumOth=0;
	char str[MAXLINE];
	char* p = str;
	printf("请输入一行文字：");
	gets(str);
	while (p[i] != '\0') {
		if (p[i] >= 'A' && p[i] <= 'Z') {
				sumCap += 1;
			}
		else if (p[i] >= 'a' && p[i] <= 'z') {
				sumSma += 1;
			}
		else if (p[i] == ' ') {
				sumSpa += 1;
			}
		else if(p[i] >= '0' && p[i] <= '9') {
				sumNum += 1;
			}
		else {
				sumOth += 1;
			}
		i++;
	}
	printf("大写字母个数%d\n小写字母个数%d\n空格个数%d\n数字字数%d\n其他字符个数%d", sumCap, sumSma, sumSpa, sumNum, sumOth);
	return 0;
}*/
	#pragma region 结构体
//struct Score {
//	char name[10];
//	int math;
//	int english;
//};
//struct Score myScore;
//struct Score classone[29];  
//strcpy(myScore.name, "PDB");
//myScore.math = 100;
//myScore.english = 10;
//
//typedef struct {
//	int age;
//	char name[10];
//}Person;
//Person T佬;
//
//typedef struct {
//	Person student;
//	int math
//}StudentScore;
#pragma endregion
	/*练习9-1*/
	/*struct Complex {
	int real;
	int imagnary;
	};*/
	#pragma region 结构体数组与指针
//struct Score classone[29];
//classone[0].math = 80;
//classone[0].english = 70;
//struct Score* p;
//p = &classone[0];
//or p = classone;
//p->math = 70;
//p->english = 80;
#pragma endregion
	/*练习9-5*/
	/*struct student {
	int num;
	char name[10];
	int computer, english, math;
	double average;
	};
	int main() {
		int i, index, j, n;
		float MAX, MIN;
		struct student students[10];
		printf("Input n:");
		scanf("%d", &n);
		for (i = 0; i < n; i++) {
			printf("Input the info of No.%d:\n", i + 1);
			printf("number:");
			scanf("%d", &students[i].num);
			printf("name:");
			scanf("%s", students[i].name);
			printf("math score:");
			scanf("%d", &students[i].math);
			printf("english score:");
			scanf("%d", &students[i].english);
			printf("computer score:");
			scanf("%d", &students[i].computer);
			students[i].average = (students[i].math + students[i].english + students[i].computer) / 3.0;
		}
		if (i == 0) {
			MIN = students[i].average;
			MAX = students[i].average;
		}
		else {

		}
		printf("最大：num%d\nname%s.2lf\n", students[].num, students[].name, students[].average);
		printf("最小：num%d\nname%s.2lf\n", students[].num, students[].name, students[].average);
		return 0;
	}*/
	/*练习9-6*/
	/*typedef struct student {
		int num;
		char name[10];
		int computer, english, math;
		double average;
	}studentType;
	int main(int argc, char* argv[]) {
		studentType mystudent;
		studentType* p;
		p=& mystudent;
		printf("number:");
		scanf("%d", &p->num);
		printf("name:");
		scanf("%s", p->name);
		printf("computer:");
		scanf("%d", &p->computer);
		printf("english:");
		scanf("%d", &p->english);
		printf("math:");
		scanf("%d", &p->math);
		printf("name:%s,num:%d,computer=%d,english=%d,math=%d", mystudent.name, mystudent.num, mystudent.computer, mystudent.english, mystudent.math);
	}*/
	/*文件*/
	/*typedef struct Score {
	char name[10];
	int math;
	int english;
	}TypScore;
	int main() {
	FILE* fp;
	TypScore myclass[3];
	int i;
	fp = fopen("text.txt", "w");
	for (i = 0; i < 2; i++) {
		scanf("%s", myclass[i].name);
		scanf("%d", &myclass[i].math);
		scanf("%d", &myclass[i].english);
		fprintf(fp, "%s\n", myclass[i].name);
		fprintf(fp, "%d\n", myclass[i].math);
		fprintf(fp, "%d\n", myclass[i].english);
	}
	fclose(fp);
	fp = fopen("text.bin", "wb");
	for (i = 0; i < 2; i++) {
		scanf("%s", myclass[i].name);
		scanf("%d", &myclass[i].math);
		scanf("%d", &myclass[i].english);
		fwrite(&myclass[i], 1, sizeof(TypScore), fp);
	}
	return 0;
	}*/
	/*第九次作业-刘超然-2023060904025*/
	/*typedef struct {
	int hour, minute, second;
	}time;
int main()
{
	int n;
	time T;
	printf("输入小时：");
	scanf("%d", &T.hour);
	printf("输入分钟：");
	scanf("%d", &T.minute);
	printf("输入秒钟：");
	scanf("%d", &T.second);
	printf("请输入秒数：");
	scanf("%d", &n);
	if (n >= 60) {
		printf("Error!");
	}
	else {
		if (n + T.second >= 60) {
			T.second = n + T.second - 60;
			T.minute += 1;
		}
		else {
			T.second += n;
		}
		if (T.minute == 60) {
			T.minute = 0;
			T.hour += 1;
		}
		if (T.hour == 24) {
			T.hour = 0;
		}
		printf("%d:%d:%d", T.hour, T.minute, T.second);
	}
	return 0;
	}*/
	/*第九次作业-刘超然-2023060904025*/
	/*typedef struct{
	float real;
	float imagnary;
}complex;
int main() {
	complex num1, num2, num3;
	printf("输入第一个复数：");
	scanf("%f%f", &num1.real, &num1.imagnary);
	printf("输入第二个复数：");
	scanf("%f%f", &num2.real, &num2.imagnary);
	num3.real = num1.real * num2.real - num1.imagnary * num2.imagnary;
	num3.imagnary = num1.real * num2.imagnary + num1.imagnary * num2.real;
	printf("两个复数之积：%f+%fi", num3.real, num3.imagnary);
	return 0;
	}*/
	/*第十次作业-刘超然-2023060904025*/
	/*int main()
{
	FILE* fp;
	double num;
	if ((fp = fopen("number.txt", "w")) == NULL) {
		printf("File open error!\n");
		exit(0);
	}
	printf("输入若干实数：\n");
	scanf("%lf", &num);
	while (num != -1) {
		fprintf(fp, "%lf\n", num);
		scanf("%lf", &num);
	}
	if (fclose(fp)) {
		printf("Can not close the file!\n");
		exit(0);
	}
	return 0;
	}*/
	/*素数文件*/
	/*int main() {
	int n = 2, count = 0;
	FILE* fp;
	if ((fp = fopen("prime.txt", "w")) == NULL) {
		printf("File open error!\n");
		exit(0);
	}
	while (count < 500) {
		if
	}
}*/
    /*return 0;
}*/