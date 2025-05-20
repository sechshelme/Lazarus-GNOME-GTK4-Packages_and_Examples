unit Emile;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function emile_init: longint; cdecl; external libemile;
function emile_shutdown: longint; cdecl; external libemile;

// === Konventiert am: 20-5-25 15:35:26 ===


implementation



end.
