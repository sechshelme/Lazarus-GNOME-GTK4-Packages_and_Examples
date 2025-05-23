unit elm_tooltip;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Tooltip_Orient = ^TElm_Tooltip_Orient;
  TElm_Tooltip_Orient = longint;

const
  ELM_TOOLTIP_ORIENT_NONE = 0;
  ELM_TOOLTIP_ORIENT_TOP_LEFT = 1;
  ELM_TOOLTIP_ORIENT_TOP = 2;
  ELM_TOOLTIP_ORIENT_TOP_RIGHT = 3;
  ELM_TOOLTIP_ORIENT_LEFT = 4;
  ELM_TOOLTIP_ORIENT_CENTER = 5;
  ELM_TOOLTIP_ORIENT_RIGHT = 6;
  ELM_TOOLTIP_ORIENT_BOTTOM_LEFT = 7;
  ELM_TOOLTIP_ORIENT_BOTTOM = 8;
  ELM_TOOLTIP_ORIENT_BOTTOM_RIGHT = 9;
  ELM_TOOLTIP_ORIENT_LAST = 10;

procedure elm_object_tooltip_move_freeze_push(obj: PEvas_Object); cdecl; external libelementary;
procedure elm_object_tooltip_move_freeze_pop(obj: PEvas_Object); cdecl; external libelementary;
function elm_object_tooltip_move_freeze_get(obj: PEvas_Object): longint; cdecl; external libelementary;
procedure elm_object_tooltip_orient_set(obj: PEvas_Object; orient: TElm_Tooltip_Orient); cdecl; external libelementary;
function elm_object_tooltip_orient_get(obj: PEvas_Object): TElm_Tooltip_Orient; cdecl; external libelementary;

type
  PElm_Tooltip_Content_Cb = ^TElm_Tooltip_Content_Cb;
  TElm_Tooltip_Content_Cb = function(data: pointer; obj: PEvas_Object; tooltip: PEvas_Object): PEvas_Object; cdecl;

  PElm_Tooltip_Item_Content_Cb = ^TElm_Tooltip_Item_Content_Cb;
  TElm_Tooltip_Item_Content_Cb = function(data: pointer; obj: PEvas_Object; tooltip: PEvas_Object; item: pointer): PEvas_Object; cdecl;

procedure elm_object_tooltip_show(obj: PEvas_Object); cdecl; external libelementary;
procedure elm_object_tooltip_hide(obj: PEvas_Object); cdecl; external libelementary;
procedure elm_object_tooltip_text_set(obj: PEvas_Object; text: pchar); cdecl; external libelementary;
procedure elm_object_tooltip_domain_translatable_text_set(obj: PEvas_Object; domain: pchar; text: pchar); cdecl; external libelementary;

procedure elm_object_tooltip_translatable_text_set(obj: PEvas_Object; text: pchar);

procedure elm_object_tooltip_content_cb_set(obj: PEvas_Object; func: TElm_Tooltip_Content_Cb; data: pointer; del_cb: TEvas_Smart_Cb); cdecl; external libelementary;
procedure elm_object_tooltip_unset(obj: PEvas_Object); cdecl; external libelementary;
procedure elm_object_tooltip_style_set(obj: PEvas_Object; style: pchar); cdecl; external libelementary;
function elm_object_tooltip_style_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
function elm_object_tooltip_window_mode_set(obj: PEvas_Object; disable: TEina_Bool): TEina_Bool; cdecl; external libelementary;
function elm_object_tooltip_window_mode_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 23-5-25 18:00:09 ===


implementation


procedure elm_object_tooltip_translatable_text_set(obj: PEvas_Object; text: pchar);
begin
  elm_object_tooltip_domain_translatable_text_set(obj, nil, text);
end;


end.
