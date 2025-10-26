
unit procargs;
interface

{
  Automatically converted by H2Pas 1.0.0 from procargs.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    procargs.h
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
Pglibtop_proc_args  = ^glibtop_proc_args;
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
{$ifndef __GLIBTOP_PROC_ARGS_H__}
{$define __GLIBTOP_PROC_ARGS_H__}
{$include <glibtop.h>}
{$include <glibtop/global.h>}

const
  GLIBTOP_PROC_ARGS_SIZE = 0;  
  GLIBTOP_MAX_PROC_ARGS = 1;  
type
{ GLIBTOP_PROC_ARGS_SIZE	 }
  Pglibtop_proc_args = ^Tglibtop_proc_args;
  Tglibtop_proc_args = record
      flags : Tguint64;
      size : Tguint64;
    end;


function glibtop_get_proc_args_l(server:Pglibtop; buf:Pglibtop_proc_args; pid:Tpid_t; max_len:dword):Pchar;cdecl;external;
function glibtop_get_proc_args(buf:Pglibtop_proc_args; pid:Tpid_t; max_len:dword):Pchar;cdecl;external;
{$if GLIBTOP_SUID_PROC_ARGS}

const
  glibtop_get_proc_args_r = glibtop_get_proc_args_p;  

procedure _glibtop_init_proc_args_p(server:Pglibtop);cdecl;external;
function glibtop_get_proc_args_p(server:Pglibtop; buf:Pglibtop_proc_args; pid:Tpid_t; max_len:dword):Pchar;cdecl;external;
{$else}
{ !GLIBTOP_SUID_PROC_ARGS  }

const
  glibtop_get_proc_args_r = glibtop_get_proc_args_s;  

procedure _glibtop_init_proc_args_s(server:Pglibtop);cdecl;external;
function glibtop_get_proc_args_s(server:Pglibtop; buf:Pglibtop_proc_args; pid:Tpid_t; max_len:dword):Pchar;cdecl;external;
{$endif}
{ GLIBTOP_SUID_PROC_ARGS  }
{
 * NEW functions
  }

function glibtop_get_proc_argv_l(server:Pglibtop; buf:Pglibtop_proc_args; pid:Tpid_t; max_len:dword):^Pchar;cdecl;external;
{*
 * glibtop_get_proc_argv:
 * @buf:
 * @pid:
 * @max_len:
 *
 * Returns: (transfer full):
  }
function glibtop_get_proc_argv(buf:Pglibtop_proc_args; pid:Tpid_t; max_len:dword):^Pchar;cdecl;external;
{$endif}

implementation


end.
