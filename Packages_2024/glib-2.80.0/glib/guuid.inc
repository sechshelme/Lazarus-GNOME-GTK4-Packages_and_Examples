
{$IFDEF read_interface}


function g_uuid_string_is_valid(str: Pgchar): Tgboolean; cdecl; external libglib2;
function g_uuid_string_random: Pgchar; cdecl; external libglib2;

// === Konventiert am: 11-8-24 19:40:22 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
