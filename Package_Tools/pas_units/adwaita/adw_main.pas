unit adw_main;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure adw_init; cdecl; external libadwaita;
function adw_is_initialized: Tgboolean; cdecl; external libadwaita;

// === Konventiert am: 10-1-25 15:07:03 ===


implementation



end.
