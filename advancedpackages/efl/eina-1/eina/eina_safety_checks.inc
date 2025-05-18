{$IFDEF read_interface}

var
  EINA_ERROR_SAFETY_FAILED: TEina_Error; cvar;external libeina;

procedure _eina_safety_error(file_: pchar; func: pchar; line: longint; str: pchar); cdecl; external libeina;

// === Konventiert am: 16-5-25 19:49:11 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
