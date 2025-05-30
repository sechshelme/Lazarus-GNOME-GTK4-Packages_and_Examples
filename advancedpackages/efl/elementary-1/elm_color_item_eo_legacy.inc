{$IFDEF read_interface}


type
  PElm_Color_Item = ^TElm_Color_Item;
  TElm_Color_Item = TEo;

procedure elm_color_item_color_set(obj: PElm_Color_Item; r: longint; g: longint; b: longint; a: longint); cdecl; external libelementary;
procedure elm_color_item_color_get(obj: PElm_Color_Item; r: Plongint; g: Plongint; b: Plongint; a: Plongint); cdecl; external libelementary;
procedure elm_color_item_selected_set(obj: PElm_Color_Item; selected: TEina_Bool); cdecl; external libelementary;
function elm_color_item_selected_get(obj: PElm_Color_Item): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 29-5-25 20:29:12 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
