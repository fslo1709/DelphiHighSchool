@echo off
title Promedio
color 0E
set/p var1=Ingrese un numero  
set/p var2=Ingrese un numero  
set/p var3=Ingrese un numero  
set/p var4=Ingrese un numero  
set/p var5=Ingrese un numero  
set/p var6=Ingrese un numero  
set/p var7=Ingrese un numero  
set/p var8=Ingrese un numero  
set/p var9=Ingrese un numero  
set/p var10=Ingrese un numero  
set/a "n= (%var1%+%var2%+%var3%+%var4%+%var5%+%var6%+%var7%+%var8%+%var9%+%var10%)/10"
echo El promedio es %n%
pause >nul
exit