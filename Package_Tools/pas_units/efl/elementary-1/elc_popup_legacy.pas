unit elc_popup_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_popup_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;

// === Konventiert am: 31-5-25 19:46:57 ===


implementation



end.
