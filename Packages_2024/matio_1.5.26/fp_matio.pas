unit fp_matio;

interface

const
  {$IFDEF Linux}
  libmatio = 'libmatio';
  {$ENDIF}

  {$IFDEF Windows}
  libmatio = 'libmatio.dll';
  {$ENDIF}

type
  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

  // ==== matio_pubconf.h

const
  MATIO_PUBCONF_H = 1;
  MATIO_MAJOR_VERSION = 1;
  MATIO_MINOR_VERSION = 5;
  MATIO_RELEASE_LEVEL = 26;
  MATIO_VERSION = 1526;
  MATIO_VERSION_STR = '1.5.26';
  MAT_FT_DEFAULT = $0100; // MAT_FT_MAT5
  MATIO_HAVE_STDINT_H = 1;
  MATIO_HAVE_INTTYPES_H = 1;

type
  Tmat_int16_t = int16;
  Tmat_int32_t = int32;
  Tmat_int64_t = int64;
  Tmat_int8_t = int8;
  Tmat_uint16_t = uint16;
  Tmat_uint32_t = uint32;
  Tmat_uint64_t = uint64;
  Tmat_uint8_t = uint8;

type
  Pmat_int64_t = ^Tmat_int64_t;
  Pmat_uint64_t = ^Tmat_uint64_t;
  Pmat_int32_t = ^Tmat_int32_t;
  Pmat_uint32_t = ^Tmat_uint32_t;
  Pmat_int16_t = ^Tmat_int16_t;
  Pmat_uint16_t = ^Tmat_uint16_t;
  Pmat_int8_t = ^Tmat_int8_t;
  Pmat_uint8_t = ^Tmat_uint8_t;


  // ==== matio.h

type
  Tmat_acc = longint;
const
  MAT_ACC_RDONLY = 0;
  MAT_ACC_RDWR = 1;

type
  Tmat_ft = longint;
const
  MAT_FT_MAT73 = $0200;
  MAT_FT_MAT5 = $0100;
  MAT_FT_MAT4 = $0010;
  MAT_FT_UNDEFINED = 0;

type
  Tmatio_types = longint;
const
  MAT_T_UNKNOWN = 0;
  MAT_T_INT8 = 1;
  MAT_T_UINT8 = 2;
  MAT_T_INT16 = 3;
  MAT_T_UINT16 = 4;
  MAT_T_INT32 = 5;
  MAT_T_UINT32 = 6;
  MAT_T_SINGLE = 7;
  MAT_T_DOUBLE = 9;
  MAT_T_INT64 = 12;
  MAT_T_UINT64 = 13;
  MAT_T_MATRIX = 14;
  MAT_T_COMPRESSED = 15;
  MAT_T_UTF8 = 16;
  MAT_T_UTF16 = 17;
  MAT_T_UTF32 = 18;
  MAT_T_STRING = 20;
  MAT_T_CELL = 21;
  MAT_T_STRUCT = 22;
  MAT_T_ARRAY = 23;
  MAT_T_FUNCTION = 24;

type
  Tmatio_classes = longint;
const
  MAT_C_EMPTY = 0;
  MAT_C_CELL = 1;
  MAT_C_STRUCT = 2;
  MAT_C_OBJECT = 3;
  MAT_C_CHAR = 4;
  MAT_C_SPARSE = 5;
  MAT_C_DOUBLE = 6;
  MAT_C_SINGLE = 7;
  MAT_C_INT8 = 8;
  MAT_C_UINT8 = 9;
  MAT_C_INT16 = 10;
  MAT_C_UINT16 = 11;
  MAT_C_INT32 = 12;
  MAT_C_UINT32 = 13;
  MAT_C_INT64 = 14;
  MAT_C_UINT64 = 15;
  MAT_C_FUNCTION = 16;
  MAT_C_OPAQUE = 17;

type
  Tmatio_flags = longint;
const
  MAT_F_COMPLEX = $0800;
  MAT_F_GLOBAL = $0400;
  MAT_F_LOGICAL = $0200;
  MAT_F_DONT_COPY_DATA = $0001;

type
  Tmatio_compression = longint;
const
  MAT_COMPRESSION_NONE = 0;
  MAT_COMPRESSION_ZLIB = 1;

