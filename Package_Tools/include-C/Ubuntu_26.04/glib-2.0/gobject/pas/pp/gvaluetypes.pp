
unit gvaluetypes;
interface

{
  Automatically converted by H2Pas 1.0.0 from gvaluetypes.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gvaluetypes.h
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
Pgchararray  = ^gchararray;
PGValue  = ^GValue;
PGVariant  = ^GVariant;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GObject - GLib Type, Object, Parameter and Signal Library
 * Copyright (C) 1997-1999, 2000-2001 Tim Janik and Red Hat, Inc.
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
 * gvaluetypes.h: GLib default values
  }
{$ifndef __G_VALUETYPES_H__}
{$define __G_VALUETYPES_H__}
{$if !defined (__GLIB_GOBJECT_H_INSIDE__) && !defined (GOBJECT_COMPILATION)}
{$error "Only <glib-object.h> can be included directly."}
{$endif}
{$include	<gobject/gvalue.h>}
{ --- type macros ---  }
{*
 * G_VALUE_HOLDS_CHAR:
 * @value: a valid #GValue structure
 * 
 * Checks whether the given #GValue can hold values of type %G_TYPE_CHAR.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function G_VALUE_HOLDS_CHAR(value : longint) : longint;

{*
 * G_VALUE_HOLDS_UCHAR:
 * @value: a valid #GValue structure
 * 
 * Checks whether the given #GValue can hold values of type %G_TYPE_UCHAR.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_UCHAR(value : longint) : longint;

{*
 * G_VALUE_HOLDS_BOOLEAN:
 * @value: a valid #GValue structure
 * 
 * Checks whether the given #GValue can hold values of type %G_TYPE_BOOLEAN.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_BOOLEAN(value : longint) : longint;

{*
 * G_VALUE_HOLDS_INT:
 * @value: a valid #GValue structure
 * 
 * Checks whether the given #GValue can hold values of type %G_TYPE_INT.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_INT(value : longint) : longint;

{*
 * G_VALUE_HOLDS_UINT:
 * @value: a valid #GValue structure
 * 
 * Checks whether the given #GValue can hold values of type %G_TYPE_UINT.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_UINT(value : longint) : longint;

{*
 * G_VALUE_HOLDS_LONG:
 * @value: a valid #GValue structure
 * 
 * Checks whether the given #GValue can hold values of type %G_TYPE_LONG.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_LONG(value : longint) : longint;

{*
 * G_VALUE_HOLDS_ULONG:
 * @value: a valid #GValue structure
 * 
 * Checks whether the given #GValue can hold values of type %G_TYPE_ULONG.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_ULONG(value : longint) : longint;

{*
 * G_VALUE_HOLDS_INT64:
 * @value: a valid #GValue structure
 * 
 * Checks whether the given #GValue can hold values of type %G_TYPE_INT64.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_INT64(value : longint) : longint;

{*
 * G_VALUE_HOLDS_UINT64:
 * @value: a valid #GValue structure
 * 
 * Checks whether the given #GValue can hold values of type %G_TYPE_UINT64.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_UINT64(value : longint) : longint;

{*
 * G_VALUE_HOLDS_FLOAT:
 * @value: a valid #GValue structure
 * 
 * Checks whether the given #GValue can hold values of type %G_TYPE_FLOAT.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_FLOAT(value : longint) : longint;

{*
 * G_VALUE_HOLDS_DOUBLE:
 * @value: a valid #GValue structure
 * 
 * Checks whether the given #GValue can hold values of type %G_TYPE_DOUBLE.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_DOUBLE(value : longint) : longint;

{*
 * G_VALUE_HOLDS_STRING:
 * @value: a valid #GValue structure
 * 
 * Checks whether the given #GValue can hold values of type %G_TYPE_STRING.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_STRING(value : longint) : longint;

{*
 * G_VALUE_IS_INTERNED_STRING:
 * @value: a valid #GValue structure
 *
 * Checks whether @value contains a string which is canonical.
 *
 * Returns: %TRUE if the value contains a string in its canonical
 * representation, as returned by g_intern_string(). See also
 * g_value_set_interned_string().
 *
 * Since: 2.66
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_IS_INTERNED_STRING(value : longint) : longint;

{*
 * G_VALUE_HOLDS_POINTER:
 * @value: a valid #GValue structure
 * 
 * Checks whether the given #GValue can hold values of type %G_TYPE_POINTER.
 * 
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_POINTER(value : longint) : longint;

{*
 * G_TYPE_GTYPE:
 * 
 * The type for #GType.
  }
{ was #define dname def_expr }
function G_TYPE_GTYPE : longint; { return type might be wrong }

{*
 * G_VALUE_HOLDS_GTYPE:
 * @value: a valid #GValue structure
 * 
 * Checks whether the given #GValue can hold values of type %G_TYPE_GTYPE.
 * 
 * Since: 2.12
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_GTYPE(value : longint) : longint;

{*
 * G_VALUE_HOLDS_VARIANT:
 * @value: a valid #GValue structure
 *
 * Checks whether the given #GValue can hold values of type %G_TYPE_VARIANT.
 *
 * Returns: %TRUE on success.
 *
 * Since: 2.26
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_VARIANT(value : longint) : longint;

{ --- prototypes ---  }
{xxxxxGLIB_DEPRECATED_IN_2_32_FOR(g_value_set_schar) }
procedure g_value_set_char(value:PGValue; v_char:Tgchar);cdecl;external;
{xxxxxGLIB_DEPRECATED_IN_2_32_FOR(g_value_get_schar) }
(* Const before type ignored *)
function g_value_get_char(value:PGValue):Tgchar;cdecl;external;
procedure g_value_set_schar(value:PGValue; v_char:Tgint8);cdecl;external;
(* Const before type ignored *)
function g_value_get_schar(value:PGValue):Tgint8;cdecl;external;
procedure g_value_set_uchar(value:PGValue; v_uchar:Tguchar);cdecl;external;
(* Const before type ignored *)
function g_value_get_uchar(value:PGValue):Tguchar;cdecl;external;
procedure g_value_set_boolean(value:PGValue; v_boolean:Tgboolean);cdecl;external;
(* Const before type ignored *)
function g_value_get_boolean(value:PGValue):Tgboolean;cdecl;external;
procedure g_value_set_int(value:PGValue; v_int:Tgint);cdecl;external;
(* Const before type ignored *)
function g_value_get_int(value:PGValue):Tgint;cdecl;external;
procedure g_value_set_uint(value:PGValue; v_uint:Tguint);cdecl;external;
(* Const before type ignored *)
function g_value_get_uint(value:PGValue):Tguint;cdecl;external;
procedure g_value_set_long(value:PGValue; v_long:Tglong);cdecl;external;
(* Const before type ignored *)
function g_value_get_long(value:PGValue):Tglong;cdecl;external;
procedure g_value_set_ulong(value:PGValue; v_ulong:Tgulong);cdecl;external;
(* Const before type ignored *)
function g_value_get_ulong(value:PGValue):Tgulong;cdecl;external;
procedure g_value_set_int64(value:PGValue; v_int64:Tgint64);cdecl;external;
(* Const before type ignored *)
function g_value_get_int64(value:PGValue):Tgint64;cdecl;external;
procedure g_value_set_uint64(value:PGValue; v_uint64:Tguint64);cdecl;external;
(* Const before type ignored *)
function g_value_get_uint64(value:PGValue):Tguint64;cdecl;external;
procedure g_value_set_float(value:PGValue; v_float:Tgfloat);cdecl;external;
(* Const before type ignored *)
function g_value_get_float(value:PGValue):Tgfloat;cdecl;external;
procedure g_value_set_double(value:PGValue; v_double:Tgdouble);cdecl;external;
(* Const before type ignored *)
function g_value_get_double(value:PGValue):Tgdouble;cdecl;external;
(* Const before type ignored *)
procedure g_value_set_string(value:PGValue; v_string:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_value_set_static_string(value:PGValue; v_string:Pgchar);cdecl;external;
(* Const before type ignored *)
procedure g_value_set_interned_string(value:PGValue; v_string:Pgchar);cdecl;external;
(* Const before type ignored *)
(* Const before type ignored *)
function g_value_get_string(value:PGValue):Pgchar;cdecl;external;
(* Const before type ignored *)
function g_value_dup_string(value:PGValue):Pgchar;cdecl;external;
function g_value_steal_string(value:PGValue):Pgchar;cdecl;external;
procedure g_value_set_pointer(value:PGValue; v_pointer:Tgpointer);cdecl;external;
(* Const before type ignored *)
function g_value_get_pointer(value:PGValue):Tgpointer;cdecl;external;
function g_gtype_get_type:TGType;cdecl;external;
procedure g_value_set_gtype(value:PGValue; v_gtype:TGType);cdecl;external;
(* Const before type ignored *)
function g_value_get_gtype(value:PGValue):TGType;cdecl;external;
procedure g_value_set_variant(value:PGValue; variant:PGVariant);cdecl;external;
procedure g_value_take_variant(value:PGValue; variant:PGVariant);cdecl;external;
(* Const before type ignored *)
function g_value_get_variant(value:PGValue):PGVariant;cdecl;external;
(* Const before type ignored *)
function g_value_dup_variant(value:PGValue):PGVariant;cdecl;external;
{ Convenience for registering new pointer types  }
(* Const before type ignored *)
function g_pointer_type_register_static(name:Pgchar):TGType;cdecl;external;
{ debugging aid, describe value contents as string  }
(* Const before type ignored *)
function g_strdup_value_contents(value:PGValue):Pgchar;cdecl;external;
procedure g_value_take_string(value:PGValue; v_string:Pgchar);cdecl;external;
{xxxxxGLIB_DEPRECATED_FOR(g_value_take_string) }
procedure g_value_set_string_take_ownership(value:PGValue; v_string:Pgchar);cdecl;external;
{ humpf, need a C representable type name for G_TYPE_STRING  }
{*
 * gchararray:
 * 
 * A C representable type name for %G_TYPE_STRING.
  }
type
  Pgchararray = ^Tgchararray;
  Tgchararray = Pgchar;
{$endif}
{ __G_VALUETYPES_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_CHAR(value : longint) : longint;
begin
  G_VALUE_HOLDS_CHAR:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_CHAR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_UCHAR(value : longint) : longint;
begin
  G_VALUE_HOLDS_UCHAR:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_UCHAR);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_BOOLEAN(value : longint) : longint;
begin
  G_VALUE_HOLDS_BOOLEAN:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_BOOLEAN);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_INT(value : longint) : longint;
begin
  G_VALUE_HOLDS_INT:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_INT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_UINT(value : longint) : longint;
begin
  G_VALUE_HOLDS_UINT:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_UINT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_LONG(value : longint) : longint;
begin
  G_VALUE_HOLDS_LONG:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_LONG);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_ULONG(value : longint) : longint;
begin
  G_VALUE_HOLDS_ULONG:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_ULONG);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_INT64(value : longint) : longint;
begin
  G_VALUE_HOLDS_INT64:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_INT64);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_UINT64(value : longint) : longint;
begin
  G_VALUE_HOLDS_UINT64:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_UINT64);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_FLOAT(value : longint) : longint;
begin
  G_VALUE_HOLDS_FLOAT:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_FLOAT);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_DOUBLE(value : longint) : longint;
begin
  G_VALUE_HOLDS_DOUBLE:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_DOUBLE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_STRING(value : longint) : longint;
begin
  G_VALUE_HOLDS_STRING:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_STRING);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_IS_INTERNED_STRING(value : longint) : longint;
begin
  G_VALUE_IS_INTERNED_STRING:=(G_VALUE_HOLDS_STRING(value)) and (@((value^.((data[1]).v_uint)) and G_VALUE_INTERNED_STRING));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_POINTER(value : longint) : longint;
begin
  G_VALUE_HOLDS_POINTER:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_POINTER);
end;

{ was #define dname def_expr }
function G_TYPE_GTYPE : longint; { return type might be wrong }
  begin
    G_TYPE_GTYPE:=g_gtype_get_type;
  end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_GTYPE(value : longint) : longint;
begin
  G_VALUE_HOLDS_GTYPE:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_GTYPE);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_VARIANT(value : longint) : longint;
begin
  G_VALUE_HOLDS_VARIANT:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_VARIANT);
end;


end.
