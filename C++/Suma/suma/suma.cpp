// suma.cpp : Defines the entry point for the console application.
//
#include "stdafx.h"
#include "conio.h"
#include "stdio.h"
#include "math.h"
#include "string.h"
int _tmain(int argc, _TCHAR* argv[])
{
	int a,b,c=0;
	printf("Ingrese un n�mero: ");
	scanf("%d",&a);
	printf("Ingrese otro n�mero: ");
	scanf("%d",&b);
	c= a+b;
	printf("El resultado es: %d \n",c);
	getchar(); getchar();
	return 0;
}

