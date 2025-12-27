unit graphblas;

interface

const
  {$IFDEF linux}
  libgraphblas = 'graphblas';
  {$ENDIF}

  {$IFDEF windows}
  libgraphblas = 'graphblas.dll'; // ??????
  {$ENDIF}

type
  Tuint8_t = uint8;
  Puint8_t = ^Tuint8_t;
  PPuint8_t = ^Puint8_t;
  Tuint16_t = uint16;
  Puint16_t = ^Tuint16_t;
  PPuint16_t = ^Puint16_t;
  Tuint32_t = uint32;
  Puint32_t = ^Tuint32_t;
  PPuint32_t = ^Puint32_t;
  Tuint64_t = uint64;
  Puint64_t = ^Tuint64_t;
  PPuint64_t = ^Puint64_t;

  Tint8_t = int8;
  Pint8_t = ^Tint8_t;
  PPint8_t = ^Pint8_t;
  Tint16_t = int16;
  Pint16_t = ^Tint16_t;
  PPint16_t = ^Pint16_t;
  Tint32_t = int32;
  Pint32_t = ^Tint32_t;
  PPint32_t = ^Pint32_t;
  Tint64_t = int64;
  Pint64_t = ^Tint64_t;
  PPint64_t = ^Pint64_t;

  TSize_t = SizeUInt;
  PSize_t = ^TSize_t;

  PFILE = type Pointer;

const
  INT64_MAX = 9223372036854775807;  // 2^63 - 1


  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  GxB_STDC_VERSION = 199001;

type
  TGxB_FC32_t = record
    re, im: single;
  end;
  PGxB_FC32_t = ^TGxB_FC32_t;

  TGxB_FC64_t = record
    re, im: double;
  end;
  PGxB_FC64_t = ^TGxB_FC64_t;

function GxB_VERSION(major, minor, sub: longint): longint;

const
  GxB_IMPLEMENTATION_NAME = 'SuiteSparse:GraphBLAS';
  GxB_IMPLEMENTATION_DATE = 'Dec 23, 2022';
  GxB_IMPLEMENTATION_MAJOR = 7;
  GxB_IMPLEMENTATION_MINOR = 4;
  GxB_IMPLEMENTATION_SUB = 0;
  GxB_SPEC_DATE = 'Nov 15, 2021';
  GxB_SPEC_MAJOR = 2;
  GxB_SPEC_MINOR = 0;
  GxB_SPEC_SUB = 0;
  GRB_VERSION = GxB_SPEC_MAJOR;
  GRB_SUBVERSION = GxB_SPEC_MINOR;

function GxB_IMPLEMENTATION: longint;

function GxB_SPEC_VERSION: longint;

type
  PPGrB_Index = ^PGrB_Index;
  PGrB_Index = ^TGrB_Index;
  TGrB_Index = Tuint64_t;

function GrB_INDEX_MAX: longint;

function GxB_INDEX_MAX: TGrB_Index;

type
  PGrB_Info = ^TGrB_Info;
  TGrB_Info = longint;

const
  GrB_SUCCESS = 0;
  GrB_NO_VALUE = 1;
  GxB_EXHAUSTED = 2;
  GrB_UNINITIALIZED_OBJECT = -(1);
  GrB_NULL_POINTER = -(2);
  GrB_INVALID_VALUE = -(3);
  GrB_INVALID_INDEX = -(4);
  GrB_DOMAIN_MISMATCH = -(5);
  GrB_DIMENSION_MISMATCH = -(6);
  GrB_OUTPUT_NOT_EMPTY = -(7);
  GrB_NOT_IMPLEMENTED = -(8);
  GrB_PANIC = -(101);
  GrB_OUT_OF_MEMORY = -(102);
  GrB_INSUFFICIENT_SPACE = -(103);
  GrB_INVALID_OBJECT = -(104);
  GrB_INDEX_OUT_OF_BOUNDS = -(105);
  GrB_EMPTY_OBJECT = -(106);

type
  PGrB_Mode = ^TGrB_Mode;
  TGrB_Mode = longint;

const
  GrB_NONBLOCKING = 0;
  GrB_BLOCKING = 1;
  GxB_NONBLOCKING_GPU = 2;
  GxB_BLOCKING_GPU = 3;

function GrB_init(mode: TGrB_Mode): TGrB_Info; cdecl; external libgraphblas;

type
  TUserMalloc = function(size: TSize_t): Pointer; cdecl;
  TUserCalloc = function(count: TSize_t; size: TSize_t): Pointer; cdecl;
  TUserRealloc = function(p: Pointer; size: TSize_t): Pointer; cdecl;
  TUserFree = procedure(p: Pointer); cdecl;

function GxB_init(mode: TGrB_Mode; user_malloc: TUserMalloc; user_calloc: TUserCalloc; user_realloc: TUserRealloc; user_free: TUserFree): TGrB_Info; cdecl; external libgraphblas;
function GrB_finalize: TGrB_Info; cdecl; external libgraphblas;
function GrB_getVersion(version: Pdword; subversion: Pdword): TGrB_Info; cdecl; external libgraphblas;

const
  GxB_NTHREADS = 5;
  GxB_CHUNK = 7;
  GxB_GPU_CONTROL = 21;
  GxB_GPU_CHUNK = 22;

type
  PGrB_Desc_Field = ^TGrB_Desc_Field;
  TGrB_Desc_Field = longint;

const
  GrB_OUTP = 0;
  GrB_MASK = 1;
  GrB_INP0 = 2;
  GrB_INP1 = 3;
  GxB_DESCRIPTOR_NTHREADS = GxB_NTHREADS;
  GxB_DESCRIPTOR_CHUNK = GxB_CHUNK;
  GxB_DESCRIPTOR_GPU_CONTROL = GxB_GPU_CONTROL;
  GxB_DESCRIPTOR_GPU_CHUNK = GxB_GPU_CHUNK;
  GxB_AxB_METHOD = 1000;
  GxB_SORT = 35;
  GxB_COMPRESSION = 36;
  GxB_IMPORT = 37;

type
  PGrB_Desc_Value = ^TGrB_Desc_Value;
  TGrB_Desc_Value = longint;

const
  GxB_DEFAULT = 0;
  GrB_REPLACE = 1;
  GrB_COMP = 2;
  GrB_STRUCTURE = 4;
  GrB_TRAN = 3;
  GxB_GPU_ALWAYS = 2001;
  GxB_GPU_NEVER = 2002;
  GxB_AxB_GUSTAVSON = 1001;
  GxB_AxB_DOT = 1003;
  GxB_AxB_HASH = 1004;
  GxB_AxB_SAXPY = 1005;
  GxB_SECURE_IMPORT = 502;
  GxB_FAST_IMPORT = GxB_DEFAULT;

type
  PGrB_Descriptor = ^TGrB_Descriptor;
  TGrB_Descriptor = Pointer;

