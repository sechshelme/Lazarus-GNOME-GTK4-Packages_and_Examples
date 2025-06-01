unit elm_scale;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


procedure elm_object_scale_set(obj: PEvas_Object; scale: double); cdecl; external libelementary;
function elm_object_scale_get(obj: PEvas_Object): double; cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:01:11 ===


implementation



end.
