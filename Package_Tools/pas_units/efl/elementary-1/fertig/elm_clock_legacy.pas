unit elm_clock_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_clock_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;

// === Konventiert am: 26-5-25 19:35:39 ===


implementation



end.
