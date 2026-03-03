unit lsmdomentities;

interface

uses
  fp_lasem;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function lsm_dom_get_entity(name: pchar): pchar; cdecl; external liblasem;

// === Konventiert am: 3-3-26 15:12:11 ===


implementation



end.
