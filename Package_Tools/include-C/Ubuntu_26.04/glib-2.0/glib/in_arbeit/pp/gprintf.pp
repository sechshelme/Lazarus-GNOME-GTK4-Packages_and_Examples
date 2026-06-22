
unit gprintf;
interface

{
  Automatically converted by H2Pas 1.0.0 from gprintf.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gprintf.h
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
PFILE  = ^FILE;
Pgchar  = ^gchar;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GLIB - Library of useful routines for C programming
 * Copyright (C) 1995-1997, 2002  Peter Mattis, Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_PRINTF_H__}
{$define __G_PRINTF_H__}
{$include <glib.h>}
{$include <stdio.h>}
{$include <stdarg.h>}
(* Const before declarator ignored *)

function g_printf(format:Pgchar; args:array of const):Tgint;cdecl;external;
function g_printf(format:Pgchar):Tgint;cdecl;external;
(* Const before declarator ignored *)
function g_fprintf(file:PFILE; format:Pgchar; args:array of const):Tgint;cdecl;external;
function g_fprintf(file:PFILE; format:Pgchar):Tgint;cdecl;external;
(* Const before declarator ignored *)
function g_sprintf(_string:Pgchar; format:Pgchar; args:array of const):Tgint;cdecl;external;
function g_sprintf(_string:Pgchar; format:Pgchar):Tgint;cdecl;external;
(* Const before declarator ignored *)
function g_vprintf(format:Pgchar; args:Tva_list):Tgint;cdecl;external;
(* Const before declarator ignored *)
function g_vfprintf(file:PFILE; format:Pgchar; args:Tva_list):Tgint;cdecl;external;
(* Const before declarator ignored *)
function g_vsprintf(_string:Pgchar; format:Pgchar; args:Tva_list):Tgint;cdecl;external;
(* Const before declarator ignored *)
function g_vasprintf(_string:PPgchar; format:Pgchar; args:Tva_list):Tgint;cdecl;external;
{$endif}
{ __G_PRINTF_H__  }

implementation


end.
