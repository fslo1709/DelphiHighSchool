// merge.cpp : Defines the entry point for the console application.
//
#include "stdafx.h"
#include "conio.h"
#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include "string.h"
#include "time.h"
int _tmain(int argc, _TCHAR* argv[])
{
	int v1[100],v2[100],v3[100],n1,n2,n3,i,j,k,t,c1,c2;
	printf("Ingrese el numero de elementos de v1: ");
	scanf("%d",&n1);
	printf("Ingrese el numero de elementos de v2: ");
	scanf("%d",&n2);
	srand(time(NULL));
	t=0;
	printf("V1:");
	for (i=0; i<n1; i++)
	{	t=t+(rand()%5)+1;
		v1[i]=t;
		printf("%4d",v1[i]);
	}
	t=0;
	printf("\n \nV2:");
	for (i=0; i<n2; i++)
	{	t=t+(rand()%5)+1;
		v2[i]=t;
		printf("%4d",v2[i]);
	}
	v1[n1]=v2[n2-1]+1;
	v2[n2]=v1[n1-1]+1;
	c1=0;
	c2=0;
	for (i=0; i<(n1+n2); i++)
		v3[i]=(v1[c1]<v2[c2])?(v1[c1++]):(v2[c2++]);
	printf("\n \nV3:");
	for (i=0; i<n1+n2; i++)
		printf("%4d",v3[i]);
	getchar(); getchar();
	return 0;
}

