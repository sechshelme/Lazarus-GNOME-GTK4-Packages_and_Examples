{$IFDEF read_interface}


function evhttp_start(address: pchar; port: Tev_uint16_t): Pevhttp; cdecl; external libevent;
function evhttp_connection_new(address: pchar; port: Tev_uint16_t): Pevhttp_connection; cdecl; external libevent;
procedure evhttp_connection_set_base(evcon: Pevhttp_connection; base: Pevent_base); cdecl; external libevent;


  // === Konventiert am: 26-8-25 19:37:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
