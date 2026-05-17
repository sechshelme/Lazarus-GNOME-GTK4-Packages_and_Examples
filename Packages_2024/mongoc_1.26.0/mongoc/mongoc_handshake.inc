

  {$IFDEF read_enum}
const
  MONGOC_HANDSHAKE_APPNAME_MAX = 128;
  {$ENDIF read_enum}

{$IFDEF read_function}
function mongoc_handshake_data_append(driver_name: pchar; driver_version: pchar; platform: pchar): Boolean; cdecl; external libmongoc;
{$ENDIF read_function}

// === Konventiert am: 15-5-26 15:15:38 ===



{$IFDEF read_implementation}



{$ENDIF read_implementation}
