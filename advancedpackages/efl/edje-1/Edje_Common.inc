{$IFDEF read_interface}


type
  PEdje_Cursor = ^TEdje_Cursor;
  TEdje_Cursor = longint;

const
  EDJE_CURSOR_MAIN = 0;
  EDJE_CURSOR_SELECTION_BEGIN = 1;
  EDJE_CURSOR_SELECTION_END = 2;
  EDJE_CURSOR_PREEDIT_START = 3;
  EDJE_CURSOR_PREEDIT_END = 4;
  EDJE_CURSOR_USER = 5;
  EDJE_CURSOR_USER_EXTRA = 6;

type
  PEdje_Text_Autocapital_Type = ^TEdje_Text_Autocapital_Type;
  TEdje_Text_Autocapital_Type = longint;

const
  EDJE_TEXT_AUTOCAPITAL_TYPE_NONE = 0;
  EDJE_TEXT_AUTOCAPITAL_TYPE_WORD = 1;
  EDJE_TEXT_AUTOCAPITAL_TYPE_SENTENCE = 2;
  EDJE_TEXT_AUTOCAPITAL_TYPE_ALLCHARACTER = 3;

type
  PEdje_Input_Hints = ^TEdje_Input_Hints;
  TEdje_Input_Hints = longint;

const
  EDJE_INPUT_HINT_NONE = 0;
  EDJE_INPUT_HINT_AUTO_COMPLETE = 1;
  EDJE_INPUT_HINT_SENSITIVE_DATA = 2;

type
  PEdje_Input_Panel_Lang = ^TEdje_Input_Panel_Lang;
  TEdje_Input_Panel_Lang = longint;

const
  EDJE_INPUT_PANEL_LANG_AUTOMATIC = 0;
  EDJE_INPUT_PANEL_LANG_ALPHABET = 1;

type
  PEdje_Input_Panel_Return_Key_Type = ^TEdje_Input_Panel_Return_Key_Type;
  TEdje_Input_Panel_Return_Key_Type = longint;

const
  EDJE_INPUT_PANEL_RETURN_KEY_TYPE_DEFAULT = 0;
  EDJE_INPUT_PANEL_RETURN_KEY_TYPE_DONE = 1;
  EDJE_INPUT_PANEL_RETURN_KEY_TYPE_GO = 2;
  EDJE_INPUT_PANEL_RETURN_KEY_TYPE_JOIN = 3;
  EDJE_INPUT_PANEL_RETURN_KEY_TYPE_LOGIN = 4;
  EDJE_INPUT_PANEL_RETURN_KEY_TYPE_NEXT = 5;
  EDJE_INPUT_PANEL_RETURN_KEY_TYPE_SEARCH = 6;
  EDJE_INPUT_PANEL_RETURN_KEY_TYPE_SEND = 7;
  EDJE_INPUT_PANEL_RETURN_KEY_TYPE_SIGNIN = 8;

type
  PEdje_Input_Panel_Layout = ^TEdje_Input_Panel_Layout;
  TEdje_Input_Panel_Layout = longint;

const
  EDJE_INPUT_PANEL_LAYOUT_NORMAL = 0;
  EDJE_INPUT_PANEL_LAYOUT_NUMBER = 1;
  EDJE_INPUT_PANEL_LAYOUT_EMAIL = 2;
  EDJE_INPUT_PANEL_LAYOUT_URL = 3;
  EDJE_INPUT_PANEL_LAYOUT_PHONENUMBER = 4;
  EDJE_INPUT_PANEL_LAYOUT_IP = 5;
  EDJE_INPUT_PANEL_LAYOUT_MONTH = 6;
  EDJE_INPUT_PANEL_LAYOUT_NUMBERONLY = 7;
  EDJE_INPUT_PANEL_LAYOUT_INVALID = 8;
  EDJE_INPUT_PANEL_LAYOUT_HEX = 9;
  EDJE_INPUT_PANEL_LAYOUT_TERMINAL = 10;
  EDJE_INPUT_PANEL_LAYOUT_PASSWORD = 11;
  EDJE_INPUT_PANEL_LAYOUT_DATETIME = 12;
  EDJE_INPUT_PANEL_LAYOUT_EMOTICON = 13;
  EDJE_INPUT_PANEL_LAYOUT_VOICE = 14;

