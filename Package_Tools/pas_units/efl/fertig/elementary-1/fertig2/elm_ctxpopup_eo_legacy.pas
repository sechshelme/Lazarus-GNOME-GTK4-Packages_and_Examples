unit elm_ctxpopup_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  TElm_Ctxpopup = record
  end;
  PElm_Ctxpopup = ^TElm_Ctxpopup;

type
  PElm_Ctxpopup_Direction = ^TElm_Ctxpopup_Direction;
  TElm_Ctxpopup_Direction = longint;

const
  ELM_CTXPOPUP_DIRECTION_DOWN = 0;
  ELM_CTXPOPUP_DIRECTION_RIGHT = 1;
  ELM_CTXPOPUP_DIRECTION_LEFT = 2;
  ELM_CTXPOPUP_DIRECTION_UP = 3;
  ELM_CTXPOPUP_DIRECTION_UNKNOWN = 4;

function elm_ctxpopup_selected_item_get(obj: PElm_Ctxpopup): PElm_Widget_Item; cdecl; external libelementary;
function elm_ctxpopup_first_item_get(obj: PElm_Ctxpopup): PElm_Widget_Item; cdecl; external libelementary;
function elm_ctxpopup_last_item_get(obj: PElm_Ctxpopup): PElm_Widget_Item; cdecl; external libelementary;
function elm_ctxpopup_items_get(obj: PElm_Ctxpopup): PEina_List; cdecl; external libelementary;
procedure elm_ctxpopup_horizontal_set(obj: PElm_Ctxpopup; horizontal: TEina_Bool); cdecl; external libelementary;
function elm_ctxpopup_horizontal_get(obj: PElm_Ctxpopup): TEina_Bool; cdecl; external libelementary;
procedure elm_ctxpopup_auto_hide_disabled_set(obj: PElm_Ctxpopup; disabled: TEina_Bool); cdecl; external libelementary;
function elm_ctxpopup_auto_hide_disabled_get(obj: PElm_Ctxpopup): TEina_Bool; cdecl; external libelementary;
procedure elm_ctxpopup_hover_parent_set(obj: PElm_Ctxpopup; parent: PEfl_Canvas_Object); cdecl; external libelementary;
function elm_ctxpopup_hover_parent_get(obj: PElm_Ctxpopup): PEfl_Canvas_Object; cdecl; external libelementary;
procedure elm_ctxpopup_direction_priority_set(obj: PElm_Ctxpopup; first: TElm_Ctxpopup_Direction; second: TElm_Ctxpopup_Direction; third: TElm_Ctxpopup_Direction; fourth: TElm_Ctxpopup_Direction); cdecl; external libelementary;
procedure elm_ctxpopup_direction_priority_get(obj: PElm_Ctxpopup; first: PElm_Ctxpopup_Direction; second: PElm_Ctxpopup_Direction; third: PElm_Ctxpopup_Direction; fourth: PElm_Ctxpopup_Direction); cdecl; external libelementary;
function elm_ctxpopup_direction_get(obj: PElm_Ctxpopup): TElm_Ctxpopup_Direction; cdecl; external libelementary;
procedure elm_ctxpopup_dismiss(obj: PElm_Ctxpopup); cdecl; external libelementary;
procedure elm_ctxpopup_clear(obj: PElm_Ctxpopup); cdecl; external libelementary;
function elm_ctxpopup_item_insert_before(obj: PElm_Ctxpopup; before: PElm_Widget_Item; _label: pchar; icon: PEfl_Canvas_Object; func: TEvas_Smart_Cb;
  data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_ctxpopup_item_insert_after(obj: PElm_Ctxpopup; after: PElm_Widget_Item; _label: pchar; icon: PEfl_Canvas_Object; func: TEvas_Smart_Cb;
  data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_ctxpopup_item_append(obj: PElm_Ctxpopup; _label: pchar; icon: PEfl_Canvas_Object; func: TEvas_Smart_Cb; data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_ctxpopup_item_prepend(obj: PElm_Ctxpopup; _label: pchar; icon: PEfl_Canvas_Object; func: TEvas_Smart_Cb; data: pointer): PElm_Widget_Item; cdecl; external libelementary;

// === Konventiert am: 28-5-25 15:57:07 ===


implementation



end.
