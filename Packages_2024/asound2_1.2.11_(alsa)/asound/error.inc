{$IFDEF read_interface}


const
  SND_ERROR_BEGIN = 500000;
  SND_ERROR_INCOMPATIBLE_VERSION = SND_ERROR_BEGIN + 0;
  SND_ERROR_ALISP_NIL = SND_ERROR_BEGIN + 1;

function snd_strerror(errnum: longint): pchar; cdecl; external libasound;

type
  Tsnd_lib_error_handler_t = procedure(file_: pchar; line: longint; _function: pchar; err: longint; fmt: pchar); varargs; cdecl;

var
  snd_lib_error: Tsnd_lib_error_handler_t; cvar;external libasound;

function snd_lib_error_set_handler(handler: Tsnd_lib_error_handler_t): longint; cdecl; external libasound;

type
  Tsnd_local_error_handler_t = procedure(file_: pchar; line: longint; func: pchar; err: longint; fmt: pchar; arg: Tva_list); cdecl;

function snd_lib_error_set_local(func: Tsnd_local_error_handler_t): Tsnd_local_error_handler_t; cdecl; external libasound;

// === Konventiert am: 19-11-25 16:12:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
