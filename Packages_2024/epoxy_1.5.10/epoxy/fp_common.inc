{$IFDEF read_interface}


type
  Pbool = ^Tbool;
  Tbool = Boolean8;


function epoxy_extension_in_string(extension_list: pchar; ext: pchar): Tbool; cdecl; external libepoxy;

// === Konventiert am: 4-5-26 15:03:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
