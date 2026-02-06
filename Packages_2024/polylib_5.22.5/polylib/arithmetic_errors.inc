{$IFDEF read_interface}


type
  Texception_callback_t = procedure(para1: pchar; para2: pchar; para3: longint); cdecl;

const
  __CURRENT_FUNCTION_NAME__ = '<unknown>';

var
  the_last_just_thrown_exception : dword;cvar;external libpolylib;

// === Konventiert am: 5-2-26 19:35:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
