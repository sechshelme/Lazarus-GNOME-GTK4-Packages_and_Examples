{$IFDEF read_interface}


const
  JSC_OPTIONS_USE_JIT = 'useJIT';
  JSC_OPTIONS_USE_DFG = 'useDFGJIT';
  JSC_OPTIONS_USE_FTL = 'useFTLJIT';
  JSC_OPTIONS_USE_LLINT = 'useLLInt';

function jsc_options_set_boolean(option: pchar; Value: Tgboolean): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_options_get_boolean(option: pchar; Value: Pgboolean): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_options_set_int(option: pchar; Value: Tgint): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_options_get_int(option: pchar; Value: Pgint): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_options_set_uint(option: pchar; Value: Tguint): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_options_get_uint(option: pchar; Value: Pguint): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_options_set_size(option: pchar; Value: Tgsize): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_options_get_size(option: pchar; Value: Pgsize): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_options_set_double(option: pchar; Value: Tgdouble): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_options_get_double(option: pchar; Value: Pgdouble): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_options_set_string(option: pchar; Value: pchar): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_options_get_string(option: pchar; Value: PPchar): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_options_set_range_string(option: pchar; Value: pchar): Tgboolean; cdecl; external libjavascriptcoregtk;
function jsc_options_get_range_string(option: pchar; Value: PPchar): Tgboolean; cdecl; external libjavascriptcoregtk;

type
  PJSCOptionType = ^TJSCOptionType;
  TJSCOptionType = longint;

const
  JSC_OPTION_BOOLEAN = 0;
  JSC_OPTION_INT = 1;
  JSC_OPTION_UINT = 2;
  JSC_OPTION_SIZE = 3;
  JSC_OPTION_DOUBLE = 4;
  JSC_OPTION_STRING = 5;
  JSC_OPTION_RANGE_STRING = 6;

type
  TJSCOptionsFunc = function(option: pchar; _type: TJSCOptionType; description: pchar; user_data: Tgpointer): Tgboolean; cdecl;

procedure jsc_options_foreach(_function: TJSCOptionsFunc; user_data: Tgpointer); cdecl; external libjavascriptcoregtk;
function jsc_options_get_option_group: PGOptionGroup; cdecl; external libjavascriptcoregtk;

// === Konventiert am: 4-1-25 19:12:52 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
