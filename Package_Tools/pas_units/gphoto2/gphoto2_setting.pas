unit gphoto2_setting;

interface

uses
  fp_glib2, fp_gphoto2;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function gp_setting_set(id: pchar; key: pchar; value: pchar): longint; cdecl; external libgphoto2;
function gp_setting_get(id: pchar; key: pchar; value: pchar): longint; cdecl; external libgphoto2;

// === Konventiert am: 17-11-25 15:47:18 ===


implementation



end.
