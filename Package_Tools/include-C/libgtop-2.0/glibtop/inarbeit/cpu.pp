
unit cpu;
interface

{
  Automatically converted by H2Pas 1.0.0 from cpu.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    cpu.h
}

{ Pointers to basic pascal types, inserted by h2pas conversion program.}
Type
  PLongint  = ^Longint;
  PSmallInt = ^SmallInt;
  PByte     = ^Byte;
  PWord     = ^Word;
  PDWord    = ^DWord;
  PDouble   = ^Double;

Type
Pglibtop  = ^glibtop;
Pglibtop_cpu  = ^glibtop_cpu;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 1998-99 Martin Baulig
   This file is part of LibGTop 1.0.

   Contributed by Martin Baulig <martin@home-of-linux.org>, April 1998.

   LibGTop is free software; you can redistribute it and/or modify it
   under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2 of the License,
   or (at your option) any later version.

   LibGTop is distributed in the hope that it will be useful, but WITHOUT
   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
   FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
   for more details.

   You should have received a copy of the GNU General Public License
   along with LibGTop; see the file COPYING. If not, write to the
   Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.
 }
{$ifndef __GLIBTOP_CPU_H__}
{$define __GLIBTOP_CPU_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_CPU_TOTAL = 0;  
  GLIBTOP_CPU_USER = 1;  
  GLIBTOP_CPU_NICE = 2;  
  GLIBTOP_CPU_SYS = 3;  
  GLIBTOP_CPU_IDLE = 4;  
  GLIBTOP_CPU_FREQUENCY = 5;  
  GLIBTOP_XCPU_TOTAL = 6;  
  GLIBTOP_XCPU_USER = 7;  
  GLIBTOP_XCPU_NICE = 8;  
  GLIBTOP_XCPU_SYS = 9;  
  GLIBTOP_XCPU_IDLE = 10;  
  GLIBTOP_XCPU_FLAGS = 11;  
  GLIBTOP_CPU_IOWAIT = 12;  
  GLIBTOP_CPU_IRQ = 13;  
  GLIBTOP_CPU_SOFTIRQ = 14;  
  GLIBTOP_XCPU_IOWAIT = 15;  
  GLIBTOP_XCPU_IRQ = 16;  
  GLIBTOP_XCPU_SOFTIRQ = 17;  
  GLIBTOP_MAX_CPU = 18;  
{ Nobody should really be using more than 4 processors.
   Yes we are :)
   Nobody should really be using more than 32 processors.
 }
  GLIBTOP_NCPU = 1024;  
type
{ GLIBTOP_CPU_TOTAL		 }
{ GLIBTOP_CPU_USER		 }
{ GLIBTOP_CPU_NICE		 }
{ GLIBTOP_CPU_SYS		 }
{ GLIBTOP_CPU_IDLE		 }
{ GLIBTOP_CPU_IOWAIT		 }
{ GLIBTOP_CPU_IRQ		 }
{ GLIBTOP_CPU_SOFTIRQ		 }
{ GLIBTOP_CPU_FREQUENCY	 }
{ GLIBTOP_XCPU_TOTAL		 }
{ GLIBTOP_XCPU_USER		 }
{ GLIBTOP_XCPU_NICE		 }
{ GLIBTOP_XCPU_SYS		 }
{ GLIBTOP_XCPU_IDLE		 }
{ GLIBTOP_XCPU_IOWAIT		 }
{ GLIBTOP_XCPU_IRQ		 }
{ GLIBTOP_XCPU_SOFTIRQ		 }
{ GLIBTOP_XCPU_IDLE		 }
  Pglibtop_cpu = ^Tglibtop_cpu;
  Tglibtop_cpu = record
      flags : Tguint64;
      total : Tguint64;
      user : Tguint64;
      nice : Tguint64;
      sys : Tguint64;
      idle : Tguint64;
      iowait : Tguint64;
      irq : Tguint64;
      softirq : Tguint64;
      frequency : Tguint64;
      xcpu_total : array[0..(GLIBTOP_NCPU)-1] of Tguint64;
      xcpu_user : array[0..(GLIBTOP_NCPU)-1] of Tguint64;
      xcpu_nice : array[0..(GLIBTOP_NCPU)-1] of Tguint64;
      xcpu_sys : array[0..(GLIBTOP_NCPU)-1] of Tguint64;
      xcpu_idle : array[0..(GLIBTOP_NCPU)-1] of Tguint64;
      xcpu_iowait : array[0..(GLIBTOP_NCPU)-1] of Tguint64;
      xcpu_irq : array[0..(GLIBTOP_NCPU)-1] of Tguint64;
      xcpu_softirq : array[0..(GLIBTOP_NCPU)-1] of Tguint64;
      xcpu_flags : Tguint64;
    end;


procedure glibtop_get_cpu(buf:Pglibtop_cpu);cdecl;external;
{$if GLIBTOP_SUID_CPU}

const
  glibtop_get_cpu_r = glibtop_get_cpu_p;  
{$else}

const
  glibtop_get_cpu_r = glibtop_get_cpu_s;  
{$endif}

procedure glibtop_get_cpu_l(server:Pglibtop; buf:Pglibtop_cpu);cdecl;external;
{$if GLIBTOP_SUID_CPU}

procedure _glibtop_init_cpu_p(server:Pglibtop);cdecl;external;
procedure glibtop_get_cpu_p(server:Pglibtop; buf:Pglibtop_cpu);cdecl;external;
{$else}

procedure _glibtop_init_cpu_s(server:Pglibtop);cdecl;external;
procedure glibtop_get_cpu_s(server:Pglibtop; buf:Pglibtop_cpu);cdecl;external;
{$endif}
{$endif}

implementation


end.
