@echo off
set/p var1= Ingrese un número
set/p var2= Ingrese otro número
set/a var3= %var1%-%var2%
if %var3% equ 0 echo son iguales
if %var3% gtr 0 echo El primero número es mayor
if %var3% lss 0 echo El segundo número es mayor

pause>nul
exit