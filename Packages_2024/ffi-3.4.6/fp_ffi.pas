unit fp_ffi;

interface

const
  {$IFDEF Linux}
  libffi = 'libffi';
  {$ENDIF}

  {$IFDEF Windows}
  libffi = 'libffi-8.dll';
  {$ENDIF}

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


// ==== ffitarget.h

const
  FFI_SIZEOF_ARG = 8;
  USE_BUILTIN_FFS = 0;

type
  Pffi_arg = ^Tffi_arg;
  Tffi_arg = UInt64;

  Pffi_sarg = ^Tffi_sarg;
  Tffi_sarg = int64;

const
  FFI_SIZEOF_JAVA_RAW = 4;

type
  Tffi_abi = longint;

  {$IFDEF Linux}
const
  FFI_FIRST_ABI = 1;
  FFI_UNIX64 = 2;
  FFI_WIN64 = 3;
  FFI_EFI64 = FFI_WIN64;
  FFI_GNUW64 = 4;
  FFI_LAST_ABI = 5;
  FFI_DEFAULT_ABI = FFI_UNIX64;
  {$ENDIF}

  {$IFDEF Windows}
const
  FFI_FIRST_ABI = 0;
  FFI_WIN64 = 1;
  FFI_GNUW64 = 2;
  FFI_LAST_ABI = 3;
  FFI_DEFAULT_ABI = FFI_GNUW64;
  {$ENDIF}

const
  FFI_TYPE_LAST = 15; // ????????


const
  FFI_CLOSURES = 1;
  FFI_GO_CLOSURES = 1;
  FFI_TYPE_SMALL_STRUCT_1B = FFI_TYPE_LAST + 1;
  FFI_TYPE_SMALL_STRUCT_2B = FFI_TYPE_LAST + 2;
  FFI_TYPE_SMALL_STRUCT_4B = FFI_TYPE_LAST + 3;
  FFI_TYPE_MS_STRUCT = FFI_TYPE_LAST + 4;
  FFI_TRAMPOLINE_SIZE = 32;
  FFI_NATIVE_RAW_API = 0;

  // ==== ffi.h

type
  Tsize_t = SizeUInt;
  Psize_t = ^Tsize_t;

const
  FFI_TYPE_VOID_ = 0;
  FFI_TYPE_INT_ = 1;
  FFI_TYPE_FLOAT_ = 2;
  FFI_TYPE_DOUBLE_ = 3;
  FFI_TYPE_LONGDOUBLE_ = 4;
  FFI_TYPE_UINT8_ = 5;
  FFI_TYPE_SINT8_ = 6;
  FFI_TYPE_UINT16_ = 7;
  FFI_TYPE_SINT16_ = 8;
  FFI_TYPE_UINT32_ = 9;
  FFI_TYPE_SINT32_ = 10;
  FFI_TYPE_UINT64_ = 11;
  FFI_TYPE_SINT64_ = 12;
  FFI_TYPE_STRUCT_ = 13;
  FFI_TYPE_POINTER_ = 14;
  FFI_TYPE_COMPLEX_ = 15;
  FFI_TYPE_LAST_ = FFI_TYPE_COMPLEX_;

const
  FFI_64_BIT_MAX = 9223372036854775807;

type
  PPffi_type = ^Pffi_type;
  Pffi_type = ^Tffi_type;

  Tffi_type = record
    size: Tsize_t;
    alignment: word;
    _type: word;
    elements: ^Pffi_type;
  end;

