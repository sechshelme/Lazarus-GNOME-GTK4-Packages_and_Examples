unit elm_general;

interface

uses  ctypes, efl, fp_eina, fp_evas;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PElm_Object_Select_Mode = ^TElm_Object_Select_Mode;
  TElm_Object_Select_Mode = longint;

const
  ELM_OBJECT_SELECT_MODE_DEFAULT = 0;
  ELM_OBJECT_SELECT_MODE_ALWAYS = 1;
  ELM_OBJECT_SELECT_MODE_NONE = 2;
  ELM_OBJECT_SELECT_MODE_DISPLAY_ONLY = 3;
  ELM_OBJECT_SELECT_MODE_MAX = 4;

type
  PElm_Icon_Type = ^TElm_Icon_Type;
  TElm_Icon_Type = longint;

const
  ELM_ICON_NONE = 0;
  ELM_ICON_FILE = 1;
  ELM_ICON_STANDARD = 2;

type
  PElm_Input_Panel_Layout = ^TElm_Input_Panel_Layout;
  TElm_Input_Panel_Layout = longint;

const
  ELM_INPUT_PANEL_LAYOUT_NORMAL = 0;
  ELM_INPUT_PANEL_LAYOUT_NUMBER = 1;
  ELM_INPUT_PANEL_LAYOUT_EMAIL = 2;
  ELM_INPUT_PANEL_LAYOUT_URL = 3;
  ELM_INPUT_PANEL_LAYOUT_PHONENUMBER = 4;
  ELM_INPUT_PANEL_LAYOUT_IP = 5;
  ELM_INPUT_PANEL_LAYOUT_MONTH = 6;
  ELM_INPUT_PANEL_LAYOUT_NUMBERONLY = 7;
  ELM_INPUT_PANEL_LAYOUT_INVALID = 8;
  ELM_INPUT_PANEL_LAYOUT_HEX = 9;
  ELM_INPUT_PANEL_LAYOUT_TERMINAL = 10;
  ELM_INPUT_PANEL_LAYOUT_PASSWORD = 11;
  ELM_INPUT_PANEL_LAYOUT_DATETIME = 12;
  ELM_INPUT_PANEL_LAYOUT_EMOTICON = 13;
  ELM_INPUT_PANEL_LAYOUT_VOICE = 14;

type
  PElm_Input_Panel_Lang = ^TElm_Input_Panel_Lang;
  TElm_Input_Panel_Lang = longint;

const
  ELM_INPUT_PANEL_LANG_AUTOMATIC = 0;
  ELM_INPUT_PANEL_LANG_ALPHABET = 1;

type
  PElm_Autocapital_Type = ^TElm_Autocapital_Type;
  TElm_Autocapital_Type = longint;

const
  ELM_AUTOCAPITAL_TYPE_NONE = 0;
  ELM_AUTOCAPITAL_TYPE_WORD = 1;
  ELM_AUTOCAPITAL_TYPE_SENTENCE = 2;
  ELM_AUTOCAPITAL_TYPE_ALLCHARACTER = 3;

type
  PElm_Input_Panel_Return_Key_Type = ^TElm_Input_Panel_Return_Key_Type;
  TElm_Input_Panel_Return_Key_Type = longint;

const
  ELM_INPUT_PANEL_RETURN_KEY_TYPE_DEFAULT = 0;
  ELM_INPUT_PANEL_RETURN_KEY_TYPE_DONE = 1;
  ELM_INPUT_PANEL_RETURN_KEY_TYPE_GO = 2;
  ELM_INPUT_PANEL_RETURN_KEY_TYPE_JOIN = 3;
  ELM_INPUT_PANEL_RETURN_KEY_TYPE_LOGIN = 4;
  ELM_INPUT_PANEL_RETURN_KEY_TYPE_NEXT = 5;
  ELM_INPUT_PANEL_RETURN_KEY_TYPE_SEARCH = 6;
  ELM_INPUT_PANEL_RETURN_KEY_TYPE_SEND = 7;
  ELM_INPUT_PANEL_RETURN_KEY_TYPE_SIGNIN = 8;

type
  PElm_Input_Hints = ^TElm_Input_Hints;
  TElm_Input_Hints = longint;

