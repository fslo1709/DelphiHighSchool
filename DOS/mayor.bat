@echo off
set/p var1= Ingrese un n�mero
set/p var2= Ingrese otro n�mero
set/a var3= %var1%-%var2%
if %var3% equ 0 echo son iguales
if %var3% gtr 0 echo El primero n�mero es mayor
if %var3% lss 0 echo El segundo n�mero es mayor

pause>nul
exit