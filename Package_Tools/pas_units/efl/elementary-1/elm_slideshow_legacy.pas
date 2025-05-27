unit elm_slideshow_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_slideshow_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;

// === Konventiert am: 27-5-25 17:54:02 ===


implementation



end.
