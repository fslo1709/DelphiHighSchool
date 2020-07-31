@echo off
echo Ingrese tres lados de un triángulo
set/p a=Primer lado 
set/p b=Segundo lado 
set/p c= Tercer lado 
if %a% equ %b% if %a% equ %c% echo Equiláteros
if %a% equ %b% if not %a% equ %c% echo Isósceles
if %a% equ %c% if not %a% equ %b% echo Isósceles
if %b% equ %c% if not %a% equ %b% echo Isósceles
if not %a% equ %b% if not %b% equ %c% if not %a% equ %c% echo Escaleno
pause>nul
exit