@ECHO OFF
SETLOCAL EnableDelayedExpansion
REM SETLOCAL ENABLEEXTENSIONS
set "debug=%2"
set count=1

if [%1]==[] set /p num=Input decimal number: 
if NOT [%1]==[] set num=%1
if [%1]==[/d] ( 
set debug=/d
set /p num=Input decimal number:
)

cls
set decnum=!num!

:mathloop
if !count! GTR 1 set num=!div!
set /a div=num/2
set /a mod=num%%2
set /a c[!count!]=%mod%
if !debug!==/d ECHO Remainder: !c[%count%]!, Div: !div!, Count: !count!
if !div! GEQ 1 (
set /a count=count+=1
goto :mathloop
)
for /L %%C in (1,1,!count!) do set "binnum=!c[%%C]!!binnum!"
ECHO ###############
ECHO !decnum! =
ECHO 0b!binnum!
ECHO ###############
pause > NUL