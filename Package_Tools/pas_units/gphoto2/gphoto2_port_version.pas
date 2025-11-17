unit gphoto2_port_version;

interface

uses
  fp_glib2, fp_gphoto2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


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


implementation



end.
