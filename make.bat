@echo off

set rom="hello.nes"
set srcdir="src"
set objdir="obj"
set config="%srcdir%\nrom128.cfg"

rmdir /Q /S %objdir%
mkdir %objdir%
del %rom%

ca65 %srcdir%\crt0.s -o %objdir%\crt0.o
cc65 %srcdir%\main.c -o %objdir%\main.s
ca65 %objdir%\main.s -o %objdir%\main.o
ld65 -o %rom% -m map.txt -C %config% %objdir%\crt0.o %objdir%\main.o %srcdir%\nes.lib

fceux64 %rom%