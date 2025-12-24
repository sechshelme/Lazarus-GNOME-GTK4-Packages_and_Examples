{$IFDEF read_interface}


function avahi_alternative_host_name(s: pchar): pchar; cdecl; external libavahi_common;
function avahi_alternative_service_name(s: pchar): pchar; cdecl; external libavahi_common;

// === Konventiert am: 24-12-25 15:58:57 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
