// Mayor_n.cpp : Defines the entry point for the console application.
//
#include "stdafx.h"
#include "stdlib.h"
#include "conio.h"
#include "stdio.h"
#include "math.h"
#include "string.h"
int _tmain(int argc, _TCHAR* argv[])
{
	int i,n,v[1000];
	int t=0;
	printf("Ingrese el número de elementos a comparar: ");
	scanf ("%d", &n);
	i=0;
	while (i<n)
	{	scanf("%d", &v[i]);
		if (i==0)
			{t=v[0];
		}
		if (t<v[i])
		{	t=v[i];
		}
		i++;
	}
	printf("\nEl mayor es: %d",t);
	getchar();getchar();
	return 0;
}

