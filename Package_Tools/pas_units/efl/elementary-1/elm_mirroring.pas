unit elm_mirroring;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_object_mirrored_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_object_mirrored_set(obj: PEvas_Object; mirrored: TEina_Bool); cdecl; external libelementary;
function elm_object_mirrored_automatic_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_object_mirrored_automatic_set(obj: PEvas_Object; automatic: TEina_Bool); cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:42:03 ===


implementation



end.
