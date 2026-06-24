
unit gboxed;
interface

{
  Automatically converted by H2Pas 1.0.0 from gboxed.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gboxed.h
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
PGValue  = ^GValue;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ GObject - GLib Type, Object, Parameter and Signal Library
 * Copyright (C) 2000-2001 Red Hat, Inc.
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
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
  }
{$ifndef __G_BOXED_H__}
{$define __G_BOXED_H__}
{$if !defined (__GLIB_GOBJECT_H_INSIDE__) && !defined (GOBJECT_COMPILATION)}
{$error "Only <glib-object.h> can be included directly."}
{$endif}
{$include        <gobject/gtype.h>}
{$ifndef __GI_SCANNER__}
{$include        <gobject/glib-types.h>}
{$endif}
{ --- type macros ---  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function G_TYPE_IS_BOXED(_type : longint) : longint;

{*
 * G_VALUE_HOLDS_BOXED:
 * @value: a valid #GValue structure
 *
 * Checks whether the given #GValue can hold values derived
 * from type %G_TYPE_BOXED.
 *
 * Returns: %TRUE on success.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_BOXED(value : longint) : longint;

{ --- typedefs ---  }
{*
 * GBoxedCopyFunc:
 * @boxed: (not nullable): The boxed structure to be copied.
 *
 * This function is provided by the user and should produce a copy
 * of the passed in boxed structure.
 *
 * Returns: (not nullable): The newly created copy of the boxed structure.
  }
type

  TGBoxedCopyFunc = function (boxed:Tgpointer):Tgpointer;cdecl;
{*
 * GBoxedFreeFunc:
 * @boxed: (not nullable): The boxed structure to be freed.
 *
 * This function is provided by the user and should free the boxed
 * structure passed.
  }

  TGBoxedFreeFunc = procedure (boxed:Tgpointer);cdecl;
{ --- prototypes ---  }

function g_boxed_copy(boxed_type:TGType; src_boxed:Tgconstpointer):Tgpointer;cdecl;external;
procedure g_boxed_free(boxed_type:TGType; boxed:Tgpointer);cdecl;external;
procedure g_value_set_boxed(value:PGValue; v_boxed:Tgconstpointer);cdecl;external;
procedure g_value_set_static_boxed(value:PGValue; v_boxed:Tgconstpointer);cdecl;external;
procedure g_value_take_boxed(value:PGValue; v_boxed:Tgconstpointer);cdecl;external;
{xxxxxGLIB_DEPRECATED_FOR(g_value_take_boxed) }
procedure g_value_set_boxed_take_ownership(value:PGValue; v_boxed:Tgconstpointer);cdecl;external;
(* Const before type ignored *)
function g_value_get_boxed(value:PGValue):Tgpointer;cdecl;external;
(* Const before type ignored *)
function g_value_dup_boxed(value:PGValue):Tgpointer;cdecl;external;
{ --- convenience ---  }
(* Const before type ignored *)
function g_boxed_type_register_static(name:Pgchar; boxed_copy:TGBoxedCopyFunc; boxed_free:TGBoxedFreeFunc):TGType;cdecl;external;
{ --- GObject boxed types ---  }
{*
 * G_TYPE_CLOSURE:
 *
 * The #GType for #GClosure.
  }
{ was #define dname def_expr }
function G_TYPE_CLOSURE : longint; { return type might be wrong }

{*
 * G_TYPE_VALUE:
 *
 * The type ID of the "GValue" type which is a boxed type,
 * used to pass around pointers to GValues.
  }
{ was #define dname def_expr }
function G_TYPE_VALUE : longint; { return type might be wrong }

function g_closure_get_type:TGType;cdecl;external;
function g_value_get_type:TGType;cdecl;external;
{$endif}
{ __G_BOXED_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_BOXED(_type : longint) : longint;
begin
  G_TYPE_IS_BOXED:=(G_TYPE_FUNDAMENTAL(_type))=G_TYPE_BOXED;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS_BOXED(value : longint) : longint;
begin
  G_VALUE_HOLDS_BOXED:=G_TYPE_CHECK_VALUE_TYPE(value,G_TYPE_BOXED);
end;

{ was #define dname def_expr }
function G_TYPE_CLOSURE : longint; { return type might be wrong }
  begin
    G_TYPE_CLOSURE:=g_closure_get_type;
  end;

{ was #define dname def_expr }
function G_TYPE_VALUE : longint; { return type might be wrong }
  begin
    G_TYPE_VALUE:=g_value_get_type;
  end;


end.
