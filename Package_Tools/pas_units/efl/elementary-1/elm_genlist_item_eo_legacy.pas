unit elm_genlist_item_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_widget_item_eo_legacy, elm_general, elm_gen;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Genlist_Item = ^TElm_Genlist_Item;
  TElm_Genlist_Item = TEo;

function elm_genlist_item_prev_get(obj: PElm_Genlist_Item): PElm_Widget_Item; cdecl; external libelementary;
function elm_genlist_item_next_get(obj: PElm_Genlist_Item): PElm_Widget_Item; cdecl; external libelementary;
function elm_genlist_item_parent_get(obj: PElm_Genlist_Item): PElm_Widget_Item; cdecl; external libelementary;
function elm_genlist_item_subitems_get(obj: PElm_Genlist_Item): PEina_List; cdecl; external libelementary;
procedure elm_genlist_item_selected_set(obj: PElm_Genlist_Item; selected: TEina_Bool); cdecl; external libelementary;
function elm_genlist_item_selected_get(obj: PElm_Genlist_Item): TEina_Bool; cdecl; external libelementary;
procedure elm_genlist_item_expanded_set(obj: PElm_Genlist_Item; expanded: TEina_Bool); cdecl; external libelementary;
function elm_genlist_item_expanded_get(obj: PElm_Genlist_Item): TEina_Bool; cdecl; external libelementary;
function elm_genlist_item_expanded_depth_get(obj: PElm_Genlist_Item): longint; cdecl; external libelementary;
function elm_genlist_item_item_class_get(obj: PElm_Genlist_Item): PElm_Genlist_Item_Class; cdecl; external libelementary;
function elm_genlist_item_index_get(obj: PElm_Genlist_Item): longint; cdecl; external libelementary;
function elm_genlist_item_decorate_mode_get(obj: PElm_Genlist_Item): pchar; cdecl; external libelementary;
procedure elm_genlist_item_flip_set(obj: PElm_Genlist_Item; flip: TEina_Bool); cdecl; external libelementary;
function elm_genlist_item_flip_get(obj: PElm_Genlist_Item): TEina_Bool; cdecl; external libelementary;
procedure elm_genlist_item_select_mode_set(obj: PElm_Genlist_Item; mode: TElm_Object_Select_Mode); cdecl; external libelementary;
function elm_genlist_item_select_mode_get(obj: PElm_Genlist_Item): TElm_Object_Select_Mode; cdecl; external libelementary;
function elm_genlist_item_type_get(obj: PElm_Genlist_Item): TElm_Genlist_Item_Type; cdecl; external libelementary;
procedure elm_genlist_item_pin_set(obj: PElm_Genlist_Item; pin: TEina_Bool); cdecl; external libelementary;
function elm_genlist_item_pin_get(obj: PElm_Genlist_Item): TEina_Bool; cdecl; external libelementary;
function elm_genlist_item_subitems_count(obj: PElm_Genlist_Item): dword; cdecl; external libelementary;
procedure elm_genlist_item_subitems_clear(obj: PElm_Genlist_Item); cdecl; external libelementary;
procedure elm_genlist_item_promote(obj: PElm_Genlist_Item); cdecl; external libelementary;
procedure elm_genlist_item_demote(obj: PElm_Genlist_Item); cdecl; external libelementary;
procedure elm_genlist_item_show(obj: PElm_Genlist_Item; _type: TElm_Genlist_Item_Scrollto_Type); cdecl; external libelementary;
procedure elm_genlist_item_bring_in(obj: PElm_Genlist_Item; _type: TElm_Genlist_Item_Scrollto_Type); cdecl; external libelementary;
procedure elm_genlist_item_all_contents_unset(obj: PElm_Genlist_Item; l: PPEina_List); cdecl; external libelementary;
procedure elm_genlist_item_update(obj: PElm_Genlist_Item); cdecl; external libelementary;
procedure elm_genlist_item_fields_update(obj: PElm_Genlist_Item; parts: pchar; itf: TElm_Genlist_Item_Field_Type); cdecl; external libelementary;
procedure elm_genlist_item_item_class_update(obj: PElm_Genlist_Item; itc: PElm_Genlist_Item_Class); cdecl; external libelementary;
procedure elm_genlist_item_decorate_mode_set(obj: PElm_Genlist_Item; decorate_it_type: pchar; decorate_it_set: TEina_Bool); cdecl; external libelementary;

// === Konventiert am: 26-5-25 17:31:57 ===


implementation



end.
