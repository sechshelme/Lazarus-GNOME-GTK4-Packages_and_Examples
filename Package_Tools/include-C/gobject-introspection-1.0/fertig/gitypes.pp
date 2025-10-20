
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
PGArgument  = ^GArgument;
Pgchar  = ^gchar;
PGIArgInfo  = ^GIArgInfo;
PGIArgument  = ^GIArgument;
PGIArrayType  = ^GIArrayType;
PGIBaseInfo  = ^GIBaseInfo;
PGIBaseInfoStub  = ^GIBaseInfoStub;
PGICallableInfo  = ^GICallableInfo;
PGICallbackInfo  = ^GICallbackInfo;
PGIConstantInfo  = ^GIConstantInfo;
PGIDirection  = ^GIDirection;
PGIEnumInfo  = ^GIEnumInfo;
PGIFieldInfo  = ^GIFieldInfo;
PGIFieldInfoFlags  = ^GIFieldInfoFlags;
PGIFunctionInfo  = ^GIFunctionInfo;
PGIFunctionInfoFlags  = ^GIFunctionInfoFlags;
PGIInfoType  = ^GIInfoType;
PGIInterfaceInfo  = ^GIInterfaceInfo;
PGIObjectInfo  = ^GIObjectInfo;
PGIPropertyInfo  = ^GIPropertyInfo;
PGIRegisteredTypeInfo  = ^GIRegisteredTypeInfo;
PGIScopeType  = ^GIScopeType;
PGISignalInfo  = ^GISignalInfo;
PGIStructInfo  = ^GIStructInfo;
PGITransfer  = ^GITransfer;
PGITypeInfo  = ^GITypeInfo;
PGITypeTag  = ^GITypeTag;
PGIUnionInfo  = ^GIUnionInfo;
PGIValueInfo  = ^GIValueInfo;
PGIVFuncInfo  = ^GIVFuncInfo;
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
{$ifndef __GITYPES_H__}
{$define __GITYPES_H__}
{$if !defined (__GIREPOSITORY_H_INSIDE__) && !defined (GI_COMPILATION)}
{$error "Only <girepository.h> can be included directly."}
{$endif}
{$include <giversionmacros.h>}
{< private > }
type
  PGIBaseInfoStub = ^TGIBaseInfoStub;
  TGIBaseInfoStub = record
      dummy1 : Tgint32;
      dummy2 : Tgint32;
      dummy3 : Tgpointer;
      dummy4 : Tgpointer;
      dummy5 : Tgpointer;
      dummy6 : Tguint32;
      dummy7 : Tguint32;
      padding : array[0..3] of Tgpointer;
    end;
  TGIBaseInfo = TGIBaseInfoStub;
  PGIBaseInfo = ^TGIBaseInfo;
{*
 * GICallableInfo:
 *
 * Represents a callable, either #GIFunctionInfo, #GICallbackInfo or
 * #GIVFuncInfo.
  }

  PGICallableInfo = ^TGICallableInfo;
  TGICallableInfo = TGIBaseInfo;
{*
 * GIFunctionInfo:
 *
 * Represents a function, eg arguments and return value.
  }

  PGIFunctionInfo = ^TGIFunctionInfo;
  TGIFunctionInfo = TGIBaseInfo;
{*
 * SECTION:gicallbackinfo
 * @title: GICallbackInfo
 * @short_description: Struct representing a callback
 *
 * GICallbackInfo represents a callback.
  }
{*
 * GICallbackInfo:
 *
 * Represents a callback, eg arguments and return value.
  }

  PGICallbackInfo = ^TGICallbackInfo;
  TGICallbackInfo = TGIBaseInfo;
{*
 * GIRegisteredTypeInfo:
 *
 * Represent a registered type.
  }

  PGIRegisteredTypeInfo = ^TGIRegisteredTypeInfo;
  TGIRegisteredTypeInfo = TGIBaseInfo;
{*
 * GIStructInfo:
 *
 * Represents a struct.
  }

  PGIStructInfo = ^TGIStructInfo;
  TGIStructInfo = TGIBaseInfo;
{*
 * GIUnionInfo:
 *
 * Represents a union.
  }

  PGIUnionInfo = ^TGIUnionInfo;
  TGIUnionInfo = TGIBaseInfo;
{*
 * GIEnumInfo:
 *
 * Represents an enum or a flag.
  }

  PGIEnumInfo = ^TGIEnumInfo;
  TGIEnumInfo = TGIBaseInfo;
{*
 * GIObjectInfo:
 *
 * Represents an object.
  }

  PGIObjectInfo = ^TGIObjectInfo;
  TGIObjectInfo = TGIBaseInfo;
{*
 * GIInterfaceInfo:
 *
 * Represents an interface.
  }

  PGIInterfaceInfo = ^TGIInterfaceInfo;
  TGIInterfaceInfo = TGIBaseInfo;
{*
 * GIConstantInfo:
 *
 * Represents a constant.
  }

  PGIConstantInfo = ^TGIConstantInfo;
  TGIConstantInfo = TGIBaseInfo;
{*
 * SECTION:givalueinfo
 * @title: GIValueInfo
 * @short_description: Struct representing a value
 *
 * GIValueInfo represents a value.
  }
{*
 * GIValueInfo:
 *
 * Represents a enum value of a #GIEnumInfo.
  }

  PGIValueInfo = ^TGIValueInfo;
  TGIValueInfo = TGIBaseInfo;
{*
 * GISignalInfo:
 *
 * Represents a signal.
  }

  PGISignalInfo = ^TGISignalInfo;
  TGISignalInfo = TGIBaseInfo;
{*
 * GIVFuncInfo:
 *
 * Represents a virtual function.
  }

  PGIVFuncInfo = ^TGIVFuncInfo;
  TGIVFuncInfo = TGIBaseInfo;
{*
 * GIPropertyInfo:
 *
 * Represents a property of a #GIObjectInfo or a #GIInterfaceInfo.
  }

  PGIPropertyInfo = ^TGIPropertyInfo;
  TGIPropertyInfo = TGIBaseInfo;
{*
 * GIFieldInfo:
 *
 * Represents a field of a #GIStructInfo or a #GIUnionInfo.
  }

  PGIFieldInfo = ^TGIFieldInfo;
  TGIFieldInfo = TGIBaseInfo;
{*
 * GIArgInfo:
 *
 * Represents an argument.
  }

  PGIArgInfo = ^TGIArgInfo;
  TGIArgInfo = TGIBaseInfo;
{*
 * GITypeInfo:
 *
 * Represents type information, direction, transfer etc.
  }

  PGITypeInfo = ^TGITypeInfo;
  TGITypeInfo = TGIBaseInfo;
{*
 * GIUnresolvedInfo:
 *
 * Represents a unresolved type in a typelib.
  }
  PGIArgument = ^TGIArgument;
  TGIArgument = record
      case longint of
        0 : ( v_boolean : Tgboolean );
        1 : ( v_int8 : Tgint8 );
        2 : ( v_uint8 : Tguint8 );
        3 : ( v_int16 : Tgint16 );
        4 : ( v_uint16 : Tguint16 );
        5 : ( v_int32 : Tgint32 );
        6 : ( v_uint32 : Tguint32 );
        7 : ( v_int64 : Tgint64 );
        8 : ( v_uint64 : Tguint64 );
        9 : ( v_float : Tgfloat );
        10 : ( v_double : Tgdouble );
        11 : ( v_short : Tgshort );
        12 : ( v_ushort : Tgushort );
        13 : ( v_int : Tgint );
        14 : ( v_uint : Tguint );
        15 : ( v_long : Tglong );
        16 : ( v_ulong : Tgulong );
        17 : ( v_ssize : Tgssize );
        18 : ( v_size : Tgsize );
        19 : ( v_string : Pgchar );
        20 : ( v_pointer : Tgpointer );
      end;