function GrB_Descriptor_new(descriptor: PGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Descriptor_set(desc: TGrB_Descriptor; field: TGrB_Desc_Field; val: TGrB_Desc_Value): TGrB_Info; cdecl; external libgraphblas;
function GxB_Descriptor_get(val: PGrB_Desc_Value; desc: TGrB_Descriptor; field: TGrB_Desc_Field): TGrB_Info; cdecl; external libgraphblas;
function GxB_Desc_set(desc: TGrB_Descriptor; field: TGrB_Desc_Field): TGrB_Info; cdecl; varargs; external libgraphblas;
function GxB_Desc_set_INT32(desc: TGrB_Descriptor; field: TGrB_Desc_Field; value: Tint32_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Desc_set_FP64(desc: TGrB_Descriptor; field: TGrB_Desc_Field; value: double): TGrB_Info; cdecl; external libgraphblas;
function GxB_Desc_get(desc: TGrB_Descriptor; field: TGrB_Desc_Field): TGrB_Info; cdecl; varargs; external libgraphblas;
function GxB_Desc_get_INT32(desc: TGrB_Descriptor; field: TGrB_Desc_Field; value: Pint32_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Desc_get_FP64(desc: TGrB_Descriptor; field: TGrB_Desc_Field; value: Pdouble): TGrB_Info; cdecl; external libgraphblas;
function GrB_Descriptor_free(descriptor: PGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

var
  GrB_DESC_T1: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_T0: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_T0T1: TGrB_Descriptor; cvar; external libgraphblas;

  GrB_DESC_C: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_CT1: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_CT0: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_CT0T1: TGrB_Descriptor; cvar; external libgraphblas;

  GrB_DESC_S: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_ST1: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_ST0: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_ST0T1: TGrB_Descriptor; cvar; external libgraphblas;

  GrB_DESC_SC: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_SCT1: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_SCT0: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_SCT0T1: TGrB_Descriptor; cvar; external libgraphblas;

  GrB_DESC_R: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_RT1: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_RT0: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_RT0T1: TGrB_Descriptor; cvar; external libgraphblas;

  GrB_DESC_RC: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_RCT1: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_RCT0: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_RCT0T1: TGrB_Descriptor; cvar; external libgraphblas;

  GrB_DESC_RS: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_RST1: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_RST0: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_RST0T1: TGrB_Descriptor; cvar; external libgraphblas;

  GrB_DESC_RSC: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_RSCT1: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_RSCT0: TGrB_Descriptor; cvar; external libgraphblas;
  GrB_DESC_RSCT0T1: TGrB_Descriptor; cvar; external libgraphblas;

type
  PGrB_Type = ^TGrB_Type;
  TGrB_Type = Pointer;

var
  GrB_BOOL: TGrB_Type; cvar;external libgraphblas;
  GrB_INT8: TGrB_Type; cvar; external libgraphblas;
  GrB_INT16: TGrB_Type; cvar; external libgraphblas;
  GrB_INT32: TGrB_Type; cvar; external libgraphblas;
  GrB_INT64: TGrB_Type; cvar; external libgraphblas;
  GrB_UINT8: TGrB_Type; cvar; external libgraphblas;
  GrB_UINT16: TGrB_Type; cvar; external libgraphblas;
  GrB_UINT32: TGrB_Type; cvar; external libgraphblas;
  GrB_UINT64: TGrB_Type; cvar; external libgraphblas;
  GrB_FP32: TGrB_Type; cvar; external libgraphblas;
  GrB_FP64: TGrB_Type; cvar; external libgraphblas;
  GxB_FC32: TGrB_Type; cvar; external libgraphblas;
  GxB_FC64: TGrB_Type; cvar; external libgraphblas;

function Type_new(_type: PGrB_Type; sizeof_ctype: Tsize_t): TGrB_Info; cdecl; external libgraphblas;

const
  GxB_MAX_NAME_LEN = 128;

function GxB_Type_new(_type: PGrB_Type; sizeof_ctype: Tsize_t; type_name: pchar; type_defn: pchar): TGrB_Info; cdecl; external libgraphblas;
function GB_Type_new(_type: PGrB_Type; sizeof_ctype: Tsize_t; type_name: pchar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Type_name(type_name: pchar; _type: TGrB_Type): TGrB_Info; cdecl; external libgraphblas;
function GxB_Type_size(size: Psize_t; _type: TGrB_Type): TGrB_Info; cdecl; external libgraphblas;
function GxB_Type_from_name(_type: PGrB_Type; type_name: pchar): TGrB_Info; cdecl; external libgraphblas;
function GrB_Type_free(_type: PGrB_Type): TGrB_Info; cdecl; external libgraphblas;

type
  PGrB_UnaryOp = ^TGrB_UnaryOp;
  TGrB_UnaryOp = Pointer;

var
  GrB_IDENTITY_BOOL: TGrB_UnaryOp; cvar;external libgraphblas;
  GxB_ABS_BOOL: TGrB_UnaryOp; cvar;external libgraphblas;
  GxB_SQRT_FP32: TGrB_UnaryOp; cvar;external libgraphblas;

type
  TGxB_unary_function = procedure(para1: pointer; para2: pointer); cdecl;

function UnaryOp_new(unaryop: PGrB_UnaryOp; _function: TGxB_unary_function; ztype: TGrB_Type; xtype: TGrB_Type): TGrB_Info; cdecl; external libgraphblas;
function GxB_UnaryOp_new(unaryop: PGrB_UnaryOp; _function: TGxB_unary_function; ztype: TGrB_Type; xtype: TGrB_Type; unop_name: pchar; unop_defn: pchar): TGrB_Info; cdecl; external libgraphblas;
function GB_UnaryOp_new(unaryop: PGrB_UnaryOp; _function: TGxB_unary_function; ztype: TGrB_Type; xtype: TGrB_Type; unop_name: pchar): TGrB_Info; cdecl; external libgraphblas;
function GxB_UnaryOp_ztype(ztype: PGrB_Type; unaryop: TGrB_UnaryOp): TGrB_Info; cdecl; external libgraphblas;
function GxB_UnaryOp_ztype_name(type_name: pchar; unaryop: TGrB_UnaryOp): TGrB_Info; cdecl; external libgraphblas;
function GxB_UnaryOp_xtype(xtype: PGrB_Type; unaryop: TGrB_UnaryOp): TGrB_Info; cdecl; external libgraphblas;
function GxB_UnaryOp_xtype_name(type_name: pchar; unaryop: TGrB_UnaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_UnaryOp_free(unaryop: PGrB_UnaryOp): TGrB_Info; cdecl; external libgraphblas;

type
  PGrB_BinaryOp = ^TGrB_BinaryOp;
  TGrB_BinaryOp = Pointer;

var
  GrB_FIRST_BOOL: TGrB_BinaryOp; cvar;external libgraphblas;
  GxB_BSHIFT_INT8: TGrB_BinaryOp; cvar;external libgraphblas;
  GrB_EQ_BOOL: TGrB_BinaryOp; cvar;external libgraphblas;
  GxB_CMPLX_FP32: TGrB_BinaryOp; cvar;external libgraphblas;
  GxB_FIRSTI_INT32: TGrB_BinaryOp; cvar;external libgraphblas;
  GxB_POSITIONI_INT32: TGrB_UnaryOp; cvar;external libgraphblas;
  GxB_IGNORE_DUP: TGrB_BinaryOp; cvar;external libgraphblas;

type
  TGxB_binary_function = procedure(para1: pointer; para2: pointer; para3: pointer); cdecl;

function BinaryOp_new(binaryop: PGrB_BinaryOp; _function: TGxB_binary_function; ztype: TGrB_Type; xtype: TGrB_Type; ytype: TGrB_Type): TGrB_Info; cdecl; external libgraphblas;

function GxB_BinaryOp_new(op: PGrB_BinaryOp; _function: TGxB_binary_function; ztype: TGrB_Type; xtype: TGrB_Type; ytype: TGrB_Type;
  binop_name: pchar; binop_defn: pchar): TGrB_Info; cdecl; external libgraphblas;
function GB_BinaryOp_new(binaryop: PGrB_BinaryOp; _function: TGxB_binary_function; ztype: TGrB_Type; xtype: TGrB_Type; ytype: TGrB_Type;
  binop_name: pchar): TGrB_Info; cdecl; external libgraphblas;
function GxB_BinaryOp_ztype(ztype: PGrB_Type; binaryop: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GxB_BinaryOp_ztype_name(type_name: pchar; binaryop: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GxB_BinaryOp_xtype(xtype: PGrB_Type; binaryop: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GxB_BinaryOp_xtype_name(type_name: pchar; binaryop: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GxB_BinaryOp_ytype(ytype: PGrB_Type; binaryop: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GxB_BinaryOp_ytype_name(type_name: pchar; binaryop: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_BinaryOp_free(binaryop: PGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;

type
  PGxB_SelectOp = ^TGxB_SelectOp;
  TGxB_SelectOp = Pointer;

var
  GxB_TRIL: TGxB_SelectOp; cvar;external libgraphblas;

type
  TGxB_select_function = function(i: TGrB_Index; j: TGrB_Index; x: pointer; thunk: pointer): boolean; cdecl;

function SelectOp_new(selectop: PGxB_SelectOp; _function: TGxB_select_function; xtype: TGrB_Type; ttype: TGrB_Type): TGrB_Info; cdecl; external libgraphblas;

function GB_SelectOp_new(selectop: PGxB_SelectOp; _function: TGxB_select_function; xtype: TGrB_Type; ttype: TGrB_Type; name: pchar): TGrB_Info; cdecl; external libgraphblas;
function GxB_SelectOp_xtype(xtype: PGrB_Type; selectop: TGxB_SelectOp): TGrB_Info; cdecl; external libgraphblas;
function GxB_SelectOp_ttype(ttype: PGrB_Type; selectop: TGxB_SelectOp): TGrB_Info; cdecl; external libgraphblas;
function GxB_SelectOp_free(selectop: PGxB_SelectOp): TGrB_Info; cdecl; external libgraphblas;

type
  PGrB_IndexUnaryOp = ^TGrB_IndexUnaryOp;
  TGrB_IndexUnaryOp = Pointer;

  TGxB_index_unary_function = procedure(z: pointer; x: pointer; i: TGrB_Index; j: TGrB_Index; y: pointer); cdecl;

function IndexUnaryOp_new(op: PGrB_IndexUnaryOp; _function: TGxB_index_unary_function; ztype: TGrB_Type; xtype: TGrB_Type; ytype: TGrB_Type): TGrB_Info; cdecl; external libgraphblas;

function GxB_IndexUnaryOp_new(op: PGrB_IndexUnaryOp; _function: TGxB_index_unary_function; ztype: TGrB_Type; xtype: TGrB_Type; ytype: TGrB_Type;
  idxop_name: pchar; idxop_defn: pchar): TGrB_Info; cdecl; external libgraphblas;
function GxB_IndexUnaryOp_ztype_name(type_name: pchar; op: TGrB_IndexUnaryOp): TGrB_Info; cdecl; external libgraphblas;
function GxB_IndexUnaryOp_xtype_name(type_name: pchar; op: TGrB_IndexUnaryOp): TGrB_Info; cdecl; external libgraphblas;
function GxB_IndexUnaryOp_ytype_name(type_name: pchar; op: TGrB_IndexUnaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_IndexUnaryOp_free(op: PGrB_IndexUnaryOp): TGrB_Info; cdecl; external libgraphblas;

var
  GrB_ROWINDEX_INT32: TGrB_IndexUnaryOp; cvar;external libgraphblas;

type
  PGrB_Monoid = ^TGrB_Monoid;
  TGrB_Monoid = Pointer;

function GrB_Monoid_new_BOOL(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: boolean): TGrB_Info; cdecl; external libgraphblas;
function GrB_Monoid_new_INT8(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: Tint8_t): TGrB_Info; cdecl; external libgraphblas;
function GrB_Monoid_new_UINT8(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: Tuint8_t): TGrB_Info; cdecl; external libgraphblas;
function GrB_Monoid_new_INT16(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: Tint16_t): TGrB_Info; cdecl; external libgraphblas;
function GrB_Monoid_new_UINT16(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: Tuint16_t): TGrB_Info; cdecl; external libgraphblas;
function GrB_Monoid_new_INT32(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: Tint32_t): TGrB_Info; cdecl; external libgraphblas;
function GrB_Monoid_new_UINT32(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: Tuint32_t): TGrB_Info; cdecl; external libgraphblas;
function GrB_Monoid_new_INT64(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: Tint64_t): TGrB_Info; cdecl; external libgraphblas;
function GrB_Monoid_new_UINT64(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: Tuint64_t): TGrB_Info; cdecl; external libgraphblas;
function GrB_Monoid_new_FP32(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: single): TGrB_Info; cdecl; external libgraphblas;
function GrB_Monoid_new_FP64(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: double): TGrB_Info; cdecl; external libgraphblas;
function GxB_Monoid_new_FC32(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: TGxB_FC32_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Monoid_new_FC64(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: TGxB_FC64_t): TGrB_Info; cdecl; external libgraphblas;
function GrB_Monoid_new_UDT(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: pointer): TGrB_Info; cdecl; external libgraphblas;

function GxB_Monoid_terminal_new_BOOL(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: boolean; terminal: boolean): TGrB_Info; cdecl; external libgraphblas;
function GxB_Monoid_terminal_new_INT8(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: Tint8_t; terminal: Tint8_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Monoid_terminal_new_UINT8(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: Tuint8_t; terminal: Tuint8_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Monoid_terminal_new_INT16(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: Tint16_t; terminal: Tint16_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Monoid_terminal_new_UINT16(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: Tuint16_t; terminal: Tuint16_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Monoid_terminal_new_INT32(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: Tint32_t; terminal: Tint32_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Monoid_terminal_new_UINT32(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: Tuint32_t; terminal: Tuint32_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Monoid_terminal_new_INT64(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: Tint64_t; terminal: Tint64_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Monoid_terminal_new_UINT64(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: Tuint64_t; terminal: Tuint64_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Monoid_terminal_new_FP32(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: single; terminal: single): TGrB_Info; cdecl; external libgraphblas;
function GxB_Monoid_terminal_new_FP64(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: double; terminal: double): TGrB_Info; cdecl; external libgraphblas;
function GxB_Monoid_terminal_new_FC32(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: TGxB_FC32_t; terminal: TGxB_FC32_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Monoid_terminal_new_FC64(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: TGxB_FC64_t; terminal: TGxB_FC64_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Monoid_terminal_new_UDT(monoid: PGrB_Monoid; op: TGrB_BinaryOp; identity: pointer; terminal: pointer): TGrB_Info; cdecl; external libgraphblas;

function GxB_Monoid_operator(op: PGrB_BinaryOp; monoid: TGrB_Monoid): TGrB_Info; cdecl; external libgraphblas;
function GxB_Monoid_identity(identity: pointer; monoid: TGrB_Monoid): TGrB_Info; cdecl; external libgraphblas;
function GxB_Monoid_terminal(has_terminal: PBoolean; terminal: pointer; monoid: TGrB_Monoid): TGrB_Info; cdecl; external libgraphblas;
function GrB_Monoid_free(monoid: PGrB_Monoid): TGrB_Info; cdecl; external libgraphblas;

type
  PGrB_Semiring = ^TGrB_Semiring;
  TGrB_Semiring = Pointer;

function GrB_Semiring_new(semiring: PGrB_Semiring; add: TGrB_Monoid; multiply: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GxB_Semiring_add(add: PGrB_Monoid; semiring: TGrB_Semiring): TGrB_Info; cdecl; external libgraphblas;
function GxB_Semiring_multiply(multiply: PGrB_BinaryOp; semiring: TGrB_Semiring): TGrB_Info; cdecl; external libgraphblas;
function GrB_Semiring_free(semiring: PGrB_Semiring): TGrB_Info; cdecl; external libgraphblas;

type
  PGxB_Scalar = ^TGxB_Scalar;
  TGxB_Scalar = Pointer;

  PGrB_Scalar = ^TGrB_Scalar;
  TGrB_Scalar = Pointer;

function GrB_Scalar_new(s: PGrB_Scalar; _type: TGrB_Type): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_dup(s: PGrB_Scalar; t: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_clear(s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_nvals(nvals: PGrB_Index; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_type(_type: PGrB_Type; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_type_name(type_name: pchar; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_memoryUsage(size: Psize_t; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_free(s: PGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_new(s: PGrB_Scalar; _type: TGrB_Type): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_dup(s: PGrB_Scalar; t: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_clear(s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_nvals(nvals: PGrB_Index; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_free(s: PGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;

function GrB_Scalar_setElement_BOOL(s: TGrB_Scalar; x: boolean): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_setElement_INT8(s: TGrB_Scalar; x: Tint8_t): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_setElement_UINT8(s: TGrB_Scalar; x: Tuint8_t): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_setElement_INT16(s: TGrB_Scalar; x: Tint16_t): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_setElement_UINT16(s: TGrB_Scalar; x: Tuint16_t): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_setElement_INT32(s: TGrB_Scalar; x: Tint32_t): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_setElement_UINT32(s: TGrB_Scalar; x: Tuint32_t): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_setElement_INT64(s: TGrB_Scalar; x: Tint64_t): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_setElement_UINT64(s: TGrB_Scalar; x: Tuint64_t): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_setElement_FP32(s: TGrB_Scalar; x: single): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_setElement_FP64(s: TGrB_Scalar; x: double): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_setElement_FC32(s: TGrB_Scalar; x: TGxB_FC32_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_setElement_FC64(s: TGrB_Scalar; x: TGxB_FC64_t): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_setElement_UDT(s: TGrB_Scalar; x: pointer): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_setElement_BOOL(s: TGrB_Scalar; x: boolean): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_setElement_INT8(s: TGrB_Scalar; x: Tint8_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_setElement_INT16(s: TGrB_Scalar; x: Tint16_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_setElement_INT32(s: TGrB_Scalar; x: Tint32_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_setElement_INT64(s: TGrB_Scalar; x: Tint64_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_setElement_UINT8(s: TGrB_Scalar; x: Tuint8_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_setElement_UINT16(s: TGrB_Scalar; x: Tuint16_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_setElement_UINT32(s: TGrB_Scalar; x: Tuint32_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_setElement_UINT64(s: TGrB_Scalar; x: Tuint64_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_setElement_FP32(s: TGrB_Scalar; x: single): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_setElement_FP64(s: TGrB_Scalar; x: double): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_setElement_UDT(s: TGrB_Scalar; x: pointer): TGrB_Info; cdecl; external libgraphblas;

function GrB_Scalar_extractElement_BOOL(x: PBoolean; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_extractElement_INT8(x: Pint8_t; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_extractElement_UINT8(x: Puint8_t; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_extractElement_INT16(x: Pint16_t; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_extractElement_UINT16(x: Puint16_t; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_extractElement_INT32(x: Pint32_t; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_extractElement_UINT32(x: Puint32_t; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_extractElement_INT64(x: Pint64_t; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_extractElement_UINT64(x: Puint64_t; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_extractElement_FP32(x: Psingle; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_extractElement_FP64(x: Pdouble; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_extractElement_FC32(x: PGxB_FC32_t; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_extractElement_FC64(x: PGxB_FC64_t; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_extractElement_UDT(x: pointer; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_extractElement_BOOL(x: PBoolean; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_extractElement_INT8(x: Pint8_t; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_extractElement_INT16(x: Pint16_t; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_extractElement_INT32(x: Pint32_t; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_extractElement_INT64(x: Pint64_t; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_extractElement_UINT8(x: Puint8_t; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_extractElement_UINT16(x: Puint16_t; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_extractElement_UINT32(x: Puint32_t; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_extractElement_UINT64(x: Puint64_t; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_extractElement_FP32(x: Psingle; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_extractElement_FP64(x: Pdouble; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_extractElement_UDT(x: pointer; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;

type
  PGrB_Vector = ^TGrB_Vector;
  TGrB_Vector = Pointer;

function GrB_Vector_new(v: PGrB_Vector; _type: TGrB_Type; n: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_dup(w: PGrB_Vector; u: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_clear(v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_size(n: PGrB_Index; v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_nvals(nvals: PGrB_Index; v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_type(_type: PGrB_Type; v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_type_name(type_name: pchar; v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_memoryUsage(size: Psize_t; v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_iso(iso: PBoolean; v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_free(v: PGrB_Vector): TGrB_Info; cdecl; external libgraphblas;

function GrB_Vector_build_BOOL(w: TGrB_Vector; I: PGrB_Index; X: PBoolean; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_build_INT8(w: TGrB_Vector; I: PGrB_Index; X: Pint8_t; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_build_UINT8(w: TGrB_Vector; I: PGrB_Index; X: Puint8_t; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_build_INT16(w: TGrB_Vector; I: PGrB_Index; X: Pint16_t; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_build_UINT16(w: TGrB_Vector; I: PGrB_Index; X: Puint16_t; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_build_INT32(w: TGrB_Vector; I: PGrB_Index; X: Pint32_t; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_build_UINT32(w: TGrB_Vector; I: PGrB_Index; X: Puint32_t; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_build_INT64(w: TGrB_Vector; I: PGrB_Index; X: Pint64_t; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_build_UINT64(w: TGrB_Vector; I: PGrB_Index; X: Puint64_t; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_build_FP32(w: TGrB_Vector; I: PGrB_Index; X: Psingle; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_build_FP64(w: TGrB_Vector; I: PGrB_Index; X: Pdouble; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_build_FC32(w: TGrB_Vector; I: PGrB_Index; X: PGxB_FC32_t; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_build_FC64(w: TGrB_Vector; I: PGrB_Index; X: PGxB_FC64_t; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_build_UDT(w: TGrB_Vector; I: PGrB_Index; X: pointer; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_build_Scalar(w: TGrB_Vector; I: PGrB_Index; scalar: TGrB_Scalar; nvals: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;

function GrB_Vector_setElement_BOOL(w: TGrB_Vector; x: boolean; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_setElement_INT8(w: TGrB_Vector; x: Tint8_t; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_setElement_UINT8(w: TGrB_Vector; x: Tuint8_t; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_setElement_INT16(w: TGrB_Vector; x: Tint16_t; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_setElement_UINT16(w: TGrB_Vector; x: Tuint16_t; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_setElement_INT32(w: TGrB_Vector; x: Tint32_t; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_setElement_UINT32(w: TGrB_Vector; x: Tuint32_t; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_setElement_INT64(w: TGrB_Vector; x: Tint64_t; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_setElement_UINT64(w: TGrB_Vector; x: Tuint64_t; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_setElement_FP32(w: TGrB_Vector; x: single; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_setElement_FP64(w: TGrB_Vector; x: double; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_setElement_FC32(w: TGrB_Vector; x: TGxB_FC32_t; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_setElement_FC64(w: TGrB_Vector; x: TGxB_FC64_t; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_setElement_UDT(w: TGrB_Vector; x: pointer; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_setElement_Scalar(w: TGrB_Vector; x: TGrB_Scalar; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;

function GrB_Vector_extractElement_BOOL(x: PBoolean; v: TGrB_Vector; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractElement_INT8(x: Pint8_t; v: TGrB_Vector; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractElement_UINT8(x: Puint8_t; v: TGrB_Vector; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractElement_INT16(x: Pint16_t; v: TGrB_Vector; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractElement_UINT16(x: Puint16_t; v: TGrB_Vector; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractElement_INT32(x: Pint32_t; v: TGrB_Vector; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractElement_UINT32(x: Puint32_t; v: TGrB_Vector; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractElement_INT64(x: Pint64_t; v: TGrB_Vector; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractElement_UINT64(x: Puint64_t; v: TGrB_Vector; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractElement_FP32(x: Psingle; v: TGrB_Vector; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractElement_FP64(x: Pdouble; v: TGrB_Vector; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_extractElement_FC32(x: PGxB_FC32_t; v: TGrB_Vector; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_extractElement_FC64(x: PGxB_FC64_t; v: TGrB_Vector; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractElement_UDT(x: pointer; v: TGrB_Vector; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractElement_Scalar(x: TGrB_Scalar; v: TGrB_Vector; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;

function GxB_Vector_isStoredElement(v: TGrB_Vector; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_removeElement(v: TGrB_Vector; i: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;

function GrB_Vector_extractTuples_BOOL(I: PGrB_Index; X: PBoolean; nvals: PGrB_Index; v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractTuples_INT8(I: PGrB_Index; X: Pint8_t; nvals: PGrB_Index; v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractTuples_UINT8(I: PGrB_Index; X: Puint8_t; nvals: PGrB_Index; v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractTuples_INT16(I: PGrB_Index; X: Pint16_t; nvals: PGrB_Index; v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractTuples_UINT16(I: PGrB_Index; X: Puint16_t; nvals: PGrB_Index; v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractTuples_INT32(I: PGrB_Index; X: Pint32_t; nvals: PGrB_Index; v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractTuples_UINT32(I: PGrB_Index; X: Puint32_t; nvals: PGrB_Index; v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractTuples_INT64(I: PGrB_Index; X: Pint64_t; nvals: PGrB_Index; v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractTuples_UINT64(I: PGrB_Index; X: Puint64_t; nvals: PGrB_Index; v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractTuples_FP32(I: PGrB_Index; X: Psingle; nvals: PGrB_Index; v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractTuples_FP64(I: PGrB_Index; X: Pdouble; nvals: PGrB_Index; v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_extractTuples_FC32(I: PGrB_Index; X: PGxB_FC32_t; nvals: PGrB_Index; v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_extractTuples_FC64(I: PGrB_Index; X: PGxB_FC64_t; nvals: PGrB_Index; v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_extractTuples_UDT(I: PGrB_Index; X: pointer; nvals: PGrB_Index; v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;

type
  PGrB_Matrix = ^TGrB_Matrix;
  TGrB_Matrix = Pointer;

function GrB_Matrix_new(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_dup(C: PGrB_Matrix; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_clear(A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_nrows(nrows: PGrB_Index; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_ncols(ncols: PGrB_Index; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_nvals(nvals: PGrB_Index; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_type(_type: PGrB_Type; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_type_name(type_name: pchar; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_memoryUsage(size: Psize_t; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_iso(iso: PBoolean; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_free(A: PGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;

function GrB_Matrix_build_BOOL(C: TGrB_Matrix; I: PGrB_Index; J: PGrB_Index; X: PBoolean; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_build_INT8(C: TGrB_Matrix; I: PGrB_Index; J: PGrB_Index; X: Pint8_t; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_build_UINT8(C: TGrB_Matrix; I: PGrB_Index; J: PGrB_Index; X: Puint8_t; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_build_INT16(C: TGrB_Matrix; I: PGrB_Index; J: PGrB_Index; X: Pint16_t; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_build_UINT16(C: TGrB_Matrix; I: PGrB_Index; J: PGrB_Index; X: Puint16_t; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_build_INT32(C: TGrB_Matrix; I: PGrB_Index; J: PGrB_Index; X: Pint32_t; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_build_UINT32(C: TGrB_Matrix; I: PGrB_Index; J: PGrB_Index; X: Puint32_t; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_build_INT64(C: TGrB_Matrix; I: PGrB_Index; J: PGrB_Index; X: Pint64_t; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_build_UINT64(C: TGrB_Matrix; I: PGrB_Index; J: PGrB_Index; X: Puint64_t; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_build_FP32(C: TGrB_Matrix; I: PGrB_Index; J: PGrB_Index; X: Psingle; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_build_FP64(C: TGrB_Matrix; I: PGrB_Index; J: PGrB_Index; X: Pdouble; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_build_FC32(C: TGrB_Matrix; I: PGrB_Index; J: PGrB_Index; X: PGxB_FC32_t; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_build_FC64(C: TGrB_Matrix; I: PGrB_Index; J: PGrB_Index; X: PGxB_FC64_t; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_build_UDT(C: TGrB_Matrix; I: PGrB_Index; J: PGrB_Index; X: pointer; nvals: TGrB_Index; dup: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_build_Scalar(C: TGrB_Matrix; I: PGrB_Index; J: PGrB_Index; scalar: TGrB_Scalar; nvals: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;

function GrB_Matrix_setElement_BOOL(C: TGrB_Matrix; x: boolean; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_setElement_INT8(C: TGrB_Matrix; x: Tint8_t; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_setElement_UINT8(C: TGrB_Matrix; x: Tuint8_t; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_setElement_INT16(C: TGrB_Matrix; x: Tint16_t; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_setElement_UINT16(C: TGrB_Matrix; x: Tuint16_t; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_setElement_INT32(C: TGrB_Matrix; x: Tint32_t; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_setElement_UINT32(C: TGrB_Matrix; x: Tuint32_t; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_setElement_INT64(C: TGrB_Matrix; x: Tint64_t; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_setElement_UINT64(C: TGrB_Matrix; x: Tuint64_t; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_setElement_FP32(C: TGrB_Matrix; x: single; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_setElement_FP64(C: TGrB_Matrix; x: double; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_setElement_FC32(C: TGrB_Matrix; x: TGxB_FC32_t; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_setElement_FC64(C: TGrB_Matrix; x: TGxB_FC64_t; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_setElement_UDT(C: TGrB_Matrix; x: pointer; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_setElement_Scalar(C: TGrB_Matrix; x: TGrB_Scalar; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;

function GrB_Matrix_extractElement_BOOL(x: PBoolean; A: TGrB_Matrix; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractElement_INT8(x: Pint8_t; A: TGrB_Matrix; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractElement_UINT8(x: Puint8_t; A: TGrB_Matrix; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractElement_INT16(x: Pint16_t; A: TGrB_Matrix; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractElement_UINT16(x: Puint16_t; A: TGrB_Matrix; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractElement_INT32(x: Pint32_t; A: TGrB_Matrix; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractElement_UINT32(x: Puint32_t; A: TGrB_Matrix; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractElement_INT64(x: Pint64_t; A: TGrB_Matrix; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractElement_UINT64(x: Puint64_t; A: TGrB_Matrix; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractElement_FP32(x: Psingle; A: TGrB_Matrix; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractElement_FP64(x: Pdouble; A: TGrB_Matrix; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_extractElement_FC32(x: PGxB_FC32_t; A: TGrB_Matrix; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_extractElement_FC64(x: PGxB_FC64_t; A: TGrB_Matrix; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractElement_UDT(x: pointer; A: TGrB_Matrix; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractElement_Scalar(x: TGrB_Scalar; A: TGrB_Matrix; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;

function GxB_Matrix_isStoredElement(A: TGrB_Matrix; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_removeElement(C: TGrB_Matrix; i: TGrB_Index; j: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;

function GrB_Matrix_extractTuples_BOOL(I: PGrB_Index; J: PGrB_Index; X: PBoolean; nvals: PGrB_Index; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractTuples_INT8(I: PGrB_Index; J: PGrB_Index; X: Pint8_t; nvals: PGrB_Index; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractTuples_UINT8(I: PGrB_Index; J: PGrB_Index; X: Puint8_t; nvals: PGrB_Index; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractTuples_INT16(I: PGrB_Index; J: PGrB_Index; X: Pint16_t; nvals: PGrB_Index; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractTuples_UINT16(I: PGrB_Index; J: PGrB_Index; X: Puint16_t; nvals: PGrB_Index; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractTuples_INT32(I: PGrB_Index; J: PGrB_Index; X: Pint32_t; nvals: PGrB_Index; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractTuples_UINT32(I: PGrB_Index; J: PGrB_Index; X: Puint32_t; nvals: PGrB_Index; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractTuples_INT64(I: PGrB_Index; J: PGrB_Index; X: Pint64_t; nvals: PGrB_Index; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractTuples_UINT64(I: PGrB_Index; J: PGrB_Index; X: Puint64_t; nvals: PGrB_Index; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractTuples_FP32(I: PGrB_Index; J: PGrB_Index; X: Psingle; nvals: PGrB_Index; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractTuples_FP64(I: PGrB_Index; J: PGrB_Index; X: Pdouble; nvals: PGrB_Index; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_extractTuples_FC32(I: PGrB_Index; J: PGrB_Index; X: PGxB_FC32_t; nvals: PGrB_Index; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_extractTuples_FC64(I: PGrB_Index; J: PGrB_Index; X: PGxB_FC64_t; nvals: PGrB_Index; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extractTuples_UDT(I: PGrB_Index; J: PGrB_Index; X: pointer; nvals: PGrB_Index; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;

function GxB_Matrix_concat(C: TGrB_Matrix; Tiles: PGrB_Matrix; m: TGrB_Index; n: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_split(Tiles: PGrB_Matrix; m: TGrB_Index; n: TGrB_Index; Tile_nrows: PGrB_Index; Tile_ncols: PGrB_Index;
  A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_diag(C: PGrB_Matrix; v: TGrB_Vector; k: Tint64_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_diag(C: TGrB_Matrix; v: TGrB_Vector; k: Tint64_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_diag(v: TGrB_Vector; A: TGrB_Matrix; k: Tint64_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

const
  GxB_HYPER = 0;

type
  PGxB_Option_Field = ^TGxB_Option_Field;
  TGxB_Option_Field = longint;

const
  GxB_HYPER_SWITCH = 0;
  GxB_BITMAP_SWITCH = 34;
  GxB_FORMAT = 1;
  GxB_MODE = 2;
  GxB_LIBRARY_NAME = 8;
  GxB_LIBRARY_VERSION = 9;
  GxB_LIBRARY_DATE = 10;
  GxB_LIBRARY_ABOUT = 11;
  GxB_LIBRARY_URL = 12;
  GxB_LIBRARY_LICENSE = 13;
  GxB_LIBRARY_COMPILE_DATE = 14;
  GxB_LIBRARY_COMPILE_TIME = 15;
  GxB_API_VERSION = 16;
  GxB_API_DATE = 17;
  GxB_API_ABOUT = 18;
  GxB_API_URL = 19;
  GxB_COMPILER_VERSION = 23;
  GxB_COMPILER_NAME = 24;
  GxB_LIBRARY_OPENMP = 25;
  GxB_GLOBAL_NTHREADS = GxB_NTHREADS;
  GxB_GLOBAL_CHUNK = GxB_CHUNK;
  GxB_BURBLE = 99;
  GxB_PRINTF = 101;
  GxB_FLUSH = 102;
  GxB_MEMORY_POOL = 103;
  GxB_PRINT_1BASED = 104;
  GxB_SPARSITY_STATUS = 33;
  GxB_IS_HYPER = 6;
  GxB_SPARSITY_CONTROL = 32;
  GxB_GLOBAL_GPU_CONTROL = GxB_GPU_CONTROL;
  GxB_GLOBAL_GPU_CHUNK = GxB_GPU_CHUNK;

type
  PGxB_Format_Value = ^TGxB_Format_Value;
  TGxB_Format_Value = longint;

const
  GxB_BY_ROW = 0;
  GxB_BY_COL = 1;
  GxB_NO_FORMAT = -(1);

var
  GxB_FORMAT_DEFAULT: TGxB_Format_Value; cvar;external libgraphblas;
  GxB_HYPER_DEFAULT: double; cvar;external libgraphblas;

const
  GxB_HYPERSPARSE = 1;
  GxB_SPARSE = 2;
  GxB_BITMAP = 4;
  GxB_FULL = 8;
  GxB_NBITMAP_SWITCH = 8;
  GxB_ANY_SPARSITY = ((GxB_HYPERSPARSE + GxB_SPARSE) + GxB_BITMAP) + GxB_FULL;
  GxB_AUTO_SPARSITY = GxB_ANY_SPARSITY;

var
  GxB_ALWAYS_HYPER: double; cvar;external libgraphblas;

function GxB_Matrix_Option_set(A: TGrB_Matrix; field: TGxB_Option_Field): TGrB_Info; cdecl; varargs; external libgraphblas;
function GxB_Matrix_Option_set_INT32(A: TGrB_Matrix; field: TGxB_Option_Field; value: Tint32_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_Option_set_FP64(A: TGrB_Matrix; field: TGxB_Option_Field; value: double): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_Option_get(A: TGrB_Matrix; field: TGxB_Option_Field): TGrB_Info; cdecl; varargs; external libgraphblas;
function GxB_Matrix_Option_get_INT32(A: TGrB_Matrix; field: TGxB_Option_Field; value: Pint32_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_Option_get_FP64(A: TGrB_Matrix; field: TGxB_Option_Field; value: Pdouble): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_Option_set(A: TGrB_Vector; field: TGxB_Option_Field): TGrB_Info; cdecl; varargs; external libgraphblas;
function GxB_Vector_Option_set_INT32(v: TGrB_Vector; field: TGxB_Option_Field; value: Tint32_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_Option_set_FP64(v: TGrB_Vector; field: TGxB_Option_Field; value: double): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_Option_get(A: TGrB_Vector; field: TGxB_Option_Field): TGrB_Info; cdecl; varargs; external libgraphblas;
function GxB_Vector_Option_get_INT32(v: TGrB_Vector; field: TGxB_Option_Field; value: Pint32_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_Option_get_FP64(v: TGrB_Vector; field: TGxB_Option_Field; value: Pdouble): TGrB_Info; cdecl; external libgraphblas;
function GxB_Global_Option_set(field: TGxB_Option_Field): TGrB_Info; cdecl; varargs; external libgraphblas;
function GxB_Global_Option_set_INT32(field: TGxB_Option_Field; value: Tint32_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Global_Option_set_FP64(field: TGxB_Option_Field; value: double): TGrB_Info; cdecl; external libgraphblas;
function GxB_Global_Option_set_FP64_ARRAY(field: TGxB_Option_Field; value: Pdouble): TGrB_Info; cdecl; external libgraphblas;
function GxB_Global_Option_set_INT64_ARRAY(field: TGxB_Option_Field; value: Pint64_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Global_Option_set_FUNCTION(field: TGxB_Option_Field; value: pointer): TGrB_Info; cdecl; external libgraphblas;
function GxB_Global_Option_get(field: TGxB_Option_Field): TGrB_Info; cdecl; varargs; external libgraphblas;
function GxB_Global_Option_get_INT32(field: TGxB_Option_Field; value: Pint32_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Global_Option_get_FP64(field: TGxB_Option_Field; value: Pdouble): TGrB_Info; cdecl; external libgraphblas;
function GxB_Global_Option_get_INT64(field: TGxB_Option_Field; value: Pint64_t): TGrB_Info; cdecl; external libgraphblas;
function GxB_Global_Option_get_CHAR(field: TGxB_Option_Field; value: PPchar): TGrB_Info; cdecl; external libgraphblas;
function GxB_Global_Option_get_FUNCTION(field: TGxB_Option_Field; value: Ppointer): TGrB_Info; cdecl; external libgraphblas;

const
  GrB_NULL = nil;
  GrB_INVALID_HANDLE = nil;

type
  PGrB_WaitMode = ^TGrB_WaitMode;
  TGrB_WaitMode = longint;

const
  GrB_COMPLETE = 0;
  GrB_MATERIALIZE = 1;

function GrB_Type_wait(_type: TGrB_Type; waitmode: TGrB_WaitMode): TGrB_Info; cdecl; external libgraphblas;
function GrB_UnaryOp_wait(op: TGrB_UnaryOp; waitmode: TGrB_WaitMode): TGrB_Info; cdecl; external libgraphblas;
function GrB_BinaryOp_wait(op: TGrB_BinaryOp; waitmode: TGrB_WaitMode): TGrB_Info; cdecl; external libgraphblas;
function GxB_SelectOp_wait(op: TGxB_SelectOp; waitmode: TGrB_WaitMode): TGrB_Info; cdecl; external libgraphblas;
function GrB_IndexUnaryOp_wait(op: TGrB_IndexUnaryOp; waitmode: TGrB_WaitMode): TGrB_Info; cdecl; external libgraphblas;
function GrB_Monoid_wait(monoid: TGrB_Monoid; waitmode: TGrB_WaitMode): TGrB_Info; cdecl; external libgraphblas;
function GrB_Semiring_wait(semiring: TGrB_Semiring; waitmode: TGrB_WaitMode): TGrB_Info; cdecl; external libgraphblas;
function GrB_Descriptor_wait(desc: TGrB_Descriptor; waitmode: TGrB_WaitMode): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_wait(s: TGrB_Scalar; waitmode: TGrB_WaitMode): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_wait(v: TGrB_Vector; waitmode: TGrB_WaitMode): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_wait(A: TGrB_Matrix; waitmode: TGrB_WaitMode): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_wait(s: PGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;

function GrB_Type_error(error: PPchar; _type: TGrB_Type): TGrB_Info; cdecl; external libgraphblas;
function GrB_UnaryOp_error(error: PPchar; op: TGrB_UnaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_BinaryOp_error(error: PPchar; op: TGrB_BinaryOp): TGrB_Info; cdecl; external libgraphblas;
function GxB_SelectOp_error(error: PPchar; op: TGxB_SelectOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_IndexUnaryOp_error(error: PPchar; op: TGrB_IndexUnaryOp): TGrB_Info; cdecl; external libgraphblas;
function GrB_Monoid_error(error: PPchar; monoid: TGrB_Monoid): TGrB_Info; cdecl; external libgraphblas;
function GrB_Semiring_error(error: PPchar; semiring: TGrB_Semiring): TGrB_Info; cdecl; external libgraphblas;
function GrB_Scalar_error(error: PPchar; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_error(error: PPchar; v: TGrB_Vector): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_error(error: PPchar; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Descriptor_error(error: PPchar; d: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_error(error: PPchar; s: TGrB_Scalar): TGrB_Info; cdecl; external libgraphblas;

function GrB_mxm(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; semiring: TGrB_Semiring; A: TGrB_Matrix;
  B: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_vxm(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; semiring: TGrB_Semiring; u: TGrB_Vector;
  A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_mxv(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; semiring: TGrB_Semiring; A: TGrB_Matrix;
  u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GrB_Vector_eWiseMult_Semiring(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; semiring: TGrB_Semiring; u: TGrB_Vector;
  v: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_eWiseMult_Monoid(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; u: TGrB_Vector;
  v: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_eWiseMult_BinaryOp(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; mult: TGrB_BinaryOp; u: TGrB_Vector;
  v: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_eWiseMult_Semiring(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; semiring: TGrB_Semiring; A: TGrB_Matrix;
  B: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_eWiseMult_Monoid(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; A: TGrB_Matrix;
  B: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_eWiseMult_BinaryOp(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; mult: TGrB_BinaryOp; A: TGrB_Matrix;
  B: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GrB_Vector_eWiseAdd_Semiring(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; semiring: TGrB_Semiring; u: TGrB_Vector;
  v: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_eWiseAdd_Monoid(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; u: TGrB_Vector;
  v: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_eWiseAdd_BinaryOp(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; add: TGrB_BinaryOp; u: TGrB_Vector;
  v: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_eWiseAdd_Semiring(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; semiring: TGrB_Semiring; A: TGrB_Matrix;
  B: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_eWiseAdd_Monoid(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; A: TGrB_Matrix;
  B: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_eWiseAdd_BinaryOp(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; add: TGrB_BinaryOp; A: TGrB_Matrix;
  B: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GxB_Vector_eWiseUnion(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; add: TGrB_BinaryOp; u: TGrB_Vector;
  alpha: TGrB_Scalar; v: TGrB_Vector; beta: TGrB_Scalar; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_eWiseUnion(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; add: TGrB_BinaryOp; A: TGrB_Matrix;
  alpha: TGrB_Scalar; B: TGrB_Matrix; beta: TGrB_Scalar; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

var
  GrB_ALL: Puint64_t; cvar;external libgraphblas;

const
  GxB_RANGE = INT64_MAX;
  GxB_STRIDE = INT64_MAX - 1;
  GxB_BACKWARDS = INT64_MAX - 2;
  GxB_BEGIN = 0;
  GxB_END = 1;
  GxB_INC = 2;

function GrB_Vector_extract(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; u: TGrB_Vector; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_extract(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; A: TGrB_Matrix; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Col_extract(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; A: TGrB_Matrix; I: PGrB_Index;
  ni: TGrB_Index; j: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GxB_Vector_subassign(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; u: TGrB_Vector; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_subassign(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; A: TGrB_Matrix; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Col_subassign(C: TGrB_Matrix; mask: TGrB_Vector; accum: TGrB_BinaryOp; u: TGrB_Vector; I: PGrB_Index;
  ni: TGrB_Index; j: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Row_subassign(C: TGrB_Matrix; mask: TGrB_Vector; accum: TGrB_BinaryOp; u: TGrB_Vector; i: TGrB_Index;
  J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_subassign_BOOL(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: boolean; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_subassign_INT8(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: Tint8_t; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_subassign_UINT8(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: Tuint8_t; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_subassign_INT16(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: Tint16_t; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_subassign_UINT16(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: Tuint16_t; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_subassign_INT32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: Tint32_t; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_subassign_UINT32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: Tuint32_t; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_subassign_INT64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: Tint64_t; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_subassign_UINT64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: Tuint64_t; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_subassign_FP32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: single; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_subassign_FP64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: double; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_subassign_FC32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: TGxB_FC32_t; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_subassign_FC64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: TGxB_FC64_t; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_subassign_UDT(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: pointer; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_subassign_Scalar(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: TGrB_Scalar; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GxB_Matrix_subassign_BOOL(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: boolean; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_subassign_INT8(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: Tint8_t; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_subassign_UINT8(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: Tuint8_t; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_subassign_INT16(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: Tint16_t; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_subassign_UINT16(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: Tuint16_t; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_subassign_INT32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: Tint32_t; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_subassign_UINT32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: Tuint32_t; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_subassign_INT64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: Tint64_t; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_subassign_UINT64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: Tuint64_t; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_subassign_FP32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: single; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_subassign_FP64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: double; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_subassign_FC32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: TGxB_FC32_t; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_subassign_FC64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: TGxB_FC64_t; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_subassign_UDT(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: pointer; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_subassign_Scalar(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: TGrB_Scalar; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GrB_Vector_assign(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; u: TGrB_Vector; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_assign(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; A: TGrB_Matrix; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Col_assign(C: TGrB_Matrix; mask: TGrB_Vector; accum: TGrB_BinaryOp; u: TGrB_Vector; I: PGrB_Index;
  ni: TGrB_Index; j: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Row_assign(C: TGrB_Matrix; mask: TGrB_Vector; accum: TGrB_BinaryOp; u: TGrB_Vector; i: TGrB_Index;
  J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GrB_Vector_assign_BOOL(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: boolean; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_assign_INT8(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: Tint8_t; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_assign_UINT8(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: Tuint8_t; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_assign_INT16(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: Tint16_t; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_assign_UINT16(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: Tuint16_t; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_assign_INT32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: Tint32_t; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_assign_UINT32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: Tuint32_t; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_assign_INT64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: Tint64_t; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_assign_UINT64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: Tuint64_t; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_assign_FP32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: single; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_assign_FP64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: double; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_assign_FC32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: TGxB_FC32_t; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_assign_FC64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: TGxB_FC64_t; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_assign_UDT(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: pointer; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_assign_Scalar(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; x: TGrB_Scalar; I: PGrB_Index;
  ni: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GrB_Matrix_assign_BOOL(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: boolean; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_assign_INT8(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: Tint8_t; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_assign_UINT8(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: Tuint8_t; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_assign_INT16(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: Tint16_t; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_assign_UINT16(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: Tuint16_t; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_assign_INT32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: Tint32_t; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_assign_UINT32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: Tuint32_t; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_assign_INT64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: Tint64_t; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_assign_UINT64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: Tuint64_t; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_assign_FP32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: single; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_assign_FP64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: double; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_assign_FC32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: TGxB_FC32_t; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_assign_FC64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: TGxB_FC64_t; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_assign_UDT(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: pointer; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_assign_Scalar(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; x: TGrB_Scalar; I: PGrB_Index;
  ni: TGrB_Index; J: PGrB_Index; nj: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GrB_Vector_apply(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_UnaryOp; u: TGrB_Vector;
  desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_UnaryOp; A: TGrB_Matrix;
  desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GrB_Vector_apply_BinaryOp1st_Scalar(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: TGrB_Scalar;
  u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_apply_BinaryOp1st(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: TGrB_Scalar;
  u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp1st_BOOL(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: boolean;
  u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp1st_INT8(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: Tint8_t;
  u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp1st_INT16(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: Tint16_t;
  u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp1st_INT32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: Tint32_t;
  u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp1st_INT64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: Tint64_t;
  u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp1st_UINT8(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: Tuint8_t;
  u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp1st_UINT16(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: Tuint16_t;
  u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp1st_UINT32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: Tuint32_t;
  u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp1st_UINT64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: Tuint64_t;
  u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp1st_FP32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: single;
  u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp1st_FP64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: double;
  u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_apply_BinaryOp1st_FC32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: TGxB_FC32_t;
  u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_apply_BinaryOp1st_FC64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: TGxB_FC64_t;
  u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp1st_UDT(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: pointer;
  u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GrB_Vector_apply_BinaryOp2nd_Scalar(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; u: TGrB_Vector;
  y: TGrB_Scalar; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_apply_BinaryOp2nd(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; u: TGrB_Vector;
  y: TGrB_Scalar; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp2nd_BOOL(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; u: TGrB_Vector;
  y: boolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp2nd_INT8(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; u: TGrB_Vector;
  y: Tint8_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp2nd_INT16(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; u: TGrB_Vector;
  y: Tint16_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp2nd_INT32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; u: TGrB_Vector;
  y: Tint32_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp2nd_INT64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; u: TGrB_Vector;
  y: Tint64_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp2nd_UINT8(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; u: TGrB_Vector;
  y: Tuint8_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp2nd_UINT16(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; u: TGrB_Vector;
  y: Tuint16_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp2nd_UINT32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; u: TGrB_Vector;
  y: Tuint32_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp2nd_UINT64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; u: TGrB_Vector;
  y: Tuint64_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp2nd_FP32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; u: TGrB_Vector;
  y: single; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp2nd_FP64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; u: TGrB_Vector;
  y: double; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_apply_BinaryOp2nd_FC32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; u: TGrB_Vector;
  y: TGxB_FC32_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_apply_BinaryOp2nd_FC64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; u: TGrB_Vector;
  y: TGxB_FC64_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_BinaryOp2nd_UDT(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; u: TGrB_Vector;
  y: pointer; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GrB_Vector_apply_IndexOp_Scalar(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: TGrB_Scalar; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_IndexOp_BOOL(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: boolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_IndexOp_INT8(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: Tint8_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_IndexOp_INT16(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: Tint16_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_IndexOp_INT32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: Tint32_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_IndexOp_INT64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: Tint64_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_IndexOp_UINT8(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: Tuint8_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_IndexOp_UINT16(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: Tuint16_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_IndexOp_UINT32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: Tuint32_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_IndexOp_UINT64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: Tuint64_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_IndexOp_FP32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: single; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_IndexOp_FP64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: double; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_apply_IndexOp_FC32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: TGxB_FC32_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_apply_IndexOp_FC64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: TGxB_FC64_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_apply_IndexOp_UDT(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: pointer; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GrB_Matrix_apply_BinaryOp1st_Scalar(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: TGrB_Scalar;
  A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_apply_BinaryOp1st(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: TGrB_Scalar;
  A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp1st_BOOL(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: boolean;
  A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp1st_INT8(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: Tint8_t;
  A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp1st_INT16(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: Tint16_t;
  A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp1st_INT32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: Tint32_t;
  A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp1st_INT64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: Tint64_t;
  A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp1st_UINT8(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: Tuint8_t;
  A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp1st_UINT16(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: Tuint16_t;
  A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp1st_UINT32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: Tuint32_t;
  A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp1st_UINT64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: Tuint64_t;
  A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp1st_FP32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: single;
  A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp1st_FP64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: double;
  A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_apply_BinaryOp1st_FC32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: TGxB_FC32_t;
  A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_apply_BinaryOp1st_FC64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: TGxB_FC64_t;
  A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp1st_UDT(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; x: pointer;
  A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GrB_Matrix_apply_BinaryOp2nd_Scalar(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; A: TGrB_Matrix;
  y: TGrB_Scalar; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_apply_BinaryOp2nd(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; A: TGrB_Matrix;
  y: TGrB_Scalar; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp2nd_BOOL(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; A: TGrB_Matrix;
  y: boolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp2nd_INT8(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; A: TGrB_Matrix;
  y: Tint8_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp2nd_INT16(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; A: TGrB_Matrix;
  y: Tint16_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp2nd_INT32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; A: TGrB_Matrix;
  y: Tint32_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp2nd_INT64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; A: TGrB_Matrix;
  y: Tint64_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp2nd_UINT8(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; A: TGrB_Matrix;
  y: Tuint8_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp2nd_UINT16(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; A: TGrB_Matrix;
  y: Tuint16_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp2nd_UINT32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; A: TGrB_Matrix;
  y: Tuint32_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp2nd_UINT64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; A: TGrB_Matrix;
  y: Tuint64_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp2nd_FP32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; A: TGrB_Matrix;
  y: single; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp2nd_FP64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; A: TGrB_Matrix;
  y: double; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_apply_BinaryOp2nd_FC32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; A: TGrB_Matrix;
  y: TGxB_FC32_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_apply_BinaryOp2nd_FC64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; A: TGrB_Matrix;
  y: TGxB_FC64_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_BinaryOp2nd_UDT(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; A: TGrB_Matrix;
  y: pointer; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GrB_Matrix_apply_IndexOp_Scalar(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: TGrB_Scalar; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_IndexOp_BOOL(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: boolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_IndexOp_INT8(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: Tint8_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_IndexOp_INT16(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: Tint16_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_IndexOp_INT32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: Tint32_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_IndexOp_INT64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: Tint64_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_IndexOp_UINT8(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: Tuint8_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_IndexOp_UINT16(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: Tuint16_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_IndexOp_UINT32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: Tuint32_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_IndexOp_UINT64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: Tuint64_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_IndexOp_FP32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: single; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_IndexOp_FP64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: double; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_apply_IndexOp_FC32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: TGxB_FC32_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_apply_IndexOp_FC64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: TGxB_FC64_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_apply_IndexOp_UDT(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: pointer; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GrB_Vector_select_Scalar(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: TGrB_Scalar; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_select_BOOL(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: boolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_select_INT8(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: Tint8_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_select_INT16(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: Tint16_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_select_INT32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: Tint32_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_select_INT64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: Tint64_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_select_UINT8(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: Tuint8_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_select_UINT16(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: Tuint16_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_select_UINT32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: Tuint32_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_select_UINT64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: Tuint64_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_select_FP32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: single; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_select_FP64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: double; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_select_FC32(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: TGxB_FC32_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_select_FC64(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: TGxB_FC64_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_select_UDT(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; u: TGrB_Vector;
  y: pointer; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GrB_Matrix_select_Scalar(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: TGrB_Scalar; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_select_BOOL(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: boolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_select_INT8(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: Tint8_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_select_INT16(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: Tint16_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_select_INT32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: Tint32_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_select_INT64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: Tint64_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_select_UINT8(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: Tuint8_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_select_UINT16(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: Tuint16_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_select_UINT32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: Tuint32_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_select_UINT64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: Tuint64_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_select_FP32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: single; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_select_FP64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: double; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_select_FC32(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: TGxB_FC32_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_select_FC64(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: TGxB_FC64_t; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_select_UDT(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_IndexUnaryOp; A: TGrB_Matrix;
  y: pointer; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GxB_Vector_select(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGxB_SelectOp; u: TGrB_Vector;
  Thunk: TGrB_Scalar; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_select(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGxB_SelectOp; A: TGrB_Matrix;
  Thunk: TGrB_Scalar; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GrB_Matrix_reduce_Monoid(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; A: TGrB_Matrix;
  desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_reduce_BinaryOp(w: TGrB_Vector; mask: TGrB_Vector; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; A: TGrB_Matrix;
  desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GrB_Vector_reduce_BOOL(c: PBoolean; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_reduce_INT8(c: Pint8_t; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_reduce_UINT8(c: Puint8_t; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_reduce_INT16(c: Pint16_t; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_reduce_UINT16(c: Puint16_t; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_reduce_INT32(c: Pint32_t; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_reduce_UINT32(c: Puint32_t; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_reduce_INT64(c: Pint64_t; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_reduce_UINT64(c: Puint64_t; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_reduce_FP32(c: Psingle; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_reduce_FP64(c: Pdouble; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_reduce_FC32(c: PGxB_FC32_t; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_reduce_FC64(c: PGxB_FC64_t; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_reduce_UDT(c: pointer; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_reduce_Monoid_Scalar(c: TGrB_Scalar; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_reduce_BinaryOp_Scalar(c: TGrB_Scalar; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GrB_Matrix_reduce_BOOL(c: PBoolean; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_reduce_INT8(c: Pint8_t; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_reduce_UINT8(c: Puint8_t; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_reduce_INT16(c: Pint16_t; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_reduce_UINT16(c: Puint16_t; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_reduce_INT32(c: Pint32_t; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_reduce_UINT32(c: Puint32_t; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_reduce_INT64(c: Pint64_t; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_reduce_UINT64(c: Puint64_t; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_reduce_FP32(c: Psingle; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_reduce_FP64(c: Pdouble; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_reduce_FC32(c: PGxB_FC32_t; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_reduce_FC64(c: PGxB_FC64_t; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_reduce_UDT(c: pointer; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_reduce_Monoid_Scalar(c: TGrB_Scalar; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_reduce_BinaryOp_Scalar(S: TGrB_Scalar; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GrB_transpose(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GxB_kron(C: TGrB_Matrix; Mask: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; A: TGrB_Matrix;
  B: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_kronecker_BinaryOp(C: TGrB_Matrix; M: TGrB_Matrix; accum: TGrB_BinaryOp; op: TGrB_BinaryOp; A: TGrB_Matrix;
  B: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_kronecker_Monoid(C: TGrB_Matrix; M: TGrB_Matrix; accum: TGrB_BinaryOp; monoid: TGrB_Monoid; A: TGrB_Matrix;
  B: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_kronecker_Semiring(C: TGrB_Matrix; M: TGrB_Matrix; accum: TGrB_BinaryOp; semiring: TGrB_Semiring; A: TGrB_Matrix;
  B: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

var
  GxB_MIN_INT8_MONOID: TGrB_Monoid; cvar;external libgraphblas;
  GxB_MIN_FIRST_INT8: TGrB_Semiring; cvar;external libgraphblas;
  GrB_PLUS_TIMES_SEMIRING_INT8: TGrB_Semiring; cvar;external libgraphblas;

function GrB_Matrix_resize(C: TGrB_Matrix; nrows_new: TGrB_Index; ncols_new: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GrB_Vector_resize(w: TGrB_Vector; nrows_new: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_resize(C: TGrB_Matrix; nrows_new: TGrB_Index; ncols_new: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_resize(w: TGrB_Vector; nrows_new: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;

type
  PGxB_Print_Level = ^TGxB_Print_Level;
  TGxB_Print_Level = longint;

const
  GxB_SILENT = 0;
  GxB_SUMMARY = 1;
  GxB_SHORT = 2;
  GxB_COMPLETE = 3;
  GxB_SHORT_VERBOSE = 4;
  GxB_COMPLETE_VERBOSE = 5;

function GxB_Type_fprint(_type: TGrB_Type; name: pchar; pr: TGxB_Print_Level; f: PFILE): TGrB_Info; cdecl; external libgraphblas;
function GxB_UnaryOp_fprint(unaryop: TGrB_UnaryOp; name: pchar; pr: TGxB_Print_Level; f: PFILE): TGrB_Info; cdecl; external libgraphblas;
function GxB_BinaryOp_fprint(binaryop: TGrB_BinaryOp; name: pchar; pr: TGxB_Print_Level; f: PFILE): TGrB_Info; cdecl; external libgraphblas;
function GxB_IndexUnaryOp_fprint(op: TGrB_IndexUnaryOp; name: pchar; pr: TGxB_Print_Level; f: PFILE): TGrB_Info; cdecl; external libgraphblas;
function GxB_SelectOp_fprint(selectop: TGxB_SelectOp; name: pchar; pr: TGxB_Print_Level; f: PFILE): TGrB_Info; cdecl; external libgraphblas;
function GxB_Monoid_fprint(monoid: TGrB_Monoid; name: pchar; pr: TGxB_Print_Level; f: PFILE): TGrB_Info; cdecl; external libgraphblas;
function GxB_Semiring_fprint(semiring: TGrB_Semiring; name: pchar; pr: TGxB_Print_Level; f: PFILE): TGrB_Info; cdecl; external libgraphblas;
function GxB_Descriptor_fprint(descriptor: TGrB_Descriptor; name: pchar; pr: TGxB_Print_Level; f: PFILE): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_fprint(A: TGrB_Matrix; name: pchar; pr: TGxB_Print_Level; f: PFILE): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_fprint(v: TGrB_Vector; name: pchar; pr: TGxB_Print_Level; f: PFILE): TGrB_Info; cdecl; external libgraphblas;
function GxB_Scalar_fprint(s: TGrB_Scalar; name: pchar; pr: TGxB_Print_Level; f: PFILE): TGrB_Info; cdecl; external libgraphblas;

function GxB_Matrix_import_CSR(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ap: PPGrB_Index;
  Aj: PPGrB_Index; Ax: Ppointer; Ap_size: TGrB_Index; Aj_size: TGrB_Index; Ax_size: TGrB_Index;
  iso: boolean; jumbled: boolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_pack_CSR(A: TGrB_Matrix; Ap: PPGrB_Index; Aj: PPGrB_Index; Ax: Ppointer; Ap_size: TGrB_Index;
  Aj_size: TGrB_Index; Ax_size: TGrB_Index; iso: boolean; jumbled: boolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GxB_Matrix_import_CSC(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ap: PPGrB_Index;
  Ai: PPGrB_Index; Ax: Ppointer; Ap_size: TGrB_Index; Ai_size: TGrB_Index; Ax_size: TGrB_Index;
  iso: boolean; jumbled: boolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_pack_CSC(A: TGrB_Matrix; Ap: PPGrB_Index; Ai: PPGrB_Index; Ax: Ppointer; Ap_size: TGrB_Index;
  Ai_size: TGrB_Index; Ax_size: TGrB_Index; iso: boolean; jumbled: boolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_import_HyperCSR(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ap: PPGrB_Index;
  Ah: PPGrB_Index; Aj: PPGrB_Index; Ax: Ppointer; Ap_size: TGrB_Index; Ah_size: TGrB_Index;
  Aj_size: TGrB_Index; Ax_size: TGrB_Index; iso: boolean; nvec: TGrB_Index; jumbled: boolean;
  desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_pack_HyperCSR(A: TGrB_Matrix; Ap: PPGrB_Index; Ah: PPGrB_Index; Aj: PPGrB_Index; Ax: Ppointer;
  Ap_size: TGrB_Index; Ah_size: TGrB_Index; Aj_size: TGrB_Index; Ax_size: TGrB_Index; iso: boolean;
  nvec: TGrB_Index; jumbled: boolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GxB_Matrix_import_HyperCSC(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ap: PPGrB_Index;
  Ah: PPGrB_Index; Ai: PPGrB_Index; Ax: Ppointer; Ap_size: TGrB_Index; Ah_size: TGrB_Index;
  Ai_size: TGrB_Index; Ax_size: TGrB_Index; iso: boolean; nvec: TGrB_Index; jumbled: boolean;
  desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_pack_HyperCSC(A: TGrB_Matrix; Ap: PPGrB_Index; Ah: PPGrB_Index; Ai: PPGrB_Index; Ax: Ppointer;
  Ap_size: TGrB_Index; Ah_size: TGrB_Index; Ai_size: TGrB_Index; Ax_size: TGrB_Index; iso: boolean;
  nvec: TGrB_Index; jumbled: boolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GxB_Matrix_import_BitmapR(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ab: PPint8_t;
  Ax: Ppointer; Ab_size: TGrB_Index; Ax_size: TGrB_Index; iso: boolean; nvals: TGrB_Index;
  desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_pack_BitmapR(A: TGrB_Matrix; Ab: PPint8_t; Ax: Ppointer; Ab_size: TGrB_Index; Ax_size: TGrB_Index;
  iso: boolean; nvals: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GxB_Matrix_import_BitmapC(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ab: PPint8_t;
  Ax: Ppointer; Ab_size: TGrB_Index; Ax_size: TGrB_Index; iso: boolean; nvals: TGrB_Index;
  desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_pack_BitmapC(A: TGrB_Matrix; Ab: PPint8_t; Ax: Ppointer; Ab_size: TGrB_Index; Ax_size: TGrB_Index;
  iso: boolean; nvals: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GxB_Matrix_import_FullR(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ax: Ppointer;
  Ax_size: TGrB_Index; iso: boolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_pack_FullR(A: TGrB_Matrix; Ax: Ppointer; Ax_size: TGrB_Index; iso: boolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GxB_Matrix_import_FullC(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ax: Ppointer;
  Ax_size: TGrB_Index; iso: boolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_pack_FullC(A: TGrB_Matrix; Ax: Ppointer; Ax_size: TGrB_Index; iso: boolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GxB_Vector_import_CSC(v: PGrB_Vector; _type: TGrB_Type; n: TGrB_Index; vi: PPGrB_Index; vx: Ppointer;
  vi_size: TGrB_Index; vx_size: TGrB_Index; iso: boolean; nvals: TGrB_Index; jumbled: boolean;
  desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_pack_CSC(v: TGrB_Vector; vi: PPGrB_Index; vx: Ppointer; vi_size: TGrB_Index; vx_size: TGrB_Index;
  iso: boolean; nvals: TGrB_Index; jumbled: boolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GxB_Vector_import_Bitmap(v: PGrB_Vector; _type: TGrB_Type; n: TGrB_Index; vb: PPint8_t; vx: Ppointer;
  vb_size: TGrB_Index; vx_size: TGrB_Index; iso: boolean; nvals: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_pack_Bitmap(v: TGrB_Vector; vb: PPint8_t; vx: Ppointer; vb_size: TGrB_Index; vx_size: TGrB_Index;
  iso: boolean; nvals: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GxB_Vector_import_Full(v: PGrB_Vector; _type: TGrB_Type; n: TGrB_Index; vx: Ppointer; vx_size: TGrB_Index;
  iso: boolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_pack_Full(v: TGrB_Vector; vx: Ppointer; vx_size: TGrB_Index; iso: boolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GxB_Matrix_export_CSR(A: PGrB_Matrix; _type: PGrB_Type; nrows: PGrB_Index; ncols: PGrB_Index; Ap: PPGrB_Index;
  Aj: PPGrB_Index; Ax: Ppointer; Ap_size: PGrB_Index; Aj_size: PGrB_Index; Ax_size: PGrB_Index;
  iso: PBoolean; jumbled: PBoolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_unpack_CSR(A: TGrB_Matrix; Ap: PPGrB_Index; Aj: PPGrB_Index; Ax: Ppointer; Ap_size: PGrB_Index;
  Aj_size: PGrB_Index; Ax_size: PGrB_Index; iso: PBoolean; jumbled: PBoolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_export_CSC(A: PGrB_Matrix; _type: PGrB_Type; nrows: PGrB_Index; ncols: PGrB_Index; Ap: PPGrB_Index;
  Ai: PPGrB_Index; Ax: Ppointer; Ap_size: PGrB_Index; Ai_size: PGrB_Index; Ax_size: PGrB_Index;
  iso: PBoolean; jumbled: PBoolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_unpack_CSC(A: TGrB_Matrix; Ap: PPGrB_Index; Ai: PPGrB_Index; Ax: Ppointer; Ap_size: PGrB_Index;
  Ai_size: PGrB_Index; Ax_size: PGrB_Index; iso: PBoolean; jumbled: PBoolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_export_HyperCSR(A: PGrB_Matrix; _type: PGrB_Type; nrows: PGrB_Index; ncols: PGrB_Index; Ap: PPGrB_Index;
  Ah: PPGrB_Index; Aj: PPGrB_Index; Ax: Ppointer; Ap_size: PGrB_Index; Ah_size: PGrB_Index;
  Aj_size: PGrB_Index; Ax_size: PGrB_Index; iso: PBoolean; nvec: PGrB_Index; jumbled: PBoolean;
  desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_unpack_HyperCSR(A: TGrB_Matrix; Ap: PPGrB_Index; Ah: PPGrB_Index; Aj: PPGrB_Index; Ax: Ppointer;
  Ap_size: PGrB_Index; Ah_size: PGrB_Index; Aj_size: PGrB_Index; Ax_size: PGrB_Index; iso: PBoolean;
  nvec: PGrB_Index; jumbled: PBoolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_export_HyperCSC(A: PGrB_Matrix; _type: PGrB_Type; nrows: PGrB_Index; ncols: PGrB_Index; Ap: PPGrB_Index;
  Ah: PPGrB_Index; Ai: PPGrB_Index; Ax: Ppointer; Ap_size: PGrB_Index; Ah_size: PGrB_Index;
  Ai_size: PGrB_Index; Ax_size: PGrB_Index; iso: PBoolean; nvec: PGrB_Index; jumbled: PBoolean;
  desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_unpack_HyperCSC(A: TGrB_Matrix; Ap: PPGrB_Index; Ah: PPGrB_Index; Ai: PPGrB_Index; Ax: Ppointer;
  Ap_size: PGrB_Index; Ah_size: PGrB_Index; Ai_size: PGrB_Index; Ax_size: PGrB_Index; iso: PBoolean;
  nvec: PGrB_Index; jumbled: PBoolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_export_BitmapR(A: PGrB_Matrix; _type: PGrB_Type; nrows: PGrB_Index; ncols: PGrB_Index; Ab: PPint8_t;
  Ax: Ppointer; Ab_size: PGrB_Index; Ax_size: PGrB_Index; iso: PBoolean; nvals: PGrB_Index;
  desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_unpack_BitmapR(A: TGrB_Matrix; Ab: PPint8_t; Ax: Ppointer; Ab_size: PGrB_Index; Ax_size: PGrB_Index;
  iso: PBoolean; nvals: PGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_export_BitmapC(A: PGrB_Matrix; _type: PGrB_Type; nrows: PGrB_Index; ncols: PGrB_Index; Ab: PPint8_t;
  Ax: Ppointer; Ab_size: PGrB_Index; Ax_size: PGrB_Index; iso: PBoolean; nvals: PGrB_Index;
  desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_unpack_BitmapC(A: TGrB_Matrix; Ab: PPint8_t; Ax: Ppointer; Ab_size: PGrB_Index; Ax_size: PGrB_Index;
  iso: PBoolean; nvals: PGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_export_FullR(A: PGrB_Matrix; _type: PGrB_Type; nrows: PGrB_Index; ncols: PGrB_Index; Ax: Ppointer;
  Ax_size: PGrB_Index; iso: PBoolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_unpack_FullR(A: TGrB_Matrix; Ax: Ppointer; Ax_size: PGrB_Index; iso: PBoolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_export_FullC(A: PGrB_Matrix; _type: PGrB_Type; nrows: PGrB_Index; ncols: PGrB_Index; Ax: Ppointer;
  Ax_size: PGrB_Index; iso: PBoolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_unpack_FullC(A: TGrB_Matrix; Ax: Ppointer; Ax_size: PGrB_Index; iso: PBoolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_export_CSC(v: PGrB_Vector; _type: PGrB_Type; n: PGrB_Index; vi: PPGrB_Index; vx: Ppointer;
  vi_size: PGrB_Index; vx_size: PGrB_Index; iso: PBoolean; nvals: PGrB_Index; jumbled: PBoolean;
  desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_unpack_CSC(v: TGrB_Vector; vi: PPGrB_Index; vx: Ppointer; vi_size: PGrB_Index; vx_size: PGrB_Index;
  iso: PBoolean; nvals: PGrB_Index; jumbled: PBoolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_export_Bitmap(v: PGrB_Vector; _type: PGrB_Type; n: PGrB_Index; vb: PPint8_t; vx: Ppointer;
  vb_size: PGrB_Index; vx_size: PGrB_Index; iso: PBoolean; nvals: PGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_unpack_Bitmap(v: TGrB_Vector; vb: PPint8_t; vx: Ppointer; vb_size: PGrB_Index; vx_size: PGrB_Index;
  iso: PBoolean; nvals: PGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_export_Full(v: PGrB_Vector; _type: PGrB_Type; n: PGrB_Index; vx: Ppointer; vx_size: PGrB_Index;
  iso: PBoolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_unpack_Full(v: TGrB_Vector; vx: Ppointer; vx_size: PGrB_Index; iso: PBoolean; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

function GxB_unpack_HyperHash(A: TGrB_Matrix; Y: PGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_pack_HyperHash(A: TGrB_Matrix; Y: PGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

type
  PGrB_Format = ^TGrB_Format;
  TGrB_Format = longint;

const
  GrB_CSR_FORMAT = 0;
  GrB_CSC_FORMAT = 1;
  GrB_COO_FORMAT = 2;

function GrB_Matrix_import_BOOL(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ap: PGrB_Index;
  Ai: PGrB_Index; Ax: PBoolean; Ap_len: TGrB_Index; Ai_len: TGrB_Index; Ax_len: TGrB_Index;
  format: TGrB_Format): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_import_INT8(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ap: PGrB_Index;
  Ai: PGrB_Index; Ax: Pint8_t; Ap_len: TGrB_Index; Ai_len: TGrB_Index; Ax_len: TGrB_Index;
  format: TGrB_Format): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_import_INT16(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ap: PGrB_Index;
  Ai: PGrB_Index; Ax: Pint16_t; Ap_len: TGrB_Index; Ai_len: TGrB_Index; Ax_len: TGrB_Index;
  format: TGrB_Format): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_import_INT32(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ap: PGrB_Index;
  Ai: PGrB_Index; Ax: Pint32_t; Ap_len: TGrB_Index; Ai_len: TGrB_Index; Ax_len: TGrB_Index;
  format: TGrB_Format): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_import_INT64(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ap: PGrB_Index;
  Ai: PGrB_Index; Ax: Pint64_t; Ap_len: TGrB_Index; Ai_len: TGrB_Index; Ax_len: TGrB_Index;
  format: TGrB_Format): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_import_UINT8(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ap: PGrB_Index;
  Ai: PGrB_Index; Ax: Puint8_t; Ap_len: TGrB_Index; Ai_len: TGrB_Index; Ax_len: TGrB_Index;
  format: TGrB_Format): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_import_UINT16(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ap: PGrB_Index;
  Ai: PGrB_Index; Ax: Puint16_t; Ap_len: TGrB_Index; Ai_len: TGrB_Index; Ax_len: TGrB_Index;
  format: TGrB_Format): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_import_UINT32(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ap: PGrB_Index;
  Ai: PGrB_Index; Ax: Puint32_t; Ap_len: TGrB_Index; Ai_len: TGrB_Index; Ax_len: TGrB_Index;
  format: TGrB_Format): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_import_UINT64(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ap: PGrB_Index;
  Ai: PGrB_Index; Ax: Puint64_t; Ap_len: TGrB_Index; Ai_len: TGrB_Index; Ax_len: TGrB_Index;
  format: TGrB_Format): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_import_FP32(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ap: PGrB_Index;
  Ai: PGrB_Index; Ax: Psingle; Ap_len: TGrB_Index; Ai_len: TGrB_Index; Ax_len: TGrB_Index;
  format: TGrB_Format): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_import_FP64(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ap: PGrB_Index;
  Ai: PGrB_Index; Ax: Pdouble; Ap_len: TGrB_Index; Ai_len: TGrB_Index; Ax_len: TGrB_Index;
  format: TGrB_Format): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_import_FC32(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ap: PGrB_Index;
  Ai: PGrB_Index; Ax: PGxB_FC32_t; Ap_len: TGrB_Index; Ai_len: TGrB_Index; Ax_len: TGrB_Index;
  format: TGrB_Format): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_import_FC64(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ap: PGrB_Index;
  Ai: PGrB_Index; Ax: PGxB_FC64_t; Ap_len: TGrB_Index; Ai_len: TGrB_Index; Ax_len: TGrB_Index;
  format: TGrB_Format): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_import_UDT(A: PGrB_Matrix; _type: TGrB_Type; nrows: TGrB_Index; ncols: TGrB_Index; Ap: PGrB_Index;
  Ai: PGrB_Index; Ax: pointer; Ap_len: TGrB_Index; Ai_len: TGrB_Index; Ax_len: TGrB_Index;
  format: TGrB_Format): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_export_BOOL(Ap: PGrB_Index; Ai: PGrB_Index; Ax: PBoolean; Ap_len: PGrB_Index; Ai_len: PGrB_Index;
  Ax_len: PGrB_Index; format: TGrB_Format; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_export_INT8(Ap: PGrB_Index; Ai: PGrB_Index; Ax: Pint8_t; Ap_len: PGrB_Index; Ai_len: PGrB_Index;
  Ax_len: PGrB_Index; format: TGrB_Format; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_export_INT16(Ap: PGrB_Index; Ai: PGrB_Index; Ax: Pint16_t; Ap_len: PGrB_Index; Ai_len: PGrB_Index;
  Ax_len: PGrB_Index; format: TGrB_Format; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_export_INT32(Ap: PGrB_Index; Ai: PGrB_Index; Ax: Pint32_t; Ap_len: PGrB_Index; Ai_len: PGrB_Index;
  Ax_len: PGrB_Index; format: TGrB_Format; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_export_INT64(Ap: PGrB_Index; Ai: PGrB_Index; Ax: Pint64_t; Ap_len: PGrB_Index; Ai_len: PGrB_Index;
  Ax_len: PGrB_Index; format: TGrB_Format; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_export_UINT8(Ap: PGrB_Index; Ai: PGrB_Index; Ax: Puint8_t; Ap_len: PGrB_Index; Ai_len: PGrB_Index;
  Ax_len: PGrB_Index; format: TGrB_Format; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_export_UINT16(Ap: PGrB_Index; Ai: PGrB_Index; Ax: Puint16_t; Ap_len: PGrB_Index; Ai_len: PGrB_Index;
  Ax_len: PGrB_Index; format: TGrB_Format; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_export_UINT32(Ap: PGrB_Index; Ai: PGrB_Index; Ax: Puint32_t; Ap_len: PGrB_Index; Ai_len: PGrB_Index;
  Ax_len: PGrB_Index; format: TGrB_Format; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_export_UINT64(Ap: PGrB_Index; Ai: PGrB_Index; Ax: Puint64_t; Ap_len: PGrB_Index; Ai_len: PGrB_Index;
  Ax_len: PGrB_Index; format: TGrB_Format; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_export_FP32(Ap: PGrB_Index; Ai: PGrB_Index; Ax: Psingle; Ap_len: PGrB_Index; Ai_len: PGrB_Index;
  Ax_len: PGrB_Index; format: TGrB_Format; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_export_FP64(Ap: PGrB_Index; Ai: PGrB_Index; Ax: Pdouble; Ap_len: PGrB_Index; Ai_len: PGrB_Index;
  Ax_len: PGrB_Index; format: TGrB_Format; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_export_FC32(Ap: PGrB_Index; Ai: PGrB_Index; Ax: PGxB_FC32_t; Ap_len: PGrB_Index; Ai_len: PGrB_Index;
  Ax_len: PGrB_Index; format: TGrB_Format; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_export_FC64(Ap: PGrB_Index; Ai: PGrB_Index; Ax: PGxB_FC64_t; Ap_len: PGrB_Index; Ai_len: PGrB_Index;
  Ax_len: PGrB_Index; format: TGrB_Format; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_export_UDT(Ap: PGrB_Index; Ai: PGrB_Index; Ax: pointer; Ap_len: PGrB_Index; Ai_len: PGrB_Index;
  Ax_len: PGrB_Index; format: TGrB_Format; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_exportSize(Ap_len: PGrB_Index; Ai_len: PGrB_Index; Ax_len: PGrB_Index; format: TGrB_Format; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_exportHint(format: PGrB_Format; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;

const
  GxB_COMPRESSION_NONE = -(1);
  GxB_COMPRESSION_DEFAULT = 0;
  GxB_COMPRESSION_LZ4 = 1000;
  GxB_COMPRESSION_LZ4HC = 2000;
  GxB_COMPRESSION_ZSTD = 3000;
  GxB_COMPRESSION_INTEL = 1000000;

function GxB_Matrix_serialize(blob_handle: Ppointer; blob_size_handle: PGrB_Index; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_serialize(blob: pointer; blob_size_handle: PGrB_Index; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_serialize(blob_handle: Ppointer; blob_size_handle: PGrB_Index; u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_serializeSize(blob_size_handle: PGrB_Index; A: TGrB_Matrix): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_deserialize(C: PGrB_Matrix; _type: TGrB_Type; blob: pointer; blob_size: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GrB_Matrix_deserialize(C: PGrB_Matrix; _type: TGrB_Type; blob: pointer; blob_size: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_deserialize(w: PGrB_Vector; _type: TGrB_Type; blob: pointer; blob_size: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_deserialize_type_name(type_name: pchar; blob: pointer; blob_size: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;

function GxB_Vector_sort(w: TGrB_Vector; p: TGrB_Vector; op: TGrB_BinaryOp; u: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_sort(C: TGrB_Matrix; P: TGrB_Matrix; op: TGrB_BinaryOp; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_reshape(C: TGrB_Matrix; by_col: boolean; nrows_new: TGrB_Index; ncols_new: TGrB_Index; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_reshapeDup(C: PGrB_Matrix; A: TGrB_Matrix; by_col: boolean; nrows_new: TGrB_Index; ncols_new: TGrB_Index;
  desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;

type
  TGB_Iterator_opaque = record
    pstart: Tint64_t;
    pend: Tint64_t;
    p: Tint64_t;
    k: Tint64_t;
    header_size: Tsize_t;
    pmax: Tint64_t;
    avlen: Tint64_t;
    avdim: Tint64_t;
    anvec: Tint64_t;
    Ap: Pint64_t;
    Ah: Pint64_t;
    Ab: Pint8_t;
    Ai: Pint64_t;
    Ax: pointer;
    type_size: Tsize_t;
    A_sparsity: longint;
    iso: boolean;
    by_col: boolean;
  end;
  PGB_Iterator_opaque = ^TGB_Iterator_opaque;

  PGxB_Iterator = ^TGxB_Iterator;
  TGxB_Iterator = PGB_Iterator_opaque;

function GxB_Iterator_new(iterator: PGxB_Iterator): TGrB_Info; cdecl; external libgraphblas;
function GxB_Iterator_free(iterator: PGxB_Iterator): TGrB_Info; cdecl; external libgraphblas;

function GB_Iterator_attach(iterator: TGxB_Iterator; A: TGrB_Matrix; format: TGxB_Format_Value; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GB_Iterator_rc_seek(iterator: TGxB_Iterator; j: TGrB_Index; jth_vector: boolean): TGrB_Info; cdecl; external libgraphblas;
function GB_Iterator_rc_bitmap_next(iterator: TGxB_Iterator): TGrB_Info; cdecl; external libgraphblas;

function GxB_rowIterator_attach(iterator: TGxB_Iterator; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_rowIterator_kount(iterator: TGxB_Iterator): TGrB_Index; cdecl; external libgraphblas;
function GxB_rowIterator_seekRow(iterator: TGxB_Iterator; row: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GxB_rowIterator_kseek(iterator: TGxB_Iterator; k: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GxB_rowIterator_nextRow(iterator: TGxB_Iterator): TGrB_Info; cdecl; external libgraphblas;
function GxB_rowIterator_nextCol(iterator: TGxB_Iterator): TGrB_Info; cdecl; external libgraphblas;
function GxB_rowIterator_getRowIndex(iterator: TGxB_Iterator): TGrB_Index; cdecl; external libgraphblas;
function GxB_rowIterator_getColIndex(iterator: TGxB_Iterator): TGrB_Index; cdecl; external libgraphblas;

function GxB_colIterator_attach(iterator: TGxB_Iterator; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_colIterator_kount(iterator: TGxB_Iterator): TGrB_Index; cdecl; external libgraphblas;
function GxB_colIterator_seekCol(iterator: TGxB_Iterator; col: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GxB_colIterator_kseek(iterator: TGxB_Iterator; k: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GxB_colIterator_nextCol(iterator: TGxB_Iterator): TGrB_Info; cdecl; external libgraphblas;
function GxB_colIterator_nextRow(iterator: TGxB_Iterator): TGrB_Info; cdecl; external libgraphblas;
function GxB_colIterator_getColIndex(iterator: TGxB_Iterator): TGrB_Index; cdecl; external libgraphblas;
function GxB_colIterator_getRowIndex(iterator: TGxB_Iterator): TGrB_Index; cdecl; external libgraphblas;

function GxB_Matrix_Iterator_attach(iterator: TGxB_Iterator; A: TGrB_Matrix; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_Iterator_getpmax(iterator: TGxB_Iterator): TGrB_Index; cdecl; external libgraphblas;
function GxB_Matrix_Iterator_seek(iterator: TGxB_Iterator; p: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_Iterator_next(iterator: TGxB_Iterator): TGrB_Info; cdecl; external libgraphblas;
function GxB_Matrix_Iterator_getp(iterator: TGxB_Iterator): TGrB_Index; cdecl; external libgraphblas;
procedure GxB_Matrix_Iterator_getIndex(iterator: TGxB_Iterator; row: PGrB_Index; col: PGrB_Index); cdecl; external libgraphblas;

function GxB_Vector_Iterator_attach(iterator: TGxB_Iterator; v: TGrB_Vector; desc: TGrB_Descriptor): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_Iterator_getpmax(iterator: TGxB_Iterator): TGrB_Index; cdecl; external libgraphblas;
function GB_Vector_Iterator_bitmap_seek(iterator: TGxB_Iterator; unused: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_Iterator_seek(iterator: TGxB_Iterator; p: TGrB_Index): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_Iterator_next(iterator: TGxB_Iterator): TGrB_Info; cdecl; external libgraphblas;
function GxB_Vector_Iterator_getp(iterator: TGxB_Iterator): TGrB_Index; cdecl; external libgraphblas;
function GxB_Vector_Iterator_getIndex(iterator: TGxB_Iterator): TGrB_Index; cdecl; external libgraphblas;

function GxB_Iterator_get_BOOL(iterator: TGxB_Iterator): boolean; cdecl; external libgraphblas;
function GxB_Iterator_get_INT8(iterator: TGxB_Iterator): Tint8_t; cdecl; external libgraphblas;
function GxB_Iterator_get_INT16(iterator: TGxB_Iterator): Tint16_t; cdecl; external libgraphblas;
function GxB_Iterator_get_INT32(iterator: TGxB_Iterator): Tint32_t; cdecl; external libgraphblas;
function GxB_Iterator_get_INT64(iterator: TGxB_Iterator): Tint64_t; cdecl; external libgraphblas;
function GxB_Iterator_get_UINT8(iterator: TGxB_Iterator): Tuint8_t; cdecl; external libgraphblas;
function GxB_Iterator_get_UINT16(iterator: TGxB_Iterator): Tuint16_t; cdecl; external libgraphblas;
function GxB_Iterator_get_UINT32(iterator: TGxB_Iterator): Tuint32_t; cdecl; external libgraphblas;
function GxB_Iterator_get_UINT64(iterator: TGxB_Iterator): Tuint64_t; cdecl; external libgraphblas;
function GxB_Iterator_get_FP32(iterator: TGxB_Iterator): single; cdecl; external libgraphblas;
function GxB_Iterator_get_FP64(iterator: TGxB_Iterator): double; cdecl; external libgraphblas;
function GxB_Iterator_get_FC32(iterator: TGxB_Iterator): TGxB_FC32_t; cdecl; external libgraphblas;
function GxB_Iterator_get_FC64(iterator: TGxB_Iterator): TGxB_FC64_t; cdecl; external libgraphblas;
procedure GxB_Iterator_get_UDT(iterator: TGxB_Iterator; value: pointer); cdecl; external libgraphblas;

type
  PRMM_MODE = ^TRMM_MODE;
  TRMM_MODE = longint;

const
  rmm_wrap_host = 0;
  rmm_wrap_host_pinned = 1;
  rmm_wrap_device = 2;
  rmm_wrap_managed = 3;

procedure rmm_wrap_finalize; cdecl; external libgraphblas;
function rmm_wrap_initialize(mode: TRMM_MODE; init_pool_size: Tsize_t; max_pool_size: Tsize_t): longint; cdecl; external libgraphblas;
function rmm_wrap_allocate(size: Psize_t): pointer; cdecl; external libgraphblas;
procedure rmm_wrap_deallocate(p: pointer; size: Tsize_t); cdecl; external libgraphblas;
function rmm_wrap_malloc(size: Tsize_t): pointer; cdecl; external libgraphblas;
function rmm_wrap_calloc(n: Tsize_t; size: Tsize_t): pointer; cdecl; external libgraphblas;
function rmm_wrap_realloc(p: pointer; newsize: Tsize_t): pointer; cdecl; external libgraphblas;
procedure rmm_wrap_free(p: pointer); cdecl; external libgraphblas;

// === Konventiert am: 27-12-25 15:36:01 ===


implementation


function GxB_VERSION(major, minor, sub: longint): longint;
begin
  GxB_VERSION := (((major * 1000) + minor) * 1000) + sub;
end;

function GxB_IMPLEMENTATION: longint;
begin
  GxB_IMPLEMENTATION := GxB_VERSION(GxB_IMPLEMENTATION_MAJOR, GxB_IMPLEMENTATION_MINOR, GxB_IMPLEMENTATION_SUB);
end;

function GxB_SPEC_VERSION: longint;
begin
  GxB_SPEC_VERSION := GxB_VERSION(GxB_SPEC_MAJOR, GxB_SPEC_MINOR, GxB_SPEC_SUB);
end;

function GrB_INDEX_MAX: longint;
begin
  GrB_INDEX_MAX := (TGrB_Index(1 shl 60)) - 1;
end;

function GxB_INDEX_MAX: TGrB_Index;
begin
  GxB_INDEX_MAX := TGrB_Index(1 shl 60);
end;


end.
