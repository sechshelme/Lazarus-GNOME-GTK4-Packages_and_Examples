{$IFDEF read_interface}


type
  PElm_Ctxpopup_Item = ^TElm_Ctxpopup_Item;
  TElm_Ctxpopup_Item = TEo;

function elm_ctxpopup_item_prev_get(obj: PElm_Ctxpopup_Item): PElm_Widget_Item; cdecl; external libelementary;
function elm_ctxpopup_item_next_get(obj: PElm_Ctxpopup_Item): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_ctxpopup_item_selected_set(obj: PElm_Ctxpopup_Item; selected: TEina_Bool); cdecl; external libelementary;
function elm_ctxpopup_item_selected_get(obj: PElm_Ctxpopup_Item): TEina_Bool; cdecl; external libelementary;
procedure elm_ctxpopup_item_init(obj: PElm_Ctxpopup_Item; func: TEvas_Smart_Cb; data: pointer); cdecl; external libelementary;

// === Konventiert am: 28-5-25 16:37:10 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