type
  TEdje_Perspective = record
  end;
  PEdje_Perspective = ^TEdje_Perspective;

type
  TEdje_Version = record
    major: longint;
    minor: longint;
    micro: longint;
    revision: longint;
  end;
  PEdje_Version = ^TEdje_Version;

var
  edje_version: PEdje_Version; cvar;external libedje;

type
  PEdje_Object = ^TEdje_Object;
  TEdje_Object = TEo;

type
  TEdje_Color_Class = record
    name: pchar;
    r: byte;
    g: byte;
    b: byte;
    a: byte;
    r2: byte;
    g2: byte;
    b2: byte;
    a2: byte;
    r3: byte;
    g3: byte;
    b3: byte;
    a3: byte;
    desc: PEina_Stringshare;
  end;
  PEdje_Color_Class = ^TEdje_Color_Class;

  TEdje_Text_Class = record
    name: pchar;
    font: pchar;
    size: TEvas_Font_Size;
  end;
  PEdje_Text_Class = ^TEdje_Text_Class;

  TEdje_Size_Class = record
    name: PEina_Stringshare;
    minw: TEvas_Coord;
    minh: TEvas_Coord;
    maxw: TEvas_Coord;
    maxh: TEvas_Coord;
  end;
  PEdje_Size_Class = ^TEdje_Size_Class;

procedure edje_message_signal_process; cdecl; external libedje;

type
  TEfl_Signal_Cb = procedure(data: pointer; obj: PEvas_Object; emission: pchar; source: pchar); cdecl;

  PEdje_Signal_Cb = ^TEdje_Signal_Cb;
  TEdje_Signal_Cb = TEfl_Signal_Cb;

function edje_object_signal_callback_extra_data_get: pointer; cdecl; external libedje;

{$ifdef EFL_BETA_API_SUPPORT}
function edje_object_signal_callback_seat_data_get: pointer; cdecl; external libedje;
{$endif}

type
  PEdje_Channel = ^TEdje_Channel;
  TEdje_Channel = longint;

const
  EDJE_CHANNEL_EFFECT = 0;
  EDJE_CHANNEL_BACKGROUND = 1;
  EDJE_CHANNEL_MUSIC = 2;
  EDJE_CHANNEL_FOREGROUND = 3;
  EDJE_CHANNEL_INTERFACE = 4;
  EDJE_CHANNEL_INPUT = 5;
  EDJE_CHANNEL_ALERT = 6;
  EDJE_CHANNEL_ALL = 7;

procedure edje_audio_channel_mute_set(channel: TEdje_Channel; mute: TEina_Bool); cdecl; external libedje;
function edje_audio_channel_mute_get(channel: TEdje_Channel): TEina_Bool; cdecl; external libedje;
function edje_init: longint; cdecl; external libedje;
function edje_shutdown: longint; cdecl; external libedje;
procedure edje_fontset_append_set(fonts: pchar); cdecl; external libedje;
function edje_mmap_data_get(f: PEina_File; key: pchar): pchar; cdecl; external libedje;
function edje_file_data_get(file_: pchar; key: pchar): pchar; cdecl; external libedje;
function edje_module_load(module: pchar): TEina_Bool; cdecl; external libedje;
function edje_available_modules_get: PEina_List; cdecl; external libedje;
function edje_fontset_append_get: pchar; cdecl; external libedje;
procedure edje_file_cache_set(count: longint); cdecl; external libedje;
function edje_file_cache_get: longint; cdecl; external libedje;
procedure edje_file_cache_flush; cdecl; external libedje;
procedure edje_collection_cache_set(count: longint); cdecl; external libedje;
function edje_collection_cache_get: longint; cdecl; external libedje;
procedure edje_collection_cache_flush; cdecl; external libedje;

