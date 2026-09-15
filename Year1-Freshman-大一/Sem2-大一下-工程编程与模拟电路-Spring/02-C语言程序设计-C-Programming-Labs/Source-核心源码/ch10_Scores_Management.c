//==============================================================================
//
// Title:		ch10
// Purpose:		A short description of the command-line tool.
//
// Created on:	2024/5/30 at 10:30:22 by .
// Copyright:	. All Rights Reserved.
//
//==============================================================================

//==============================================================================
// Include files

#include <ansi_c.h>

//==============================================================================
// Constants

//==============================================================================
// Types
 typedef struct Score
   {
	char name[10];
	int math;
	int english;	
   }TypScore;
//==============================================================================
// Static global variables

//==============================================================================
// Static functions



//==============================================================================
// Global variables

//==============================================================================
// Global functions


int main (void)
{
	FILE *fp;
	TypScore myclass[3];
	int i;
/*	fp = fopen("text.txt","w");
	
	for(i=0;i<2;i++)
	{
		scanf("%s",myclass[i].name);
		scanf("%d",&myclass[i].math);
		scanf("%d",&myclass[i].english);
		fprintf(fp,"%s\n", myclass[i].name);
		fprintf(fp,"%d\n",myclass[i].math);
		fprintf(fp,"%d\n",myclass[i].english);
	}
	
	fclose(fp);
*/
/*	fp = fopen("text.txt","r");
	i=0;
	while(!feof(fp))
	{
		fscanf(fp,"%s",myclass[i].name);
		fscanf(fp,"%d",&myclass[i].math);
		fscanf(fp,"%d",&myclass[i].english);
		i++;
	}
	int j;
	for(j=0;j<i;j++)
	{
		printf("%s\n",myclass[j].name);
		printf("%d\n",myclass[j].math);
		printf("%d\n",myclass[j].english);
	}
	fclose(fp);
*/

/*	fp = fopen("text.bin","wb");
	for(i=0;i<2;i++)
	{
		scanf("%s",myclass[i].name);
		scanf("%d",&myclass[i].math);
		scanf("%d",&myclass[i].english);
		fwrite(&myclass[i],1,sizeof(TypScore),fp);
	}
	
	fclose(fp);
*/
	fp = fopen("text.bin","rb");
	i=0;
	while(!feof(fp))
	{
		fread(&myclass[i],1,sizeof(TypScore),fp);
		i++;
	}
	int j;
	for(j=0;j<i;j++)
	{
		printf("%s\n",myclass[j].name);
		printf("%d\n",myclass[j].math);
		printf("%d\n",myclass[j].english);
	}
	fclose(fp);
	return 0;

}