{*
 * GIArgument:
 * @v_boolean: TODO
 * @v_int8: TODO
 * @v_uint8: TODO
 * @v_int16: TODO
 * @v_uint16: TODO
 * @v_int32: TODO
 * @v_uint32: TODO
 * @v_int64: TODO
 * @v_uint64: TODO
 * @v_float: TODO
 * @v_double: TODO
 * @v_short: TODO
 * @v_ushort: TODO
 * @v_int: TODO
 * @v_uint: TODO
 * @v_long: TODO
 * @v_ulong: TODO
 * @v_ssize: TODO
 * @v_size: TODO
 * @v_string: TODO
 * @v_pointer: TODO
 *
 * Stores an argument of varying type
  }

  PGIArgument = ^TGIArgument;
  TGIArgument = TGIArgument;
{*
 * GIInfoType:
 * @GI_INFO_TYPE_INVALID: invalid type
 * @GI_INFO_TYPE_FUNCTION: function, see #GIFunctionInfo
 * @GI_INFO_TYPE_CALLBACK: callback, see #GIFunctionInfo
 * @GI_INFO_TYPE_STRUCT: struct, see #GIStructInfo
 * @GI_INFO_TYPE_BOXED: boxed, see #GIStructInfo or #GIUnionInfo
 * @GI_INFO_TYPE_ENUM: enum, see #GIEnumInfo
 * @GI_INFO_TYPE_FLAGS: flags, see #GIEnumInfo
 * @GI_INFO_TYPE_OBJECT: object, see #GIObjectInfo
 * @GI_INFO_TYPE_INTERFACE: interface, see #GIInterfaceInfo
 * @GI_INFO_TYPE_CONSTANT: contant, see #GIConstantInfo
 * @GI_INFO_TYPE_INVALID_0: deleted, used to be GI_INFO_TYPE_ERROR_DOMAIN.
 * @GI_INFO_TYPE_UNION: union, see #GIUnionInfo
 * @GI_INFO_TYPE_VALUE: enum value, see #GIValueInfo
 * @GI_INFO_TYPE_SIGNAL: signal, see #GISignalInfo
 * @GI_INFO_TYPE_VFUNC: virtual function, see #GIVFuncInfo
 * @GI_INFO_TYPE_PROPERTY: GObject property, see #GIPropertyInfo
 * @GI_INFO_TYPE_FIELD: struct or union field, see #GIFieldInfo
 * @GI_INFO_TYPE_ARG: argument of a function or callback, see #GIArgInfo
 * @GI_INFO_TYPE_TYPE: type information, see #GITypeInfo
 * @GI_INFO_TYPE_UNRESOLVED: unresolved type, a type which is not present in
 *   the typelib, or any of its dependencies.
 *
 * The type of a GIBaseInfo struct.
  }
{  5  }
{ 10  }
{ 15  }

  PGIInfoType = ^TGIInfoType;
  TGIInfoType =  Longint;
  Const
    GI_INFO_TYPE_INVALID = 0;
    GI_INFO_TYPE_FUNCTION = 1;
    GI_INFO_TYPE_CALLBACK = 2;
    GI_INFO_TYPE_STRUCT = 3;
    GI_INFO_TYPE_BOXED = 4;
    GI_INFO_TYPE_ENUM = 5;
    GI_INFO_TYPE_FLAGS = 6;
    GI_INFO_TYPE_OBJECT = 7;
    GI_INFO_TYPE_INTERFACE = 8;
    GI_INFO_TYPE_CONSTANT = 9;
    GI_INFO_TYPE_INVALID_0 = 10;
    GI_INFO_TYPE_UNION = 11;
    GI_INFO_TYPE_VALUE = 12;
    GI_INFO_TYPE_SIGNAL = 13;
    GI_INFO_TYPE_VFUNC = 14;
    GI_INFO_TYPE_PROPERTY = 15;
    GI_INFO_TYPE_FIELD = 16;
    GI_INFO_TYPE_ARG = 17;
    GI_INFO_TYPE_TYPE = 18;
    GI_INFO_TYPE_UNRESOLVED = 19;
