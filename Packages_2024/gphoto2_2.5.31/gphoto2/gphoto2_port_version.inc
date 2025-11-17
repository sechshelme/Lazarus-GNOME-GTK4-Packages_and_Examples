{$IFDEF read_interface}


type
  PGPVersionVerbosity = ^TGPVersionVerbosity;
  TGPVersionVerbosity = longint;

const
  GP_VERSION_SHORT = 0;
  GP_VERSION_VERBOSE = 1;

type
  TGPVersionFunc = function(verbose: TGPVersionVerbosity): PPchar; cdecl;

function gp_port_library_version(verbose: TGPVersionVerbosity): Ppchar; cdecl; external libgphoto2;

// === Konventiert am: 17-11-25 15:47:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
