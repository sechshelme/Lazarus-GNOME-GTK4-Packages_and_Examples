
{$IFDEF read_interface}


function g_hostname_is_non_ascii(hostname: Pgchar): Tgboolean; cdecl; external libglib2;
function g_hostname_is_ascii_encoded(hostname: Pgchar): Tgboolean; cdecl; external libglib2;
function g_hostname_is_ip_address(hostname: Pgchar): Tgboolean; cdecl; external libglib2;
function g_hostname_to_ascii(hostname: Pgchar): Pgchar; cdecl; external libglib2;
function g_hostname_to_unicode(hostname: Pgchar): Pgchar; cdecl; external libglib2;

// === Konventiert am: 11-8-24 19:40:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
