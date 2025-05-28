unit elm_toolbar_item_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_widget_item_eo_legacy;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Toolbar_Item = ^TElm_Toolbar_Item;
  TElm_Toolbar_Item = TEo;

type
  PElm_Toolbar_Item_Scrollto_Type = ^TElm_Toolbar_Item_Scrollto_Type;
  TElm_Toolbar_Item_Scrollto_Type = longint;

const
  ELM_TOOLBAR_ITEM_SCROLLTO_NONE = 0;
  ELM_TOOLBAR_ITEM_SCROLLTO_IN = 1;
  ELM_TOOLBAR_ITEM_SCROLLTO_FIRST = 2;
  ELM_TOOLBAR_ITEM_SCROLLTO_MIDDLE = 4;
  ELM_TOOLBAR_ITEM_SCROLLTO_LAST = 8;

type
  TElm_Toolbar_Item_State = record
    _label: pchar;
    icon_str: pchar;
    icon: PEfl_Canvas_Object;
    func: TEvas_Smart_Cb;
    data: pointer;
  end;
  PElm_Toolbar_Item_State = ^TElm_Toolbar_Item_State;

function elm_toolbar_item_prev_get(obj: PElm_Toolbar_Item): PElm_Widget_Item; cdecl; external libelementary;
function elm_toolbar_item_next_get(obj: PElm_Toolbar_Item): PElm_Widget_Item; cdecl; external libelementary;
procedure elm_toolbar_item_selected_set(obj: PElm_Toolbar_Item; selected: TEina_Bool); cdecl; external libelementary;
function elm_toolbar_item_selected_get(obj: PElm_Toolbar_Item): TEina_Bool; cdecl; external libelementary;
procedure elm_toolbar_item_priority_set(obj: PElm_Toolbar_Item; priority: longint); cdecl; external libelementary;
function elm_toolbar_item_priority_get(obj: PElm_Toolbar_Item): longint; cdecl; external libelementary;
procedure elm_toolbar_item_icon_set(obj: PElm_Toolbar_Item; icon: pchar); cdecl; external libelementary;
function elm_toolbar_item_icon_get(obj: PElm_Toolbar_Item): pchar; cdecl; external libelementary;
function elm_toolbar_item_object_get(obj: PElm_Toolbar_Item): PEfl_Canvas_Object; cdecl; external libelementary;
function elm_toolbar_item_icon_object_get(obj: PElm_Toolbar_Item): PEfl_Canvas_Object; cdecl; external libelementary;
procedure elm_toolbar_item_separator_set(obj: PElm_Toolbar_Item; separator: TEina_Bool); cdecl; external libelementary;
function elm_toolbar_item_separator_get(obj: PElm_Toolbar_Item): TEina_Bool; cdecl; external libelementary;
function elm_toolbar_item_menu_get(obj: PElm_Toolbar_Item): PEfl_Canvas_Object; cdecl; external libelementary;
function elm_toolbar_item_state_set(obj: PElm_Toolbar_Item; state: PElm_Toolbar_Item_State): TEina_Bool; cdecl; external libelementary;
function elm_toolbar_item_state_get(obj: PElm_Toolbar_Item): PElm_Toolbar_Item_State; cdecl; external libelementary;
function elm_toolbar_item_icon_memfile_set(obj: PElm_Toolbar_Item; img: pointer; size: Tsize_t; format: pchar; key: pchar): TEina_Bool; cdecl; external libelementary;
function elm_toolbar_item_icon_file_set(obj: PElm_Toolbar_Item; file_: pchar; key: pchar): TEina_Bool; cdecl; external libelementary;
function elm_toolbar_item_state_add(obj: PElm_Toolbar_Item; icon: pchar; _label: pchar; func: TEvas_Smart_Cb; data: pointer): PElm_Toolbar_Item_State; cdecl; external libelementary;
function elm_toolbar_item_state_del(obj: PElm_Toolbar_Item; state: PElm_Toolbar_Item_State): TEina_Bool; cdecl; external libelementary;
function elm_toolbar_item_state_next(obj: PElm_Toolbar_Item): PElm_Toolbar_Item_State; cdecl; external libelementary;
function elm_toolbar_item_state_prev(obj: PElm_Toolbar_Item): PElm_Toolbar_Item_State; cdecl; external libelementary;
procedure elm_toolbar_item_show(obj: PElm_Toolbar_Item; scrollto: TElm_Toolbar_Item_Scrollto_Type); cdecl; external libelementary;
procedure elm_toolbar_item_bring_in(obj: PElm_Toolbar_Item; scrollto: TElm_Toolbar_Item_Scrollto_Type); cdecl; external libelementary;
procedure elm_toolbar_item_menu_set(obj: PElm_Toolbar_Item; menu: TEina_Bool); cdecl; external libelementary;

// === Konventiert am: 26-5-25 17:07:22 ===


implementation



end.