var
  ffi_type_void: Tffi_type; cvar;external libffi;
  ffi_type_uint8: Tffi_type; cvar;external libffi;
  ffi_type_sint8: Tffi_type; cvar;external libffi;
  ffi_type_uint16: Tffi_type; cvar;external libffi;
  ffi_type_sint16: Tffi_type; cvar;external libffi;
  ffi_type_uint32: Tffi_type; cvar;external libffi;
  ffi_type_sint32: Tffi_type; cvar;external libffi;
  ffi_type_uint64: Tffi_type; cvar;external libffi;
  ffi_type_sint64: Tffi_type; cvar;external libffi;
  ffi_type_float: Tffi_type; cvar;external libffi;
  ffi_type_double: Tffi_type; cvar;external libffi;
  ffi_type_pointer: Tffi_type; cvar;external libffi;
  ffi_type_longdouble: Tffi_type; cvar;external libffi;

  ffi_type_complex_float: Tffi_type; cvar;external libffi;
  ffi_type_complex_double: Tffi_type; cvar;external libffi;
  ffi_type_complex_longdouble: Tffi_type; cvar;external libffi;

  ffi_type_uchar: Tffi_type absolute ffi_type_uint8;
  ffi_type_schar: Tffi_type absolute ffi_type_sint8;

  ffi_type_ushort: Tffi_type absolute ffi_type_uint16;
  ffi_type_sshort: Tffi_type absolute ffi_type_sint16;

  ffi_type_uint: Tffi_type absolute ffi_type_uint32;
  ffi_type_sint: Tffi_type absolute ffi_type_sint32;

  ffi_type_ulong: Tffi_type absolute ffi_type_uint64;
  ffi_type_slong: Tffi_type absolute ffi_type_sint64;

type
  Pffi_status = ^Tffi_status;
  Tffi_status = longint;

const
  FFI_OK = 0;
  FFI_BAD_TYPEDEF = 1;
  FFI_BAD_ABI = 2;
  FFI_BAD_ARGTYPE = 3;

type
  Tffi_cif = record
    abi: Tffi_abi;
    nargs: dword;
    arg_types: ^Pffi_type;
    rtype: Pffi_type;
    bytes: dword;
    flags: dword;
  end;
  Pffi_cif = ^Tffi_cif;

type
  Tffi_raw = record
    case longint of
      0: (sint: Tffi_sarg);
      1: (uint: Tffi_arg);
      2: (flt: single);
      3: (data: array[0..(FFI_SIZEOF_ARG) - 1] of char);
      4: (ptr: pointer);
  end;
  Pffi_raw = ^Tffi_raw;

type
  Pffi_java_raw = type Pointer;

procedure ffi_raw_call(cif: Pffi_cif; fn: Pointer; rvalue: pointer; avalue: Pffi_raw); cdecl; external libffi;
procedure ffi_ptrarray_to_raw(cif: Pffi_cif; args: Ppointer; raw: Pffi_raw); cdecl; external libffi;
procedure ffi_raw_to_ptrarray(cif: Pffi_cif; raw: Pffi_raw; args: Ppointer); cdecl; external libffi;
function ffi_raw_size(cif: Pffi_cif): Tsize_t; cdecl; external libffi;

procedure ffi_java_raw_call(cif: Pffi_cif; fn: Pointer; rvalue: pointer; avalue: Pffi_java_raw); cdecl; external libffi; deprecated;
procedure ffi_java_ptrarray_to_raw(cif: Pffi_cif; args: Ppointer; raw: Pffi_java_raw); cdecl; external libffi; deprecated;
procedure ffi_java_raw_to_ptrarray(cif: Pffi_cif; raw: Pffi_java_raw; args: Ppointer); cdecl; external libffi; deprecated;
function ffi_java_raw_size(cif: Pffi_cif): Tsize_t; cdecl; external libffi; deprecated;

type
  Tffi_closure = record
    union: record
      case longint of
        0: (tramp: array[0..(FFI_TRAMPOLINE_SIZE) - 1] of char);
        1: (ftramp: pointer);
      end;
    cif: Pffi_cif;
    fun: procedure(para1: Pffi_cif; para2: pointer; para3: Ppointer; para4: pointer); cdecl;
    user_data: pointer;
  end;
  Pffi_closure = ^Tffi_closure;

function ffi_closure_alloc(size: Tsize_t; code: Ppointer): pointer; cdecl; external libffi;
procedure ffi_closure_free(para1: pointer); cdecl; external libffi;

type
  Tprep_proc = procedure(para1: Pffi_cif; para2: pointer; para3: Ppointer; para4: pointer); cdecl;

