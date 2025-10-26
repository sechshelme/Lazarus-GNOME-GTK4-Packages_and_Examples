
unit procwd;
interface

{
  Automatically converted by H2Pas 1.0.0 from procwd.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    procwd.h
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
Pchar  = ^char;
Pglibtop  = ^glibtop;
Pglibtop_proc_wd  = ^glibtop_proc_wd;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ Copyright (C) 2007 Benoît Dejean
   This file is part of LibGTop 2.

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
{$ifndef __GLIBTOP_PROCWD_H__}
{$define __GLIBTOP_PROCWD_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}
type

const
  GLIBTOP_PROC_WD_NUMBER = 0;  
  GLIBTOP_PROC_WD_ROOT = 1;  
  GLIBTOP_PROC_WD_EXE = 2;  
  GLIBTOP_MAX_PROC_WD = 3;  
  GLIBTOP_PROC_WD_ROOT_LEN = 215;  
  GLIBTOP_PROC_WD_EXE_LEN = 215;  
type
  Pglibtop_proc_wd = ^Tglibtop_proc_wd;
  Tglibtop_proc_wd = record
      flags : Tguint64;
      number : Tguint32;
      root : array[0..(GLIBTOP_PROC_WD_ROOT_LEN+1)-1] of char;
      exe : array[0..(GLIBTOP_PROC_WD_EXE_LEN+1)-1] of char;
    end;

{*
 * glibtop_get_proc_wd:
 * @buf:
 * @pid:
 *
 * Returns: (transfer full):
  }

function glibtop_get_proc_wd(buf:Pglibtop_proc_wd; pid:Tpid_t):^Pchar;cdecl;external;
function glibtop_get_proc_wd_l(server:Pglibtop; buf:Pglibtop_proc_wd; pid:Tpid_t):^Pchar;cdecl;external;
{$if GLIBTOP_SUID_PROC_WD}

const
  glibtop_get_proc_wd_r = glibtop_get_proc_wd_p;  

procedure _glibtop_init_proc_wd_p(server:Pglibtop);cdecl;external;
function glibtop_get_proc_wd_p(server:Pglibtop; buf:Pglibtop_proc_wd; pid:Tpid_t):^Pchar;cdecl;external;
{$else}

const
  glibtop_get_proc_wd_r = glibtop_get_proc_wd_s;  

procedure _glibtop_init_proc_wd_s(server:Pglibtop);cdecl;external;
function glibtop_get_proc_wd_s(server:Pglibtop; buf:Pglibtop_proc_wd; pid:Tpid_t):^Pchar;cdecl;external;
{$endif}
{$endif}

implementation


end.
