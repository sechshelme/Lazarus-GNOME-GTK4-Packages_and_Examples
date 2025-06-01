unit elm_focus_item;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


function elm_object_focused_item_get(obj: PEvas_Object): PElm_Object_Item; cdecl; external libelementary;
function elm_object_focus_next_item_get(obj: PEvas_Object; dir: TElm_Focus_Direction): PElm_Object_Item; cdecl; external libelementary;
procedure elm_object_focus_next_item_set(obj: PEvas_Object; next_item: PElm_Object_Item; dir: TElm_Focus_Direction); cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:22:19 ===


implementation



end.
