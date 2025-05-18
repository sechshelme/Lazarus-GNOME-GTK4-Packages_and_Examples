{$IFDEF read_interface}


function eina_binshare_add_length(obj: pointer; olen: dword): pointer; cdecl; external libeina;
function eina_binshare_ref(obj: pointer): pointer; cdecl; external libeina;
procedure eina_binshare_del(obj: pointer); cdecl; external libeina;
function eina_binshare_length(obj: pointer): longint; cdecl; external libeina;
procedure eina_binshare_dump; cdecl; external libeina;

// === Konventiert am: 17-5-25 13:52:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