const
  ELM_INPUT_HINT_NONE = 0;
  ELM_INPUT_HINT_AUTO_COMPLETE = 1;
  ELM_INPUT_HINT_SENSITIVE_DATA = 2;
  ELM_INPUT_HINT_AUTOFILL_CREDIT_CARD_EXPIRATION_DATE = 256;
  ELM_INPUT_HINT_AUTOFILL_CREDIT_CARD_EXPIRATION_DAY = 512;
  ELM_INPUT_HINT_AUTOFILL_CREDIT_CARD_EXPIRATION_MONTH = 768;
  ELM_INPUT_HINT_AUTOFILL_CREDIT_CARD_EXPIRATION_YEAR = 1024;
  ELM_INPUT_HINT_AUTOFILL_CREDIT_CARD_NUMBER = 1280;
  ELM_INPUT_HINT_AUTOFILL_EMAIL_ADDRESS = 1536;
  ELM_INPUT_HINT_AUTOFILL_NAME = 1792;
  ELM_INPUT_HINT_AUTOFILL_PHONE = 2048;
  ELM_INPUT_HINT_AUTOFILL_POSTAL_ADDRESS = 2304;
  ELM_INPUT_HINT_AUTOFILL_POSTAL_CODE = 2560;
  ELM_INPUT_HINT_AUTOFILL_ID = 2816;

type
  TElm_Event_Policy_Changed = record
    policy: dword;
    new_value: longint;
    old_value: longint;
  end;
  PElm_Event_Policy_Changed = ^TElm_Event_Policy_Changed;

type
  PElm_Policy = ^TElm_Policy;
  TElm_Policy = longint;

const
  ELM_POLICY_QUIT = 0;
  ELM_POLICY_EXIT = 1;
  ELM_POLICY_THROTTLE = 2;
  ELM_POLICY_LAST = 3;

type
  PElm_Policy_Quit = ^TElm_Policy_Quit;
  TElm_Policy_Quit = longint;

const
  ELM_POLICY_QUIT_NONE = 0;
  ELM_POLICY_QUIT_LAST_WINDOW_CLOSED = 1;
  ELM_POLICY_QUIT_LAST_WINDOW_HIDDEN = 2;

type
  PElm_Policy_Exit = ^TElm_Policy_Exit;
  TElm_Policy_Exit = longint;

const
  ELM_POLICY_EXIT_NONE = 0;
  ELM_POLICY_EXIT_WINDOWS_DEL = 1;

type
  PElm_Policy_Throttle = ^TElm_Policy_Throttle;
  TElm_Policy_Throttle = longint;

const
  ELM_POLICY_THROTTLE_CONFIG = 0;
  ELM_POLICY_THROTTLE_HIDDEN_ALWAYS = 1;
  ELM_POLICY_THROTTLE_NEVER = 2;

type
  PElm_Object_Multi_Select_Mode = ^TElm_Object_Multi_Select_Mode;
  TElm_Object_Multi_Select_Mode = longint;

const
  ELM_OBJECT_MULTI_SELECT_MODE_DEFAULT = 0;
  ELM_OBJECT_MULTI_SELECT_MODE_WITH_CONTROL = 1;
  ELM_OBJECT_MULTI_SELECT_MODE_MAX = 2;

type
  PElm_Wrap_Type = ^TElm_Wrap_Type;
  TElm_Wrap_Type = longint;

const
  ELM_WRAP_NONE = 0;
  ELM_WRAP_CHAR = 1;
  ELM_WRAP_WORD = 2;
  ELM_WRAP_MIXED = 3;
  ELM_WRAP_LAST = 4;

type
  PElm_Text_Format = ^TElm_Text_Format;
  TElm_Text_Format = longint;

const
  ELM_TEXT_FORMAT_PLAIN_UTF8 = 0;
  ELM_TEXT_FORMAT_MARKUP_UTF8 = 1;

type
  PElm_Cnp_Mode = ^TElm_Cnp_Mode;
  TElm_Cnp_Mode = longint;

const
  ELM_CNP_MODE_MARKUP = 0;
  ELM_CNP_MODE_NO_IMAGE = 1;
  ELM_CNP_MODE_PLAINTEXT = 2;

type
  PElm_Genlist_Item_Type = ^TElm_Genlist_Item_Type;
  TElm_Genlist_Item_Type = longint;

const
  ELM_GENLIST_ITEM_NONE = 0;
  ELM_GENLIST_ITEM_TREE = 1;
  ELM_GENLIST_ITEM_GROUP = 2;
  ELM_GENLIST_ITEM_MAX = 4;

type
  PElm_Genlist_Item_Field_Type = ^TElm_Genlist_Item_Field_Type;
  TElm_Genlist_Item_Field_Type = longint;

const
  ELM_GENLIST_ITEM_FIELD_ALL = 0;
  ELM_GENLIST_ITEM_FIELD_TEXT = 1;
  ELM_GENLIST_ITEM_FIELD_CONTENT = 2;
  ELM_GENLIST_ITEM_FIELD_STATE = 4;

type
  PElm_Genlist_Item_Scrollto_Type = ^TElm_Genlist_Item_Scrollto_Type;
  TElm_Genlist_Item_Scrollto_Type = longint;

const
  ELM_GENLIST_ITEM_SCROLLTO_NONE = 0;
  ELM_GENLIST_ITEM_SCROLLTO_IN = 1;
  ELM_GENLIST_ITEM_SCROLLTO_TOP = 2;
  ELM_GENLIST_ITEM_SCROLLTO_MIDDLE = 4;
  ELM_GENLIST_ITEM_SCROLLTO_BOTTOM = 8;

