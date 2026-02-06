{$IFDEF read_interface}


type
  Talloc_func_ptr = function(para1: Tsize_t): pointer; cdecl;
  Palloc_func_ptr = ^Talloc_func_ptr;
  Trealloc_func_ptr = function(para1: pointer; para2: Tsize_t; para3: Tsize_t): pointer; cdecl;
  Prealloc_func_ptr = ^Trealloc_func_ptr;
  Tfree_func_ptr = procedure(para1: pointer; para2: Tsize_t); cdecl;
  Pfree_func_ptr = ^Tfree_func_ptr;

procedure mp_get_memory_functions(
  alloc_func_ptr: Palloc_func_ptr;
  realloc_func_ptr: Prealloc_func_ptr;
  free_func_ptr: Pfree_func_ptr); cdecl; external libpolylib;

type
  PPValue = ^PValue;
  PValue = ^TValue;
  TValue = int64;

const
  VALUE_FMT = '%ld';

type
  Tvalue_print_gmp_free_t = procedure (para1:pointer; para2:Tsize_t);cdecl;

var
  overflow_error : dword;cvar;external libpolylib;
  simplex_arithmetic_error : dword;cvar;external libpolylib;
  user_exception_error : dword;cvar;external libpolylib;
  parser_exception_error : dword;cvar;external libpolylib;
  any_exception_error : dword;cvar;external libpolylib;

procedure dump_exception_stack_to_file(para1: PFILE); cdecl; external libpolylib;
procedure dump_exception_stack; cdecl; external libpolylib;
function push_exception_on_stack(para1: longint; para2: pchar; para3: pchar; para4: longint): Pjmp_buf; cdecl; external libpolylib;
procedure pop_exception_from_stack(para1: longint; para2: pchar; para3: pchar; para4: longint); cdecl; external libpolylib;
procedure throw_exception(para1: longint; para2: pchar; para3: pchar; para4: longint); cdecl; external libpolylib;

// === Konventiert am: 5-2-26 19:35:43 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