type
  PEdje_External_Param_Type = ^TEdje_External_Param_Type;
  TEdje_External_Param_Type = longint;

const
  EDJE_EXTERNAL_PARAM_TYPE_INT = 0;
  EDJE_EXTERNAL_PARAM_TYPE_DOUBLE = 1;
  EDJE_EXTERNAL_PARAM_TYPE_STRING = 2;
  EDJE_EXTERNAL_PARAM_TYPE_BOOL = 3;
  EDJE_EXTERNAL_PARAM_TYPE_CHOICE = 4;
  EDJE_EXTERNAL_PARAM_TYPE_MAX = 5;

type
  PEdje_External_Param_Flags = ^TEdje_External_Param_Flags;
  TEdje_External_Param_Flags = longint;

const
  EDJE_EXTERNAL_PARAM_FLAGS_NONE = 0;
  EDJE_EXTERNAL_PARAM_FLAGS_GET = 1 shl 0;
  EDJE_EXTERNAL_PARAM_FLAGS_SET = 1 shl 1;
  EDJE_EXTERNAL_PARAM_FLAGS_STATE = 1 shl 2;
  EDJE_EXTERNAL_PARAM_FLAGS_CONSTRUCTOR = 1 shl 3;
  EDJE_EXTERNAL_PARAM_FLAGS_REGULAR = (EDJE_EXTERNAL_PARAM_FLAGS_GET or EDJE_EXTERNAL_PARAM_FLAGS_SET) or EDJE_EXTERNAL_PARAM_FLAGS_STATE;

type
  TEdje_External_Param = record
    name: pchar;
    _type: TEdje_External_Param_Type;
    i: longint;
    d: double;
    s: pchar;
  end;
  PEdje_External_Param = ^TEdje_External_Param;

function edje_external_param_type_str(_type: TEdje_External_Param_Type): pchar; cdecl; external libedje;

const
  EDJE_EXTERNAL_INT_UNSET = High(integer);
  EDJE_EXTERNAL_DOUBLE_UNSET = 1.7976931348623157e+308;

type
  PEdje_External_Param_Info = ^TEdje_External_Param_Info;

  TEdje_External_Param_Info = record
    name: pchar;
    _type: TEdje_External_Param_Type;
    flags: TEdje_External_Param_Flags;
    info: record
      case longint of
        0: (i: record
            def: longint;
            min: longint;
            max: longint;
            step: longint;
            end);
        1: (d: record
            def: double;
            min: double;
            max: double;
            step: double;
            end);
        2: (s: record
            def: pchar;
            accept_fmt: pchar;
            deny_fmt: pchar;
            end);
        3: (b: record
            def: longint;
            false_str: pchar;
            true_str: pchar;
            end);
        4: (c: record
            def: pchar;
            choices: ^pchar;
            def_get: function(data: pointer; info: PEdje_External_Param_Info): pchar; cdecl;
            query: function(data: pointer; info: PEdje_External_Param_Info): PPchar; cdecl;
            end);
      end;
  end;

const
  EDJE_EXTERNAL_TYPE_ABI_VERSION = 3;

type
  TEdje_External_Type = record
    abi_version: dword;
    module: pchar;
    module_name: pchar;
    add: function(data: pointer; evas: PEvas; parent: PEvas_Object; params: PEina_List; part_name: pchar): PEvas_Object; cdecl;
    state_set: procedure(data: pointer; obj: PEvas_Object; from_params: pointer; to_params: pointer; pos: single); cdecl;
    signal_emit: procedure(data: pointer; obj: PEvas_Object; emission: pchar; source: pchar); cdecl;
    param_set: function(data: pointer; obj: PEvas_Object; param: PEdje_External_Param): TEina_Bool; cdecl;
    param_get: function(data: pointer; obj: PEvas_Object; param: PEdje_External_Param): TEina_Bool; cdecl;
    content_get: function(data: pointer; obj: PEvas_Object; content: pchar): PEvas_Object; cdecl;
    params_parse: function(data: pointer; obj: PEvas_Object; params: PEina_List): pointer; cdecl;
    params_free: procedure(params: pointer); cdecl;
    label_get: function(data: pointer): pchar; cdecl;
    description_get: function(data: pointer): pchar; cdecl;
    icon_add: function(data: pointer; e: PEvas): PEvas_Object; cdecl;
    preview_add: function(data: pointer; e: PEvas): PEvas_Object; cdecl;
    translate: function(data: pointer; orig: pchar): pchar; cdecl;
    parameters_info: PEdje_External_Param_Info;
    data: pointer;
  end;
  PEdje_External_Type = ^TEdje_External_Type;

  TEdje_External_Type_Info = record
    name: pchar;
    info: PEdje_External_Type;
  end;
  PEdje_External_Type_Info = ^TEdje_External_Type_Info;

