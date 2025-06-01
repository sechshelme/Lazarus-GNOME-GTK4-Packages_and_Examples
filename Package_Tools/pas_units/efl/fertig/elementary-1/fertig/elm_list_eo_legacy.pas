unit elm_list_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_general, elm_widget_item_eo_legacy;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_List = ^TElm_List;
  TElm_List = TEo;

procedure elm_list_horizontal_set(obj: PElm_List; horizontal: TEina_Bool); cdecl; external libelementary;
function elm_list_horizontal_get(obj: PElm_List): TEina_Bool; cdecl; external libelementary;
procedure elm_list_select_mode_set(obj: PElm_List; mode: TElm_Object_Select_Mode); cdecl; external libelementary;
function elm_list_select_mode_get(obj: PElm_List): TElm_Object_Select_Mode; cdecl; external libelementary;
procedure elm_list_focus_on_selection_set(obj: PElm_List; enabled: TEina_Bool); cdecl; external libelementary;
function elm_list_focus_on_selection_get(obj: PElm_List): TEina_Bool; cdecl; external libelementary;
procedure elm_list_multi_select_set(obj: PElm_List; multi: TEina_Bool); cdecl; external libelementary;
function elm_list_multi_select_get(obj: PElm_List): TEina_Bool; cdecl; external libelementary;
procedure elm_list_multi_select_mode_set(obj: PElm_List; mode: TElm_Object_Multi_Select_Mode); cdecl; external libelementary;
function elm_list_multi_select_mode_get(obj: PElm_List): TElm_Object_Multi_Select_Mode; cdecl; external libelementary;
procedure elm_list_mode_set(obj: PElm_List; mode: TElm_List_Mode); cdecl; external libelementary;
function elm_list_mode_get(obj: PElm_List): TElm_List_Mode; cdecl; external libelementary;
function elm_list_selected_item_get(obj: PElm_List): PElm_Widget_Item; cdecl; external libelementary;
function elm_list_items_get(obj: PElm_List): PEina_List; cdecl; external libelementary;
function elm_list_first_item_get(obj: PElm_List): PElm_Widget_Item; cdecl; external libelementary;
function elm_list_selected_items_get(obj: PElm_List): PEina_List; cdecl; external libelementary;
function elm_list_last_item_get(obj: PElm_List): PElm_Widget_Item; cdecl; external libelementary;
function elm_list_item_insert_before(obj: PElm_List; before: PElm_Widget_Item; _label: pchar; icon: PEfl_Canvas_Object; end_: PEfl_Canvas_Object;
  func: TEvas_Smart_Cb; data: pointer): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_list_go(obj: PElm_List); cdecl; external libelementary;
function elm_list_item_insert_after(obj: PElm_List; after: PElm_Widget_Item; _label: pchar; icon: PEfl_Canvas_Object; end_: PEfl_Canvas_Object;
  func: TEvas_Smart_Cb; data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_list_at_xy_item_get(obj: PElm_List; x: longint; y: longint; posret: Plongint): PElm_Widget_Item; cdecl; external libelementary;
function elm_list_item_append(obj: PElm_List; _label: pchar; icon: PEfl_Canvas_Object; end_: PEfl_Canvas_Object; func: TEvas_Smart_Cb;
  data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_list_item_prepend(obj: PElm_List; _label: pchar; icon: PEfl_Canvas_Object; end_: PEfl_Canvas_Object; func: TEvas_Smart_Cb;
  data: pointer): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_list_clear(obj: PElm_List); cdecl; external libelementary;
function elm_list_item_sorted_insert(obj: PElm_List; _label: pchar; icon: PEfl_Canvas_Object; end_: PEfl_Canvas_Object; func: TEvas_Smart_Cb;
  data: pointer; cmp_func: TEina_Compare_Cb): PElm_Widget_Item; cdecl; external libelementary;

// === Konventiert am: 26-5-25 13:35:50 ===


implementation



end.
