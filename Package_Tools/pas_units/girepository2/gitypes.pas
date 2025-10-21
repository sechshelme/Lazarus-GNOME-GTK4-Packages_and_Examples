unit gitypes;

interface

uses
  fp_glib2, fp_girepository2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGIBaseInfoStack = record
    parent_instance: TGTypeInstance;
    dummy0: longint;
    dummy1: array[0..2] of pointer;
    dummy2: array[0..1] of Tuint32_t;
    dummy3: array[0..5] of pointer;
  end;
  PGIBaseInfoStack = ^TGIBaseInfoStack;

type
  PGICallableInfo = type Pointer;
  PGIFunctionInfo = type Pointer;
  PGICallbackInfo = type Pointer;
  PGIRegisteredTypeInfo = type Pointer;
  PGIStructInfo = type Pointer;
  PGIUnionInfo = type Pointer;
  PGIEnumInfo = type Pointer;
  PGIFlagsInfo = type Pointer;
  PGIObjectInfo = type Pointer;
  PGIInterfaceInfo = type Pointer;
  PGIConstantInfo = type Pointer;
  PGIValueInfo = type Pointer;
  PGISignalInfo = type Pointer;
  PGIVFuncInfo = type Pointer;
  PGIPropertyInfo = type Pointer;
  PGIFieldInfo = type Pointer;

function gi_callable_info_get_type: TGType; cdecl; external libgirepository2;
function gi_function_info_get_type: TGType; cdecl; external libgirepository2;
function gi_callback_info_get_type: TGType; cdecl; external libgirepository2;
function gi_registered_type_info_get_type: TGType; cdecl; external libgirepository2;
function gi_struct_info_get_type: TGType; cdecl; external libgirepository2;
function gi_union_info_get_type: TGType; cdecl; external libgirepository2;
function gi_enum_info_get_type: TGType; cdecl; external libgirepository2;
function gi_flags_info_get_type: TGType; cdecl; external libgirepository2;
function gi_object_info_get_type: TGType; cdecl; external libgirepository2;
function gi_interface_info_get_type: TGType; cdecl; external libgirepository2;
function gi_constant_info_get_type: TGType; cdecl; external libgirepository2;
function gi_value_info_get_type: TGType; cdecl; external libgirepository2;
function gi_signal_info_get_type: TGType; cdecl; external libgirepository2;
function gi_vfunc_info_get_type: TGType; cdecl; external libgirepository2;
function gi_property_info_get_type: TGType; cdecl; external libgirepository2;
function gi_field_info_get_type: TGType; cdecl; external libgirepository2;

type
  TGIArgInfo = record
    parent: TGIBaseInfoStack;
    padding: array[0..5] of pointer;
  end;
  PGIArgInfo = ^TGIArgInfo;

function gi_arg_info_get_type: TGType; cdecl; external libgirepository2;

type
  TGITypeInfo = record
    parent: TGIBaseInfoStack;
    padding: array[0..5] of pointer;
  end;
  PGITypeInfo = ^TGITypeInfo;

function gi_type_info_get_type: TGType; cdecl; external libgirepository2;

type
  PGIUnresolvedInfo = type Pointer;

function gi_unresolved_info_get_type: TGType; cdecl; external libgirepository2;

type
  TGIArgument = record
    case longint of
      0: (v_boolean: Tgboolean);
      1: (v_int8: Tint8_t);
      2: (v_uint8: Tuint8_t);
      3: (v_int16: Tint16_t);
      4: (v_uint16: Tuint16_t);
      5: (v_int32: Tint32_t);
      6: (v_uint32: Tuint32_t);
      7: (v_int64: Tint64_t);
      8: (v_uint64: Tuint64_t);
      9: (v_float: single);
      10: (v_double: double);
      11: (v_short: smallint);
      12: (v_ushort: word);
      13: (v_int: longint);
      14: (v_uint: dword);
      15: (v_long: longint);
      16: (v_ulong: dword);
      17: (v_ssize: Tgssize);
      18: (v_size: Tsize_t);
      19: (v_string: pchar);
      20: (v_pointer: pointer);
  end;
  PGIArgument = ^TGIArgument;

type
  PGITransfer = ^TGITransfer;
  TGITransfer = longint;

const
  GI_TRANSFER_NOTHING = 0;
  GI_TRANSFER_CONTAINER = 1;
  GI_TRANSFER_EVERYTHING = 2;

type
  PGIDirection = ^TGIDirection;
  TGIDirection = longint;

const
  GI_DIRECTION_IN = 0;
  GI_DIRECTION_OUT = 1;
  GI_DIRECTION_INOUT = 2;

type
  PGIScopeType = ^TGIScopeType;
  TGIScopeType = longint;

const
  GI_SCOPE_TYPE_INVALID = 0;
  GI_SCOPE_TYPE_CALL = 1;
  GI_SCOPE_TYPE_ASYNC = 2;
  GI_SCOPE_TYPE_NOTIFIED = 3;
  GI_SCOPE_TYPE_FOREVER = 4;

type
  PGITypeTag = ^TGITypeTag;
  TGITypeTag = longint;

const
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
  GI_TYPE_TAG_N_TYPES = GI_TYPE_TAG_UNICHAR + 1;

type
  PGIArrayType = ^TGIArrayType;
  TGIArrayType = longint;

const
  GI_ARRAY_TYPE_C = 0;
  GI_ARRAY_TYPE_ARRAY = 1;
  GI_ARRAY_TYPE_PTR_ARRAY = 2;
  GI_ARRAY_TYPE_BYTE_ARRAY = 3;

type
  PGIFieldInfoFlags = ^TGIFieldInfoFlags;
  TGIFieldInfoFlags = longint;

const
  GI_FIELD_IS_READABLE = 1 shl 0;
  GI_FIELD_IS_WRITABLE = 1 shl 1;

type
  PGIVFuncInfoFlags = ^TGIVFuncInfoFlags;
  TGIVFuncInfoFlags = longint;

const
  GI_VFUNC_MUST_CHAIN_UP = 1 shl 0;
  GI_VFUNC_MUST_OVERRIDE = 1 shl 1;
  GI_VFUNC_MUST_NOT_OVERRIDE = 1 shl 2;

type
  PGIFunctionInfoFlags = ^TGIFunctionInfoFlags;
  TGIFunctionInfoFlags = longint;

const
  GI_FUNCTION_IS_METHOD = 1 shl 0;
  GI_FUNCTION_IS_CONSTRUCTOR = 1 shl 1;
  GI_FUNCTION_IS_GETTER = 1 shl 2;
  GI_FUNCTION_IS_SETTER = 1 shl 3;
  GI_FUNCTION_WRAPS_VFUNC = 1 shl 4;

  // === Konventiert am: 21-10-25 13:37:01 ===


implementation



end.