const
  MAT_BY_NAME = 1;
  MAT_BY_INDEX = 2;

type
  Pmat_complex_split_t = ^Tmat_complex_split_t;
  Tmat_complex_split_t = record
    Re: pointer;
    Im: pointer;
  end;

  Pmat_t = type Pointer;
  Pmatvar_internal = type Pointer;

  PPmatvar_t = ^Pmatvar_t;
  Pmatvar_t = ^Tmatvar_t;
  Tmatvar_t = record
    nbytes: Tsize_t;
    rank: longint;
    data_type: Tmatio_types;
    data_size: longint;
    class_type: Tmatio_classes;
    isComplex: longint;
    isGlobal: longint;
    isLogical: longint;
    dims: Psize_t;
    name: pchar;
    data: pointer;
    mem_conserve: longint;
    compression: Tmatio_compression;
    internal: Pmatvar_internal;
  end;

  Pmat_sparse_t = ^Tmat_sparse_t;
  Tmat_sparse_t = record
    nzmax: Tmat_uint32_t;
    ir: Pmat_uint32_t;
    nir: Tmat_uint32_t;
    jc: Pmat_uint32_t;
    njc: Tmat_uint32_t;
    ndata: Tmat_uint32_t;
    data: pointer;
  end;

const
  MATIO_LOG_LEVEL_ERROR = 1;
  MATIO_LOG_LEVEL_CRITICAL = 1 shl 1;
  MATIO_LOG_LEVEL_WARNING = 1 shl 2;
  MATIO_LOG_LEVEL_MESSAGE = 1 shl 3;
  MATIO_LOG_LEVEL_DEBUG = 1 shl 4;

  MATIO_E_NO_ERROR = 0;
  MATIO_E_UNKNOWN_ERROR = 1;
  MATIO_E_GENERIC_READ_ERROR = 2;
  MATIO_E_GENERIC_WRITE_ERROR = 3;
  MATIO_E_INDEX_TOO_BIG = 4;
  MATIO_E_FILE_FORMAT_VIOLATION = 5;
  MATIO_E_FAIL_TO_IDENTIFY = 6;
  MATIO_E_BAD_ARGUMENT = 7;
  MATIO_E_OUTPUT_BAD_DATA = 8;
  MATIO_E_OPERATION_NOT_SUPPORTED = 13;
  MATIO_E_OUT_OF_MEMORY = 14;
  MATIO_E_BAD_VARIABLE_NAME = 15;
  MATIO_E_OPERATION_PROHIBITED_IN_WRITE_MODE = 16;
  MATIO_E_OPERATION_PROHIBITED_IN_READ_MODE = 17;
  MATIO_E_WRITE_VARIABLE_DOES_NOT_EXIST = 18;
  MATIO_E_READ_VARIABLE_DOES_NOT_EXIST = 19;
  MATIO_E_FILESYSTEM_COULD_NOT_OPEN = 20;
  MATIO_E_FILESYSTEM_COULD_NOT_OPEN_TEMPORARY = 21;
  MATIO_E_FILESYSTEM_COULD_NOT_REOPEN = 22;
  MATIO_E_BAD_OPEN_MODE = 23;
  MATIO_E_FILESYSTEM_ERROR_ON_CLOSE = 24;

type
  Tmat_iter_pred_t = function(name: pchar; user_data: pointer): longint; cdecl;

procedure Mat_GetLibraryVersion(major: Plongint; minor: Plongint; release: Plongint); cdecl; external libmatio;
function Mat_SetVerbose(verb: longint; s: longint): longint; cdecl; external libmatio;
function Mat_SetDebug(d: longint): longint; cdecl; external libmatio;
procedure Mat_Critical(format: pchar; args: array of const); cdecl; external libmatio;
procedure Mat_Critical(format: pchar); cdecl; external libmatio;
procedure Mat_Error(format: pchar; args: array of const); cdecl; external libmatio;
procedure Mat_Error(format: pchar); cdecl; external libmatio;
procedure Mat_Help(helpstr: PPchar); cdecl; external libmatio;
function Mat_LogInit(prog_name: pchar): longint; cdecl; external libmatio;
function Mat_LogClose: longint; cdecl; external libmatio;