function edje_external_type_register(type_name: pchar; type_info: PEdje_External_Type): TEina_Bool; cdecl; external libedje;
function edje_external_type_unregister(type_name: pchar): TEina_Bool; cdecl; external libedje;
procedure edje_external_type_array_register(arr: PEdje_External_Type_Info); cdecl; external libedje;
procedure edje_external_type_array_unregister(arr: PEdje_External_Type_Info); cdecl; external libedje;
function edje_external_type_abi_version_get: dword; cdecl; external libedje;
function edje_external_iterator_get: PEina_Iterator; cdecl; external libedje;
function edje_external_param_find(params: PEina_List; key: pchar): PEdje_External_Param; cdecl; external libedje;
function edje_external_param_int_get(params: PEina_List; key: pchar; ret: Plongint): TEina_Bool; cdecl; external libedje;
function edje_external_param_double_get(params: PEina_List; key: pchar; ret: Pdouble): TEina_Bool; cdecl; external libedje;
function edje_external_param_string_get(params: PEina_List; key: pchar; ret: PPchar): TEina_Bool; cdecl; external libedje;
function edje_external_param_bool_get(params: PEina_List; key: pchar; ret: PEina_Bool): TEina_Bool; cdecl; external libedje;
function edje_external_param_choice_get(params: PEina_List; key: pchar; ret: PPchar): TEina_Bool; cdecl; external libedje;
function edje_external_param_info_get(type_name: pchar): PEdje_External_Param_Info; cdecl; external libedje;
function edje_external_type_get(type_name: pchar): PEdje_External_Type; cdecl; external libedje;

type
  PEdje_Aspect_Control = ^TEdje_Aspect_Control;
  TEdje_Aspect_Control = longint;

const
  EDJE_ASPECT_CONTROL_NONE = 0;
  EDJE_ASPECT_CONTROL_NEITHER = 1;
  EDJE_ASPECT_CONTROL_HORIZONTAL = 2;
  EDJE_ASPECT_CONTROL_VERTICAL = 3;
  EDJE_ASPECT_CONTROL_BOTH = 4;

function edje_object_part_object_name_get(obj: PEvas_Object): pchar; cdecl; external libedje;
procedure edje_scale_set(scale: double); cdecl; external libedje;
function edje_scale_get: double; cdecl; external libedje;

type
  TEdje_Entry_Change_Info = record
  end;
  PEdje_Entry_Change_Info = ^TEdje_Entry_Change_Info;


type
  PEdje_Text_Filter_Type = ^TEdje_Text_Filter_Type;
  TEdje_Text_Filter_Type = longint;

const
  EDJE_TEXT_FILTER_TEXT = 0;
  EDJE_TEXT_FILTER_FORMAT = 1;
  EDJE_TEXT_FILTER_MARKUP = 2;

const
  EDJE_INPUT_PANEL_LAYOUT_NORMAL_VARIATION_NORMAL = 0;
  EDJE_INPUT_PANEL_LAYOUT_NORMAL_VARIATION_FILENAME = 1;
  EDJE_INPUT_PANEL_LAYOUT_NORMAL_VARIATION_PERSON_NAME = 2;

const
  EDJE_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_NORMAL = 0;
  EDJE_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_SIGNED = 1;
  EDJE_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_DECIMAL = 2;
  EDJE_INPUT_PANEL_LAYOUT_NUMBERONLY_VARIATION_SIGNED_AND_DECIMAL = 3;