type
  PElm_Gengrid_Item_Scrollto_Type = ^TElm_Gengrid_Item_Scrollto_Type;
  TElm_Gengrid_Item_Scrollto_Type = longint;

const
  ELM_GENGRID_ITEM_SCROLLTO_NONE = 0;
  ELM_GENGRID_ITEM_SCROLLTO_IN = 1;
  ELM_GENGRID_ITEM_SCROLLTO_TOP = 2;
  ELM_GENGRID_ITEM_SCROLLTO_MIDDLE = 4;
  ELM_GENGRID_ITEM_SCROLLTO_BOTTOM = 8;

type
  PElm_Gengrid_Item_Field_Type = ^TElm_Gengrid_Item_Field_Type;
  TElm_Gengrid_Item_Field_Type = longint;

const
  ELM_GENGRID_ITEM_FIELD_ALL = 0;
  ELM_GENGRID_ITEM_FIELD_TEXT = 1;
  ELM_GENGRID_ITEM_FIELD_CONTENT = 2;
  ELM_GENGRID_ITEM_FIELD_STATE = 4;

type
  PElm_List_Mode = ^TElm_List_Mode;
  TElm_List_Mode = longint;

const
  ELM_LIST_COMPRESS = 0;
  ELM_LIST_SCROLL = 1;
  ELM_LIST_LIMIT = 2;
  ELM_LIST_EXPAND = 3;
  ELM_LIST_LAST = 4;

type
  PElm_Focus_Direction = ^TElm_Focus_Direction;
  TElm_Focus_Direction = longint;

const
  ELM_FOCUS_PREVIOUS = 0;
  ELM_FOCUS_NEXT = 1;
  ELM_FOCUS_UP = 2;
  ELM_FOCUS_DOWN = 3;
  ELM_FOCUS_RIGHT = 4;
  ELM_FOCUS_LEFT = 5;
  ELM_FOCUS_LAST = 6;

type
  PElm_Object_Layer = ^TElm_Object_Layer;
  TElm_Object_Layer = longint;

const
  ELM_OBJECT_LAYER_BACKGROUND = EVAS_LAYER_MIN + 64;
  ELM_OBJECT_LAYER_DEFAULT = 0;
  ELM_OBJECT_LAYER_FOCUS = EVAS_LAYER_MAX - 128;
  ELM_OBJECT_LAYER_TOOLTIP = EVAS_LAYER_MAX - 64;
  ELM_OBJECT_LAYER_CURSOR = EVAS_LAYER_MAX - 32;
  ELM_OBJECT_LAYER_LAST = (EVAS_LAYER_MAX - 32) + 1;

type
  PElm_Focus_Region_Show_Mode = ^TElm_Focus_Region_Show_Mode;
  TElm_Focus_Region_Show_Mode = longint;

const
  ELM_FOCUS_REGION_SHOW_WIDGET = 0;
  ELM_FOCUS_REGION_SHOW_ITEM = 1;

type
  PElm_Atspi_Bridge_State = ^TElm_Atspi_Bridge_State;
  TElm_Atspi_Bridge_State = longint;

const
  ELM_ATSPI_BRIDGE_CONNECTED = 0;
  ELM_ATSPI_BRIDGE_DISCONNECTED = 1;

type
  PElm_Event_Atspi_Bridge_State_Changed = ^TElm_Event_Atspi_Bridge_State_Changed;

  TElm_Event_Atspi_Bridge_State_Changed = record
    state: TElm_Atspi_Bridge_State;
  end;

var
  ELM_ECORE_EVENT_ETHUMB_CONNECT: longint; cvar;external libelementary;
  ELM_EVENT_CONFIG_ALL_CHANGED: longint; cvar;external libelementary;
  ELM_EVENT_POLICY_CHANGED: longint; cvar;external libelementary;
  ELM_EVENT_PROCESS_BACKGROUND: longint; cvar;external libelementary;
  ELM_EVENT_PROCESS_FOREGROUND: longint; cvar;external libelementary;
  ELM_EVENT_ATSPI_BRIDGE_STATE_CHANGED: longint; cvar;external libelementary;

type
  TElm_Event_Cb = function(data: pointer; obj: PEvas_Object; src: PEvas_Object; _type: TEvas_Callback_Type; event_info: pointer): TEina_Bool; cdecl;

