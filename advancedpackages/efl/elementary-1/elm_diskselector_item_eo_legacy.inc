{$IFDEF read_interface}


type
  PElm_Diskselector_Item = ^TElm_Diskselector_Item;
  TElm_Diskselector_Item = TEo;

function elm_diskselector_item_prev_get(obj: PElm_Diskselector_Item): PElm_Widget_Item; cdecl; external libelementary;
function elm_diskselector_item_next_get(obj: PElm_Diskselector_Item): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_diskselector_item_selected_set(obj: PElm_Diskselector_Item; selected: TEina_Bool); cdecl; external libelementary;
function elm_diskselector_item_selected_get(obj: PElm_Diskselector_Item): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 30-5-25 19:28:14 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
