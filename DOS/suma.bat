@echo off
title Suma de dos n�meros
color 0E
set/p var1=Ingrese un n�mero    
set/p var2=Ingrese otro n�mero    
set/a var3=%var1%+%var2%
echo.
echo La suma es    %var3%
pause >nul
exit
