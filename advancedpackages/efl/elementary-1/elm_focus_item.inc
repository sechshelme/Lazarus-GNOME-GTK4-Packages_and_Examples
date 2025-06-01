{$IFDEF read_interface}


function elm_object_focused_item_get(obj: PEvas_Object): PElm_Object_Item; cdecl; external libelementary;
function elm_object_focus_next_item_get(obj: PEvas_Object; dir: TElm_Focus_Direction): PElm_Object_Item; cdecl; external libelementary;
procedure elm_object_focus_next_item_set(obj: PEvas_Object; next_item: PElm_Object_Item; dir: TElm_Focus_Direction); cdecl; external libelementary;

// === Konventiert am: 1-6-25 13:22:19 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
