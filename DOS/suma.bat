@echo off
title Suma de dos números
color 0E
set/p var1=Ingrese un número    
set/p var2=Ingrese otro número    
set/a var3=%var1%+%var2%
echo.
echo La suma es    %var3%
pause >nul
exit
