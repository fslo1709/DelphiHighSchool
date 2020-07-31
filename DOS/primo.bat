@echo off
set/a var1= 2
set/a var2= 2
echo 2 es primo
:ciclo1
set/a var2= 2
set/a "q= %var1% / 2"
:ciclo2
set/a "p= %var1% %% %var2%"
if %p% equ 0 goto noprimo
set/a var2= %var2%+1
if %var2% lss %q% goto ciclo2
echo %var1% es primo
:noprimo
set/a var1= %var1%+1
if %var1% lss 26 goto ciclo1
pause>nul
exit