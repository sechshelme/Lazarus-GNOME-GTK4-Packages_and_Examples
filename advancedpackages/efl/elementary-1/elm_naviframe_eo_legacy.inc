{$IFDEF read_interface}


type
  PElm_Naviframe = ^TElm_Naviframe;
  TElm_Naviframe = TEo;

procedure elm_naviframe_event_enabled_set(obj: PElm_Naviframe; enabled: TEina_Bool); cdecl; external libelementary;
function elm_naviframe_event_enabled_get(obj: PElm_Naviframe): TEina_Bool; cdecl; external libelementary;
procedure elm_naviframe_content_preserve_on_pop_set(obj: PElm_Naviframe; preserve: TEina_Bool); cdecl; external libelementary;
function elm_naviframe_content_preserve_on_pop_get(obj: PElm_Naviframe): TEina_Bool; cdecl; external libelementary;
procedure elm_naviframe_prev_btn_auto_pushed_set(obj: PElm_Naviframe; auto_pushed: TEina_Bool); cdecl; external libelementary;
function elm_naviframe_prev_btn_auto_pushed_get(obj: PElm_Naviframe): TEina_Bool; cdecl; external libelementary;
function elm_naviframe_items_get(obj: PElm_Naviframe): PEina_List; cdecl; external libelementary;
function elm_naviframe_top_item_get(obj: PElm_Naviframe): PElm_Widget_Item; cdecl; external libelementary;
function elm_naviframe_bottom_item_get(obj: PElm_Naviframe): PElm_Widget_Item; cdecl; external libelementary;
function elm_naviframe_item_pop(obj: PElm_Naviframe): PEfl_Canvas_Object; cdecl; external libelementary;
function elm_naviframe_item_insert_before(obj: PElm_Naviframe; before: PElm_Widget_Item; title_label: pchar; prev_btn: PEfl_Canvas_Object; next_btn: PEfl_Canvas_Object;
  content: PEfl_Canvas_Object; item_style: pchar): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_naviframe_item_simple_promote(obj: PElm_Naviframe; content: PEfl_Canvas_Object); cdecl; external libelementary;
function elm_naviframe_item_insert_after(obj: PElm_Naviframe; after: PElm_Widget_Item; title_label: pchar; prev_btn: PEfl_Canvas_Object; next_btn: PEfl_Canvas_Object;
  content: PEfl_Canvas_Object; item_style: pchar): PElm_Widget_Item; cdecl; external libelementary;

// === Konventiert am: 28-5-25 17:40:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
