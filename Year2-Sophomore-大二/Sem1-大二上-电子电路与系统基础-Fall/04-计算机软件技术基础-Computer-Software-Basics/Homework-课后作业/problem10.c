//==============================================================================
//
// Title:		problem10
// Purpose:		A short description of the command-line tool.
//
// Created on:	2022/10/19 at 10:51:28 by .
// Copyright:	. All Rights Reserved.
//
//==============================================================================

//==============================================================================
// Include files
#include <ansi_c.h>
typedef struct
{
	int coefficient;
	int exponent;
}elemtype;
typedef struct nodetype
{
	elemtype data;
	struct nodetype *next;
}node;
int inilist(node **head);
int appenddata(node *phead,elemtype data);
int insertdata(node *head,int i,elemtype x);
int deletedata(node *head,int i,elemtype *pdata);
int addmultinomial(node * pa, node *pb);


int main ()
{
	elemtype adata[5]={{1,0},{5,1},{7,3},{-9,7},{5,16}};
	elemtype bdata[5]={{4,1},{7,4},{4,7},{-3,15},{1,16}};
	node *pa,*pb,*p;
	inilist(&pa);
	inilist(&pb);

	int i=0;
	for(i=0;i<5;i++)
	{
		appenddata(pa,adata[i]);
		appenddata(pb,bdata[i]);
	}
	p=pa->next;
	printf("A(x)=");
	while(p!=NULL)
	{
		printf("%dx^%d",p->data.coefficient,p->data.exponent);
		if(p->next!=NULL) printf("+");
		p=p->next;
	}
	p=pb->next;
	printf("\nB(x)=");
	while(p!=NULL)
	{
		printf("%dx^%d",p->data.coefficient,p->data.exponent);
		if(p->next!=NULL) printf("+");
		p=p->next;
	}
	addmultinomial(pa,pb);
	p = pa->next;
	printf("\nA(x)=");
	while(p!=NULL)
	{
		printf("%dx^%d",p->data.coefficient,p->data.exponent);
		if(p->next!=NULL) printf("+");
		p=p->next;
	}
	p=pb->next;
	printf("\nB(x)=");
	while(p!=NULL)
	{
		printf("%dx^%d",p->data.coefficient,p->data.exponent);
		if(p->next!=NULL) printf("+");
		p=p->next;
	}




	return 0;


}
int inilist(node **head)
{
	*head = (node *)malloc(sizeof(node));
	if(*head==NULL)
	{
		return -1;
	}
	(*head)->next = NULL;
	return 0 ;
}
int  appenddata(node *phead, elemtype data)
{
	node *pnode;
	node * p;
	p=phead;
	while(p->next)
	{
		p=p->next;
	}
	pnode = (node *)malloc(sizeof(node));
	if(pnode==NULL)
	{
		return -1;
	}
	pnode->data = data;
	pnode->next = NULL;
	p->next = pnode;
	return 0;
}
//index之后插入结点
int insertdata(node *head,int index,elemtype x)
{
	node *pnode;
	node * p;
	int i=0;
	p=head;

	while(p->next!=NULL &&i<index)
	{
		i++;
		p=p->next;
	}
	if(p->next == NULL && i<index) return -1;
	pnode = (node *)malloc(sizeof(node));
	if(pnode==NULL)
	{
		return -1;
	}
	pnode->data = x;
	pnode->next = p->next;
	p->next = pnode;
	return 0;
}
//删除index结点
int deletedata(node *head,int index,elemtype *pdata)
{
	node * p,*q;
	int i=0;
	p=head;
	while(p->next!=NULL &&i<(index-1))	  //查找待删除结点的前驱结点
	{
		i++;
		p=p->next;
	}
	if(p->next == NULL && i<=(index-1)) return -1;
	*pdata = p->next->data;
	q= p->next;
	p->next = p->next->next;
	free(q);
	return 0;
}
int addmultinomial(node * pahead, node *pbhead)
{
	node * pa, *pb;
	elemtype data;
	int aindex,bindex;
	pa = pahead;
	pb = pbhead->next;
	aindex =1;
	bindex = 1;
	while(pa->next!=NULL)
	{
		if(pa->next->data.exponent == pb->data.exponent)
		{
			pa->next->data.coefficient = pa->next->data.coefficient+pb->data.coefficient;
			pa= pa->next;
			deletedata(pbhead,bindex,&data);
			pb = pbhead->next;
			if(pb==NULL) return 0;

		}
		else if(pa->next->data.exponent<pb->data.exponent)
		{
			pa=pa->next;
		}
		else // pa->next->data.exponent>pb->data.exponent
		{
			//b的结点链接到a
			pbhead->next = pb->next;
			pb->next = pa->next;
			pa->next = pb;
			pa=pa->next;
			pb=pbhead->next;
			if(pb==NULL) return 0 ;
		}
	}
	if(pb->next!=NULL)
	{
		pa->next = pb;
		pbhead->next = NULL;
	}
	return 0 ;
}