const
  EDJE_INPUT_PANEL_LAYOUT_PASSWORD_VARIATION_NORMAL = 0;
  EDJE_INPUT_PANEL_LAYOUT_PASSWORD_VARIATION_NUMBERONLY = 1;

type
  TEdje_Text_Filter_Cb = procedure(data: pointer; obj: PEvas_Object; part: pchar; _type: TEdje_Text_Filter_Type; text: PPchar); cdecl;
  TEdje_Markup_Filter_Cb = procedure(data: pointer; obj: PEvas_Object; part: pchar; text: PPchar); cdecl;

  TEdje_Item_Provider_Cb = function(data: pointer; obj: PEvas_Object; part: pchar; item: pchar): PEvas_Object; cdecl;
  PEdje_Item_Provider_Cb = ^TEdje_Item_Provider_Cb;

procedure edje_password_show_last_set(password_show_last: TEina_Bool); cdecl; external libedje;
procedure edje_password_show_last_timeout_set(password_show_last_timeout: double); cdecl; external libedje;
function edje_color_class_set(color_class: pchar; r: longint; g: longint; b: longint; a: longint; r2: longint; g2: longint; b2: longint; a2: longint; r3: longint; g3: longint; b3: longint; a3: longint): TEina_Bool; cdecl; external libedje;
procedure edje_color_class_apply; cdecl; external libedje;
function edje_color_class_get(color_class: pchar; r: Plongint; g: Plongint; b: Plongint; a: Plongint; r2: Plongint; g2: Plongint; b2: Plongint; a2: Plongint; r3: Plongint; g3: Plongint; b3: Plongint; a3: Plongint): TEina_Bool; cdecl; external libedje;
procedure edje_color_class_del(color_class: pchar); cdecl; external libedje;
function edje_color_class_list: PEina_List; cdecl; external libedje;
function edje_color_class_active_iterator_new: PEina_Iterator; cdecl; external libedje;
function edje_mmap_color_class_iterator_new(f: PEina_File): PEina_Iterator; cdecl; external libedje;
function edje_size_class_set(size_class: pchar; minw: TEvas_Coord; minh: TEvas_Coord; maxw: TEvas_Coord; maxh: TEvas_Coord): TEina_Bool; cdecl; external libedje;
function edje_size_class_get(size_class: pchar; minw: PEvas_Coord; minh: PEvas_Coord; maxw: PEvas_Coord; maxh: PEvas_Coord): TEina_Bool; cdecl; external libedje;
procedure edje_size_class_del(size_class: pchar); cdecl; external libedje;
function edje_size_class_list: PEina_List; cdecl; external libedje;
function edje_size_class_active_iterator_new: PEina_Iterator; cdecl; external libedje;
function edje_mmap_size_class_iterator_new(f: PEina_File): PEina_Iterator; cdecl; external libedje;
function edje_text_class_set(text_class: pchar; font: pchar; size: TEvas_Font_Size): TEina_Bool; cdecl; external libedje;
function edje_text_class_get(text_class: pchar; font: PPchar; size: PEvas_Font_Size): TEina_Bool; cdecl; external libedje;
procedure edje_text_class_del(text_class: pchar); cdecl; external libedje;
function edje_text_class_list: PEina_List; cdecl; external libedje;
function edje_text_class_active_iterator_new: PEina_Iterator; cdecl; external libedje;
function edje_mmap_text_class_iterator_new(f: PEina_File): PEina_Iterator; cdecl; external libedje;
function edje_mmap_collection_list(f: PEina_File): PEina_List; cdecl; external libedje;
procedure edje_mmap_collection_list_free(lst: PEina_List); cdecl; external libedje;
function edje_mmap_color_class_used_list(f: PEina_File): PEina_List; cdecl; external libedje;
function edje_file_color_class_used_list(file_: pchar): PEina_List; cdecl; external libedje;
procedure edje_file_color_class_used_free(lst: PEina_List); cdecl; external libedje;
function edje_mmap_group_exists(f: PEina_File; glob: pchar): TEina_Bool; cdecl; external libedje;
function edje_mmap_3d_has(f: PEina_File; group: pchar): TEina_Bool; cdecl; external libedje; deprecated;
function edje_file_iterator_new: PEina_Iterator; cdecl; external libedje;
function edje_file_collection_list(file_: pchar): PEina_List; cdecl; external libedje;
procedure edje_file_collection_list_free(lst: PEina_List); cdecl; external libedje;
function edje_file_group_exists(file_: pchar; glob: pchar): TEina_Bool; cdecl; external libedje;

