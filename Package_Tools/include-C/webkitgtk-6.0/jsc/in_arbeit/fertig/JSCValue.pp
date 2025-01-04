
unit JSCValue;
interface

{
  Automatically converted by H2Pas 1.0.0 from JSCValue.h
  The following command line parameters were used:
    -p
    -T
    -d
    -c
    -e
    JSCValue.h
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
PGBytes  = ^GBytes;
Pgchar  = ^gchar;
PGPtrArray  = ^GPtrArray;
Pgsize  = ^gsize;
PGType  = ^GType;
PJSCClass  = ^JSCClass;
PJSCContext  = ^JSCContext;
PJSCTypedArrayType  = ^JSCTypedArrayType;
PJSCValue  = ^JSCValue;
PJSCValuePropertyFlags  = ^JSCValuePropertyFlags;
{$IFDEF FPC}
{$PACKRECORDS C}
{$ENDIF}


{
 * Copyright (C) 2018 Igalia S.L.
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
{$ifndef JSCValue_h}
{$define JSCValue_h}
{$include <glib-object.h>}
{$include <jsc/JSCDefines.h>}

{ was #define dname def_expr }
function JSC_TYPE_VALUE : longint; { return type might be wrong }

{JSC_DECLARE_FINAL_TYPE (JSCValue, jsc_value, JSC, VALUE, GObject) }
type

  PJSCValuePropertyFlags = ^TJSCValuePropertyFlags;
  TJSCValuePropertyFlags =  Longint;
  Const
    JSC_VALUE_PROPERTY_CONFIGURABLE = 1 shl 0;
    JSC_VALUE_PROPERTY_ENUMERABLE = 1 shl 1;
    JSC_VALUE_PROPERTY_WRITABLE = 1 shl 2;
;
type
  PJSCTypedArrayType = ^TJSCTypedArrayType;
  TJSCTypedArrayType =  Longint;
  Const
    JSC_TYPED_ARRAY_NONE = 0;
    JSC_TYPED_ARRAY_INT8 = 1;
    JSC_TYPED_ARRAY_INT16 = 2;
    JSC_TYPED_ARRAY_INT32 = 3;
    JSC_TYPED_ARRAY_INT64 = 4;
    JSC_TYPED_ARRAY_UINT8 = 5;
    JSC_TYPED_ARRAY_UINT8_CLAMPED = 6;
    JSC_TYPED_ARRAY_UINT16 = 7;
    JSC_TYPED_ARRAY_UINT32 = 8;
    JSC_TYPED_ARRAY_UINT64 = 9;
    JSC_TYPED_ARRAY_FLOAT32 = 10;
    JSC_TYPED_ARRAY_FLOAT64 = 11;
;

function jsc_value_get_context(value:PJSCValue):PJSCContext;cdecl;external;
function jsc_value_new_undefined(context:PJSCContext):PJSCValue;cdecl;external;
function jsc_value_is_undefined(value:PJSCValue):Tgboolean;cdecl;external;
function jsc_value_new_null(context:PJSCContext):PJSCValue;cdecl;external;
function jsc_value_is_null(value:PJSCValue):Tgboolean;cdecl;external;
function jsc_value_new_number(context:PJSCContext; number:Tdouble):PJSCValue;cdecl;external;
function jsc_value_is_number(value:PJSCValue):Tgboolean;cdecl;external;
function jsc_value_to_double(value:PJSCValue):Tdouble;cdecl;external;
function jsc_value_to_int32(value:PJSCValue):Tgint32;cdecl;external;
function jsc_value_new_boolean(context:PJSCContext; value:Tgboolean):PJSCValue;cdecl;external;
function jsc_value_is_boolean(value:PJSCValue):Tgboolean;cdecl;external;
function jsc_value_to_boolean(value:PJSCValue):Tgboolean;cdecl;external;
(* Const before type ignored *)
function jsc_value_new_string(context:PJSCContext; _string:Pchar):PJSCValue;cdecl;external;
function jsc_value_new_string_from_bytes(context:PJSCContext; bytes:PGBytes):PJSCValue;cdecl;external;
function jsc_value_is_string(value:PJSCValue):Tgboolean;cdecl;external;
function jsc_value_to_string(value:PJSCValue):Pchar;cdecl;external;
function jsc_value_to_string_as_bytes(value:PJSCValue):PGBytes;cdecl;external;
function jsc_value_new_array(context:PJSCContext; first_item_type:TGType; args:array of const):PJSCValue;cdecl;external;
function jsc_value_new_array(context:PJSCContext; first_item_type:TGType):PJSCValue;cdecl;external;
function jsc_value_new_array_from_garray(context:PJSCContext; array:PGPtrArray):PJSCValue;cdecl;external;
(* Const before type ignored *)
(* Const before declarator ignored *)
function jsc_value_new_array_from_strv(context:PJSCContext; strv:PPchar):PJSCValue;cdecl;external;
function jsc_value_is_array(value:PJSCValue):Tgboolean;cdecl;external;
function jsc_value_new_object(context:PJSCContext; instance:Tgpointer; jsc_class:PJSCClass):PJSCValue;cdecl;external;
function jsc_value_is_object(value:PJSCValue):Tgboolean;cdecl;external;
(* Const before type ignored *)
function jsc_value_object_is_instance_of(value:PJSCValue; name:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
procedure jsc_value_object_set_property(value:PJSCValue; name:Pchar; _property:PJSCValue);cdecl;external;
(* Const before type ignored *)
function jsc_value_object_get_property(value:PJSCValue; name:Pchar):PJSCValue;cdecl;external;
procedure jsc_value_object_set_property_at_index(value:PJSCValue; index:Tguint; _property:PJSCValue);cdecl;external;
function jsc_value_object_get_property_at_index(value:PJSCValue; index:Tguint):PJSCValue;cdecl;external;
(* Const before type ignored *)
function jsc_value_object_has_property(value:PJSCValue; name:Pchar):Tgboolean;cdecl;external;
(* Const before type ignored *)
function jsc_value_object_delete_property(value:PJSCValue; name:Pchar):Tgboolean;cdecl;external;
function jsc_value_object_enumerate_properties(value:PJSCValue):^Pgchar;cdecl;external;
(* Const before type ignored *)
function jsc_value_object_invoke_method(value:PJSCValue; name:Pchar; first_parameter_type:TGType; args:array of const):PJSCValue;cdecl;external;
function jsc_value_object_invoke_method(value:PJSCValue; name:Pchar; first_parameter_type:TGType):PJSCValue;cdecl;external;
(* Const before type ignored *)
function jsc_value_object_invoke_methodv(value:PJSCValue; name:Pchar; n_parameters:Tguint; parameters:PPJSCValue):PJSCValue;cdecl;external;
(* Const before type ignored *)
procedure jsc_value_object_define_property_data(value:PJSCValue; property_name:Pchar; flags:TJSCValuePropertyFlags; property_value:PJSCValue);cdecl;external;
(* Const before type ignored *)
procedure jsc_value_object_define_property_accessor(value:PJSCValue; property_name:Pchar; flags:TJSCValuePropertyFlags; property_type:TGType; getter:TGCallback; 
            setter:TGCallback; user_data:Tgpointer; destroy_notify:TGDestroyNotify);cdecl;external;
(* Const before type ignored *)
function jsc_value_new_function(context:PJSCContext; name:Pchar; callback:TGCallback; user_data:Tgpointer; destroy_notify:TGDestroyNotify; 
           return_type:TGType; n_params:Tguint; args:array of const):PJSCValue;cdecl;external;
function jsc_value_new_function(context:PJSCContext; name:Pchar; callback:TGCallback; user_data:Tgpointer; destroy_notify:TGDestroyNotify; 
           return_type:TGType; n_params:Tguint):PJSCValue;cdecl;external;
(* Const before type ignored *)
function jsc_value_new_functionv(context:PJSCContext; name:Pchar; callback:TGCallback; user_data:Tgpointer; destroy_notify:TGDestroyNotify; 
           return_type:TGType; n_parameters:Tguint; parameter_types:PGType):PJSCValue;cdecl;external;
(* Const before type ignored *)
function jsc_value_new_function_variadic(context:PJSCContext; name:Pchar; callback:TGCallback; user_data:Tgpointer; destroy_notify:TGDestroyNotify; 
           return_type:TGType):PJSCValue;cdecl;external;
function jsc_value_is_function(value:PJSCValue):Tgboolean;cdecl;external;
function jsc_value_function_call(value:PJSCValue; first_parameter_type:TGType; args:array of const):PJSCValue;cdecl;external;
function jsc_value_function_call(value:PJSCValue; first_parameter_type:TGType):PJSCValue;cdecl;external;
function jsc_value_function_callv(value:PJSCValue; n_parameters:Tguint; parameters:PPJSCValue):PJSCValue;cdecl;external;
function jsc_value_new_array_buffer(context:PJSCContext; data:Tgpointer; size:Tgsize; destroy_notify:TGDestroyNotify; user_data:Tgpointer):PJSCValue;cdecl;external;
function jsc_value_is_array_buffer(value:PJSCValue):Tgboolean;cdecl;external;
function jsc_value_array_buffer_get_data(value:PJSCValue; size:Pgsize):Tgpointer;cdecl;external;
function jsc_value_array_buffer_get_size(value:PJSCValue):Tgsize;cdecl;external;
function jsc_value_new_typed_array(context:PJSCContext; _type:TJSCTypedArrayType; length:Tgsize):PJSCValue;cdecl;external;
function jsc_value_new_typed_array_with_buffer(array_buffer:PJSCValue; _type:TJSCTypedArrayType; offset:Tgsize; length:Tgssize):PJSCValue;cdecl;external;
function jsc_value_is_typed_array(value:PJSCValue):Tgboolean;cdecl;external;
function jsc_value_typed_array_get_type(value:PJSCValue):TJSCTypedArrayType;cdecl;external;
function jsc_value_typed_array_get_data(value:PJSCValue; length:Pgsize):Tgpointer;cdecl;external;
function jsc_value_typed_array_get_length(value:PJSCValue):Tgsize;cdecl;external;
function jsc_value_typed_array_get_size(value:PJSCValue):Tgsize;cdecl;external;
function jsc_value_typed_array_get_offset(value:PJSCValue):Tgsize;cdecl;external;
function jsc_value_typed_array_get_buffer(value:PJSCValue):PJSCValue;cdecl;external;
function jsc_value_is_constructor(value:PJSCValue):Tgboolean;cdecl;external;
function jsc_value_constructor_call(value:PJSCValue; first_parameter_type:TGType; args:array of const):PJSCValue;cdecl;external;
function jsc_value_constructor_call(value:PJSCValue; first_parameter_type:TGType):PJSCValue;cdecl;external;
function jsc_value_constructor_callv(value:PJSCValue; n_parameters:Tguint; parameters:PPJSCValue):PJSCValue;cdecl;external;
(* Const before type ignored *)
function jsc_value_new_from_json(context:PJSCContext; json:Pchar):PJSCValue;cdecl;external;
function jsc_value_to_json(value:PJSCValue; indent:Tguint):Pchar;cdecl;external;
{$endif}
{ JSCValue_h  }

implementation

{ was #define dname def_expr }
function JSC_TYPE_VALUE : longint; { return type might be wrong }
  begin
    JSC_TYPE_VALUE:=jsc_value_get_type;
  end;


end.
