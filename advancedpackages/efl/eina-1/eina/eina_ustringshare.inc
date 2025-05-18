{$IFDEF read_interface}


function eina_ustringshare_add_length(str: PEina_Unicode; slen: dword): PEina_Unicode; cdecl; external libeina;
function eina_ustringshare_add(str: PEina_Unicode): PEina_Unicode; cdecl; external libeina;
function eina_ustringshare_ref(str: PEina_Unicode): PEina_Unicode; cdecl; external libeina;
procedure eina_ustringshare_del(str: PEina_Unicode); cdecl; external libeina;
function eina_ustringshare_strlen(str: PEina_Unicode): longint; cdecl; external libeina;

// === Konventiert am: 17-5-25 16:00:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
