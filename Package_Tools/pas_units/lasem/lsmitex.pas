unit lsmitex;

interface

uses
  fp_glib2, fp_lasem;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function lsm_itex_to_mathml(itex: pchar; size: Tgssize): pchar; cdecl; external liblasem;
procedure lsm_itex_free_mathml_buffer(mathml: pchar); cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:38:58 ===


implementation



end.
