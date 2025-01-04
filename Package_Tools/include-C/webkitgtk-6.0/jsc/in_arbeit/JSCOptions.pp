
unit JSCOptions;
interface

{
  Automatically converted by H2Pas 1.0.0 from JSCOptions.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    JSCOptions.h
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
Pgboolean  = ^gboolean;
Pgdouble  = ^gdouble;
Pgint  = ^gint;
PGOptionGroup  = ^GOptionGroup;
Pgsize  = ^gsize;
Pguint  = ^guint;
PJSCOptionType  = ^JSCOptionType;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2019 Igalia S.L.
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Library General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this library; see the file COPYING.LIB.  If not, write to
 * the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
  }
{$if !defined(__JSC_H_INSIDE__) && !defined(BUILDING_WEBKIT)}
{$error "Only <jsc/jsc.h> can be included directly."}
{$endif}
{$ifndef JSCOptions_h}
{$define JSCOptions_h}
{$include <glib-object.h>}
{$include <jsc/JSCDefines.h>}

const
  JSC_OPTIONS_USE_JIT = 'useJIT';  
  JSC_OPTIONS_USE_DFG = 'useDFGJIT';  
  JSC_OPTIONS_USE_FTL = 'useFTLJIT';  
  JSC_OPTIONS_USE_LLINT = 'useLLInt';  
(* Const before type ignored *)

function jsc_options_set_boolean(option:Pchar; value:Tgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
function jsc_options_get_boolean(option:Pchar; value:Pgboolean):Tgboolean;cdecl;external;
(* Const before type ignored *)
function jsc_options_set_int(option:Pchar; value:Tgint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function jsc_options_get_int(option:Pchar; value:Pgint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function jsc_options_set_uint(option:Pchar; value:Tguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function jsc_options_get_uint(option:Pchar; value:Pguint):Tgboolean;cdecl;external;
(* Const before type ignored *)
function jsc_options_set_size(option:Pchar; value:Tgsize):Tgboolean;cdecl;external;
(* Const before type ignored *)
function jsc_options_get_size(option:Pchar; value:Pgsize):Tgboolean;cdecl;external;
(* Const before type ignored *)
function jsc_options_set_double(option:Pchar; value:Tgdouble):Tgboolean;cdecl;external;
(* Const before type ignored *)
function jsc_options_get_double(option:Pchar; value:Pgdouble):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function jsc_options_set_string(option:Pchar; value:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function jsc_options_get_string(option:Pchar; value:PPchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function jsc_options_set_range_string(option:Pchar; value:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function jsc_options_get_range_string(option:Pchar; value:PPchar):Tgboolean;cdecl;external;
type
  PJSCOptionType = ^TJSCOptionType;
  TJSCOptionType =  Longint;
  Const
    JSC_OPTION_BOOLEAN = 0;
    JSC_OPTION_INT = 1;
    JSC_OPTION_UINT = 2;
    JSC_OPTION_SIZE = 3;
    JSC_OPTION_DOUBLE = 4;
    JSC_OPTION_STRING = 5;
    JSC_OPTION_RANGE_STRING = 6;
;
(* Const before type ignored *)
(* Const before type ignored *)
type

  TJSCOptionsFunc = function (option:Pchar; _type:TJSCOptionType; description:Pchar; user_data:Tgpointer):Tgboolean;cdecl;

procedure jsc_options_foreach(_function:TJSCOptionsFunc; user_data:Tgpointer);cdecl;external;
function jsc_options_get_option_group:PGOptionGroup;cdecl;external;
{$endif}
{ JSCOptions_h  }

implementation


end.
