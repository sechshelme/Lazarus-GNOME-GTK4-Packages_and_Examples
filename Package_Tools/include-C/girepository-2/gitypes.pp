
unit gitypes;
interface

{
  Automatically converted by H2Pas 1.0.0 from gitypes.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    gitypes.h
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
PGIArgInfo  = ^GIArgInfo;
PGIArgument  = ^GIArgument;
PGIArrayType  = ^GIArrayType;
PGIBaseInfoStack  = ^GIBaseInfoStack;
PGIDirection  = ^GIDirection;
PGIFieldInfoFlags  = ^GIFieldInfoFlags;
PGIFunctionInfoFlags  = ^GIFunctionInfoFlags;
PGIScopeType  = ^GIScopeType;
PGITransfer  = ^GITransfer;
PGITypeInfo  = ^GITypeInfo;
PGITypeTag  = ^GITypeTag;
PGIVFuncInfoFlags  = ^GIVFuncInfoFlags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{ -*- mode: C; c-file-style: "gnu"; indent-tabs-mode: nil; -*-
 * GObject introspection: types
 *
 * Copyright (C) 2005 Matthias Clasen
 * Copyright (C) 2008,2009 Red Hat, Inc.
 *
 * SPDX-License-Identifier: LGPL-2.1-or-later
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2 of the License, or (at your option) any later version.
 *
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the
 * Free Software Foundation, Inc., 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
  }
(** unsupported pragma#pragma once*)
{$if !defined (__GIREPOSITORY_H_INSIDE__) && !defined (GI_COMPILATION)}
{$error "Only <girepository.h> can be included directly."}
{$endif}
{$include <stdint.h>}
{$include <glib.h>}
{$include <glib-object.h>}
{$include "gi-visibility.h"}
{ Documented in gibaseinfo.c  }
type
{< private > }

  PGIBaseInfoStack = ^TGIBaseInfoStack;
  TGIBaseInfoStack = record
      parent_instance : TGTypeInstance;
      dummy0 : longint;
      dummy1 : array[0..2] of pointer;
      dummy2 : array[0..1] of Tuint32_t;
      dummy3 : array[0..5] of pointer;
    end;
{ Documented in gicallableinfo.c  }

function gi_callable_info_get_type:TGType;cdecl;external;
{ Documented in gifunctioninfo.c  }
type

function gi_function_info_get_type:TGType;cdecl;external;
{ Documented in gicallbackinfo.c  }
type

function gi_callback_info_get_type:TGType;cdecl;external;
{ Documented in giregisteredtypeinfo.c  }
type

function gi_registered_type_info_get_type:TGType;cdecl;external;
{ Documented in gistructinfo.c  }
type

function gi_struct_info_get_type:TGType;cdecl;external;
{ Documented in giunioninfo.c  }
type

function gi_union_info_get_type:TGType;cdecl;external;
{ Documented in gienuminfo.c  }
type

function gi_enum_info_get_type:TGType;cdecl;external;
{ Documented in giflagsinfo.c  }
type

function gi_flags_info_get_type:TGType;cdecl;external;
{ Documented in giobjectinfo.c  }
type

function gi_object_info_get_type:TGType;cdecl;external;
{ Documented in giinterfaceinfo.c  }
type

function gi_interface_info_get_type:TGType;cdecl;external;
{ Documented in giconstantinfo.c  }
type

function gi_constant_info_get_type:TGType;cdecl;external;
{ Documented in givalueinfo.c  }
type

function gi_value_info_get_type:TGType;cdecl;external;
{ Documented in gisignalinfo.c  }
type

function gi_signal_info_get_type:TGType;cdecl;external;
{ Documented in givfuncinfo.c  }
type

function gi_vfunc_info_get_type:TGType;cdecl;external;
{ Documented in gipropertyinfo.c  }
type

function gi_property_info_get_type:TGType;cdecl;external;
{ Documented in gifieldinfo.c  }
type

function gi_field_info_get_type:TGType;cdecl;external;
{ Documented in giarginfo.c  }
{< private > }
type
  PGIArgInfo = ^TGIArgInfo;
  TGIArgInfo = record
      parent : TGIBaseInfoStack;
      padding : array[0..5] of pointer;
    end;

function gi_arg_info_get_type:TGType;cdecl;external;
{ Documented in gitypeinfo.c  }
{< private > }
type
  PGITypeInfo = ^TGITypeInfo;
  TGITypeInfo = record
      parent : TGIBaseInfoStack;
      padding : array[0..5] of pointer;
    end;

function gi_type_info_get_type:TGType;cdecl;external;
{ Documented in giunresolvedinfo.c  }
type

function gi_unresolved_info_get_type:TGType;cdecl;external;
type
  PGIArgument = ^TGIArgument;
  TGIArgument = record
      case longint of
        0 : ( v_boolean : Tgboolean );
        1 : ( v_int8 : Tint8_t );
        2 : ( v_uint8 : Tuint8_t );
        3 : ( v_int16 : Tint16_t );
        4 : ( v_uint16 : Tuint16_t );
        5 : ( v_int32 : Tint32_t );
        6 : ( v_uint32 : Tuint32_t );
        7 : ( v_int64 : Tint64_t );
        8 : ( v_uint64 : Tuint64_t );
        9 : ( v_float : single );
        10 : ( v_double : Tdouble );
        11 : ( v_short : smallint );
        12 : ( v_ushort : word );
        13 : ( v_int : longint );
        14 : ( v_uint : dword );
        15 : ( v_long : longint );
        16 : ( v_ulong : dword );
        17 : ( v_ssize : Tgssize );
        18 : ( v_size : Tsize_t );
        19 : ( v_string : Pchar );
        20 : ( v_pointer : pointer );
      end;

{*
 * GIArgument:
 * @v_boolean: boolean value
 * @v_int8: 8-bit signed integer value
 * @v_uint8: 8-bit unsigned integer value
 * @v_int16: 16-bit signed integer value
 * @v_uint16: 16-bit unsigned integer value
 * @v_int32: 32-bit signed integer value
 * @v_uint32: 32-bit unsigned integer value
 * @v_int64: 64-bit signed integer value
 * @v_uint64: 64-bit unsigned integer value
 * @v_float: single float value
 * @v_double: double float value
 * @v_short: signed short integer value
 * @v_ushort: unsigned short integer value
 * @v_int: signed integer value
 * @v_uint: unsigned integer value
 * @v_long: signed long integer value
 * @v_ulong: unsigned long integer value
 * @v_ssize: sized `size_t` value
 * @v_size: unsigned `size_t` value
 * @v_string: nul-terminated string value
 * @v_pointer: arbitrary pointer value
 *
 * Stores an argument of varying type.
 *
 * Since: 2.80
  }

  PGIArgument = ^TGIArgument;
  TGIArgument = TGIArgument;
{*
 * GITransfer:
 * @GI_TRANSFER_NOTHING: Transfer nothing from the callee (function or the type
 *   instance the property belongs to) to the caller. The callee retains the
 *   ownership of the transfer and the caller doesn’t need to do anything to
 *   free up the resources of this transfer.
 * @GI_TRANSFER_CONTAINER: Transfer the container (list, array, hash table) from
 *   the callee to the caller. The callee retains the ownership of the
 *   individual items in the container and the caller has to free up the
 *   container resources ([func@GLib.List.free],
 *   [func@GLib.HashTable.destroy], etc) of this transfer.
 * @GI_TRANSFER_EVERYTHING: Transfer everything, e.g. the container and its
 *   contents from the callee to the caller. This is the case when the callee
 *   creates a copy of all the data it returns. The caller is responsible for
 *   cleaning up the container and item resources of this transfer.
 *
 * `GITransfer` specifies who’s responsible for freeing the resources after an
 * ownership transfer is complete.
 *
 * The transfer is the exchange of data between two parts, from the callee to
 * the caller.
 *
 * The callee is either a function/method/signal or an object/interface where a
 * property is defined. The caller is the side accessing a property or calling a
 * function.
 *
 * In the case of a containing type such as a list, an array or a hash table the
 * container itself is specified differently from the items within the
 * container. Each container is freed differently, check the documentation for
 * the types themselves for information on how to free them.
 *
 * Since: 2.80
  }

  PGITransfer = ^TGITransfer;
  TGITransfer =  Longint;
  Const
    GI_TRANSFER_NOTHING = 0;
    GI_TRANSFER_CONTAINER = 1;
    GI_TRANSFER_EVERYTHING = 2;
;
{*
 * GIDirection:
 * @GI_DIRECTION_IN: ‘in’ argument.
 * @GI_DIRECTION_OUT: ‘out’ argument.
 * @GI_DIRECTION_INOUT: ‘in and out’ argument.
 *
 * The direction of a [class@GIRepository.ArgInfo].
 *
 * Since: 2.80
  }
type
  PGIDirection = ^TGIDirection;
  TGIDirection =  Longint;
  Const
    GI_DIRECTION_IN = 0;
    GI_DIRECTION_OUT = 1;
    GI_DIRECTION_INOUT = 2;
;
{*
 * GIScopeType:
 * @GI_SCOPE_TYPE_INVALID: The argument is not of callback type.
 * @GI_SCOPE_TYPE_CALL: The callback and associated `user_data` is only
 *   used during the call to this function.
 * @GI_SCOPE_TYPE_ASYNC: The callback and associated `user_data` is
 *   only used until the callback is invoked, and the callback.
 *   is invoked always exactly once.
 * @GI_SCOPE_TYPE_NOTIFIED: The callback and associated
 *   `user_data` is used until the caller is notified via the
 *   [type@GLib.DestroyNotify].
 * @GI_SCOPE_TYPE_FOREVER: The callback and associated `user_data` is
 *   used until the process terminates
 *
 * Scope type of a [class@GIRepository.ArgInfo] representing callback,
 * determines how the callback is invoked and is used to decided when the invoke
 * structs can be freed.
 *
 * Since: 2.80
  }
type
  PGIScopeType = ^TGIScopeType;
  TGIScopeType =  Longint;
  Const
    GI_SCOPE_TYPE_INVALID = 0;
    GI_SCOPE_TYPE_CALL = 1;
    GI_SCOPE_TYPE_ASYNC = 2;
    GI_SCOPE_TYPE_NOTIFIED = 3;
    GI_SCOPE_TYPE_FOREVER = 4;
;
{*
 * GITypeTag:
 * @GI_TYPE_TAG_VOID: void
 * @GI_TYPE_TAG_BOOLEAN: boolean
 * @GI_TYPE_TAG_INT8: 8-bit signed integer
 * @GI_TYPE_TAG_UINT8: 8-bit unsigned integer
 * @GI_TYPE_TAG_INT16: 16-bit signed integer
 * @GI_TYPE_TAG_UINT16: 16-bit unsigned integer
 * @GI_TYPE_TAG_INT32: 32-bit signed integer
 * @GI_TYPE_TAG_UINT32: 32-bit unsigned integer
 * @GI_TYPE_TAG_INT64: 64-bit signed integer
 * @GI_TYPE_TAG_UINT64: 64-bit unsigned integer
 * @GI_TYPE_TAG_FLOAT: float
 * @GI_TYPE_TAG_DOUBLE: double floating point
 * @GI_TYPE_TAG_GTYPE: a [type@GObject.Type]
 * @GI_TYPE_TAG_UTF8: a UTF-8 encoded string
 * @GI_TYPE_TAG_FILENAME: a filename, encoded in the same encoding
 *   as the native filesystem is using.
 * @GI_TYPE_TAG_ARRAY: an array
 * @GI_TYPE_TAG_INTERFACE: an extended interface object
 * @GI_TYPE_TAG_GLIST: a [type@GLib.List]
 * @GI_TYPE_TAG_GSLIST: a [type@GLib.SList]
 * @GI_TYPE_TAG_GHASH: a [type@GLib.HashTable]
 * @GI_TYPE_TAG_ERROR: a [type@GLib.Error]
 * @GI_TYPE_TAG_UNICHAR: Unicode character
 *
 * The type tag of a [class@GIRepository.TypeInfo].
 *
 * Since: 2.80
  }
{ Basic types  }
{ Start of GI_TYPE_TAG_IS_NUMERIC types  }
{ End of numeric types  }
{ Non-basic types; compare with GI_TYPE_TAG_IS_BASIC  }
{ container (see GI_TYPE_TAG_IS_CONTAINER)  }
{ container  }
{ container  }
{ container  }
{ Another basic type  }
{ Note - there is currently only room for 32 tags  }
type
  PGITypeTag = ^TGITypeTag;
  TGITypeTag =  Longint;
  Const
    GI_TYPE_TAG_VOID = 0;
    GI_TYPE_TAG_BOOLEAN = 1;
    GI_TYPE_TAG_INT8 = 2;
    GI_TYPE_TAG_UINT8 = 3;
    GI_TYPE_TAG_INT16 = 4;
    GI_TYPE_TAG_UINT16 = 5;
    GI_TYPE_TAG_INT32 = 6;
    GI_TYPE_TAG_UINT32 = 7;
    GI_TYPE_TAG_INT64 = 8;
    GI_TYPE_TAG_UINT64 = 9;
    GI_TYPE_TAG_FLOAT = 10;
    GI_TYPE_TAG_DOUBLE = 11;
    GI_TYPE_TAG_GTYPE = 12;
    GI_TYPE_TAG_UTF8 = 13;
    GI_TYPE_TAG_FILENAME = 14;
    GI_TYPE_TAG_ARRAY = 15;
    GI_TYPE_TAG_INTERFACE = 16;
    GI_TYPE_TAG_GLIST = 17;
    GI_TYPE_TAG_GSLIST = 18;
    GI_TYPE_TAG_GHASH = 19;
    GI_TYPE_TAG_ERROR = 20;
    GI_TYPE_TAG_UNICHAR = 21;
;
{*
 * GI_TYPE_TAG_N_TYPES:
 *
 * Number of entries in [enum@GIRepository.TypeTag].
 *
 * Since: 2.80
  }
  GI_TYPE_TAG_N_TYPES = GI_TYPE_TAG_UNICHAR+1;  
{*
 * GIArrayType:
 * @GI_ARRAY_TYPE_C: a C array, `char[]` for instance
 * @GI_ARRAY_TYPE_ARRAY: a [type@GLib.Array] array
 * @GI_ARRAY_TYPE_PTR_ARRAY: a [type@GLib.PtrArray] array
 * @GI_ARRAY_TYPE_BYTE_ARRAY: a [type@GLib.ByteArray] array
 *
 * The type of array in a [class@GIRepository.TypeInfo].
 *
 * Since: 2.80
  }
type
  PGIArrayType = ^TGIArrayType;
  TGIArrayType =  Longint;
  Const
    GI_ARRAY_TYPE_C = 0;
    GI_ARRAY_TYPE_ARRAY = 1;
    GI_ARRAY_TYPE_PTR_ARRAY = 2;
    GI_ARRAY_TYPE_BYTE_ARRAY = 3;
;
{*
 * GIFieldInfoFlags:
 * @GI_FIELD_IS_READABLE: field is readable.
 * @GI_FIELD_IS_WRITABLE: field is writable.
 *
 * Flags for a [class@GIRepository.FieldInfo].
 *
 * Since: 2.80
  }
type
  PGIFieldInfoFlags = ^TGIFieldInfoFlags;
  TGIFieldInfoFlags =  Longint;
  Const
    GI_FIELD_IS_READABLE = 1 shl 0;
    GI_FIELD_IS_WRITABLE = 1 shl 1;
;
{*
 * GIVFuncInfoFlags:
 * @GI_VFUNC_MUST_CHAIN_UP: chains up to the parent type
 * @GI_VFUNC_MUST_OVERRIDE: overrides
 * @GI_VFUNC_MUST_NOT_OVERRIDE: does not override
 *
 * Flags of a [class@GIRepository.VFuncInfo] struct.
 *
 * Since: 2.80
  }
type
  PGIVFuncInfoFlags = ^TGIVFuncInfoFlags;
  TGIVFuncInfoFlags =  Longint;
  Const
    GI_VFUNC_MUST_CHAIN_UP = 1 shl 0;
    GI_VFUNC_MUST_OVERRIDE = 1 shl 1;
    GI_VFUNC_MUST_NOT_OVERRIDE = 1 shl 2;
;
{*
 * GIFunctionInfoFlags:
 * @GI_FUNCTION_IS_METHOD: is a method.
 * @GI_FUNCTION_IS_CONSTRUCTOR: is a constructor.
 * @GI_FUNCTION_IS_GETTER: is a getter of a [class@GIRepository.PropertyInfo].
 * @GI_FUNCTION_IS_SETTER: is a setter of a [class@GIRepository.PropertyInfo].
 * @GI_FUNCTION_WRAPS_VFUNC: represents a virtual function.
 *
 * Flags for a [class@GIRepository.FunctionInfo] struct.
 *
 * Since: 2.80
  }
type
  PGIFunctionInfoFlags = ^TGIFunctionInfoFlags;
  TGIFunctionInfoFlags =  Longint;
  Const
    GI_FUNCTION_IS_METHOD = 1 shl 0;
    GI_FUNCTION_IS_CONSTRUCTOR = 1 shl 1;
    GI_FUNCTION_IS_GETTER = 1 shl 2;
    GI_FUNCTION_IS_SETTER = 1 shl 3;
    GI_FUNCTION_WRAPS_VFUNC = 1 shl 4;
;

implementation


end.
