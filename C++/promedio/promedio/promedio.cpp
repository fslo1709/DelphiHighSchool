// promedio.cpp : Defines the entry point for the console application.
//
#include "stdafx.h"
#include "conio.h"
#include "stdio.h"
#include "math.h"
#include "string.h"
int _tmain(int argc, _TCHAR* argv[])
{
	int a,b,c,d,e=0;
	printf ("Ingrese un n�mero: ");
	scanf ("%d", &a);
	printf ("Ingrese un n�mero: ");
	scanf ("%d", &b);
	printf ("Ingrese un n�mero: ");
	scanf ("%d", &c);
	printf ("Ingrese un n�mero: ");
	scanf ("%d", &d);
	printf ("Ingrese un n�mero: ");
	scanf ("%d", &e);
	float r=(float(a)+float(b)+float(c)+float(d)+float(e))/5.0;
	printf("El resultado es: %.2g \n",r);
	getchar(); getchar();
	return 0;
}

