{$IFDEF read_interface}


type
  PElm_Flipselector_Item = ^TElm_Flipselector_Item;
  TElm_Flipselector_Item = TEo;

procedure elm_flipselector_item_selected_set(obj: PElm_Flipselector_Item; selected: TEina_Bool); cdecl; external libelementary;
function elm_flipselector_item_selected_get(obj: PElm_Flipselector_Item): TEina_Bool; cdecl; external libelementary;
function elm_flipselector_item_prev_get(obj: PElm_Flipselector_Item): PElm_Widget_Item; cdecl; external libelementary;
function elm_flipselector_item_next_get(obj: PElm_Flipselector_Item): PElm_Widget_Item; cdecl; external libelementary;

// === Konventiert am: 1-6-25 12:57:32 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
