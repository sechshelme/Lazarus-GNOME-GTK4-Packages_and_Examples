unit lsmsvgcolors;

interface

uses
  fp_glib2, fp_lasem;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function lsm_svg_color_from_string(name: pchar): dword; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:58:41 ===


implementation



end.
