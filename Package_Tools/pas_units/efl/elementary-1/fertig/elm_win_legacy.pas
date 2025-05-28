unit elm_win_legacy;

interface

uses
  ctypes, efl, fp_eina, fp_evas, fp_ecore_evas;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PElm_Win_Indicator_Mode = ^TElm_Win_Indicator_Mode;
  TElm_Win_Indicator_Mode = longint;

const
  ELM_WIN_INDICATOR_UNKNOWN = 0;
  ELM_WIN_INDICATOR_HIDE = 1;
  ELM_WIN_INDICATOR_SHOW = 2;

type
  PElm_Win_Indicator_Opacity_Mode = ^TElm_Win_Indicator_Opacity_Mode;
  TElm_Win_Indicator_Opacity_Mode = longint;

const
  ELM_WIN_INDICATOR_OPACITY_UNKNOWN = 0;
  ELM_WIN_INDICATOR_OPAQUE = 1;
  ELM_WIN_INDICATOR_TRANSLUCENT = 2;
  ELM_WIN_INDICATOR_TRANSPARENT = 3;

type
  PElm_Illume_Command = ^TElm_Illume_Command;
  TElm_Illume_Command = longint;

const
  ELM_ILLUME_COMMAND_FOCUS_BACK = 0;
  ELM_ILLUME_COMMAND_FOCUS_FORWARD = 1;
  ELM_ILLUME_COMMAND_FOCUS_HOME = 2;
  ELM_ILLUME_COMMAND_CLOSE = 3;

type
  PElm_Win_Type = ^TElm_Win_Type;
  TElm_Win_Type = longint;

const
  ELM_WIN_UNKNOWN = -(1);
  ELM_WIN_BASIC = (-(1)) + 1;
  ELM_WIN_DIALOG_BASIC = (-(1)) + 2;
  ELM_WIN_DESKTOP = (-(1)) + 3;
  ELM_WIN_DOCK = (-(1)) + 4;
  ELM_WIN_TOOLBAR = (-(1)) + 5;
  ELM_WIN_MENU = (-(1)) + 6;
  ELM_WIN_UTILITY = (-(1)) + 7;
  ELM_WIN_SPLASH = (-(1)) + 8;
  ELM_WIN_DROPDOWN_MENU = (-(1)) + 9;
  ELM_WIN_POPUP_MENU = (-(1)) + 10;
  ELM_WIN_TOOLTIP = (-(1)) + 11;
  ELM_WIN_NOTIFICATION = (-(1)) + 12;
  ELM_WIN_COMBO = (-(1)) + 13;
  ELM_WIN_DND = (-(1)) + 14;
  ELM_WIN_INLINED_IMAGE = (-(1)) + 15;
  ELM_WIN_SOCKET_IMAGE = (-(1)) + 16;
  ELM_WIN_FAKE = (-(1)) + 17;
  ELM_WIN_NAVIFRAME_BASIC = (-(1)) + 18;

type
  PElm_Win_Keyboard_Mode = ^TElm_Win_Keyboard_Mode;
  TElm_Win_Keyboard_Mode = longint;

const
  ELM_WIN_KEYBOARD_UNKNOWN = 0;
  ELM_WIN_KEYBOARD_OFF = 1;
  ELM_WIN_KEYBOARD_ON = 2;
  ELM_WIN_KEYBOARD_ALPHA = 3;
  ELM_WIN_KEYBOARD_NUMERIC = 4;
  ELM_WIN_KEYBOARD_PIN = 5;
  ELM_WIN_KEYBOARD_PHONE_NUMBER = 6;
  ELM_WIN_KEYBOARD_HEX = 7;
  ELM_WIN_KEYBOARD_TERMINAL = 8;
  ELM_WIN_KEYBOARD_PASSWORD = 9;
  ELM_WIN_KEYBOARD_IP = 10;
  ELM_WIN_KEYBOARD_HOST = 11;
  ELM_WIN_KEYBOARD_FILE = 12;
  ELM_WIN_KEYBOARD_URL = 13;
  ELM_WIN_KEYBOARD_KEYPAD = 14;
  ELM_WIN_KEYBOARD_J2ME = 15;

type
  PElm_Win_Keygrab_Mode = ^TElm_Win_Keygrab_Mode;
  TElm_Win_Keygrab_Mode = longint;

const
  ELM_WIN_KEYGRAB_UNKNOWN = 0;
  ELM_WIN_KEYGRAB_SHARED = 256;
  ELM_WIN_KEYGRAB_TOPMOST = 512;
  ELM_WIN_KEYGRAB_EXCLUSIVE = 1024;
  ELM_WIN_KEYGRAB_OVERRIDE_EXCLUSIVE = 2048;

