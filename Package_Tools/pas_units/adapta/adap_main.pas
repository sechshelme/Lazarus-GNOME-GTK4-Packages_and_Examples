unit adap_main;

interface

uses
  fp_GTK4, fp_glib2, fp_adapta;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



procedure adap_init; cdecl; external libadapta;
function adap_is_initialized: Tgboolean; cdecl; external libadapta;

// === Konventiert am: 4-12-25 17:08:38 ===


implementation



end.