type
  TLogInitFunc = procedure(log_level: longint; message: pchar); cdecl;

function Mat_LogInitFunc(prog_name: pchar; log_func: TLogInitFunc): longint; cdecl; external libmatio;
function Mat_Message(format: pchar; args: array of const): longint; cdecl; external libmatio;
function Mat_Message(format: pchar): longint; cdecl; external libmatio;
function Mat_DebugMessage(level: longint; format: pchar; args: array of const): longint; cdecl; external libmatio;
function Mat_DebugMessage(level: longint; format: pchar): longint; cdecl; external libmatio;
function Mat_VerbMessage(level: longint; format: pchar; args: array of const): longint; cdecl; external libmatio;
function Mat_VerbMessage(level: longint; format: pchar): longint; cdecl; external libmatio;
procedure Mat_Warning(format: pchar; args: array of const); cdecl; external libmatio;
procedure Mat_Warning(format: pchar); cdecl; external libmatio;
function Mat_SizeOf(data_type: Tmatio_types): Tsize_t; cdecl; external libmatio;
function Mat_SizeOfClass(class_type: longint): Tsize_t; cdecl; external libmatio;

function Mat_CreateVer(matname: pchar; hdr_str: pchar; mat_file_ver: Tmat_ft): Pmat_t; cdecl; external libmatio;
function Mat_Close(mat: Pmat_t): longint; cdecl; external libmatio;
function Mat_Open(matname: pchar; mode: longint): Pmat_t; cdecl; external libmatio;
function Mat_GetFileAccessMode(mat: Pmat_t): Tmat_acc; cdecl; external libmatio;
function Mat_GetFilename(mat: Pmat_t): pchar; cdecl; external libmatio;
function Mat_GetHeader(mat: Pmat_t): pchar; cdecl; external libmatio;
function Mat_GetVersion(mat: Pmat_t): Tmat_ft; cdecl; external libmatio;
function Mat_GetDir(mat: Pmat_t; n: Psize_t): PPchar; cdecl; external libmatio;
function Mat_Rewind(mat: Pmat_t): longint; cdecl; external libmatio;

function Mat_VarCalloc: Pmatvar_t; cdecl; external libmatio;
function Mat_VarCreate(name: pchar; class_type: Tmatio_classes; data_type: Tmatio_types; rank: longint; dims: Psize_t;
  data: pointer; opt: longint): Pmatvar_t; cdecl; external libmatio;
function Mat_VarCreateStruct(name: pchar; rank: longint; dims: Psize_t; fields: PPchar; nfields: dword): Pmatvar_t; cdecl; external libmatio;
function Mat_VarDelete(mat: Pmat_t; name: pchar): longint; cdecl; external libmatio;
function Mat_VarDuplicate(in_: Pmatvar_t; opt: longint): Pmatvar_t; cdecl; external libmatio;
procedure Mat_VarFree(matvar: Pmatvar_t); cdecl; external libmatio;
function Mat_VarGetCell(matvar: Pmatvar_t; index: longint): Pmatvar_t; cdecl; external libmatio;
function Mat_VarGetCells(matvar: Pmatvar_t; start: Plongint; stride: Plongint; edge: Plongint): PPmatvar_t; cdecl; external libmatio;
function Mat_VarGetCellsLinear(matvar: Pmatvar_t; start: longint; stride: longint; edge: longint): PPmatvar_t; cdecl; external libmatio;
function Mat_VarGetSize(matvar: Pmatvar_t): Tsize_t; cdecl; external libmatio;
function Mat_VarGetNumberOfFields(matvar: Pmatvar_t): dword; cdecl; external libmatio;
function Mat_VarAddStructField(matvar: Pmatvar_t; fieldname: pchar): longint; cdecl; external libmatio;
function Mat_VarGetStructFieldnames(matvar: Pmatvar_t): Ppchar; cdecl; external libmatio;
function Mat_VarGetStructFieldByIndex(matvar: Pmatvar_t; field_index: Tsize_t; index: Tsize_t): Pmatvar_t; cdecl; external libmatio;
function Mat_VarGetStructFieldByName(matvar: Pmatvar_t; field_name: pchar; index: Tsize_t): Pmatvar_t; cdecl; external libmatio;
function Mat_VarGetStructField(matvar: Pmatvar_t; name_or_index: pointer; opt: longint; index: longint): Pmatvar_t; cdecl; external libmatio;
function Mat_VarGetStructs(matvar: Pmatvar_t; start: Plongint; stride: Plongint; edge: Plongint; copy_fields: longint): Pmatvar_t; cdecl; external libmatio;
function Mat_VarGetStructsLinear(matvar: Pmatvar_t; start: longint; stride: longint; edge: longint; copy_fields: longint): Pmatvar_t; cdecl; external libmatio;
procedure Mat_VarPrint(matvar: Pmatvar_t; printdata: longint); cdecl; external libmatio;
function Mat_VarRead(mat: Pmat_t; name: pchar): Pmatvar_t; cdecl; external libmatio;
function Mat_VarReadData(mat: Pmat_t; matvar: Pmatvar_t; data: pointer; start: Plongint; stride: Plongint;
  edge: Plongint): longint; cdecl; external libmatio;
