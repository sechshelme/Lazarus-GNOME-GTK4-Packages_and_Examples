#!/bin/sh
DoExitAsm ()
{ echo "An error occurred while assembling $1"; exit 1; }
DoExitLink ()
{ echo "An error occurred while linking $1"; exit 1; }
echo Assembling project1
/usr/bin/as --64 -o /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/sandbox/SFML/lib/x86_64-linux/project1.o   /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/sandbox/SFML/lib/x86_64-linux/project1.s
if [ $? != 0 ]; then DoExitAsm project1; fi
rm /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/sandbox/SFML/lib/x86_64-linux/project1.s
echo Linking /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/sandbox/SFML/project1
OFS=$IFS
IFS="
"
/usr/bin/ld.bfd -b elf64-x86-64 -m elf_x86_64  -rpath $ORIGIN --dynamic-linker=/lib64/ld-linux-x86-64.so.2       -L. -o /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/sandbox/SFML/project1 -T /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/sandbox/SFML/link13530.res -e _dynamic_start
if [ $? != 0 ]; then DoExitLink /n4800/DATEN/Programmierung/mit_GIT/Lazarus/Tutorial/GNOME/sandbox/SFML/project1; fi
IFS=$OFS
