@echo off
echo Ingrese tres lados de un tri�ngulo
set/p a=Primer lado 
set/p b=Segundo lado 
set/p c= Tercer lado 
if %a% equ %b% if %a% equ %c% echo Equil�teros
if %a% equ %b% if not %a% equ %c% echo Is�sceles
if %a% equ %c% if not %a% equ %b% echo Is�sceles
if %b% equ %c% if not %a% equ %b% echo Is�sceles
if not %a% equ %b% if not %b% equ %c% if not %a% equ %c% echo Escaleno
pause>nul
exit