function Mat_VarReadDataAll(mat: Pmat_t; matvar: Pmatvar_t): longint; cdecl; external libmatio;
function Mat_VarReadDataLinear(mat: Pmat_t; matvar: Pmatvar_t; data: pointer; start: longint; stride: longint;
  edge: longint): longint; cdecl; external libmatio;
function Mat_VarReadInfo(mat: Pmat_t; name: pchar): Pmatvar_t; cdecl; external libmatio;
function Mat_VarReadNext(mat: Pmat_t): Pmatvar_t; cdecl; external libmatio;
function Mat_VarReadNextPredicate(mat: Pmat_t; pred: Tmat_iter_pred_t; user_data: pointer): Pmatvar_t; cdecl; external libmatio;
function Mat_VarReadNextInfo(mat: Pmat_t): Pmatvar_t; cdecl; external libmatio;
function Mat_VarReadNextInfoPredicate(mat: Pmat_t; pred: Tmat_iter_pred_t; user_data: pointer): Pmatvar_t; cdecl; external libmatio;
function Mat_VarSetCell(matvar: Pmatvar_t; index: longint; cell: Pmatvar_t): Pmatvar_t; cdecl; external libmatio;
function Mat_VarSetStructFieldByIndex(matvar: Pmatvar_t; field_index: Tsize_t; index: Tsize_t; field: Pmatvar_t): Pmatvar_t; cdecl; external libmatio;
function Mat_VarSetStructFieldByName(matvar: Pmatvar_t; field_name: pchar; index: Tsize_t; field: Pmatvar_t): Pmatvar_t; cdecl; external libmatio;
function Mat_VarWrite(mat: Pmat_t; matvar: Pmatvar_t; compress: Tmatio_compression): longint; cdecl; external libmatio;
function Mat_VarWriteAppend(mat: Pmat_t; matvar: Pmatvar_t; compress: Tmatio_compression; dim: longint): longint; cdecl; external libmatio;
function Mat_VarWriteInfo(mat: Pmat_t; matvar: Pmatvar_t): longint; cdecl; external libmatio;
function Mat_VarWriteData(mat: Pmat_t; matvar: Pmatvar_t; data: pointer; start: Plongint; stride: Plongint;
  edge: Plongint): longint; cdecl; external libmatio;

function Mat_CalcSingleSubscript(rank: longint; dims: Plongint; subs: Plongint): longint; cdecl; external libmatio;
function Mat_CalcSingleSubscript2(rank: longint; dims: Psize_t; subs: Psize_t; index: Psize_t): longint; cdecl; external libmatio;
function Mat_CalcSubscripts(rank: longint; dims: Plongint; index: longint): Plongint; cdecl; external libmatio;
function Mat_CalcSubscripts2(rank: longint; dims: Psize_t; index: Tsize_t): Psize_t; cdecl; external libmatio;

function Mat_Create(a, b: pchar): Pmat_t;


// === Konventiert am: 20-8-26 14:25:13 ===


implementation


function Mat_Create(a, b: pchar): Pmat_t;
begin
  Mat_Create := Mat_CreateVer(a, b, MAT_FT_DEFAULT);
end;


end.
