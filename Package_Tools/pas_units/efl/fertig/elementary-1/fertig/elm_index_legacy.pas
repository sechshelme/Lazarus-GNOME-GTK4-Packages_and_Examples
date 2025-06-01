unit elm_index_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_index_add(parent: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_index_horizontal_set(obj: PEvas_Object; horizontal: TEina_Bool); cdecl; external libelementary;
function elm_index_horizontal_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 28-5-25 13:40:21 ===


implementation



end.
