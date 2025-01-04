{$IFDEF read_interface}


  {JSC_DECLARE_FINAL_TYPE (JSCValue, jsc_value, JSC, VALUE, GObject) }
type

  PJSCValuePropertyFlags = ^TJSCValuePropertyFlags;
  TJSCValuePropertyFlags = longint;

const
  JSC_VALUE_PROPERTY_CONFIGURABLE = 1 shl 0;
  JSC_VALUE_PROPERTY_ENUMERABLE = 1 shl 1;
  JSC_VALUE_PROPERTY_WRITABLE = 1 shl 2;

type
  PJSCTypedArrayType = ^TJSCTypedArrayType;
  TJSCTypedArrayType = longint;

const
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

type
  TJSCValue = record
  end;
  PJSCValue = ^TJSCValue;
  PPJSCValue = ^PJSCValue;

  TJSCValueClass = record
    parent_class: TGObjectClass;
  end;
  PJSCValueClass = ^TJSCValueClass;

function jsc_value_get_type: TGType; cdecl; external libjavascriptcoregtk;
function jsc_value_get_context(Value: PJSCValue): PJSCContext; cdecl; external libjavascriptcoregtk;
function jsc_value_new_undefined(context: PJSCContext): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_is_undefined(Value: PJSCValue): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_value_new_null(context: PJSCContext): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_is_null(Value: PJSCValue): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_value_new_number(context: PJSCContext; number: Tdouble): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_is_number(Value: PJSCValue): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_value_to_double(Value: PJSCValue): Tdouble; cdecl; external libjavascriptcoregtk;
function jsc_value_to_int32(Value: PJSCValue): Tgint32; cdecl; external libjavascriptcoregtk;
function jsc_value_new_boolean(context: PJSCContext; Value: Tgboolean): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_is_boolean(Value: PJSCValue): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_value_to_boolean(Value: PJSCValue): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_value_new_string(context: PJSCContext; _string: pchar): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_new_string_from_bytes(context: PJSCContext; bytes: PGBytes): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_is_string(Value: PJSCValue): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_value_to_string(Value: PJSCValue): pchar; cdecl; external libjavascriptcoregtk;
function jsc_value_to_string_as_bytes(Value: PJSCValue): PGBytes; cdecl; external libjavascriptcoregtk;
function jsc_value_new_array(context: PJSCContext; first_item_type: TGType; args: array of const): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_new_array(context: PJSCContext; first_item_type: TGType): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_new_array_from_garray(context: PJSCContext; arr: PGPtrArray): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_new_array_from_strv(context: PJSCContext; strv: PPchar): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_is_array(Value: PJSCValue): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_value_new_object(context: PJSCContext; instance: Tgpointer; jsc_class: PJSCClass): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_is_object(Value: PJSCValue): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_value_object_is_instance_of(Value: PJSCValue; Name: pchar): Tgboolean; cdecl; external libjavascriptcoregtk;
procedure jsc_value_object_set_property(Value: PJSCValue; Name: pchar; _property: PJSCValue); cdecl; external libjavascriptcoregtk;
function jsc_value_object_get_property(Value: PJSCValue; Name: pchar): PJSCValue; cdecl; external libjavascriptcoregtk;
procedure jsc_value_object_set_property_at_index(Value: PJSCValue; index: Tguint; _property: PJSCValue); cdecl; external libjavascriptcoregtk;
function jsc_value_object_get_property_at_index(Value: PJSCValue; index: Tguint): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_object_has_property(Value: PJSCValue; Name: pchar): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_value_object_delete_property(Value: PJSCValue; Name: pchar): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_value_object_enumerate_properties(Value: PJSCValue): PPgchar; cdecl; external libjavascriptcoregtk;
function jsc_value_object_invoke_method(Value: PJSCValue; Name: pchar; first_parameter_type: TGType; args: array of const): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_object_invoke_method(Value: PJSCValue; Name: pchar; first_parameter_type: TGType): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_object_invoke_methodv(Value: PJSCValue; Name: pchar; n_parameters: Tguint; parameters: PPJSCValue): PJSCValue; cdecl; external libjavascriptcoregtk;
procedure jsc_value_object_define_property_data(Value: PJSCValue; property_name: pchar; flags: TJSCValuePropertyFlags; property_value: PJSCValue); cdecl; external libjavascriptcoregtk;
procedure jsc_value_object_define_property_accessor(Value: PJSCValue; property_name: pchar; flags: TJSCValuePropertyFlags; property_type: TGType; getter: TGCallback;
  setter: TGCallback; user_data: Tgpointer; destroy_notify: TGDestroyNotify); cdecl; external libjavascriptcoregtk;
