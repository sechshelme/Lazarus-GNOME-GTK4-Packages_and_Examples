{$IFDEF read_interface}


type
  PElm_Menu_Item = ^TElm_Menu_Item;
  TElm_Menu_Item = TEo;

procedure elm_menu_item_icon_name_set(obj: PElm_Menu_Item; icon: pchar); cdecl; external libelementary;
function elm_menu_item_icon_name_get(obj: PElm_Menu_Item): pchar; cdecl; external libelementary;
function elm_menu_item_prev_get(obj: PElm_Menu_Item): PElm_Widget_Item; cdecl; external libelementary;
function elm_menu_item_next_get(obj: PElm_Menu_Item): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_menu_item_selected_set(obj: PElm_Menu_Item; selected: TEina_Bool); cdecl; external libelementary;
function elm_menu_item_selected_get(obj: PElm_Menu_Item): TEina_Bool; cdecl; external libelementary;
function elm_menu_item_index_get(obj: PElm_Menu_Item): dword; cdecl; external libelementary;
procedure elm_menu_item_subitems_clear(obj: PElm_Menu_Item); cdecl; external libelementary;
function elm_menu_item_subitems_get(obj: PElm_Menu_Item): PEina_List; cdecl; external libelementary;
function elm_menu_item_is_separator(obj: PElm_Menu_Item): TEina_Bool; cdecl; external libelementary;
function elm_menu_item_object_get(obj: PElm_Menu_Item): PEfl_Canvas_Object; cdecl; external libelementary;

// === Konventiert am: 30-5-25 13:12:09 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
