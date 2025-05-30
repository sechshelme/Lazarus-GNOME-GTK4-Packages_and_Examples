{$IFDEF read_interface}


type
  PElm_Naviframe_Item = ^TElm_Naviframe_Item;
  TElm_Naviframe_Item = TEo;

procedure elm_naviframe_item_pop_to(obj: PElm_Naviframe_Item); cdecl; external libelementary;
function elm_naviframe_item_title_enabled_get(obj: PElm_Naviframe_Item): TEina_Bool; cdecl; external libelementary;
procedure elm_naviframe_item_title_enabled_set(obj: PElm_Naviframe_Item; enable: TEina_Bool; transition: TEina_Bool); cdecl; external libelementary;
procedure elm_naviframe_item_promote(obj: PElm_Naviframe_Item); cdecl; external libelementary;
procedure elm_naviframe_item_pop_cb_set(obj: PElm_Naviframe_Item; func: TElm_Naviframe_Item_Pop_Cb; data: pointer); cdecl; external libelementary;

// === Konventiert am: 30-5-25 19:28:16 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
