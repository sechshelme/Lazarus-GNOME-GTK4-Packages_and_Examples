
unit gvaluearray;
interface

{
  Automatically converted by H2Pas 1.0.0 from gvaluearray.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gvaluearray.h
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
PGValue  = ^GValue;
PGValueArray  = ^GValueArray;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GObject - GLib Type, Object, Parameter and Signal Library
 * Copyright (C) 2001 Red Hat, Inc.
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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * gvaluearray.h: GLib array type holding GValues
  }
{$ifndef __G_VALUE_ARRAY_H__}
{$define __G_VALUE_ARRAY_H__}
{$if !defined (__GLIB_GOBJECT_H_INSIDE__) && !defined (GOBJECT_COMPILATION)}
{$error "Only <glib-object.h> can be included directly."}
{$endif}
{$include	<gobject/gvalue.h>}
{*
 * G_TYPE_VALUE_ARRAY:
 *
 * The type ID of the "GValueArray" type which is a boxed type,
 * used to pass around pointers to GValueArrays.
 *
 * Deprecated: 2.32: Use #GArray instead of #GValueArray
  }

{ was #define dname def_expr }
function G_TYPE_VALUE_ARRAY : longint; { return type might be wrong }

{ --- typedefs & structs ---  }
type
{< private > }
  PGValueArray = ^TGValueArray;
  TGValueArray = record
      n_values : Tguint;
      values : PGValue;
      n_prealloced : Tguint;
    end;

{ --- prototypes ---  }
{xxxxxGLIB_DEPRECATED_IN_2_32_FOR(GArray) }

function g_value_array_get_type:TGType;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_32_FOR(GArray) }
function g_value_array_get_nth(value_array:PGValueArray; index_:Tguint):PGValue;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_32_FOR(GArray) }
function g_value_array_new(n_prealloced:Tguint):PGValueArray;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_32_FOR(GArray) }
procedure g_value_array_free(value_array:PGValueArray);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_32_FOR(GArray) }
(* Const before type ignored *)
function g_value_array_copy(value_array:PGValueArray):PGValueArray;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_32_FOR(GArray) }
(* Const before type ignored *)
function g_value_array_prepend(value_array:PGValueArray; value:PGValue):PGValueArray;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_32_FOR(GArray) }
(* Const before type ignored *)
function g_value_array_append(value_array:PGValueArray; value:PGValue):PGValueArray;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_32_FOR(GArray) }
(* Const before type ignored *)
function g_value_array_insert(value_array:PGValueArray; index_:Tguint; value:PGValue):PGValueArray;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_32_FOR(GArray) }
function g_value_array_remove(value_array:PGValueArray; index_:Tguint):PGValueArray;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_32_FOR(GArray) }
function g_value_array_sort(value_array:PGValueArray; compare_func:TGCompareFunc):PGValueArray;cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_32_FOR(GArray) }
function g_value_array_sort_with_data(value_array:PGValueArray; compare_func:TGCompareDataFunc; user_data:Tgpointer):PGValueArray;cdecl;external;
{$endif}
{ __G_VALUE_ARRAY_H__  }

implementation

{ was #define dname def_expr }
function G_TYPE_VALUE_ARRAY : longint; { return type might be wrong }
  begin
    G_TYPE_VALUE_ARRAY:=g_value_array_get_type;
  end;


end.
