
unit gvalue;
interface

{
  Automatically converted by H2Pas 1.0.0 from gvalue.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gvalue.h
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
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General
 * Public License along with this library; if not, see <http://www.gnu.org/licenses/>.
 *
 * gvalue.h: generic GValue functions
  }
{$ifndef __G_VALUE_H__}
{$define __G_VALUE_H__}
{$if !defined (__GLIB_GOBJECT_H_INSIDE__) && !defined (GOBJECT_COMPILATION)}
{$error "Only <glib-object.h> can be included directly."}
{$endif}
{$include	<gobject/gtype.h>}
{ --- type macros ---  }
{*
 * G_TYPE_IS_VALUE:
 * @type: a type
 * 
 * Checks whether the passed in type ID can be used for
 * [method@GObject.Value.init].
 *
 * That is, this macro checks whether this type provides an implementation
 * of the [struct@GObject.TypeValueTable] functions required to be able to
 * create a [struct@GObject.Value] instance.
 * 
 * Returns: Whether @type is suitable as a [struct@GObject.Value] type.
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   

function G_TYPE_IS_VALUE(_type : longint) : longint;

{*
 * G_IS_VALUE:
 * @value: a [struct@GObject.Value] structure
 * 
 * Checks if @value is a valid and initialized [struct@GObject.Value] structure.
 *
 * Returns: true on success; false otherwise
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_VALUE(value : longint) : longint;

{*
 * G_VALUE_TYPE:
 * @value: a [struct@GObject.Value] structure
 *
 * Get the type identifier of @value.
 *
 * Returns: the type ID
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_TYPE(value : longint) : longint;

{*
 * G_VALUE_TYPE_NAME:
 * @value: a [struct@GObject.Value] structure
 *
 * Gets the name of the type of @value.
 *
 * Returns: the type name
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_TYPE_NAME(value : longint) : longint;

{*
 * G_VALUE_HOLDS:
 * @value: (not nullable): a [struct@GObject.Value] structure
 * @type: a [type@GObject.Type]
 *
 * Checks if @value holds a value of @type.
 *
 * This macro will also check for `value != NULL` and issue a
 * warning if the check fails.
 *
 * Returns: true if @value is non-`NULL` and holds a value of the given @type;
 *   false otherwise
  }
{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS(value,_type : longint) : longint;

{ --- typedefs & structures ---  }
{*
 * GValueTransform:
 * @src_value: source value
 * @dest_value: target value
 * 
 * The type of value transformation functions which can be registered with
 * [func@GObject.Value.register_transform_func].
 *
 * @dest_value will be initialized to the correct destination type.
  }
(* Const before type ignored *)
type

  TGValueTransform = procedure (src_value:PGValue; dest_value:PGValue);cdecl;
{*
 * GValue:
 * 
 * An opaque structure used to hold different types of values.
 *
 * Before it can be used, a `GValue` has to be initialized to a specific type by
 * calling [method@GObject.Value.init] on it.
 *
 * Many types which are stored within a `GValue` need to allocate data on the
 * heap, so [method@GObject.Value.unset] must always be called on a `GValue` to
 * free any such data once you’re finished with the `GValue`, even if the
 * `GValue` itself is stored on the stack.
 *
 * The data within the structure has protected scope: it is accessible only
 * to functions within a [struct@GObject.TypeValueTable] structure, or
 * implementations of the `g_value_*()` API. That is, code which implements new
 * fundamental types.
 *
 * `GValue` users cannot make any assumptions about how data is stored
 * within the 2 element @data union, and the @g_type member should
 * only be accessed through the [func@GObject.VALUE_TYPE] macro and related
 * macros.
  }
{< private > }
{ public for GTypeValueTable methods  }
  PGValue = ^TGValue;
  TGValue = record
      g_type : TGType;cdecl;
      data : array[0..1] of record
          case longint of
            0 : ( v_int : Tgint );
            1 : ( v_uint : Tguint );
            2 : ( v_long : Tglong );
            3 : ( v_ulong : Tgulong );
            4 : ( v_int64 : Tgint64 );
            5 : ( v_uint64 : Tguint64 );
            6 : ( v_float : Tgfloat );
            7 : ( v_double : Tgdouble );
            8 : ( v_pointer : Tgpointer );
          end;
    end;

{ --- prototypes ---  }

function g_value_init(value:PGValue; g_type:TGType):PGValue;cdecl;external;
(* Const before type ignored *)
procedure g_value_copy(src_value:PGValue; dest_value:PGValue);cdecl;external;
function g_value_reset(value:PGValue):PGValue;cdecl;external;
procedure g_value_unset(value:PGValue);cdecl;external;
procedure g_value_set_instance(value:PGValue; instance:Tgpointer);cdecl;external;
procedure g_value_init_from_instance(value:PGValue; instance:Tgpointer);cdecl;external;
{ --- private ---  }
(* Const before type ignored *)
function g_value_fits_pointer(value:PGValue):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_value_peek_pointer(value:PGValue):Tgpointer;cdecl;external;
{ --- implementation details ---  }
function g_value_type_compatible(src_type:TGType; dest_type:TGType):Tgboolean;cdecl;external;
function g_value_type_transformable(src_type:TGType; dest_type:TGType):Tgboolean;cdecl;external;
(* Const before type ignored *)
function g_value_transform(src_value:PGValue; dest_value:PGValue):Tgboolean;cdecl;external;
procedure g_value_register_transform_func(src_type:TGType; dest_type:TGType; transform_func:TGValueTransform);cdecl;external;
{*
 * G_VALUE_NOCOPY_CONTENTS:
 *
 * Flag to indicate that allocated data in a [struct@GObject.Value] shouldn’t be
 * copied.
 *
 * If passed to [func@GObject.VALUE_COLLECT], allocated data won’t be copied
 * but used verbatim. This does not affect ref-counted types like objects.
 *
 * This does not affect usage of [method@GObject.Value.copy]: the data will
 * be copied if it is not ref-counted.
 *
 * This flag should be checked by implementations of
 * [callback@GObject.TypeValueFreeFunc], [callback@GObject.TypeValueCollectFunc]
 * and [callback@GObject.TypeValueLCopyFunc].
  }
const
  G_VALUE_NOCOPY_CONTENTS = 1 shl 27;  
{*
 * G_VALUE_INTERNED_STRING:
 *
 * Flag to indicate that a string in a [struct@GObject.Value] is canonical and
 * will exist for the duration of the process.
 *
 * See [method@GObject.Value.set_interned_string].
 *
 * This flag should be checked by implementations of
 * [callback@GObject.TypeValueFreeFunc], [callback@GObject.TypeValueCollectFunc]
 * and [callback@GObject.TypeValueLCopyFunc].
 *
 * Since: 2.66
  }
  G_VALUE_INTERNED_STRING = 1 shl 28;  
{*
 * G_VALUE_INIT:
 *
 * Clears a [struct@GObject.Value] to zero at declaration time.
 *
 * A [struct@GObject.Value] must be cleared and then initialized before it can
 * be used. This macro can be assigned to a variable instead of an explicit
 * ` 0 ` when declaring it, but it cannot be assigned to a variable after
 * declaration time.
 *
 * After the [struct@GObject.Value] is cleared, it must be initialized by
 * calling [method@GObject.Value.init] on it before any other methods can be
 * called on it.
 *
 * ```c
 *   GValue value = G_VALUE_INIT;
 *
 *   g_value_init (&value, SOME_G_TYPE);
 *   …
 *   g_value_unset (&value);
 * ```
 *
 * Since: 2.30
  }
{ xxxxxxxxxxxx #define G_VALUE_INIT   0,   0    }
{$endif}
{ __G_VALUE_H__  }

implementation

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_TYPE_IS_VALUE(_type : longint) : longint;
begin
  G_TYPE_IS_VALUE:=g_type_check_is_value_type(_type);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_IS_VALUE(value : longint) : longint;
begin
  G_IS_VALUE:=G_TYPE_CHECK_VALUE(value);
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_TYPE(value : longint) : longint;
begin
  G_VALUE_TYPE:=(PGValue(value))^.g_type;
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_TYPE_NAME(value : longint) : longint;
begin
  G_VALUE_TYPE_NAME:=g_type_name(G_VALUE_TYPE(value));
end;

{ was #define dname(params) para_def_expr }
{ argument types are unknown }
{ return type might be wrong }   
function G_VALUE_HOLDS(value,_type : longint) : longint;
begin
  G_VALUE_HOLDS:=G_TYPE_CHECK_VALUE_TYPE(value,_type);
end;


end.
