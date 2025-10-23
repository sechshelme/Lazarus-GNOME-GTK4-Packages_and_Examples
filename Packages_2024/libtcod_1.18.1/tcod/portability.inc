{$IFDEF read_interface}



function TCOD_strdup(s: pchar): pchar; cdecl; external libtcod;
function TCOD_strcasecmp(s1: pchar; s2: pchar): longint; cdecl; external libtcod;
function TCOD_strncasecmp(s1: pchar; s2: pchar; n: Tsize_t): longint; cdecl; external libtcod;

// === Konventiert am: 10-9-25 15:54:07 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
