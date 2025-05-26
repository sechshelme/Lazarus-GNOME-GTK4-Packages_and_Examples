unit elm_genlist_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, elm_general, elm_widget_item_eo_legacy, elm_gen;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Genlist = ^TElm_Genlist;
  TElm_Genlist = TEo;

procedure elm_genlist_homogeneous_set(obj: PElm_Genlist; homogeneous: TEina_Bool); cdecl; external libelementary;
function elm_genlist_homogeneous_get(obj: PElm_Genlist): TEina_Bool; cdecl; external libelementary;
procedure elm_genlist_select_mode_set(obj: PElm_Genlist; mode: TElm_Object_Select_Mode); cdecl; external libelementary;
function elm_genlist_select_mode_get(obj: PElm_Genlist): TElm_Object_Select_Mode; cdecl; external libelementary;
procedure elm_genlist_focus_on_selection_set(obj: PElm_Genlist; enabled: TEina_Bool); cdecl; external libelementary;
function elm_genlist_focus_on_selection_get(obj: PElm_Genlist): TEina_Bool; cdecl; external libelementary;
procedure elm_genlist_longpress_timeout_set(obj: PElm_Genlist; timeout: double); cdecl; external libelementary;
function elm_genlist_longpress_timeout_get(obj: PElm_Genlist): double; cdecl; external libelementary;
procedure elm_genlist_multi_select_set(obj: PElm_Genlist; multi: TEina_Bool); cdecl; external libelementary;
function elm_genlist_multi_select_get(obj: PElm_Genlist): TEina_Bool; cdecl; external libelementary;
procedure elm_genlist_reorder_mode_set(obj: PElm_Genlist; reorder_mode: TEina_Bool); cdecl; external libelementary;
function elm_genlist_reorder_mode_get(obj: PElm_Genlist): TEina_Bool; cdecl; external libelementary;
procedure elm_genlist_decorate_mode_set(obj: PElm_Genlist; decorated: TEina_Bool); cdecl; external libelementary;
function elm_genlist_decorate_mode_get(obj: PElm_Genlist): TEina_Bool; cdecl; external libelementary;
procedure elm_genlist_multi_select_mode_set(obj: PElm_Genlist; mode: TElm_Object_Multi_Select_Mode); cdecl; external libelementary;
function elm_genlist_multi_select_mode_get(obj: PElm_Genlist): TElm_Object_Multi_Select_Mode; cdecl; external libelementary;
procedure elm_genlist_block_count_set(obj: PElm_Genlist; count: longint); cdecl; external libelementary;
function elm_genlist_block_count_get(obj: PElm_Genlist): longint; cdecl; external libelementary;
procedure elm_genlist_tree_effect_enabled_set(obj: PElm_Genlist; enabled: TEina_Bool); cdecl; external libelementary;
function elm_genlist_tree_effect_enabled_get(obj: PElm_Genlist): TEina_Bool; cdecl; external libelementary;
procedure elm_genlist_highlight_mode_set(obj: PElm_Genlist; highlight: TEina_Bool); cdecl; external libelementary;
function elm_genlist_highlight_mode_get(obj: PElm_Genlist): TEina_Bool; cdecl; external libelementary;
procedure elm_genlist_mode_set(obj: PElm_Genlist; mode: TElm_List_Mode); cdecl; external libelementary;
function elm_genlist_mode_get(obj: PElm_Genlist): TElm_List_Mode; cdecl; external libelementary;
function elm_genlist_decorated_item_get(obj: PElm_Genlist): PElm_Widget_Item; cdecl; external libelementary;
function elm_genlist_selected_item_get(obj: PElm_Genlist): PElm_Widget_Item; cdecl; external libelementary;
function elm_genlist_first_item_get(obj: PElm_Genlist): PElm_Widget_Item; cdecl; external libelementary;
function elm_genlist_realized_items_get(obj: PElm_Genlist): PEina_List; cdecl; external libelementary;
function elm_genlist_selected_items_get(obj: PElm_Genlist): PEina_List; cdecl; external libelementary;
function elm_genlist_last_item_get(obj: PElm_Genlist): PElm_Widget_Item; cdecl; external libelementary;
function elm_genlist_item_insert_before(obj: PElm_Genlist; itc: PElm_Genlist_Item_Class; data: pointer; parent: PElm_Widget_Item; before_it: PElm_Widget_Item;
  _type: TElm_Genlist_Item_Type; func: TEvas_Smart_Cb; func_data: pointer): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_genlist_realized_items_update(obj: PElm_Genlist); cdecl; external libelementary;
function elm_genlist_item_insert_after(obj: PElm_Genlist; itc: PElm_Genlist_Item_Class; data: pointer; parent: PElm_Widget_Item; after_it: PElm_Widget_Item;
  _type: TElm_Genlist_Item_Type; func: TEvas_Smart_Cb; func_data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_genlist_at_xy_item_get(obj: PElm_Genlist; x: longint; y: longint; posret: Plongint): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_genlist_filter_set(obj: PElm_Genlist; key: pointer); cdecl; external libelementary;
function elm_genlist_filter_iterator_new(obj: PElm_Genlist): PEina_Iterator; cdecl; external libelementary;
function elm_genlist_filtered_items_count(obj: PElm_Genlist): dword; cdecl; external libelementary;
function elm_genlist_items_count(obj: PElm_Genlist): dword; cdecl; external libelementary;
function elm_genlist_item_prepend(obj: PElm_Genlist; itc: PElm_Genlist_Item_Class; data: pointer; parent: PElm_Widget_Item; _type: TElm_Genlist_Item_Type;
  func: TEvas_Smart_Cb; func_data: pointer): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_genlist_clear(obj: PElm_Genlist); cdecl; external libelementary;
function elm_genlist_item_append(obj: PElm_Genlist; itc: PElm_Genlist_Item_Class; data: pointer; parent: PElm_Widget_Item; _type: TElm_Genlist_Item_Type;
  func: TEvas_Smart_Cb; func_data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_genlist_item_sorted_insert(obj: PElm_Genlist; itc: PElm_Genlist_Item_Class; data: pointer; parent: PElm_Widget_Item; _type: TElm_Genlist_Item_Type;
  comp: TEina_Compare_Cb; func: TEvas_Smart_Cb; func_data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_genlist_search_by_text_item_get(obj: PElm_Genlist; item_to_search_from: PElm_Widget_Item; part_name: pchar; pattern: pchar; flags: TElm_Glob_Match_Flags): PElm_Widget_Item; cdecl; external libelementary;

// === Konventiert am: 26-5-25 13:09:52 ===


implementation



end.
