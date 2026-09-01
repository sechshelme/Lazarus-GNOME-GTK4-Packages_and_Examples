{$IFDEF read_interface}


const
  SODIUM_VERSION_STRING_ = '1.0.18';
  SODIUM_LIBRARY_VERSION_MAJOR_ = 10;
  SODIUM_LIBRARY_VERSION_MINOR_ = 3;

function sodium_version_string: pchar; cdecl; external libsodium;
function sodium_library_version_major: longint; cdecl; external libsodium;
function sodium_library_version_minor: longint; cdecl; external libsodium;
function sodium_library_minimal: longint; cdecl; external libsodium;

// === Konventiert am: 31-8-26 17:33:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
