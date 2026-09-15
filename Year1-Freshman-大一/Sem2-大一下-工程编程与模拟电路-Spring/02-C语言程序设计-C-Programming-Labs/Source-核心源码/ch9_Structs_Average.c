//==============================================================================
//
// Title:       ch9
// Purpose:     A short description of the command-line tool.
//
// Created on:  2024/5/23 at 15:21:48 by UESTC.
// Copyright:   . All Rights Reserved.
//
//==============================================================================

//==============================================================================
// Include files

#include <ansi_c.h>

//==============================================================================
// Constants

//==============================================================================
// Types
typedef struct student{
	int num;
	char name[10];
	int computer,english,math;
	double average;
}studentType;
//==============================================================================
// Static global variables

//==============================================================================
// Static functions

/// HIFN  Explain how to use this command-line tool.
/// HIPAR name/The name of the command-line tool.
static void usage (char *name)
{
    fprintf (stderr, "usage: %s <argument>\n", name);
    fprintf (stderr, "A short summary of the functionality.\n");
    fprintf (stderr, "    <argument>    is an argument\n");
    exit (1);
}

//==============================================================================
// Global variables

//==============================================================================
// Global functions
int update_score(struct student stu[],int n,int mum,int course,int score);

int main (int argc, char *argv[])
{
    struct student myclass[11];
	int i=0;
	int lowvalue=0,lowindex=0,highvalue=0,highindex=0;
	for(i=0;i<10;i++)
	{
		printf("input the info of No.%d:\n",i+1);
		printf("number:");
		scanf("%d",&myclass[i].num);
		printf("name:");
		scanf("%s",myclass[i].name);
		printf("computer:");
		scanf("%d",&myclass[i].computer);
		printf("english:");
		scanf("%d",&myclass[i].english);
		printf("math:");
		scanf("%d",&myclass[i].math);
		myclass[i].average = (myclass[i].computer+myclass[i].english+myclass[i].math)/3;
		if(i==0)
		{	lowvalue = myclass[i].average;
			highvalue = lowvalue;
		}
		else
		{
			if(lowvalue>myclass[i].average) 
			{
				lowindex = i;
				lowvalue = myclass[i].average;
			}
			if(highvalue<myclass[i].average)
			{
				highindex = i;
				highvalue = myclass[i].average;
			}
		}
	}
	printf("low average is No%d,name:%s,num:%d",lowindex,myclass[lowindex].name,myclass[lowindex].num);
	update_score(myclass,10,1,2,99);
    return 0;
}
int update_score(struct student stu[],int n,int num,int course,int score)
{
	int i,pos;
	for(i=0;i<n;i++)
	{
		if(stu[i].num==num) break;
	}
	if(i<n)
	{
		switch(course)
		{
			case 1:
				stu[i].math = score;
				break;
			case 2:
				stu[i].english = score;
				break;
			case 3:
				stu[i].computer = score;
				break;
		}
		pos = i;
		
	}
	else 
	{
		pos =-1;
	}
	return pos;
	
}


/*int main (int argc, char *argv[])   
{
	studentType mystudent;
	studentType *p;
	p=&mystudent;
	printf("number:");
	scanf("%d",&p->num);
	printf("name:");
	scanf("%s",p->name);
	printf("computer:");
	scanf("%d",&p->computer);
	printf("english:");
	scanf("%d",&p->english);
	printf("math:");
	scanf("%d",&p->math);
	printf("name:%s,num:%d,computer=%d,english=%d,math=%d",mystudent.name,mystudent.num,mystudent.computer,mystudent.english,mystudent.math);
	return 0 ;
}*/
