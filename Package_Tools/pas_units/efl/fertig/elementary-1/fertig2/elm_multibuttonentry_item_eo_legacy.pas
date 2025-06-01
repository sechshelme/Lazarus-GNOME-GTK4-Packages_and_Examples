unit elm_multibuttonentry_item_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Multibuttonentry_Item = ^TElm_Multibuttonentry_Item;
  TElm_Multibuttonentry_Item = TEo;

procedure elm_multibuttonentry_item_selected_set(obj: PElm_Multibuttonentry_Item; selected: TEina_Bool); cdecl; external libelementary;
function elm_multibuttonentry_item_selected_get(obj: PElm_Multibuttonentry_Item): TEina_Bool; cdecl; external libelementary;
function elm_multibuttonentry_item_prev_get(obj: PElm_Multibuttonentry_Item): PElm_Widget_Item; cdecl; external libelementary;
function elm_multibuttonentry_item_next_get(obj: PElm_Multibuttonentry_Item): PElm_Widget_Item; cdecl; external libelementary;

// === Konventiert am: 28-5-25 17:00:01 ===


implementation



end.
