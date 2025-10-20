unit gitypes;

interface

uses
  fp_glib2, fp_girepository;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  TGIBaseInfoStub = record
    dummy1: Tgint32;
    dummy2: Tgint32;
    dummy3: Tgpointer;
    dummy4: Tgpointer;
    dummy5: Tgpointer;
    dummy6: Tguint32;
    dummy7: Tguint32;
    padding: array[0..3] of Tgpointer;
  end;
  PGIBaseInfoStub = ^TGIBaseInfoStub;

  TGIBaseInfo = TGIBaseInfoStub;
  PGIBaseInfo = ^TGIBaseInfo;

  PGICallableInfo = ^TGICallableInfo;
  TGICallableInfo = TGIBaseInfo;

  PGIFunctionInfo = ^TGIFunctionInfo;
  TGIFunctionInfo = TGIBaseInfo;

  PGICallbackInfo = ^TGICallbackInfo;
  TGICallbackInfo = TGIBaseInfo;

  PGIRegisteredTypeInfo = ^TGIRegisteredTypeInfo;
  TGIRegisteredTypeInfo = TGIBaseInfo;

  PGIStructInfo = ^TGIStructInfo;
  TGIStructInfo = TGIBaseInfo;

  PGIUnionInfo = ^TGIUnionInfo;
  TGIUnionInfo = TGIBaseInfo;

  PGIEnumInfo = ^TGIEnumInfo;
  TGIEnumInfo = TGIBaseInfo;

  PPGIObjectInfo = ^PGIObjectInfo;
  PGIObjectInfo = ^TGIObjectInfo;
  TGIObjectInfo = TGIBaseInfo;

  PPPGIInterfaceInfo = ^PPGIInterfaceInfo;
  PPGIInterfaceInfo = ^PGIInterfaceInfo;
  PGIInterfaceInfo = ^TGIInterfaceInfo;
  TGIInterfaceInfo = TGIBaseInfo;

  PGIConstantInfo = ^TGIConstantInfo;
  TGIConstantInfo = TGIBaseInfo;

  PGIValueInfo = ^TGIValueInfo;
  TGIValueInfo = TGIBaseInfo;

  PGISignalInfo = ^TGISignalInfo;
  TGISignalInfo = TGIBaseInfo;

  PGIVFuncInfo = ^TGIVFuncInfo;
  TGIVFuncInfo = TGIBaseInfo;

  PGIPropertyInfo = ^TGIPropertyInfo;
  TGIPropertyInfo = TGIBaseInfo;

  PGIFieldInfo = ^TGIFieldInfo;
  TGIFieldInfo = TGIBaseInfo;

  PGIArgInfo = ^TGIArgInfo;
  TGIArgInfo = TGIBaseInfo;

  PGITypeInfo = ^TGITypeInfo;
  TGITypeInfo = TGIBaseInfo;

  TGIArgument = record
    case longint of
      0: (v_boolean: Tgboolean);
      1: (v_int8: Tgint8);
      2: (v_uint8: Tguint8);
      3: (v_int16: Tgint16);
      4: (v_uint16: Tguint16);
      5: (v_int32: Tgint32);
      6: (v_uint32: Tguint32);
      7: (v_int64: Tgint64);
      8: (v_uint64: Tguint64);
      9: (v_float: Tgfloat);
      10: (v_double: Tgdouble);
      11: (v_short: Tgshort);
      12: (v_ushort: Tgushort);
      13: (v_int: Tgint);
      14: (v_uint: Tguint);
      15: (v_long: Tglong);
      16: (v_ulong: Tgulong);
      17: (v_ssize: Tgssize);
      18: (v_size: Tgsize);
      19: (v_string: Pgchar);
      20: (v_pointer: Tgpointer);
  end;
  PGIArgument = ^TGIArgument;

type
  PGIInfoType = ^TGIInfoType;
  TGIInfoType = longint;

const
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
  GI_VFUNC_THROWS = 1 shl 3;

type
  PGIFunctionInfoFlags = ^TGIFunctionInfoFlags;
  TGIFunctionInfoFlags = longint;

const
  GI_FUNCTION_IS_METHOD = 1 shl 0;
  GI_FUNCTION_IS_CONSTRUCTOR = 1 shl 1;
  GI_FUNCTION_IS_GETTER = 1 shl 2;
  GI_FUNCTION_IS_SETTER = 1 shl 3;
  GI_FUNCTION_WRAPS_VFUNC = 1 shl 4;
  GI_FUNCTION_THROWS = 1 shl 5;

type
  PGArgument = ^TGArgument;
  TGArgument = TGIArgument;

  PGTypelib = type Pointer;

  // === Konventiert am: 20-10-25 16:02:26 ===


implementation



end.