type
  PEdje_Tween_Mode = ^TEdje_Tween_Mode;
  TEdje_Tween_Mode = longint;

const
  EDJE_TWEEN_MODE_NONE = 0;
  EDJE_TWEEN_MODE_LINEAR = 1;
  EDJE_TWEEN_MODE_SINUSOIDAL = 2;
  EDJE_TWEEN_MODE_ACCELERATE = 3;
  EDJE_TWEEN_MODE_DECELERATE = 4;
  EDJE_TWEEN_MODE_ACCELERATE_FACTOR = 5;
  EDJE_TWEEN_MODE_DECELERATE_FACTOR = 6;
  EDJE_TWEEN_MODE_SINUSOIDAL_FACTOR = 7;
  EDJE_TWEEN_MODE_DIVISOR_INTERP = 8;
  EDJE_TWEEN_MODE_BOUNCE = 9;
  EDJE_TWEEN_MODE_SPRING = 10;
  EDJE_TWEEN_MODE_CUBIC_BEZIER = 11;
  EDJE_TWEEN_MODE_LAST = 12;
  EDJE_TWEEN_MODE_MASK = $ff;
  EDJE_TWEEN_MODE_OPT_FROM_CURRENT = 1 shl 31;

type
  PEdje_Action_Type = ^TEdje_Action_Type;
  TEdje_Action_Type = longint;

const
  EDJE_ACTION_TYPE_NONE = 0;
  EDJE_ACTION_TYPE_STATE_SET = 1;
  EDJE_ACTION_TYPE_ACTION_STOP = 2;
  EDJE_ACTION_TYPE_SIGNAL_EMIT = 3;
  EDJE_ACTION_TYPE_DRAG_VAL_SET = 4;
  EDJE_ACTION_TYPE_DRAG_VAL_STEP = 5;
  EDJE_ACTION_TYPE_DRAG_VAL_PAGE = 6;
  EDJE_ACTION_TYPE_SCRIPT = 7;
  EDJE_ACTION_TYPE_FOCUS_SET = 8;
  EDJE_ACTION_TYPE_RESERVED00 = 9;
  EDJE_ACTION_TYPE_FOCUS_OBJECT = 10;
  EDJE_ACTION_TYPE_PARAM_COPY = 11;
  EDJE_ACTION_TYPE_PARAM_SET = 12;
  EDJE_ACTION_TYPE_SOUND_SAMPLE = 13;
  EDJE_ACTION_TYPE_SOUND_TONE = 14;
  EDJE_ACTION_TYPE_PHYSICS_IMPULSE = 15;
  EDJE_ACTION_TYPE_PHYSICS_TORQUE_IMPULSE = 16;
  EDJE_ACTION_TYPE_PHYSICS_FORCE = 17;
  EDJE_ACTION_TYPE_PHYSICS_TORQUE = 18;
  EDJE_ACTION_TYPE_PHYSICS_FORCES_CLEAR = 19;
  EDJE_ACTION_TYPE_PHYSICS_VEL_SET = 20;
  EDJE_ACTION_TYPE_PHYSICS_ANG_VEL_SET = 21;
  EDJE_ACTION_TYPE_PHYSICS_STOP = 22;
  EDJE_ACTION_TYPE_PHYSICS_ROT_SET = 23;
  EDJE_ACTION_TYPE_VIBRATION_SAMPLE = 24;
  EDJE_ACTION_TYPE_MO = 25;
  EDJE_ACTION_TYPE_VG_ANIM_STOP = 26;
  EDJE_ACTION_TYPE_VG_ANIM_PAUSE = 27;
  EDJE_ACTION_TYPE_VG_ANIM_RESUME = 28;
  EDJE_ACTION_TYPE_VG_ANIM_PLAY = 29;
  EDJE_ACTION_TYPE_VG_ANIM_REWIND = 30;
  EDJE_ACTION_TYPE_VG_ANIM_LOOP = 31;
  EDJE_ACTION_TYPE_LAST = 32;

