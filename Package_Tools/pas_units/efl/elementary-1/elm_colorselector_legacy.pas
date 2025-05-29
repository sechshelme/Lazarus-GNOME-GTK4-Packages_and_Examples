unit elm_colorselector_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}



function elm_colorselector_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;

// === Konventiert am: 29-5-25 20:29:18 ===


implementation



end.
