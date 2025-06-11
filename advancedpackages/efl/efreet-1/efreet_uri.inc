{$IFDEF read_interface}


type
  TEfreet_Uri = record
    protocol: pchar;
    hostname: pchar;
    path: pchar;
  end;
  PEfreet_Uri = ^TEfreet_Uri;

function efreet_uri_encode(uri: PEfreet_Uri): pchar; cdecl; external libefreet;
function efreet_uri_decode(val: pchar): PEfreet_Uri; cdecl; external libefreet;
procedure efreet_uri_free(uri: PEfreet_Uri); cdecl; external libefreet;

// === Konventiert am: 11-6-25 17:06:27 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
