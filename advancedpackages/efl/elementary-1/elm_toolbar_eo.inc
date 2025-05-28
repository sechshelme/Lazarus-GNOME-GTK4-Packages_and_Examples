{$IFDEF read_interface}


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

function ELM_TOOLBAR_CLASS: PEfl_Class;

function elm_toolbar_class_get: PEfl_Class; cdecl; external libelementary;
function elm_obj_toolbar_selected_item_get(obj: PEo): PElm_Widget_Item; cdecl; external libelementary;
function elm_obj_toolbar_first_item_get(obj: PEo): PElm_Widget_Item; cdecl; external libelementary;
function elm_obj_toolbar_last_item_get(obj: PEo): PElm_Widget_Item; cdecl; external libelementary;
function elm_obj_toolbar_items_get(obj: PEo): PEina_Iterator; cdecl; external libelementary;
procedure elm_obj_toolbar_homogeneous_set(obj: PEo; homogeneous: TEina_Bool); cdecl; external libelementary;
function elm_obj_toolbar_homogeneous_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure elm_obj_toolbar_align_set(obj: PEo; align: double); cdecl; external libelementary;
function elm_obj_toolbar_align_get(obj: PEo): double; cdecl; external libelementary;
procedure elm_obj_toolbar_select_mode_set(obj: PEo; mode: TElm_Object_Select_Mode); cdecl; external libelementary;
function elm_obj_toolbar_select_mode_get(obj: PEo): TElm_Object_Select_Mode; cdecl; external libelementary;
procedure elm_obj_toolbar_icon_size_set(obj: PEo; icon_size: longint); cdecl; external libelementary;
function elm_obj_toolbar_icon_size_get(obj: PEo): longint; cdecl; external libelementary;
procedure elm_obj_toolbar_shrink_mode_set(obj: PEo; shrink_mode: TElm_Toolbar_Shrink_Mode); cdecl; external libelementary;
function elm_obj_toolbar_shrink_mode_get(obj: PEo): TElm_Toolbar_Shrink_Mode; cdecl; external libelementary;
procedure elm_obj_toolbar_menu_parent_set(obj: PEo; parent: PEfl_Canvas_Object); cdecl; external libelementary;
function elm_obj_toolbar_menu_parent_get(obj: PEo): PEfl_Canvas_Object; cdecl; external libelementary;
procedure elm_obj_toolbar_standard_priority_set(obj: PEo; priority: longint); cdecl; external libelementary;
function elm_obj_toolbar_standard_priority_get(obj: PEo): longint; cdecl; external libelementary;
function elm_obj_toolbar_more_item_get(obj: PEo): PElm_Widget_Item; cdecl; external libelementary;
function elm_obj_toolbar_item_insert_before(obj: PEo; before: PElm_Widget_Item; icon: pchar; _label: pchar; func: TEvas_Smart_Cb;
  data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_obj_toolbar_item_insert_after(obj: PEo; after: PElm_Widget_Item; icon: pchar; _label: pchar; func: TEvas_Smart_Cb;
  data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_obj_toolbar_item_append(obj: PEo; icon: pchar; _label: pchar; func: TEvas_Smart_Cb; data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_obj_toolbar_items_count(obj: PEo): dword; cdecl; external libelementary;
function elm_obj_toolbar_item_prepend(obj: PEo; icon: pchar; _label: pchar; func: TEvas_Smart_Cb; data: pointer): PElm_Widget_Item; cdecl; external libelementary;
function elm_obj_toolbar_item_find_by_label(obj: PEo; _label: pchar): PElm_Widget_Item; cdecl; external libelementary;

var
  _ELM_TOOLBAR_EVENT_ITEM_FOCUSED: TEfl_Event_Description; cvar;external libelementary;
  _ELM_TOOLBAR_EVENT_ITEM_UNFOCUSED: TEfl_Event_Description; cvar;external libelementary;

function ELM_TOOLBAR_EVENT_ITEM_FOCUSED: PEfl_Event_Description;
function ELM_TOOLBAR_EVENT_ITEM_UNFOCUSED: PEfl_Event_Description;


// === Konventiert am: 26-5-25 15:23:37 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function ELM_TOOLBAR_CLASS: PEfl_Class;
begin
  ELM_TOOLBAR_CLASS := elm_toolbar_class_get;
end;

function ELM_TOOLBAR_EVENT_ITEM_FOCUSED: PEfl_Event_Description;
begin
  ELM_TOOLBAR_EVENT_ITEM_FOCUSED := @(_ELM_TOOLBAR_EVENT_ITEM_FOCUSED);
end;

function ELM_TOOLBAR_EVENT_ITEM_UNFOCUSED: PEfl_Event_Description;
begin
  ELM_TOOLBAR_EVENT_ITEM_UNFOCUSED := @(_ELM_TOOLBAR_EVENT_ITEM_UNFOCUSED);
end;


{$ENDIF read_implementation}
