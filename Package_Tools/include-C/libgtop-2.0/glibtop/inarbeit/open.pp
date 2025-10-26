
unit open;
interface

{
  Automatically converted by H2Pas 1.0.0 from open.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    open.h
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
{$ifndef __GLIBTOP_OPEN_H__}
{$define __GLIBTOP_OPEN_H__}
{$include <glibtop.h>}

const
  _GLIBTOP_INIT_STATE_INIT = $10000;  
  _GLIBTOP_INIT_STATE_OPEN = $20000;  
  _GLIBTOP_INIT_STATE_SERVER = $40000;  
  _GLIBTOP_INIT_STATE_SYSDEPS = $80000;  
  GLIBTOP_INIT_NO_OPEN = 1;  
  GLIBTOP_INIT_NO_INIT = 2;  
  GLIBTOP_FEATURES_NO_SERVER = 4;  
  GLIBTOP_FEATURES_EXCEPT = 8;  
  GLIBTOP_METHOD_DIRECT = 1;  
  GLIBTOP_METHOD_PIPE = 2;  
  GLIBTOP_METHOD_INET = 3;  
  GLIBTOP_METHOD_UNIX = 4;  
  GLIBTOP_ERROR_METHOD_IGNORE = 0;  
  GLIBTOP_ERROR_METHOD_WARN_ONCE = 1;  
  GLIBTOP_ERROR_METHOD_WARN = 2;  
  GLIBTOP_ERROR_METHOD_ABORT = 3;  
  GLIBTOP_ERROR_METHOD_DEFAULT = GLIBTOP_ERROR_METHOD_WARN_ONCE;  
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)

procedure glibtop_open_l(server:Pglibtop; program_name:Pchar; features:dword; flags:dword);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
procedure glibtop_init_p(server:Pglibtop; features:dword; flags:dword);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure glibtop_open_p(server:Pglibtop; program_name:Pchar; features:dword; flags:dword);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
(* Const before type ignored *)
procedure glibtop_open_s(server:Pglibtop; program_name:Pchar; features:dword; flags:dword);cdecl;external;
{$endif}

implementation


end.
