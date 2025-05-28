unit elm_toolbar_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, elm_general, elm_widget_item_eo_legacy;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Toolbar = ^TElm_Toolbar;
  TElm_Toolbar = TEo;

type
  PElm_Toolbar_Shrink_Mode = ^TElm_Toolbar_Shrink_Mode;
  TElm_Toolbar_Shrink_Mode = longint;

const
  ELM_TOOLBAR_SHRINK_NONE = 0;
  ELM_TOOLBAR_SHRINK_HIDE = 1;
  ELM_TOOLBAR_SHRINK_SCROLL = 2;
  ELM_TOOLBAR_SHRINK_MENU = 3;
  ELM_TOOLBAR_SHRINK_EXPAND = 4;
  ELM_TOOLBAR_SHRINK_LAST = 5;

function elm_toolbar_selected_item_get(obj: PElm_Toolbar): PElm_Widget_Item; cdecl; external libelementary;
function elm_toolbar_first_item_get(obj: PElm_Toolbar): PElm_Widget_Item; cdecl; external libelementary;
function elm_toolbar_last_item_get(obj: PElm_Toolbar): PElm_Widget_Item; cdecl; external libelementary;
function elm_toolbar_items_get(obj: PElm_Toolbar): PEina_Iterator; cdecl; external libelementary;
procedure elm_toolbar_homogeneous_set(obj: PElm_Toolbar; homogeneous: TEina_Bool); cdecl; external libelementary;
function elm_toolbar_homogeneous_get(obj: PElm_Toolbar): TEina_Bool; cdecl; external libelementary;
procedure elm_toolbar_align_set(obj: PElm_Toolbar; align: double); cdecl; external libelementary;
function elm_toolbar_align_get(obj: PElm_Toolbar): double; cdecl; external libelementary;
procedure elm_toolbar_select_mode_set(obj: PElm_Toolbar; mode: TElm_Object_Select_Mode); cdecl; external libelementary;
function elm_toolbar_select_mode_get(obj: PElm_Toolbar): TElm_Object_Select_Mode; cdecl; external libelementary;
procedure elm_toolbar_icon_size_set(obj: PElm_Toolbar; icon_size: longint); cdecl; external libelementary;
function elm_toolbar_icon_size_get(obj: PElm_Toolbar): longint; cdecl; external libelementary;
procedure elm_toolbar_shrink_mode_set(obj: PElm_Toolbar; shrink_mode: TElm_Toolbar_Shrink_Mode); cdecl; external libelementary;
function elm_toolbar_shrink_mode_get(obj: PElm_Toolbar): TElm_Toolbar_Shrink_Mode; cdecl; external libelementary;
procedure elm_toolbar_menu_parent_set(obj: PElm_Toolbar; parent: PEfl_Canvas_Object); cdecl; external libelementary;
function elm_toolbar_menu_parent_get(obj: PElm_Toolbar): PEfl_Canvas_Object; cdecl; external libelementary;
procedure elm_toolbar_standard_priority_set(obj: PElm_Toolbar; priority: longint); cdecl; external libelementary;
function elm_toolbar_standard_priority_get(obj: PElm_Toolbar): longint; cdecl; external libelementary;
function elm_toolbar_more_item_get(obj: PElm_Toolbar): PElm_Widget_Item; cdecl; external libelementary;
function elm_toolbar_item_insert_before(obj: PElm_Toolbar; before: PElm_Widget_Item; icon: pchar; _label: pchar; func: TEvas_Smart_Cb;
  data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_toolbar_item_insert_after(obj: PElm_Toolbar; after: PElm_Widget_Item; icon: pchar; _label: pchar; func: TEvas_Smart_Cb;
  data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_toolbar_item_append(obj: PElm_Toolbar; icon: pchar; _label: pchar; func: TEvas_Smart_Cb; data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_toolbar_items_count(obj: PElm_Toolbar): dword; cdecl; external libelementary;
function elm_toolbar_item_prepend(obj: PElm_Toolbar; icon: pchar; _label: pchar; func: TEvas_Smart_Cb; data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_toolbar_item_find_by_label(obj: PElm_Toolbar; _label: pchar): PElm_Widget_Item; cdecl; external libelementary;

// === Konventiert am: 26-5-25 15:23:40 ===


implementation



end.
