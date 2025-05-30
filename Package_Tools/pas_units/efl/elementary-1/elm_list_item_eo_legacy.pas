unit elm_list_item_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_List_Item = ^TElm_List_Item;
  TElm_List_Item = TEo;

procedure elm_list_item_separator_set(obj: PElm_List_Item; setting: TEina_Bool); cdecl; external libelementary;
function elm_list_item_separator_get(obj: PElm_List_Item): TEina_Bool; cdecl; external libelementary;
procedure elm_list_item_selected_set(obj: PElm_List_Item; selected: TEina_Bool); cdecl; external libelementary;
function elm_list_item_selected_get(obj: PElm_List_Item): TEina_Bool; cdecl; external libelementary;
function elm_list_item_object_get(obj: PElm_List_Item): PEfl_Canvas_Object; cdecl; external libelementary;
function elm_list_item_prev(obj: PElm_List_Item): PElm_Widget_Item; cdecl; external libelementary;
function elm_list_item_next(obj: PElm_List_Item): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_list_item_show(obj: PElm_List_Item); cdecl; external libelementary;
procedure elm_list_item_bring_in(obj: PElm_List_Item); cdecl; external libelementary;

// === Konventiert am: 30-5-25 15:26:17 ===


implementation



end.