function jsc_value_new_function(context: PJSCContext; Name: pchar; callback: TGCallback; user_data: Tgpointer; destroy_notify: TGDestroyNotify;
  return_type: TGType; n_params: Tguint; args: array of const): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_new_function(context: PJSCContext; Name: pchar; callback: TGCallback; user_data: Tgpointer; destroy_notify: TGDestroyNotify;
  return_type: TGType; n_params: Tguint): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_new_functionv(context: PJSCContext; Name: pchar; callback: TGCallback; user_data: Tgpointer; destroy_notify: TGDestroyNotify;
  return_type: TGType; n_parameters: Tguint; parameter_types: PGType): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_new_function_variadic(context: PJSCContext; Name: pchar; callback: TGCallback; user_data: Tgpointer; destroy_notify: TGDestroyNotify;
  return_type: TGType): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_is_function(Value: PJSCValue): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_value_function_call(Value: PJSCValue; first_parameter_type: TGType; args: array of const): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_function_call(Value: PJSCValue; first_parameter_type: TGType): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_function_callv(Value: PJSCValue; n_parameters: Tguint; parameters: PPJSCValue): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_new_array_buffer(context: PJSCContext; Data: Tgpointer; size: Tgsize; destroy_notify: TGDestroyNotify; user_data: Tgpointer): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_is_array_buffer(Value: PJSCValue): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_value_array_buffer_get_data(Value: PJSCValue; size: Pgsize): Tgpointer; cdecl; external libjavascriptcoregtk;
function jsc_value_array_buffer_get_size(Value: PJSCValue): Tgsize; cdecl; external libjavascriptcoregtk;
function jsc_value_new_typed_array(context: PJSCContext; _type: TJSCTypedArrayType; length: Tgsize): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_new_typed_array_with_buffer(array_buffer: PJSCValue; _type: TJSCTypedArrayType; offset: Tgsize; length: Tgssize): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_is_typed_array(Value: PJSCValue): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_value_typed_array_get_type(Value: PJSCValue): TJSCTypedArrayType; cdecl; external libjavascriptcoregtk;
function jsc_value_typed_array_get_data(Value: PJSCValue; length: Pgsize): Tgpointer; cdecl; external libjavascriptcoregtk;
function jsc_value_typed_array_get_length(Value: PJSCValue): Tgsize; cdecl; external libjavascriptcoregtk;
function jsc_value_typed_array_get_size(Value: PJSCValue): Tgsize; cdecl; external libjavascriptcoregtk;
function jsc_value_typed_array_get_offset(Value: PJSCValue): Tgsize; cdecl; external libjavascriptcoregtk;
function jsc_value_typed_array_get_buffer(Value: PJSCValue): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_is_constructor(Value: PJSCValue): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_value_constructor_call(Value: PJSCValue; first_parameter_type: TGType; args: array of const): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_constructor_call(Value: PJSCValue; first_parameter_type: TGType): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_constructor_callv(Value: PJSCValue; n_parameters: Tguint; parameters: PPJSCValue): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_new_from_json(context: PJSCContext; json: pchar): PJSCValue; cdecl; external libjavascriptcoregtk;
function jsc_value_to_json(Value: PJSCValue; indent: Tguint): pchar; cdecl; external libjavascriptcoregtk;

// === Konventiert am: 4-1-25 17:29:05 ===

function JSC_TYPE_VALUE: TGType;
function JSC_VALUE(obj: Pointer): PJSCValue;
function JSC_IS_VALUE(obj: Pointer): Tgboolean;

{$ENDIF read_interface}


{$IFDEF read_implementation}

function JSC_TYPE_VALUE: TGType;
begin
  Result := jsc_value_get_type;
end;

function JSC_VALUE(obj: Pointer): PJSCValue;
begin
  Result := PJSCValue(g_type_check_instance_cast(obj, JSC_TYPE_VALUE));
end;

function JSC_IS_VALUE(obj: Pointer): Tgboolean;
begin
  Result := g_type_check_instance_is_a(obj, JSC_TYPE_VALUE);
end;


{$ENDIF read_implementation}
