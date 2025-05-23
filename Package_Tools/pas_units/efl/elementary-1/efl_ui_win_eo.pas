unit efl_ui_win_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Win = ^TEfl_Ui_Win;
  TEfl_Ui_Win = TEo;
  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Win_Type = ^TEfl_Ui_Win_Type;
  TEfl_Ui_Win_Type = longint;

const
  EFL_UI_WIN_TYPE_UNKNOWN = -(1);
  EFL_UI_WIN_TYPE_BASIC = (-(1)) + 1;
  EFL_UI_WIN_TYPE_DIALOG_BASIC = (-(1)) + 2;
  EFL_UI_WIN_TYPE_DESKTOP = (-(1)) + 3;
  EFL_UI_WIN_TYPE_DOCK = (-(1)) + 4;
  EFL_UI_WIN_TYPE_TOOLBAR = (-(1)) + 5;
  EFL_UI_WIN_TYPE_MENU = (-(1)) + 6;
  EFL_UI_WIN_TYPE_UTILITY = (-(1)) + 7;
  EFL_UI_WIN_TYPE_SPLASH = (-(1)) + 8;
  EFL_UI_WIN_TYPE_DROPDOWN_MENU = (-(1)) + 9;
  EFL_UI_WIN_TYPE_POPUP_MENU = (-(1)) + 10;
  EFL_UI_WIN_TYPE_TOOLTIP = (-(1)) + 11;
  EFL_UI_WIN_TYPE_NOTIFICATION = (-(1)) + 12;
  EFL_UI_WIN_TYPE_COMBO = (-(1)) + 13;
  EFL_UI_WIN_TYPE_DND = (-(1)) + 14;
  EFL_UI_WIN_TYPE_INLINED_IMAGE = (-(1)) + 15;
  EFL_UI_WIN_TYPE_SOCKET_IMAGE = (-(1)) + 16;
  EFL_UI_WIN_TYPE_FAKE = (-(1)) + 17;
  EFL_UI_WIN_TYPE_NAVIFRAME_BASIC = 17;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Win_Keyboard_Mode = ^TEfl_Ui_Win_Keyboard_Mode;
  TEfl_Ui_Win_Keyboard_Mode = longint;

const
  EFL_UI_WIN_KEYBOARD_MODE_UNKNOWN = 0;
  EFL_UI_WIN_KEYBOARD_MODE_OFF = 1;
  EFL_UI_WIN_KEYBOARD_MODE_ON = 2;
  EFL_UI_WIN_KEYBOARD_MODE_ALPHA = 3;
  EFL_UI_WIN_KEYBOARD_MODE_NUMERIC = 4;
  EFL_UI_WIN_KEYBOARD_MODE_PIN = 5;
  EFL_UI_WIN_KEYBOARD_MODE_PHONE_NUMBER = 6;
  EFL_UI_WIN_KEYBOARD_MODE_HEX = 7;
  EFL_UI_WIN_KEYBOARD_MODE_TERMINAL = 8;
  EFL_UI_WIN_KEYBOARD_MODE_PASSWORD = 9;
  EFL_UI_WIN_KEYBOARD_MODE_IP = 10;
  EFL_UI_WIN_KEYBOARD_MODE_HOST = 11;
  EFL_UI_WIN_KEYBOARD_MODE_FILE = 12;
  EFL_UI_WIN_KEYBOARD_MODE_URL = 13;
  EFL_UI_WIN_KEYBOARD_MODE_KEYPAD = 14;
  EFL_UI_WIN_KEYBOARD_MODE_J2ME = 15;
  {$endif}

type
  PEfl_Ui_Win_Indicator_Mode = ^TEfl_Ui_Win_Indicator_Mode;
  TEfl_Ui_Win_Indicator_Mode = longint;

const
  EFL_UI_WIN_INDICATOR_MODE_OFF = 0;
  EFL_UI_WIN_INDICATOR_MODE_BG_OPAQUE = 1;
  EFL_UI_WIN_INDICATOR_MODE_BG_TRANSPARENT = 2;
  EFL_UI_WIN_INDICATOR_MODE_HIDDEN = 3;

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Win_Modal_Mode = ^TEfl_Ui_Win_Modal_Mode;
  TEfl_Ui_Win_Modal_Mode = longint;

const
  EFL_UI_WIN_MODAL_MODE_NONE = 0;
  EFL_UI_WIN_MODAL_MODE_MODAL = 1;
  {$endif}

  {$ifdef EFL_BETA_API_SUPPORT}
type
  PEfl_Ui_Win_Urgent_Mode = ^TEfl_Ui_Win_Urgent_Mode;
  TEfl_Ui_Win_Urgent_Mode = longint;