function ffi_prep_closure(para1: Pffi_closure; para2: Pffi_cif; fun: Tprep_proc; user_data: pointer): Tffi_status; cdecl; external libffi; deprecated;
function ffi_prep_closure_loc(para1: Pffi_closure; para2: Pffi_cif; fun: Tprep_proc; user_data: pointer; codeloc: pointer): Tffi_status; cdecl; external libffi;

type
  Tffi_raw_closure = record
    tramp: array[0..FFI_TRAMPOLINE_SIZE - 1] of char;
    cif: Pffi_cif;
    translate_args: procedure(para1: Pffi_cif; para2: pointer; para3: Ppointer; para4: pointer); cdecl;
    this_closure: pointer;
    fun: procedure(para1: Pffi_cif; para2: pointer; para3: Pffi_raw; para4: pointer); cdecl;
    user_data: pointer;
  end;
  Pffi_raw_closure = ^Tffi_raw_closure;

type
  Tffi_java_raw_closure = record
    tramp: array[0..(FFI_TRAMPOLINE_SIZE) - 1] of char;
    cif: Pffi_cif;
    translate_args: procedure(para1: Pffi_cif; para2: pointer; para3: Ppointer; para4: pointer); cdecl;
    this_closure: pointer;
    fun: procedure(para1: Pffi_cif; para2: pointer; para3: Pffi_java_raw; para4: pointer); cdecl;
    user_data: pointer;
  end;
  Pffi_java_raw_closure = ^Tffi_java_raw_closure;

type
  TPrep_proc_raw_proc = procedure(para1: Pffi_cif; para2: pointer; para3: Pffi_raw; para4: pointer); cdecl;

function ffi_prep_raw_closure(para1: Pffi_raw_closure; cif: Pffi_cif; fun: TPrep_proc_raw_proc; user_data: pointer): Tffi_status; cdecl; external libffi;
function ffi_prep_raw_closure_loc(para1: Pffi_raw_closure; cif: Pffi_cif; fun: TPrep_proc_raw_proc; user_data: pointer; codeloc: pointer): Tffi_status; cdecl; external libffi;

function ffi_prep_java_raw_closure(para1: Pffi_java_raw_closure; cif: Pffi_cif; fun: TPrep_proc_raw_proc; user_data: pointer): Tffi_status; cdecl; external libffi; deprecated;
function ffi_prep_java_raw_closure_loc(para1: Pffi_java_raw_closure; cif: Pffi_cif; fun: TPrep_proc_raw_proc; user_data: pointer; codeloc: pointer): Tffi_status; cdecl; external libffi; deprecated;

type
  Tffi_go_closure = record
    tramp: pointer;
    cif: Pffi_cif;
    fun: procedure(para1: Pffi_cif; para2: pointer; para3: Ppointer; para4: pointer); cdecl;
  end;
  Pffi_go_closure = ^Tffi_go_closure;

type
  Tprep_go_proc = procedure(para1: Pffi_cif; para2: pointer; para3: Ppointer; para4: pointer); cdecl;

function ffi_prep_go_closure(para1: Pffi_go_closure; para2: Pffi_cif; fun: Tprep_go_proc): Tffi_status; cdecl; external libffi;
procedure ffi_call_go(cif: Pffi_cif; fn: Pointer; rvalue: pointer; avalue: Ppointer; closure: pointer); cdecl; external libffi;

function ffi_prep_cif(cif: Pffi_cif; abi: Tffi_abi; nargs: dword; rtype: Pffi_type; atypes: PPffi_type): Tffi_status; cdecl; external libffi;
function ffi_prep_cif_var(cif: Pffi_cif; abi: Tffi_abi; nfixedargs: dword; ntotalargs: dword; rtype: Pffi_type;
  atypes: PPffi_type): Tffi_status; cdecl; external libffi;
procedure ffi_call(cif: Pffi_cif; fn: Pointer; rvalue: pointer; avalue: Ppointer); cdecl; external libffi;
function ffi_get_struct_offsets(abi: Tffi_abi; struct_type: Pffi_type; offsets: Psize_t): Tffi_status; cdecl; external libffi;

// === Konventiert am: 21-10-25 19:50:41 ===


implementation



end.
