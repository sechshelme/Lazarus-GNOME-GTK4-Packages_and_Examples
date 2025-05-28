unit elm_index_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_widget_item_eo_legacy;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Index = ^TElm_Index;
  TElm_Index = TEo;

procedure elm_index_autohide_disabled_set(obj: PElm_Index; disabled: TEina_Bool); cdecl; external libelementary;
function elm_index_autohide_disabled_get(obj: PElm_Index): TEina_Bool; cdecl; external libelementary;
procedure elm_index_omit_enabled_set(obj: PElm_Index; enabled: TEina_Bool); cdecl; external libelementary;
function elm_index_omit_enabled_get(obj: PElm_Index): TEina_Bool; cdecl; external libelementary;
procedure elm_index_standard_priority_set(obj: PElm_Index; priority: longint); cdecl; external libelementary;
function elm_index_standard_priority_get(obj: PElm_Index): longint; cdecl; external libelementary;
procedure elm_index_delay_change_time_set(obj: PElm_Index; dtime: double); cdecl; external libelementary;
function elm_index_delay_change_time_get(obj: PElm_Index): double; cdecl; external libelementary;
procedure elm_index_indicator_disabled_set(obj: PElm_Index; disabled: TEina_Bool); cdecl; external libelementary;
function elm_index_indicator_disabled_get(obj: PElm_Index): TEina_Bool; cdecl; external libelementary;
procedure elm_index_item_level_set(obj: PElm_Index; level: longint); cdecl; external libelementary;
function elm_index_item_level_get(obj: PElm_Index): longint; cdecl; external libelementary;
procedure elm_index_level_go(obj: PElm_Index; level: longint); cdecl; external libelementary;
function elm_index_item_prepend(obj: PElm_Index; letter: pchar; func: TEvas_Smart_Cb; data: pointer): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_index_item_clear(obj: PElm_Index); cdecl; external libelementary;
function elm_index_item_insert_after(obj: PElm_Index; after: PElm_Widget_Item; letter: pchar; func: TEvas_Smart_Cb; data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_index_item_find(obj: PElm_Index; data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_index_item_insert_before(obj: PElm_Index; before: PElm_Widget_Item; letter: pchar; func: TEvas_Smart_Cb; data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_index_item_append(obj: PElm_Index; letter: pchar; func: TEvas_Smart_Cb; data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_index_selected_item_get(obj: PElm_Index; level: longint): PElm_Widget_Item; cdecl; external libelementary;
function elm_index_item_sorted_insert(obj: PElm_Index; letter: pchar; func: TEvas_Smart_Cb; data: pointer; cmp_func: TEina_Compare_Cb;
  cmp_data_func: TEina_Compare_Cb): PElm_Widget_Item; cdecl; external libelementary;

// === Konventiert am: 28-5-25 13:31:23 ===


implementation



end.
