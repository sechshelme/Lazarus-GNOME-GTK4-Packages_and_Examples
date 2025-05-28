{$IFDEF read_interface}


type
  PElm_Index_Item = ^TElm_Index_Item;
  TElm_Index_Item = TEo;

procedure elm_index_item_selected_set(obj: PElm_Index_Item; selected: TEina_Bool); cdecl; external libelementary;
procedure elm_index_item_priority_set(obj: PElm_Index_Item; priority: longint); cdecl; external libelementary;
function elm_index_item_letter_get(obj: PElm_Index_Item): pchar; cdecl; external libelementary;

// === Konventiert am: 28-5-25 13:40:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
