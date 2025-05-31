unit elm_cache;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure elm_cache_all_flush; cdecl; external libelementary;

// === Konventiert am: 31-5-25 19:59:11 ===


implementation



end.