;
{*
 * GITransfer:
 * @GI_TRANSFER_NOTHING: transfer nothing from the callee (function or the type
 * instance the property belongs to) to the caller. The callee retains the
 * ownership of the transfer and the caller doesn't need to do anything to free
 * up the resources of this transfer.
 * @GI_TRANSFER_CONTAINER: transfer the container (list, array, hash table) from
 * the callee to the caller. The callee retains the ownership of the individual
 * items in the container and the caller has to free up the container resources
 * (g_list_free()/g_hash_table_destroy() etc) of this transfer.
 * @GI_TRANSFER_EVERYTHING: transfer everything, eg the container and its
 * contents from the callee to the caller. This is the case when the callee
 * creates a copy of all the data it returns. The caller is responsible for
 * cleaning up the container and item resources of this transfer.
 *
 * The transfer is the exchange of data between two parts, from the callee to
 * the caller. The callee is either a function/method/signal or an
 * object/interface where a property is defined. The caller is the side
 * accessing a property or calling a function.
 * #GITransfer specifies who's responsible for freeing the resources after the
 * ownership transfer is complete. In case of a containing type such as a list,
 * an array or a hash table the container itself is specified differently from
 * the items within the container itself. Each container is freed differently,
 * check the documentation for the types themselves for information on how to
 * free them.
  }
type
  PGITransfer = ^TGITransfer;
  TGITransfer =  Longint;
  Const
    GI_TRANSFER_NOTHING = 0;
    GI_TRANSFER_CONTAINER = 1;
    GI_TRANSFER_EVERYTHING = 2;
