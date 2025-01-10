unit adw_animation_util;

interface

uses
  fp_glib2, fp_GTK4;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function adw_lerp(a: Tdouble; b: Tdouble; t: Tdouble): Tdouble; cdecl; external libadwaita;
function adw_get_enable_animations(widget: PGtkWidget): Tgboolean; cdecl; external libadwaita;

// === Konventiert am: 10-1-25 15:07:00 ===


implementation



end.
