unit fp_embryo;

interface

uses
  efl, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


const
  EMBRYO_VERSION_MAJOR = EFL_VERSION_MAJOR;
  EMBRYO_VERSION_MINOR = EFL_VERSION_MINOR;

type
  TEmbryo_Version = record
    major: longint;
    minor: longint;
    micro: longint;
    revision: longint;
  end;
  PEmbryo_Version = ^TEmbryo_Version;

var
  embryo_version: PEmbryo_Version; cvar;external libembryo;

type
  PEmbryo_Error = ^TEmbryo_Error;
  TEmbryo_Error = longint;

const
  EMBRYO_ERROR_NONE = 0;
  EMBRYO_ERROR_EXIT = 1;
  EMBRYO_ERROR_ASSERT = 2;
  EMBRYO_ERROR_STACKERR = 3;
  EMBRYO_ERROR_BOUNDS = 4;
  EMBRYO_ERROR_MEMACCESS = 5;
  EMBRYO_ERROR_INVINSTR = 6;
  EMBRYO_ERROR_STACKLOW = 7;
  EMBRYO_ERROR_HEAPLOW = 8;
  EMBRYO_ERROR_CALLBACK = 9;
  EMBRYO_ERROR_NATIVE = 10;
  EMBRYO_ERROR_DIVIDE = 11;
  EMBRYO_ERROR_SLEEP = 12;
  EMBRYO_ERROR_MEMORY = 16;
  EMBRYO_ERROR_FORMAT = 17;
  EMBRYO_ERROR_VERSION = 18;
  EMBRYO_ERROR_NOTFOUND = 19;
  EMBRYO_ERROR_INDEX = 20;
  EMBRYO_ERROR_DEBUG = 21;
  EMBRYO_ERROR_INIT = 22;
  EMBRYO_ERROR_USERDATA = 23;
  EMBRYO_ERROR_INIT_JIT = 24;
  EMBRYO_ERROR_PARAMS = 25;
  EMBRYO_ERROR_DOMAIN = 26;

type
  PEmbryo_Status = ^TEmbryo_Status;
  TEmbryo_Status = longint;

const
  EMBRYO_PROGRAM_FAIL = 0;
  EMBRYO_PROGRAM_OK = 1;
  EMBRYO_PROGRAM_SLEEP = 2;
  EMBRYO_PROGRAM_BUSY = 3;
  EMBRYO_PROGRAM_TOOLONG = 4;

type
  PEmbryo_UCell = ^TEmbryo_UCell;
  TEmbryo_UCell = dword;

  PEmbryo_Cell = ^TEmbryo_Cell;
  TEmbryo_Cell = longint;

const
  EMBRYO_CELL_NONE = $7fffffff;

type
  TEmbryo_Program = record
  end;
  PEmbryo_Program = ^TEmbryo_Program;

  PEmbryo_Function = ^TEmbryo_Function;
  TEmbryo_Function = longint;

const
  EMBRYO_FUNCTION_NONE = $7fffffff;
  EMBRYO_FUNCTION_MAIN = -(1);
  EMBRYO_FUNCTION_CONT = -(2);

type
  PEmbryo_Float_Cell = ^TEmbryo_Float_Cell;
  TEmbryo_Float_Cell = record
    case longint of
      0: (f: single);
      1: (c: TEmbryo_Cell);
  end;

function embryo_init: longint; cdecl; external libembryo;
function embryo_shutdown: longint; cdecl; external libembryo;
function embryo_program_new(data: pointer; size: longint): PEmbryo_Program; cdecl; external libembryo;
function embryo_program_const_new(data: pointer; size: longint): PEmbryo_Program; cdecl; external libembryo;
function embryo_program_load(file_: pchar): PEmbryo_Program; cdecl; external libembryo;
procedure embryo_program_free(ep: PEmbryo_Program); cdecl; external libembryo;

type
  Tembryo_func = function(ep: PEmbryo_Program; params: PEmbryo_Cell): TEmbryo_Cell; cdecl;

procedure embryo_program_native_call_add(ep: PEmbryo_Program; name: pchar; func: Tembryo_func); cdecl; external libembryo;
procedure embryo_program_vm_reset(ep: PEmbryo_Program); cdecl; external libembryo;
procedure embryo_program_vm_push(ep: PEmbryo_Program); cdecl; external libembryo;
procedure embryo_program_vm_pop(ep: PEmbryo_Program); cdecl; external libembryo;
procedure embryo_swap_16(v: Pword); cdecl; external libembryo;
procedure embryo_swap_32(v: Pdword); cdecl; external libembryo;
function embryo_program_function_find(ep: PEmbryo_Program; name: pchar): TEmbryo_Function; cdecl; external libembryo;
function embryo_program_variable_find(ep: PEmbryo_Program; name: pchar): TEmbryo_Cell; cdecl; external libembryo;
function embryo_program_variable_count_get(ep: PEmbryo_Program): longint; cdecl; external libembryo;
function embryo_program_variable_get(ep: PEmbryo_Program; num: longint): TEmbryo_Cell; cdecl; external libembryo;
procedure embryo_program_error_set(ep: PEmbryo_Program; error: TEmbryo_Error); cdecl; external libembryo;
function embryo_program_error_get(ep: PEmbryo_Program): TEmbryo_Error; cdecl; external libembryo;
procedure embryo_program_data_set(ep: PEmbryo_Program; data: pointer); cdecl; external libembryo;
function embryo_program_data_get(ep: PEmbryo_Program): pointer; cdecl; external libembryo;
function embryo_error_string_get(error: TEmbryo_Error): pchar; cdecl; external libembryo;
function embryo_data_string_length_get(ep: PEmbryo_Program; str_cell: PEmbryo_Cell): longint; cdecl; external libembryo;
procedure embryo_data_string_get(ep: PEmbryo_Program; str_cell: PEmbryo_Cell; dst: pchar); cdecl; external libembryo;
procedure embryo_data_string_set(ep: PEmbryo_Program; src: pchar; str_cell: PEmbryo_Cell); cdecl; external libembryo;
function embryo_data_address_get(ep: PEmbryo_Program; addr: TEmbryo_Cell): PEmbryo_Cell; cdecl; external libembryo;
function embryo_data_heap_push(ep: PEmbryo_Program; cells: longint): TEmbryo_Cell; cdecl; external libembryo;
procedure embryo_data_heap_pop(ep: PEmbryo_Program; down_to: TEmbryo_Cell); cdecl; external libembryo;
function embryo_program_recursion_get(ep: PEmbryo_Program): longint; cdecl; external libembryo;
function embryo_program_run(ep: PEmbryo_Program; func: TEmbryo_Function): TEmbryo_Status; cdecl; external libembryo;
function embryo_program_return_value_get(ep: PEmbryo_Program): TEmbryo_Cell; cdecl; external libembryo;
procedure embryo_program_max_cycle_run_set(ep: PEmbryo_Program; max: longint); cdecl; external libembryo;
function embryo_program_max_cycle_run_get(ep: PEmbryo_Program): longint; cdecl; external libembryo;
function embryo_parameter_cell_push(ep: PEmbryo_Program; cell: TEmbryo_Cell): longint; cdecl; external libembryo;
function embryo_parameter_string_push(ep: PEmbryo_Program; str: pchar): longint; cdecl; external libembryo;
function embryo_parameter_cell_array_push(ep: PEmbryo_Program; cells: PEmbryo_Cell; num: longint): longint; cdecl; external libembryo;

// === Konventiert am: 15-6-25 13:25:35 ===


implementation



end.