procedure edje_frametime_set(t: double); cdecl; external libedje;
function edje_frametime_get: double; cdecl; external libedje;
procedure edje_freeze; cdecl; external libedje;
procedure edje_thaw; cdecl; external libedje;
procedure edje_language_set(locale: pchar); cdecl; external libedje;
procedure edje_transition_duration_factor_set(scale: double); cdecl; external libedje;
function edje_transition_duration_factor_get: double; cdecl; external libedje;

type
  PEdje_Text_Effect = ^TEdje_Text_Effect;
  TEdje_Text_Effect = longint;

const
  EDJE_TEXT_EFFECT_NONE = 0;
  EDJE_TEXT_EFFECT_PLAIN = 1;
  EDJE_TEXT_EFFECT_OUTLINE = 2;
  EDJE_TEXT_EFFECT_SOFT_OUTLINE = 3;
  EDJE_TEXT_EFFECT_SHADOW = 4;
  EDJE_TEXT_EFFECT_SOFT_SHADOW = 5;
  EDJE_TEXT_EFFECT_OUTLINE_SHADOW = 6;
  EDJE_TEXT_EFFECT_OUTLINE_SOFT_SHADOW = 7;
  EDJE_TEXT_EFFECT_FAR_SHADOW = 8;
  EDJE_TEXT_EFFECT_FAR_SOFT_SHADOW = 9;
  EDJE_TEXT_EFFECT_GLOW = 10;
  EDJE_TEXT_EFFECT_LAST = 11;
  EDJE_TEXT_EFFECT_SHADOW_DIRECTION_BOTTOM_RIGHT = $0 shl 4;
  EDJE_TEXT_EFFECT_SHADOW_DIRECTION_BOTTOM = $1 shl 4;
  EDJE_TEXT_EFFECT_SHADOW_DIRECTION_BOTTOM_LEFT = $2 shl 4;
  EDJE_TEXT_EFFECT_SHADOW_DIRECTION_LEFT = $3 shl 4;
  EDJE_TEXT_EFFECT_SHADOW_DIRECTION_TOP_LEFT = $4 shl 4;
  EDJE_TEXT_EFFECT_SHADOW_DIRECTION_TOP = $5 shl 4;
  EDJE_TEXT_EFFECT_SHADOW_DIRECTION_TOP_RIGHT = $6 shl 4;
  EDJE_TEXT_EFFECT_SHADOW_DIRECTION_RIGHT = $7 shl 4;

type
  Tlayout_data_get_func = function(para1: pointer): pointer; cdecl;
  Tlayout_data_free_func = procedure(para1: pointer); cdecl;

procedure edje_box_layout_register(name: pchar; func: TEvas_Object_Box_Layout; layout_data_get: Tlayout_data_get_func; layout_data_free: Tlayout_data_free_func; free_data: Tlayout_data_free_func; data: pointer); cdecl; external libedje;

type
  PEdje_Object_Table_Homogeneous_Mode = ^TEdje_Object_Table_Homogeneous_Mode;
  TEdje_Object_Table_Homogeneous_Mode = longint;

const
  EDJE_OBJECT_TABLE_HOMOGENEOUS_NONE = 0;
  EDJE_OBJECT_TABLE_HOMOGENEOUS_TABLE = 1;
  EDJE_OBJECT_TABLE_HOMOGENEOUS_ITEM = 2;

  // === Konventiert am: 22-5-25 17:55:40 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ENDIF read_implementation}
