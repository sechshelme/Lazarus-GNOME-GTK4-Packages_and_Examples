unit mgl_cf;

interface

uses
  mgl_command, define, abstract;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function mgl_create_graph_gl: THMGL; cdecl; external libmgl;

// === Konventiert am: 27-6-25 17:58:24 ===


implementation



end.
