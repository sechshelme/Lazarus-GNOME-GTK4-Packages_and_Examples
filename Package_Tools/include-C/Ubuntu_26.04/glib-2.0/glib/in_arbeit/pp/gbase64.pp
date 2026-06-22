
unit gbase64;
interface

{
  Automatically converted by H2Pas 1.0.0 from gbase64.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gbase64.h
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
Pgchar  = ^gchar;
Pgint  = ^gint;
Pgsize  = ^gsize;
Pguchar  = ^guchar;
Pguint  = ^guint;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ gbase64.h - Base64 coding functions
 *
 *  Copyright (C) 2005  Alexander Larsson <alexl@redhat.com>
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
 * You should have received a copy of the GNU Lesser General Public License
 * along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_BASE64_H__}
{$define __G_BASE64_H__}
{$if !defined (__GLIB_H_INSIDE__) && !defined (GLIB_COMPILATION)}
{$error "Only <glib.h> can be included directly."}
{$endif}
{$include <glib/gtypes.h>}
(* Const before type ignored *)

function g_base64_encode_step(in:Pguchar; len:Tgsize; break_lines:Tgboolean; out:Pgchar; state:Pgint; 
           save:Pgint):Tgsize;cdecl;external;
function g_base64_encode_close(break_lines:Tgboolean; out:Pgchar; state:Pgint; save:Pgint):Tgsize;cdecl;external;
(* Const before type ignored *)
function g_base64_encode(data:Pguchar; len:Tgsize):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_base64_decode_step(in:Pgchar; len:Tgsize; out:Pguchar; state:Pgint; save:Pguint):Tgsize;cdecl;external;
(* Const before type ignored *)
function g_base64_decode(text:Pgchar; out_len:Pgsize):Pguchar;cdecl;external;
function g_base64_decode_inplace(text:Pgchar; out_len:Pgsize):Pguchar;cdecl;external;
{$endif}
{ __G_BASE64_H__  }

implementation


end.
