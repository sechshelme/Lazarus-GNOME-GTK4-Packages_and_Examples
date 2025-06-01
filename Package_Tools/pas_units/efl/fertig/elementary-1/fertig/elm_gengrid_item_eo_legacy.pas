unit elm_gengrid_item_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_general, elm_widget_item_eo_legacy, elm_gen;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Gengrid_Item = ^TElm_Gengrid_Item;
  TElm_Gengrid_Item = TEo;

function elm_gengrid_item_prev_get(obj: PElm_Gengrid_Item): PElm_Widget_Item; cdecl; external libelementary;
function elm_gengrid_item_next_get(obj: PElm_Gengrid_Item): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_gengrid_item_selected_set(obj: PElm_Gengrid_Item; selected: TEina_Bool); cdecl; external libelementary;
function elm_gengrid_item_selected_get(obj: PElm_Gengrid_Item): TEina_Bool; cdecl; external libelementary;
function elm_gengrid_item_item_class_get(obj: PElm_Gengrid_Item): PElm_Gengrid_Item_Class; cdecl; external libelementary;
function elm_gengrid_item_index_get(obj: PElm_Gengrid_Item): longint; cdecl; external libelementary;
procedure elm_gengrid_item_pos_get(obj: PElm_Gengrid_Item; x: Pdword; y: Pdword); cdecl; external libelementary;
procedure elm_gengrid_item_select_mode_set(obj: PElm_Gengrid_Item; mode: TElm_Object_Select_Mode); cdecl; external libelementary;
function elm_gengrid_item_select_mode_get(obj: PElm_Gengrid_Item): TElm_Object_Select_Mode; cdecl; external libelementary;
procedure elm_gengrid_item_custom_size_set(obj: PElm_Gengrid_Item; w: longint; h: longint); cdecl; external libelementary;
procedure elm_gengrid_item_custom_size_get(obj: PElm_Gengrid_Item; w: Plongint; h: Plongint); cdecl; external libelementary;
procedure elm_gengrid_item_show(obj: PElm_Gengrid_Item; _type: TElm_Gengrid_Item_Scrollto_Type); cdecl; external libelementary;
procedure elm_gengrid_item_bring_in(obj: PElm_Gengrid_Item; _type: TElm_Gengrid_Item_Scrollto_Type); cdecl; external libelementary;
procedure elm_gengrid_item_update(obj: PElm_Gengrid_Item); cdecl; external libelementary;
procedure elm_gengrid_item_fields_update(obj: PElm_Gengrid_Item; parts: pchar; itf: TElm_Gengrid_Item_Field_Type); cdecl; external libelementary;
procedure elm_gengrid_item_item_class_update(obj: PElm_Gengrid_Item; itc: PElm_Gengrid_Item_Class); cdecl; external libelementary;
procedure elm_gengrid_item_all_contents_unset(obj: PElm_Gengrid_Item; l: PPEina_List); cdecl; external libelementary;

// === Konventiert am: 28-5-25 13:31:21 ===


implementation



end.
