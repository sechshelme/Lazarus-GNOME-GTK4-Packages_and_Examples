unit elm_diskselector_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Diskselector = ^TElm_Diskselector;
  TElm_Diskselector = TEo;

procedure elm_diskselector_side_text_max_length_set(obj: PElm_Diskselector; len: longint); cdecl; external libelementary;
function elm_diskselector_side_text_max_length_get(obj: PElm_Diskselector): longint; cdecl; external libelementary;
procedure elm_diskselector_round_enabled_set(obj: PElm_Diskselector; enabled: TEina_Bool); cdecl; external libelementary;
function elm_diskselector_round_enabled_get(obj: PElm_Diskselector): TEina_Bool; cdecl; external libelementary;
procedure elm_diskselector_display_item_num_set(obj: PElm_Diskselector; num: longint); cdecl; external libelementary;
function elm_diskselector_display_item_num_get(obj: PElm_Diskselector): longint; cdecl; external libelementary;
function elm_diskselector_first_item_get(obj: PElm_Diskselector): PElm_Widget_Item; cdecl; external libelementary;
function elm_diskselector_items_get(obj: PElm_Diskselector): PEina_List; cdecl; external libelementary;
function elm_diskselector_last_item_get(obj: PElm_Diskselector): PElm_Widget_Item; cdecl; external libelementary;
function elm_diskselector_selected_item_get(obj: PElm_Diskselector): PElm_Widget_Item; cdecl; external libelementary;
function elm_diskselector_item_append(obj: PElm_Diskselector; _label: pchar; icon: PEfl_Canvas_Object; func: TEvas_Smart_Cb; data: pointer): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_diskselector_clear(obj: PElm_Diskselector); cdecl; external libelementary;

// === Konventiert am: 28-5-25 17:59:05 ===


implementation



end.