;
{*
 * GIDirection:
 * @GI_DIRECTION_IN: in argument.
 * @GI_DIRECTION_OUT: out argument.
 * @GI_DIRECTION_INOUT: in and out argument.
 *
 * The direction of a #GIArgInfo.
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
 * @GI_SCOPE_TYPE_CALL: The callback and associated user_data is only
 *   used during the call to this function.
 * @GI_SCOPE_TYPE_ASYNC: The callback and associated user_data is
 *   only used until the callback is invoked, and the callback.
 *   is invoked always exactly once.
 * @GI_SCOPE_TYPE_NOTIFIED: The callback and associated
 *   user_data is used until the caller is notfied via the destroy_notify.
 * @GI_SCOPE_TYPE_FOREVER: The callback and associated user_data is
 *   used until the process terminates
 *
 * Scope type of a #GIArgInfo representing callback, determines how the
 * callback is invoked and is used to decided when the invoke structs
 * can be freed.
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
 * @GI_TYPE_TAG_GTYPE: a #GType
 * @GI_TYPE_TAG_UTF8: a UTF-8 encoded string
 * @GI_TYPE_TAG_FILENAME: a filename, encoded in the same encoding
 *   as the native filesystem is using.
 * @GI_TYPE_TAG_ARRAY: an array
 * @GI_TYPE_TAG_INTERFACE: an extended interface object
 * @GI_TYPE_TAG_GLIST: a #GList
 * @GI_TYPE_TAG_GSLIST: a #GSList
 * @GI_TYPE_TAG_GHASH: a #GHashTable
 * @GI_TYPE_TAG_ERROR: a #GError
 * @GI_TYPE_TAG_UNICHAR: Unicode character
 *
 * The type tag of a #GITypeInfo.
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
 * TODO
  }
  GI_TYPE_TAG_N_TYPES = GI_TYPE_TAG_UNICHAR+1;  
{$ifndef __GTK_DOC_IGNORE__}
{ These were removed and no longer appear in the typelib;
 * instead, the machine-specific versions like INT32 are
 * always used.
  }

const
  GI_TYPE_TAG_SHORT = GI_TYPE_TAG_SHORT_WAS_REMOVED;  
  GI_TYPE_TAG_INT = GI_TYPE_TAG_INT_WAS_REMOVED;  
  GI_TYPE_TAG_LONG = GI_TYPE_TAG_LONG_WAS_REMOVED;  
{$endif}
{*
 * GIArrayType:
 * @GI_ARRAY_TYPE_C: a C array, char[] for instance
 * @GI_ARRAY_TYPE_ARRAY: a @GArray array
 * @GI_ARRAY_TYPE_PTR_ARRAY: a #GPtrArray array
 * @GI_ARRAY_TYPE_BYTE_ARRAY: a #GByteArray array
 *
 * The type of array in a #GITypeInfo.
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
 * Flags for a #GIFieldInfo.
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
 * @GI_VFUNC_THROWS: Includes a #GError
 *
 * Flags of a #GIVFuncInfo struct.
  }
type
  PGIVFuncInfoFlags = ^TGIVFuncInfoFlags;
  TGIVFuncInfoFlags =  Longint;
  Const
    GI_VFUNC_MUST_CHAIN_UP = 1 shl 0;
    GI_VFUNC_MUST_OVERRIDE = 1 shl 1;
    GI_VFUNC_MUST_NOT_OVERRIDE = 1 shl 2;
    GI_VFUNC_THROWS = 1 shl 3;
;
{*
 * GIFunctionInfoFlags:
 * @GI_FUNCTION_IS_METHOD: is a method.
 * @GI_FUNCTION_IS_CONSTRUCTOR: is a constructor.
 * @GI_FUNCTION_IS_GETTER: is a getter of a #GIPropertyInfo.
 * @GI_FUNCTION_IS_SETTER: is a setter of a #GIPropertyInfo.
 * @GI_FUNCTION_WRAPS_VFUNC: represents a virtual function.
 * @GI_FUNCTION_THROWS: the function may throw an error.
 *
 * Flags for a #GIFunctionInfo struct.
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
    GI_FUNCTION_THROWS = 1 shl 5;
;
{$ifndef __GI_SCANNER__}
{$ifndef __GTK_DOC_IGNORE__}
{ backwards compatibility  }
type
  PGArgument = ^TGArgument;
  TGArgument = TGIArgument;
  TGITypelib = TGTypelib;
{$endif}
{$endif}
{$endif}
{ __GITYPES_H__  }

implementation


end.
