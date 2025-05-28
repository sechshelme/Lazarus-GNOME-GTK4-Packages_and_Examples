unit elm_index_item_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Index_Item = ^TElm_Index_Item;
  TElm_Index_Item = TEo;

procedure elm_index_item_selected_set(obj: PElm_Index_Item; selected: TEina_Bool); cdecl; external libelementary;
procedure elm_index_item_priority_set(obj: PElm_Index_Item; priority: longint); cdecl; external libelementary;
function elm_index_item_letter_get(obj: PElm_Index_Item): pchar; cdecl; external libelementary;

// === Konventiert am: 28-5-25 13:40:19 ===


implementation



end.
