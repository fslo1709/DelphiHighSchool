// insercion.cpp : Defines the entry point for the console application.
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
	int v[100],n,c,j,i,t;
	printf("Ingrese el numero de elementos del vector: ");
	scanf("%d",&n);
	t=0;
	srand(time(NULL));
	printf("Vector:");
	for (i=0; i<n; i++)
	{	t=(rand()%20)+1;
		v[i]=t;
		printf("%4d",v[i]);
	}
	i=1;
	j=1;
	while (i<n)
	{	if ((v[j]<v[j-1])&&(j>=1))
		{	c=v[j-1];
			v[j-1]=v[j];
			v[j]=c;
			j--;
		}
		else
		{
			i++;
			j=i;
		}
	}
	printf("\n \nOrdenado:");
	for (i=0; i<n; i++)
		printf("%4d",v[i]);
	getchar(); getchar();
	return 0;
}

