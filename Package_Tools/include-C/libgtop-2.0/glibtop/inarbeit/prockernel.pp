
unit prockernel;
interface

{
  Automatically converted by H2Pas 1.0.0 from prockernel.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    prockernel.h
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
Pglibtop_proc_kernel  = ^glibtop_proc_kernel;
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
{$ifndef __GLIBTOP_PROCKERNEL_H__}
{$define __GLIBTOP_PROCKERNEL_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_PROC_KERNEL_K_FLAGS = 0;  
  GLIBTOP_PROC_KERNEL_MIN_FLT = 1;  
  GLIBTOP_PROC_KERNEL_MAJ_FLT = 2;  
  GLIBTOP_PROC_KERNEL_CMIN_FLT = 3;  
  GLIBTOP_PROC_KERNEL_CMAJ_FLT = 4;  
  GLIBTOP_PROC_KERNEL_KSTK_ESP = 5;  
  GLIBTOP_PROC_KERNEL_KSTK_EIP = 6;  
  GLIBTOP_PROC_KERNEL_NWCHAN = 7;  
  GLIBTOP_PROC_KERNEL_WCHAN = 8;  
  GLIBTOP_MAX_PROC_KERNEL = 9;  
type
{ Kernel stuff  }
{ kernel flags for the process  }
{ number of minor page faults since
				 * process start  }
{ number of major page faults since
				 * process start  }
{ cumulative min_flt of process and
				 * child processes  }
{ cumulative maj_flt of process and
				 * child processes  }
{ kernel stack pointer  }
{ kernel stack pointer  }
{ address of kernel wait channel
				 * proc is sleeping in  }
  Pglibtop_proc_kernel = ^Tglibtop_proc_kernel;
  Tglibtop_proc_kernel = record
      flags : Tguint64;
      k_flags : Tguint64;
      min_flt : Tguint64;
      maj_flt : Tguint64;
      cmin_flt : Tguint64;
      cmaj_flt : Tguint64;
      kstk_esp : Tguint64;
      kstk_eip : Tguint64;
      nwchan : Tguint64;
      wchan : array[0..39] of char;
    end;


procedure glibtop_get_proc_kernel(buf:Pglibtop_proc_kernel; pid:Tpid_t);cdecl;external;
{$if GLIBTOP_SUID_PROC_KERNEL}

const
  glibtop_get_proc_kernel_r = glibtop_get_proc_kernel_p;  
{$else}

const
  glibtop_get_proc_kernel_r = glibtop_get_proc_kernel_s;  
{$endif}

procedure glibtop_get_proc_kernel_l(server:Pglibtop; buf:Pglibtop_proc_kernel; pid:Tpid_t);cdecl;external;
{$if GLIBTOP_SUID_PROC_KERNEL}

procedure _glibtop_init_proc_kernel_p(server:Pglibtop);cdecl;external;
procedure glibtop_get_proc_kernel_p(server:Pglibtop; buf:Pglibtop_proc_kernel; pid:Tpid_t);cdecl;external;
{$else}

procedure _glibtop_init_proc_kernel_s(server:Pglibtop);cdecl;external;
procedure glibtop_get_proc_kernel_s(server:Pglibtop; buf:Pglibtop_proc_kernel; pid:Tpid_t);cdecl;external;
{$endif}
{$endif}

implementation


end.