type
  PElm_Win_Move_Resize_Mode = ^TElm_Win_Move_Resize_Mode;
  TElm_Win_Move_Resize_Mode = longint;

const
  ELM_WIN_MOVE_RESIZE_MOVE = 1;
  ELM_WIN_MOVE_RESIZE_TOP = 2;
  ELM_WIN_MOVE_RESIZE_BOTTOM = 4;
  ELM_WIN_MOVE_RESIZE_LEFT = 8;
  ELM_WIN_MOVE_RESIZE_RIGHT = 16;

function elm_win_add(parent: PEvas_Object; name: pchar; _type: TElm_Win_Type): PEvas_Object; cdecl; external libelementary;

type
  PElm_Win = ^TElm_Win;
  TElm_Win = TEvas_Object;

function elm_win_fake_add(ee: PEcore_Evas): PEvas_Object; cdecl; external libelementary;
function elm_win_util_standard_add(name: pchar; title: pchar): PEvas_Object; cdecl; external libelementary;
function elm_win_util_dialog_add(parent: PEvas_Object; name: pchar; title: pchar): PEvas_Object; cdecl; external libelementary;
procedure elm_win_autodel_set(obj: PEvas_Object; autodel: TEina_Bool); cdecl; external libelementary;
function elm_win_autodel_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_win_floating_mode_set(obj: PEvas_Object; floating: TEina_Bool); cdecl; external libelementary;
function elm_win_floating_mode_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_win_norender_push(obj: PEvas_Object); cdecl; external libelementary;
procedure elm_win_norender_pop(obj: PEvas_Object); cdecl; external libelementary;
function elm_win_norender_get(obj: PEvas_Object): longint; cdecl; external libelementary;
procedure elm_win_render(obj: PEvas_Object); cdecl; external libelementary;
function elm_win_wl_window_get(obj: PEvas_Object): PEcore_Wl2_Window; cdecl; external libelementary;
function elm_win_win32_window_get(obj: PEvas_Object): PEcore_Win32_Window; cdecl; external libelementary;
procedure elm_win_wm_rotation_preferred_rotation_set(obj: PEvas_Object; rotation: longint); cdecl; external libelementary;
procedure elm_win_resize_object_add(obj: PEvas_Object; subobj: PEvas_Object); cdecl; external libelementary;
procedure elm_win_resize_object_del(obj: PEvas_Object; subobj: PEvas_Object); cdecl; external libelementary;
function elm_win_xwindow_get(obj: PEvas_Object): TEcore_X_Window; cdecl; external libelementary;
//function elm_win_wl_window_get(obj:PEvas_Object):PEcore_Wl2_Window;cdecl;external libelementary;
//function elm_win_win32_window_get(obj:PEvas_Object):PEcore_Win32_Window;cdecl;external libelementary;
function elm_win_cocoa_window_get(obj: PEvas_Object): PEcore_Cocoa_Window; cdecl; external libelementary;
function elm_win_trap_data_get(obj: PEvas_Object): pointer; cdecl; external libelementary;
procedure elm_win_override_set(obj: PEvas_Object; override: TEina_Bool); cdecl; external libelementary;
function elm_win_override_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_win_lower(obj: PEvas_Object); cdecl; external libelementary;
procedure elm_win_quickpanel_set(obj: PEvas_Object; quickpanel: TEina_Bool); cdecl; external libelementary;
function elm_win_quickpanel_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_win_quickpanel_zone_set(obj: PEvas_Object; zone: longint); cdecl; external libelementary;
function elm_win_quickpanel_zone_get(obj: PEvas_Object): longint; cdecl; external libelementary;
procedure elm_win_quickpanel_priority_major_set(obj: PEvas_Object; priority: longint); cdecl; external libelementary;
function elm_win_quickpanel_priority_major_get(obj: PEvas_Object): longint; cdecl; external libelementary;
procedure elm_win_quickpanel_priority_minor_set(obj: PEvas_Object; priority: longint); cdecl; external libelementary;
function elm_win_quickpanel_priority_minor_get(obj: PEvas_Object): longint; cdecl; external libelementary;
procedure elm_win_indicator_mode_set(obj: PEvas_Object; mode: TElm_Win_Indicator_Mode); cdecl; external libelementary;
function elm_win_indicator_mode_get(obj: PEvas_Object): TElm_Win_Indicator_Mode; cdecl; external libelementary;
procedure elm_win_indicator_opacity_set(obj: PEvas_Object; mode: TElm_Win_Indicator_Opacity_Mode); cdecl; external libelementary;
function elm_win_indicator_opacity_get(obj: PEvas_Object): TElm_Win_Indicator_Opacity_Mode; cdecl; external libelementary;
procedure elm_win_keyboard_win_set(obj: PEvas_Object; is_keyboard: TEina_Bool); cdecl; external libelementary;
function elm_win_keyboard_win_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_win_conformant_set(obj: PEvas_Object; conformant: TEina_Bool); cdecl; external libelementary;
function elm_win_conformant_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_win_wm_rotation_manual_rotation_done_set(obj: PEvas_Object; set_: TEina_Bool); cdecl; external libelementary;
function elm_win_wm_rotation_manual_rotation_done_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_win_wm_rotation_manual_rotation_done(obj: PEvas_Object); cdecl; external libelementary;
procedure elm_win_rotation_set(obj: PEvas_Object; rotation: longint); cdecl; external libelementary;
function elm_win_rotation_get(obj: PEvas_Object): longint; cdecl; external libelementary;
procedure elm_win_rotation_with_resize_set(obj: PEvas_Object; rotation: longint); cdecl; external libelementary;
function elm_win_wm_rotation_supported_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
function elm_win_wm_rotation_preferred_rotation_get(obj: PEvas_Object): longint; cdecl; external libelementary;
procedure elm_win_screen_position_get(obj: PEvas_Object; x: Plongint; y: Plongint); cdecl; external libelementary;
procedure elm_win_screen_size_get(obj: PEvas_Object; x: Plongint; y: Plongint; w: Plongint; h: Plongint); cdecl; external libelementary;
procedure elm_win_screen_dpi_get(obj: PEvas_Object; xdpi: Plongint; ydpi: Plongint); cdecl; external libelementary;
procedure elm_win_icon_name_set(obj: PEvas_Object; icon_name: pchar); cdecl; external libelementary;
function elm_win_icon_name_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
procedure elm_win_withdrawn_set(obj: PEvas_Object; withdrawn: TEina_Bool); cdecl; external libelementary;
function elm_win_withdrawn_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_win_urgent_set(obj: PEvas_Object; urgent: TEina_Bool); cdecl; external libelementary;
function elm_win_urgent_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_win_demand_attention_set(obj: PEvas_Object; demand_attention: TEina_Bool); cdecl; external libelementary;
function elm_win_demand_attention_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_win_modal_set(obj: PEvas_Object; modal: TEina_Bool); cdecl; external libelementary;
function elm_win_modal_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_win_shaped_set(obj: PEvas_Object; shaped: TEina_Bool); cdecl; external libelementary;
function elm_win_shaped_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_win_title_set(obj: PEvas_Object; title: pchar); cdecl; external libelementary;
function elm_win_title_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
procedure elm_win_size_base_set(obj: PEvas_Object; w: longint; h: longint); cdecl; external libelementary;
procedure elm_win_size_base_get(obj: PEvas_Object; w: Plongint; h: Plongint); cdecl; external libelementary;
procedure elm_win_size_step_set(obj: PEvas_Object; w: longint; h: longint); cdecl; external libelementary;
procedure elm_win_size_step_get(obj: PEvas_Object; w: Plongint; h: Plongint); cdecl; external libelementary;
procedure elm_win_illume_command_send(obj: PEvas_Object; command: TElm_Illume_Command; params: pointer); cdecl; external libelementary;
procedure elm_win_profile_set(obj: PEvas_Object; profile: pchar); cdecl; external libelementary;
function elm_win_profile_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
procedure elm_win_layer_set(obj: PEvas_Object; layer: longint); cdecl; external libelementary;
function elm_win_layer_get(obj: PEvas_Object): longint; cdecl; external libelementary;
function elm_win_inlined_image_object_get(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_win_fake_canvas_set(obj: PEvas_Object; oee: PEcore_Evas); cdecl; external libelementary; deprecated;
function elm_win_window_id_get(obj: PEvas_Object): TEcore_Window; cdecl; external libelementary;
function elm_win_main_menu_get(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_win_keyboard_mode_set(obj: PElm_Win; mode: TElm_Win_Keyboard_Mode); cdecl; external libelementary;
function elm_win_keyboard_mode_get(obj: PElm_Win): TElm_Win_Keyboard_Mode; cdecl; external libelementary;
procedure elm_win_aspect_set(obj: PElm_Win; aspect: double); cdecl; external libelementary;
function elm_win_aspect_get(obj: PElm_Win): double; cdecl; external libelementary;
function elm_win_keygrab_set(obj: PElm_Win; key: pchar; modifiers: TEvas_Modifier_Mask; not_modifiers: TEvas_Modifier_Mask; priority: longint;
  grab_mode: TElm_Win_Keygrab_Mode): TEina_Bool; cdecl; external libelementary;
function elm_win_keygrab_unset(obj: PElm_Win; key: pchar; modifiers: TEvas_Modifier_Mask; not_modifiers: TEvas_Modifier_Mask): TEina_Bool; cdecl; external libelementary;
function elm_win_get(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary;
function elm_win_socket_listen(obj: PElm_Win; svcname: pchar; svcnum: longint; svcsys: TEina_Bool): TEina_Bool; cdecl; external libelementary;
function elm_win_focus_get(obj: PElm_Win): TEina_Bool; cdecl; external libelementary;
procedure elm_win_raise(obj: PElm_Win); cdecl; external libelementary;
procedure elm_win_available_profiles_set(obj: PElm_Win; profiles: PPchar; count: dword); cdecl; external libelementary;
function elm_win_available_profiles_get(obj: PElm_Win; profiles: PPPchar; count: Pdword): TEina_Bool; cdecl; external libelementary;
procedure elm_win_wm_rotation_available_rotations_set(obj: PElm_Win; rotations: Plongint; count: dword); cdecl; external libelementary;
function elm_win_wm_rotation_available_rotations_get(obj: PElm_Win; rotations: PPlongint; count: Pdword): TEina_Bool; cdecl; external libelementary;
procedure elm_win_screen_constrain_set(obj: PEvas_Object; constrain: TEina_Bool); cdecl; external libelementary;
function elm_win_screen_constrain_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_win_prop_focus_skip_set(obj: PEvas_Object; skip: TEina_Bool); cdecl; external libelementary;
procedure elm_win_autohide_set(obj: PEvas_Object; autohide: TEina_Bool); cdecl; external libelementary;
function elm_win_autohide_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_win_icon_object_set(obj: PEvas_Object; icon: PEvas_Object); cdecl; external libelementary;
function elm_win_icon_object_get(obj: PEvas_Object): PEvas_Object; cdecl; external libelementary;
procedure elm_win_iconified_set(obj: PEvas_Object; iconified: TEina_Bool); cdecl; external libelementary;
function elm_win_iconified_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_win_maximized_set(obj: PEvas_Object; maximized: TEina_Bool); cdecl; external libelementary;
function elm_win_maximized_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_win_fullscreen_set(obj: PEvas_Object; fullscreen: TEina_Bool); cdecl; external libelementary;
function elm_win_fullscreen_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_win_sticky_set(obj: PEvas_Object; sticky: TEina_Bool); cdecl; external libelementary;
function elm_win_sticky_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_win_noblank_set(obj: PEvas_Object; noblank: TEina_Bool); cdecl; external libelementary;
function elm_win_noblank_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_win_borderless_set(obj: PEvas_Object; borderless: TEina_Bool); cdecl; external libelementary;
function elm_win_borderless_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_win_role_set(obj: PEvas_Object; role: pchar); cdecl; external libelementary;
function elm_win_role_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
function elm_win_name_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
function elm_win_type_get(obj: PEvas_Object): TElm_Win_Type; cdecl; external libelementary;
function elm_win_accel_preference_get(obj: PEvas_Object): pchar; cdecl; external libelementary;
procedure elm_win_alpha_set(obj: PEvas_Object; alpha: TEina_Bool); cdecl; external libelementary;
function elm_win_alpha_get(obj: PEvas_Object): TEina_Bool; cdecl; external libelementary;
procedure elm_win_activate(obj: PEvas_Object); cdecl; external libelementary;
procedure elm_win_center(obj: PEvas_Object; h: TEina_Bool; v: TEina_Bool); cdecl; external libelementary;
function elm_win_move_resize_start(obj: PEvas_Object; mode: TElm_Win_Move_Resize_Mode): TEina_Bool; cdecl; external libelementary;
procedure elm_win_focus_highlight_animate_set(obj: PElm_Win; animate: TEina_Bool); cdecl; external libelementary;
function elm_win_focus_highlight_animate_get(obj: PElm_Win): TEina_Bool; cdecl; external libelementary;
procedure elm_win_focus_highlight_enabled_set(obj: PElm_Win; enabled: TEina_Bool); cdecl; external libelementary;
function elm_win_focus_highlight_enabled_get(obj: PElm_Win): TEina_Bool; cdecl; external libelementary;
function elm_win_focus_highlight_style_set(obj: PElm_Win; style: pchar): TEina_Bool; cdecl; external libelementary;
function elm_win_focus_highlight_style_get(obj: PElm_Win): pchar; cdecl; external libelementary;

// === Konventiert am: 10-5-25 16:54:56 ===


implementation



end.
