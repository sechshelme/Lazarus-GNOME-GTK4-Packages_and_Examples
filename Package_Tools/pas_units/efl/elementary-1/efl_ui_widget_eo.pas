unit efl_ui_widget_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, efl_ui_focus_object_eo, efl_ui_eot;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Widget = ^TEfl_Ui_Widget;
  TEfl_Ui_Widget = TEo;

type
  TEfl_Ui_Widget_Focus_State = record
    manager: PEfl_Ui_Focus_Manager;
    parent: PEfl_Ui_Focus_Object;
    logical: TEina_Bool;
  end;
  PEfl_Ui_Widget_Focus_State = ^TEfl_Ui_Widget_Focus_State;

function EFL_UI_WIDGET_CLASS: PEfl_Class;

function efl_ui_widget_class_get: PEfl_Class; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_widget_cursor_set(obj: PEo; cursor: pchar): TEina_Bool; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_widget_cursor_get(obj: PEo): pchar; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_widget_cursor_style_set(obj: PEo; style: pchar): TEina_Bool; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_widget_cursor_style_get(obj: PEo): pchar; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_widget_cursor_theme_search_enabled_set(obj: PEo; allow: TEina_Bool): TEina_Bool; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_widget_cursor_theme_search_enabled_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
{$endif}
procedure efl_ui_widget_resize_object_set(obj: PEo; sobj: PEfl_Canvas_Object); cdecl; external libelementary;
procedure efl_ui_widget_disabled_set(obj: PEo; disabled: TEina_Bool); cdecl; external libelementary;
function efl_ui_widget_disabled_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
function efl_ui_widget_style_set(obj: PEo; style: pchar): TEina_Error; cdecl; external libelementary;
function efl_ui_widget_style_get(obj: PEo): pchar; cdecl; external libelementary;
function efl_ui_widget_input_event_handler(obj: PEo; eo_event: PEfl_Event; source: PEfl_Canvas_Object): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_widget_focus_allow_set(obj: PEo; can_focus: TEina_Bool); cdecl; external libelementary;
function efl_ui_widget_focus_allow_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_widget_parent_set(obj: PEo; parent: PEfl_Ui_Widget); cdecl; external libelementary;
function efl_ui_widget_parent_get(obj: PEo): PEfl_Ui_Widget; cdecl; external libelementary;
{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_widget_access_info_set(obj: PEo; txt: pchar); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_widget_access_info_get(obj: PEo): pchar; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_widget_on_access_activate(obj: PEo; act: TEfl_Ui_Activate): TEina_Bool; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_widget_on_access_update(obj: PEo; enable: TEina_Bool); cdecl; external libelementary;
{$endif}

function efl_ui_widget_sub_object_add(obj: PEo; sub_obj: PEfl_Canvas_Object): TEina_Bool; cdecl; external libelementary;
function efl_ui_widget_sub_object_del(obj: PEo; sub_obj: PEfl_Canvas_Object): TEina_Bool; cdecl; external libelementary;
function efl_ui_widget_theme_apply(obj: PEo): TEina_Error; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_widget_scroll_hold_push(obj: PEo); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_widget_scroll_hold_pop(obj: PEo); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_widget_scroll_freeze_push(obj: PEo); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_widget_scroll_freeze_pop(obj: PEo); cdecl; external libelementary;
{$endif}

function efl_ui_widget_interest_region_get(obj: PEo): TEina_Rect; cdecl; external libelementary;
function efl_ui_widget_focus_highlight_geometry_get(obj: PEo): TEina_Rect; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_widget_focus_move_policy_set(obj: PEo; policy: TEfl_Ui_Focus_Move_Policy); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_widget_focus_move_policy_get(obj: PEo): TEfl_Ui_Focus_Move_Policy; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_widget_focus_move_policy_automatic_set(obj: PEo; automatic: TEina_Bool); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_widget_focus_move_policy_automatic_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
{$endif}

function efl_ui_widget_focus_state_apply(obj: PEo; current_state: TEfl_Ui_Widget_Focus_State; configured_state: PEfl_Ui_Widget_Focus_State; redirect: PEfl_Ui_Widget): TEina_Bool; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
var
  _EFL_UI_WIDGET_EVENT_LANGUAGE_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_WIDGET_EVENT_LANGUAGE_CHANGED: PEfl_Event_Description;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
var
  _EFL_UI_WIDGET_EVENT_ACCESS_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_WIDGET_EVENT_ACCESS_CHANGED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 25-5-25 18:55:56 ===


implementation


function EFL_UI_WIDGET_CLASS: PEfl_Class;
begin
  EFL_UI_WIDGET_CLASS := efl_ui_widget_class_get;
end;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_WIDGET_EVENT_LANGUAGE_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_WIDGET_EVENT_LANGUAGE_CHANGED := @(_EFL_UI_WIDGET_EVENT_LANGUAGE_CHANGED);
end;

function EFL_UI_WIDGET_EVENT_ACCESS_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_WIDGET_EVENT_ACCESS_CHANGED := @(_EFL_UI_WIDGET_EVENT_ACCESS_CHANGED);
end;
{$endif}


end.