const
  EFL_UI_WIN_URGENT_MODE_NONE = 0;
  EFL_UI_WIN_URGENT_MODE_URGENT = 1;
  {$endif}

type
  PEfl_Ui_Win_Move_Resize_Mode = ^TEfl_Ui_Win_Move_Resize_Mode;
  TEfl_Ui_Win_Move_Resize_Mode = longint;

const
  EFL_UI_WIN_MOVE_RESIZE_MODE_MOVE = 1;
  EFL_UI_WIN_MOVE_RESIZE_MODE_TOP = 2;
  EFL_UI_WIN_MOVE_RESIZE_MODE_BOTTOM = 4;
  EFL_UI_WIN_MOVE_RESIZE_MODE_LEFT = 8;
  EFL_UI_WIN_MOVE_RESIZE_MODE_RIGHT = 16;

function EFL_UI_WIN_CLASS: PEfl_Class;

function efl_ui_win_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_win_indicator_mode_set(obj: PEo; _type: TEfl_Ui_Win_Indicator_Mode); cdecl; external libelementary;
function efl_ui_win_indicator_mode_get(obj: PEo): TEfl_Ui_Win_Indicator_Mode; cdecl; external libelementary;
{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_win_keyboard_mode_set(obj: PEo; mode: TEfl_Ui_Win_Keyboard_Mode); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_win_keyboard_mode_get(obj: PEo): TEfl_Ui_Win_Keyboard_Mode; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_win_wm_available_rotations_set(obj: PEo; allow_0: TEina_Bool; allow_90: TEina_Bool; allow_180: TEina_Bool; allow_270: TEina_Bool); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_win_wm_available_rotations_get(obj: PEo; allow_0: PEina_Bool; allow_90: PEina_Bool; allow_180: PEina_Bool; allow_270: PEina_Bool): TEina_Bool; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_win_wm_available_profiles_set(obj: PEo; profiles: PEina_Array); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_win_wm_available_profiles_get(obj: PEo): PEina_Array; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_win_screen_constrain_set(obj: PEo; constrain: TEina_Bool); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_win_screen_constrain_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_win_prop_focus_skip_set(obj: PEo; skip: TEina_Bool); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_win_autohide_set(obj: PEo; autohide: TEina_Bool); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_win_autohide_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
{$endif}

procedure efl_ui_win_exit_on_close_set(obj: PEo; exit_code: PEina_Value); cdecl; external libelementary;
function efl_ui_win_exit_on_close_get(obj: PEo): PEina_Value; cdecl; external libelementary;
procedure efl_ui_win_icon_object_set(obj: PEo; icon: PEfl_Canvas_Object); cdecl; external libelementary;
function efl_ui_win_icon_object_get(obj: PEo): PEfl_Canvas_Object; cdecl; external libelementary;
procedure efl_ui_win_minimized_set(obj: PEo; state: TEina_Bool); cdecl; external libelementary;
function efl_ui_win_minimized_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_win_maximized_set(obj: PEo; maximized: TEina_Bool); cdecl; external libelementary;
function efl_ui_win_maximized_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_win_fullscreen_set(obj: PEo; fullscreen: TEina_Bool); cdecl; external libelementary;
function efl_ui_win_fullscreen_get(obj: PEo): TEina_Bool; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_win_sticky_set(obj: PEo; sticky: TEina_Bool); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_win_sticky_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_win_urgent_set(obj: PEo; urgent: TEfl_Ui_Win_Urgent_Mode); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_win_urgent_get(obj: PEo): TEfl_Ui_Win_Urgent_Mode; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_win_modal_set(obj: PEo; modal: TEfl_Ui_Win_Modal_Mode); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_win_modal_get(obj: PEo): TEfl_Ui_Win_Modal_Mode; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_win_borderless_set(obj: PEo; borderless: TEina_Bool); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_win_borderless_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_win_role_set(obj: PEo; role: pchar); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_win_role_get(obj: PEo): pchar; cdecl; external libelementary;
{$endif}

procedure efl_ui_win_name_set(obj: PEo; name: pchar); cdecl; external libelementary;
function efl_ui_win_name_get(obj: PEo): pchar; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_win_type_set(obj: PEo; _type: TEfl_Ui_Win_Type); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_win_type_get(obj: PEo): TEfl_Ui_Win_Type; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_win_accel_preference_set(obj: PEo; accel: pchar); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_win_accel_preference_get(obj: PEo): pchar; cdecl; external libelementary;
{$endif}

procedure efl_ui_win_alpha_set(obj: PEo; alpha: TEina_Bool); cdecl; external libelementary;
function efl_ui_win_alpha_get(obj: PEo): TEina_Bool; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_win_stack_id_get(obj: PEo): pchar; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_win_stack_master_id_set(obj: PEo; id: pchar); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_win_stack_master_id_get(obj: PEo): pchar; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_win_stack_base_set(obj: PEo; base: TEina_Bool); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_win_stack_base_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_win_stack_pop_to(obj: PEo); cdecl; external libelementary;
{$endif}

procedure efl_ui_win_exit_on_all_windows_closed_set(exit_code: PEina_Value); cdecl; external libelementary;
function efl_ui_win_exit_on_all_windows_closed_get: PEina_Value; cdecl; external libelementary;
procedure efl_ui_win_activate(obj: PEo); cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_win_center(obj: PEo; h: TEina_Bool; v: TEina_Bool); cdecl; external libelementary;
{$endif}

function efl_ui_win_move_resize_start(obj: PEo; mode: TEfl_Ui_Win_Move_Resize_Mode): TEina_Bool; cdecl; external libelementary;
procedure efl_ui_win_hint_base_set(obj: PEo; sz: TEina_Size2D); cdecl; external libelementary;
function efl_ui_win_hint_base_get(obj: PEo): TEina_Size2D; cdecl; external libelementary;
procedure efl_ui_win_hint_step_set(obj: PEo; sz: TEina_Size2D); cdecl; external libelementary;
function efl_ui_win_hint_step_get(obj: PEo): TEina_Size2D; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_win_pointer_iterate(obj: PEo; hover: TEina_Bool): PEina_Iterator; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_win_rotation_set(obj: PEo; rotation: longint); cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_win_rotation_get(obj: PEo): longint; cdecl; external libelementary;
{$endif}

procedure efl_ui_win_focus_highlight_enabled_set(obj: PEo; enabled: TEina_Bool); cdecl; external libelementary;
function efl_ui_win_focus_highlight_enabled_get(obj: PEo): TEina_Bool; cdecl; external libelementary;
function efl_ui_win_focus_highlight_style_set(obj: PEo; style: pchar): TEina_Bool; cdecl; external libelementary;
function efl_ui_win_focus_highlight_style_get(obj: PEo): pchar; cdecl; external libelementary;
procedure efl_ui_win_focus_highlight_animate_set(obj: PEo; animate: TEina_Bool); cdecl; external libelementary;
function efl_ui_win_focus_highlight_animate_get(obj: PEo): TEina_Bool; cdecl; external libelementary;

var
  _EFL_UI_WIN_EVENT_DELETE_REQUEST: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_WIN_EVENT_DELETE_REQUEST: PEfl_Event_Description;

{$ifdef EFL_BETA_API_SUPPORT}
var
  _EFL_UI_WIN_EVENT_WITHDRAWN: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_WIN_EVENT_WITHDRAWN: PEfl_Event_Description;
{$endif}

var
  _EFL_UI_WIN_EVENT_MINIMIZED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_WIN_EVENT_MINIMIZED: PEfl_Event_Description;

var
  _EFL_UI_WIN_EVENT_NORMAL: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_WIN_EVENT_NORMAL: PEfl_Event_Description;

{$ifdef EFL_BETA_API_SUPPORT}
var
  _EFL_UI_WIN_EVENT_STICK: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_WIN_EVENT_STICK: PEfl_Event_Description;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
var
  _EFL_UI_WIN_EVENT_UNSTICK: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_WIN_EVENT_UNSTICK: PEfl_Event_Description;
{$endif}

var
  _EFL_UI_WIN_EVENT_FULLSCREEN_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_WIN_EVENT_FULLSCREEN_CHANGED: PEfl_Event_Description;

var
  _EFL_UI_WIN_EVENT_MAXIMIZED_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_WIN_EVENT_MAXIMIZED_CHANGED: PEfl_Event_Description;

{$ifdef EFL_BETA_API_SUPPORT}
var
  _EFL_UI_WIN_EVENT_INDICATOR_PROP_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_WIN_EVENT_INDICATOR_PROP_CHANGED: PEfl_Event_Description;
{$endif}

var
  _EFL_UI_WIN_EVENT_WIN_ROTATION_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_WIN_EVENT_WIN_ROTATION_CHANGED: PEfl_Event_Description;

{$ifdef EFL_BETA_API_SUPPORT}
var
  _EFL_UI_WIN_EVENT_PROFILE_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_WIN_EVENT_PROFILE_CHANGED: PEfl_Event_Description;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
var
  _EFL_UI_WIN_EVENT_WM_ROTATION_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_WIN_EVENT_WM_ROTATION_CHANGED: PEfl_Event_Description;
{$endif}

var
  _EFL_UI_WIN_EVENT_THEME_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_WIN_EVENT_THEME_CHANGED: PEfl_Event_Description;

{$ifdef EFL_BETA_API_SUPPORT}
var
  _EFL_UI_WIN_EVENT_ELM_ACTION_BLOCK_MENU: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_WIN_EVENT_ELM_ACTION_BLOCK_MENU: PEfl_Event_Description;
{$endif}

var
  _EFL_UI_WIN_EVENT_PAUSE: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_WIN_EVENT_PAUSE: PEfl_Event_Description;

var
  _EFL_UI_WIN_EVENT_RESUME: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_WIN_EVENT_RESUME: PEfl_Event_Description;

// === Konventiert am: 23-5-25 19:56:50 ===


implementation


function EFL_UI_WIN_CLASS: PEfl_Class;
begin
  EFL_UI_WIN_CLASS := efl_ui_win_class_get;
end;

function EFL_UI_WIN_EVENT_DELETE_REQUEST: PEfl_Event_Description;
begin
  EFL_UI_WIN_EVENT_DELETE_REQUEST := @(_EFL_UI_WIN_EVENT_DELETE_REQUEST);
end;

function EFL_UI_WIN_EVENT_WITHDRAWN: PEfl_Event_Description;
begin
  EFL_UI_WIN_EVENT_WITHDRAWN := @(_EFL_UI_WIN_EVENT_WITHDRAWN);
end;

function EFL_UI_WIN_EVENT_MINIMIZED: PEfl_Event_Description;
begin
  EFL_UI_WIN_EVENT_MINIMIZED := @(_EFL_UI_WIN_EVENT_MINIMIZED);
end;

function EFL_UI_WIN_EVENT_NORMAL: PEfl_Event_Description;
begin
  EFL_UI_WIN_EVENT_NORMAL := @(_EFL_UI_WIN_EVENT_NORMAL);
end;

function EFL_UI_WIN_EVENT_STICK: PEfl_Event_Description;
begin
  EFL_UI_WIN_EVENT_STICK := @(_EFL_UI_WIN_EVENT_STICK);
end;

function EFL_UI_WIN_EVENT_UNSTICK: PEfl_Event_Description;
begin
  EFL_UI_WIN_EVENT_UNSTICK := @(_EFL_UI_WIN_EVENT_UNSTICK);
end;

function EFL_UI_WIN_EVENT_FULLSCREEN_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_WIN_EVENT_FULLSCREEN_CHANGED := @(_EFL_UI_WIN_EVENT_FULLSCREEN_CHANGED);
end;

function EFL_UI_WIN_EVENT_MAXIMIZED_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_WIN_EVENT_MAXIMIZED_CHANGED := @(_EFL_UI_WIN_EVENT_MAXIMIZED_CHANGED);
end;

function EFL_UI_WIN_EVENT_INDICATOR_PROP_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_WIN_EVENT_INDICATOR_PROP_CHANGED := @(_EFL_UI_WIN_EVENT_INDICATOR_PROP_CHANGED);
end;

function EFL_UI_WIN_EVENT_WIN_ROTATION_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_WIN_EVENT_WIN_ROTATION_CHANGED := @(_EFL_UI_WIN_EVENT_WIN_ROTATION_CHANGED);
end;

function EFL_UI_WIN_EVENT_PROFILE_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_WIN_EVENT_PROFILE_CHANGED := @(_EFL_UI_WIN_EVENT_PROFILE_CHANGED);
end;

function EFL_UI_WIN_EVENT_WM_ROTATION_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_WIN_EVENT_WM_ROTATION_CHANGED := @(_EFL_UI_WIN_EVENT_WM_ROTATION_CHANGED);
end;

function EFL_UI_WIN_EVENT_THEME_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_WIN_EVENT_THEME_CHANGED := @(_EFL_UI_WIN_EVENT_THEME_CHANGED);
end;

function EFL_UI_WIN_EVENT_ELM_ACTION_BLOCK_MENU: PEfl_Event_Description;
begin
  EFL_UI_WIN_EVENT_ELM_ACTION_BLOCK_MENU := @(_EFL_UI_WIN_EVENT_ELM_ACTION_BLOCK_MENU);
end;

function EFL_UI_WIN_EVENT_PAUSE: PEfl_Event_Description;
begin
  EFL_UI_WIN_EVENT_PAUSE := @(_EFL_UI_WIN_EVENT_PAUSE);
end;

function EFL_UI_WIN_EVENT_RESUME: PEfl_Event_Description;
begin
  EFL_UI_WIN_EVENT_RESUME := @(_EFL_UI_WIN_EVENT_RESUME);
end;


end.
