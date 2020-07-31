// Mayor de tres.cpp : Defines the entry point for the console application.
//
#include "stdafx.h"
#include "stdlib.h"
#include "conio.h"
#include "stdio.h"
#include "math.h"
#include "string.h"
int _tmain(int argc, _TCHAR* argv[])
{
	int a,b,c=0;
	printf ("Ingrese un número: ");
	scanf ("%d", &a);
	printf ("Ingrese un número: ");
	scanf ("%d", &b);
	printf ("Ingrese un número: ");
	scanf ("%d", &c);
	if (a>=b && a>=c)
		printf("El primero es el mayor");
	if (b>=c && b>=a)
		printf("El segundo es el mayor");
	if (c>=a && c>=b)
		printf("El tercero es el mayor");
	printf ("%d", a);
	getchar(); getchar();
	return 0;
}

