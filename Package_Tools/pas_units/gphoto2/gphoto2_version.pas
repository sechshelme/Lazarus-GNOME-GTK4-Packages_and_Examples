unit gphoto2_version;

interface

uses
  fp_glib2, fp_gphoto2, gphoto2_port_version;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gp_library_version(verbose: TGPVersionVerbosity): PPchar; cdecl; external libgphoto2;


implementation



end.
