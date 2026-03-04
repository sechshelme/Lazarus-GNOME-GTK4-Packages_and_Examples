unit lsmmisc;

interface

uses
  fp_glib2, fp_lasem;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function lsm_g_string_free_and_steal(_string: PGString): pchar; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:53:58 ===


implementation



end.
