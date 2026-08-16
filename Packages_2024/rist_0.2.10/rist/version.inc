{$IFDEF read_interface}


const
  LIBextern_VERSION_MAJOR = 4;
  LIBextern_VERSION_MINOR = 4;
  LIBextern_VERSION_PATCH = 0;
  LIBextern_VERSION = $40400;

function LIBRIST_MAKE_API_VERSION(major, minor, patch: longint): longint;


// === Konventiert am: 15-8-26 19:16:33 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function LIBRIST_MAKE_API_VERSION(major, minor, patch: longint): longint;
begin
  LIBRIST_MAKE_API_VERSION := patch + minor * $100 + major * $10000;
end;


{$ENDIF read_implementation}
