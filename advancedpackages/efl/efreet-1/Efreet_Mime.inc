{$IFDEF read_interface}


function efreet_mime_init: longint; cdecl; external libefreet;
function efreet_mime_shutdown: longint; cdecl; external libefreet;
function efreet_mime_type_get(file_: pchar): pchar; cdecl; external libefreet;
function efreet_mime_magic_type_get(file_: pchar): pchar; cdecl; external libefreet;
function efreet_mime_globs_type_get(file_: pchar): pchar; cdecl; external libefreet;
function efreet_mime_special_type_get(file_: pchar): pchar; cdecl; external libefreet;
function efreet_mime_fallback_type_get(file_: pchar): pchar; cdecl; external libefreet;
function efreet_mime_type_icon_get(mime: pchar; theme: pchar; size: dword): pchar; cdecl; external libefreet;
procedure efreet_mime_type_cache_clear; cdecl; external libefreet;
procedure efreet_mime_type_cache_flush; cdecl; external libefreet;

// === Konventiert am: 11-6-25 17:06:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