var
  _elm_startup_time: double; cvar;external libelementary;
  { xxxxxxxxxxxxxxxxxxxxxxxxxxxxx }
  {#ifndef ELM_LIB_QUICKLAUNCH }
  {#define ELM_MAIN() int main(int argc, char **argv)  int ret__; _elm_startup_time = ecore_time_unix_get(); elm_init(argc, argv); ret__ = elm_main(argc, argv); elm_shutdown(); return ret__;  /**< macro to be used after the elm_main() function */ }
  {#else }
{* @deprecated macro to be used after the elm_main() function.
 * Do not define ELM_LIB_QUICKLAUNCH
 * Compile your programs with -fpie and -pie -rdynamic instead, to generate a single binary (linkable executable).
  }
  {#define ELM_MAIN() int main(int argc, char **argv)  int ret__; _elm_startup_time = ecore_time_unix_get(); ret__ = elm_quicklaunch_fallback(argc, argv); elm_shutdown(); return ret__;  }
  {#endif }

function elm_init(argc: longint; argv: PPchar): longint; cdecl; external libelementary;
function elm_shutdown: longint; cdecl; external libelementary;
procedure elm_run; cdecl; external libelementary;
procedure elm_exit; cdecl; external libelementary;
procedure elm_quicklaunch_mode_set(ql_on: TEina_Bool); cdecl; external libelementary;
function elm_quicklaunch_mode_get: TEina_Bool; cdecl; external libelementary;
function elm_quicklaunch_init(argc: longint; argv: PPchar): longint; cdecl; external libelementary;
function elm_quicklaunch_sub_init(argc: longint; argv: PPchar): longint; cdecl; external libelementary;
function elm_quicklaunch_sub_shutdown: longint; cdecl; external libelementary;
function elm_quicklaunch_shutdown: longint; cdecl; external libelementary;
procedure elm_quicklaunch_seed; cdecl; external libelementary;
function elm_quicklaunch_prepare(argc: longint; argv: PPchar; cwd: pchar): TEina_Bool; cdecl; external libelementary;
function efl_quicklaunch_prepare(argc: longint; argv: PPchar; cwd: pchar): TEina_Bool; cdecl; external libelementary;

type
  Tpostfork_func = procedure(data: pointer);

function elm_quicklaunch_fork(argc: longint; argv: PPchar; cwd: pchar; postfork_func: Tpostfork_func; postfork_data: pointer): longint; cdecl; external libelementary;
procedure elm_quicklaunch_cleanup; cdecl; external libelementary;
function elm_quicklaunch_fallback(argc: longint; argv: PPchar): longint; cdecl; external libelementary;
function elm_quicklaunch_exe_path_get(exe: pchar; cwd: pchar): pchar; cdecl; external libelementary;
function elm_policy_set(policy: dword; value: longint): TEina_Bool; cdecl; external libelementary;
function elm_policy_get(policy: dword): longint; cdecl; external libelementary;
procedure elm_language_set(lang: pchar); cdecl; external libelementary;

type
  PElm_Process_State = ^TElm_Process_State;
  TElm_Process_State = longint;

const
  ELM_PROCESS_STATE_FOREGROUND = 0;
  ELM_PROCESS_STATE_BACKGROUND = 1;

function elm_process_state_get: TElm_Process_State; cdecl; external libelementary;

type
  PElm_Focus_Autoscroll_Mode = ^TElm_Focus_Autoscroll_Mode;
  TElm_Focus_Autoscroll_Mode = longint;

const
  ELM_FOCUS_AUTOSCROLL_MODE_SHOW = 0;
  ELM_FOCUS_AUTOSCROLL_MODE_NONE = 1;
  ELM_FOCUS_AUTOSCROLL_MODE_BRING_IN = 2;

type
  PElm_Softcursor_Mode = ^TElm_Softcursor_Mode;
  TElm_Softcursor_Mode = longint;

const
  ELM_SOFTCURSOR_MODE_AUTO = 0;
  ELM_SOFTCURSOR_MODE_ON = 1;
  ELM_SOFTCURSOR_MODE_OFF = 2;

type
  PElm_Slider_Indicator_Visible_Mode = ^TElm_Slider_Indicator_Visible_Mode;
  TElm_Slider_Indicator_Visible_Mode = longint;

const
  ELM_SLIDER_INDICATOR_VISIBLE_MODE_DEFAULT = 0;
  ELM_SLIDER_INDICATOR_VISIBLE_MODE_ALWAYS = 1;
  ELM_SLIDER_INDICATOR_VISIBLE_MODE_ON_FOCUS = 2;
  ELM_SLIDER_INDICATOR_VISIBLE_MODE_NONE = 3;

type
  PElm_Focus_Move_Policy = ^TElm_Focus_Move_Policy;
  TElm_Focus_Move_Policy = longint;

const
  ELM_FOCUS_MOVE_POLICY_CLICK = 0;
  ELM_FOCUS_MOVE_POLICY_IN = 1;
  ELM_FOCUS_MOVE_POLICY_KEY_ONLY = 2;

  // === Konventiert am: 10-5-25 15:32:38 ===


implementation



end.
