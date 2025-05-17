{$IFDEF read_interface}


type
  PEina_Error = ^TEina_Error;
  TEina_Error = longint;

  PEina_Success_Flag = ^TEina_Success_Flag;
  TEina_Success_Flag = TEina_Bool;

const
  EINA_ERROR_NO_ERROR = TEina_Error(0);

var
  EINA_ERROR_OUT_OF_MEMORY: TEina_Error; cvar;external libeina; // deprecated;

function eina_error_msg_register(msg: pchar): TEina_Error; cdecl; external libeina;
function eina_error_msg_static_register(msg: pchar): TEina_Error; cdecl; external libeina;
function eina_error_msg_modify(error: TEina_Error; msg: pchar): TEina_Bool; cdecl; external libeina;
function eina_error_get: TEina_Error; cdecl; external libeina;
procedure eina_error_set(err: TEina_Error); cdecl; external libeina;
function eina_error_msg_get(error: TEina_Error): pchar; cdecl; external libeina;
function eina_error_find(msg: pchar): TEina_Error; cdecl; external libeina;

// === Konventiert am: 14-5-25 19:12:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}




{$ENDIF read_implementation}
