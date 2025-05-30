{$IFDEF read_interface}


type
  PElm_Flipselector = ^TElm_Flipselector;
  TElm_Flipselector = TEo;

function elm_flipselector_items_get(obj: PElm_Flipselector): PEina_List; cdecl; external libelementary;
function elm_flipselector_first_item_get(obj: PElm_Flipselector): PElm_Widget_Item; cdecl; external libelementary;
function elm_flipselector_last_item_get(obj: PElm_Flipselector): PElm_Widget_Item; cdecl; external libelementary;
function elm_flipselector_selected_item_get(obj: PElm_Flipselector): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_flipselector_first_interval_set(obj: PElm_Flipselector; interval: double); cdecl; external libelementary;
function elm_flipselector_first_interval_get(obj: PElm_Flipselector): double; cdecl; external libelementary;
function elm_flipselector_item_prepend(obj: PElm_Flipselector; _label: pchar; func: TEvas_Smart_Cb; data: pointer): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_flipselector_flip_next(obj: PElm_Flipselector); cdecl; external libelementary;
function elm_flipselector_item_append(obj: PElm_Flipselector; _label: pchar; func: TEvas_Smart_Cb; data: pointer): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_flipselector_flip_prev(obj: PElm_Flipselector); cdecl; external libelementary;

// === Konventiert am: 28-5-25 19:25:13 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
