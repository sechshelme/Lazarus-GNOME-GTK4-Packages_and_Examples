{$IFDEF read_interface}


function efreet_trash_init: longint; cdecl; external libefreet;
function efreet_trash_shutdown: longint; cdecl; external libefreet;
function efreet_trash_dir_get(for_file: pchar): pchar; cdecl; external libefreet;
function efreet_trash_delete_uri(uri: PEfreet_Uri; force_delete: longint): longint; cdecl; external libefreet;
function efreet_trash_ls: PEina_List; cdecl; external libefreet;
function efreet_trash_is_empty: longint; cdecl; external libefreet;
function efreet_trash_empty_trash: longint; cdecl; external libefreet;

// === Konventiert am: 11-6-25 17:06:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
