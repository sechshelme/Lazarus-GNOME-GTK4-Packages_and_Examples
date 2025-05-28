{$IFDEF read_interface}


type
  PElm_Gengrid = ^TElm_Gengrid;
  TElm_Gengrid = TEo;

type
  PElm_Gengrid_Reorder_Type = ^TElm_Gengrid_Reorder_Type;
  TElm_Gengrid_Reorder_Type = longint;

const
  ELM_GENGRID_REORDER_TYPE_NORMAL = 0;
  ELM_GENGRID_REORDER_TYPE_SWAP = 1;

procedure elm_gengrid_align_set(obj: PElm_Gengrid; align_x: double; align_y: double); cdecl; external libelementary;
procedure elm_gengrid_align_get(obj: PElm_Gengrid; align_x: Pdouble; align_y: Pdouble); cdecl; external libelementary;
procedure elm_gengrid_filled_set(obj: PElm_Gengrid; fill: TEina_Bool); cdecl; external libelementary;
function elm_gengrid_filled_get(obj: PElm_Gengrid): TEina_Bool; cdecl; external libelementary;
procedure elm_gengrid_multi_select_set(obj: PElm_Gengrid; multi: TEina_Bool); cdecl; external libelementary;
function elm_gengrid_multi_select_get(obj: PElm_Gengrid): TEina_Bool; cdecl; external libelementary;
procedure elm_gengrid_group_item_size_set(obj: PElm_Gengrid; w: longint; h: longint); cdecl; external libelementary;
procedure elm_gengrid_group_item_size_get(obj: PElm_Gengrid; w: Plongint; h: Plongint); cdecl; external libelementary;
procedure elm_gengrid_select_mode_set(obj: PElm_Gengrid; mode: TElm_Object_Select_Mode); cdecl; external libelementary;
function elm_gengrid_select_mode_get(obj: PElm_Gengrid): TElm_Object_Select_Mode; cdecl; external libelementary;
procedure elm_gengrid_reorder_mode_set(obj: PElm_Gengrid; reorder_mode: TEina_Bool); cdecl; external libelementary;
function elm_gengrid_reorder_mode_get(obj: PElm_Gengrid): TEina_Bool; cdecl; external libelementary;
procedure elm_gengrid_highlight_mode_set(obj: PElm_Gengrid; highlight: TEina_Bool); cdecl; external libelementary;
function elm_gengrid_highlight_mode_get(obj: PElm_Gengrid): TEina_Bool; cdecl; external libelementary;
procedure elm_gengrid_reorder_type_set(obj: PElm_Gengrid; _type: TElm_Gengrid_Reorder_Type); cdecl; external libelementary;
procedure elm_gengrid_item_size_set(obj: PElm_Gengrid; w: longint; h: longint); cdecl; external libelementary;
procedure elm_gengrid_item_size_get(obj: PElm_Gengrid; w: Plongint; h: Plongint); cdecl; external libelementary;
procedure elm_gengrid_multi_select_mode_set(obj: PElm_Gengrid; mode: TElm_Object_Multi_Select_Mode); cdecl; external libelementary;
function elm_gengrid_multi_select_mode_get(obj: PElm_Gengrid): TElm_Object_Multi_Select_Mode; cdecl; external libelementary;
procedure elm_gengrid_horizontal_set(obj: PElm_Gengrid; horizontal: TEina_Bool); cdecl; external libelementary;
function elm_gengrid_horizontal_get(obj: PElm_Gengrid): TEina_Bool; cdecl; external libelementary;
function elm_gengrid_selected_item_get(obj: PElm_Gengrid): PElm_Widget_Item; cdecl; external libelementary;
function elm_gengrid_realized_items_get(obj: PElm_Gengrid): PEina_List; cdecl; external libelementary;
function elm_gengrid_first_item_get(obj: PElm_Gengrid): PElm_Widget_Item; cdecl; external libelementary;
function elm_gengrid_selected_items_get(obj: PElm_Gengrid): PEina_List; cdecl; external libelementary;
function elm_gengrid_last_item_get(obj: PElm_Gengrid): PElm_Widget_Item; cdecl; external libelementary;
function elm_gengrid_item_insert_before(obj: PElm_Gengrid; itc: PElm_Gengrid_Item_Class; data: pointer; relative: PElm_Widget_Item; func: TEvas_Smart_Cb;
  func_data: pointer): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_gengrid_realized_items_update(obj: PElm_Gengrid); cdecl; external libelementary;
function elm_gengrid_item_insert_after(obj: PElm_Gengrid; itc: PElm_Gengrid_Item_Class; data: pointer; relative: PElm_Widget_Item; func: TEvas_Smart_Cb;
  func_data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_gengrid_items_count(obj: PElm_Gengrid): dword; cdecl; external libelementary;
function elm_gengrid_at_xy_item_get(obj: PElm_Gengrid; x: longint; y: longint; xposret: Plongint; yposret: Plongint): PElm_Widget_Item; cdecl; external libelementary;
function elm_gengrid_item_append(obj: PElm_Gengrid; itc: PElm_Gengrid_Item_Class; data: pointer; func: TEvas_Smart_Cb; func_data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_gengrid_item_prepend(obj: PElm_Gengrid; itc: PElm_Gengrid_Item_Class; data: pointer; func: TEvas_Smart_Cb; func_data: pointer): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_gengrid_clear(obj: PElm_Gengrid); cdecl; external libelementary;
function elm_gengrid_item_sorted_insert(obj: PElm_Gengrid; itc: PElm_Gengrid_Item_Class; data: pointer; comp: TEina_Compare_Cb; func: TEvas_Smart_Cb;
  func_data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_gengrid_search_by_text_item_get(obj: PElm_Gengrid; item_to_search_from: PElm_Widget_Item; part_name: pchar; pattern: pchar; flags: TElm_Glob_Match_Flags): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_gengrid_reorder_mode_start(obj: PElm_Gengrid; tween_mode: TEcore_Pos_Map); cdecl; external libelementary;
procedure elm_gengrid_reorder_mode_stop(obj: PElm_Gengrid); cdecl; external libelementary;

// === Konventiert am: 26-5-25 13:35:46 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
