unit elm_transit;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PElm_Transit_Tween_Mode = ^TElm_Transit_Tween_Mode;
  TElm_Transit_Tween_Mode = longint;

const
  ELM_TRANSIT_TWEEN_MODE_LINEAR = 0;
  ELM_TRANSIT_TWEEN_MODE_SINUSOIDAL = 1;
  ELM_TRANSIT_TWEEN_MODE_DECELERATE = 2;
  ELM_TRANSIT_TWEEN_MODE_ACCELERATE = 3;
  ELM_TRANSIT_TWEEN_MODE_DIVISOR_INTERP = 4;
  ELM_TRANSIT_TWEEN_MODE_BOUNCE = 5;
  ELM_TRANSIT_TWEEN_MODE_SPRING = 6;
  ELM_TRANSIT_TWEEN_MODE_BEZIER_CURVE = 7;

type
  PElm_Transit_Effect_Flip_Axis = ^TElm_Transit_Effect_Flip_Axis;
  TElm_Transit_Effect_Flip_Axis = longint;

const
  ELM_TRANSIT_EFFECT_FLIP_AXIS_X = 0;
  ELM_TRANSIT_EFFECT_FLIP_AXIS_Y = 1;

type
  PElm_Transit_Effect_Wipe_Dir = ^TElm_Transit_Effect_Wipe_Dir;
  TElm_Transit_Effect_Wipe_Dir = longint;

const
  ELM_TRANSIT_EFFECT_WIPE_DIR_LEFT = 0;
  ELM_TRANSIT_EFFECT_WIPE_DIR_RIGHT = 1;
  ELM_TRANSIT_EFFECT_WIPE_DIR_UP = 2;
  ELM_TRANSIT_EFFECT_WIPE_DIR_DOWN = 3;

type
  PElm_Transit_Effect_Wipe_Type = ^TElm_Transit_Effect_Wipe_Type;
  TElm_Transit_Effect_Wipe_Type = longint;

const
  ELM_TRANSIT_EFFECT_WIPE_TYPE_HIDE = 0;
  ELM_TRANSIT_EFFECT_WIPE_TYPE_SHOW = 1;

type
  PElm_Transit_Effect = ^TElm_Transit_Effect;
  TElm_Transit_Effect = pointer;

  TElm_Transit = record
  end;
  PElm_Transit = ^TElm_Transit;

  TElm_Transit_Effect_Transition_Cb = procedure(effect: PElm_Transit_Effect; transit: PElm_Transit; progress: double); cdecl;
  TElm_Transit_Effect_End_Cb = procedure(effect: PElm_Transit_Effect; transit: PElm_Transit); cdecl;
  TElm_Transit_Del_Cb = procedure(data: pointer; transit: PElm_Transit); cdecl;

function elm_transit_add: PElm_Transit; cdecl; external libelementary;
procedure elm_transit_del(transit: PElm_Transit); cdecl; external libelementary;
procedure elm_transit_effect_add(transit: PElm_Transit; transition_cb: TElm_Transit_Effect_Transition_Cb; effect: PElm_Transit_Effect; end_cb: TElm_Transit_Effect_End_Cb); cdecl; external libelementary;
procedure elm_transit_effect_del(transit: PElm_Transit; transition_cb: TElm_Transit_Effect_Transition_Cb; effect: PElm_Transit_Effect); cdecl; external libelementary;
procedure elm_transit_object_add(transit: PElm_Transit; obj: PEvas_Object); cdecl; external libelementary;
procedure elm_transit_object_remove(transit: PElm_Transit; obj: PEvas_Object); cdecl; external libelementary;
function elm_transit_objects_get(transit: PElm_Transit): PEina_List; cdecl; external libelementary;
procedure elm_transit_objects_final_state_keep_set(transit: PElm_Transit; state_keep: TEina_Bool); cdecl; external libelementary;
function elm_transit_objects_final_state_keep_get(transit: PElm_Transit): TEina_Bool; cdecl; external libelementary;
procedure elm_transit_event_enabled_set(transit: PElm_Transit; enabled: TEina_Bool); cdecl; external libelementary;
function elm_transit_event_enabled_get(transit: PElm_Transit): TEina_Bool; cdecl; external libelementary;
procedure elm_transit_del_cb_set(transit: PElm_Transit; cb: TElm_Transit_Del_Cb; data: pointer); cdecl; external libelementary;
procedure elm_transit_auto_reverse_set(transit: PElm_Transit; reverse: TEina_Bool); cdecl; external libelementary;
function elm_transit_auto_reverse_get(transit: PElm_Transit): TEina_Bool; cdecl; external libelementary;
procedure elm_transit_repeat_times_set(transit: PElm_Transit; _repeat: longint); cdecl; external libelementary;
function elm_transit_repeat_times_get(transit: PElm_Transit): longint; cdecl; external libelementary;
function elm_transit_current_repeat_times_get(transit: PElm_Transit): longint; cdecl; external libelementary;
procedure elm_transit_tween_mode_set(transit: PElm_Transit; tween_mode: TElm_Transit_Tween_Mode); cdecl; external libelementary;
function elm_transit_tween_mode_get(transit: PElm_Transit): TElm_Transit_Tween_Mode; cdecl; external libelementary;
procedure elm_transit_tween_mode_factor_set(transit: PElm_Transit; v1: double; v2: double); cdecl; external libelementary;
procedure elm_transit_tween_mode_factor_get(transit: PElm_Transit; v1: Pdouble; v2: Pdouble); cdecl; external libelementary;
procedure elm_transit_tween_mode_factor_n_set(transit: PElm_Transit; v_size: dword; v: Pdouble); cdecl; external libelementary;
procedure elm_transit_duration_set(transit: PElm_Transit; duration: double); cdecl; external libelementary;
function elm_transit_duration_get(transit: PElm_Transit): double; cdecl; external libelementary;
procedure elm_transit_go(transit: PElm_Transit); cdecl; external libelementary;
function elm_transit_revert(transit: PElm_Transit): TEina_Bool; cdecl; external libelementary;
procedure elm_transit_go_in(transit: PElm_Transit; in_: double); cdecl; external libelementary;
procedure elm_transit_paused_set(transit: PElm_Transit; paused: TEina_Bool); cdecl; external libelementary;
function elm_transit_paused_get(transit: PElm_Transit): TEina_Bool; cdecl; external libelementary;
function elm_transit_progress_value_get(transit: PElm_Transit): double; cdecl; external libelementary;
procedure elm_transit_progress_value_set(transit: PElm_Transit; progress: double); cdecl; external libelementary;
procedure elm_transit_chain_transit_add(transit: PElm_Transit; chain_transit: PElm_Transit); cdecl; external libelementary;
procedure elm_transit_chain_transit_del(transit: PElm_Transit; chain_transit: PElm_Transit); cdecl; external libelementary;
function elm_transit_chain_transits_get(transit: PElm_Transit): PEina_List; cdecl; external libelementary;
procedure elm_transit_smooth_set(transit: PElm_Transit; enabled: TEina_Bool); cdecl; external libelementary;
function elm_transit_smooth_get(transit: PElm_Transit): TEina_Bool; cdecl; external libelementary;
function elm_transit_effect_resizing_add(transit: PElm_Transit; from_w: TEvas_Coord; from_h: TEvas_Coord; to_w: TEvas_Coord; to_h: TEvas_Coord): PElm_Transit_Effect; cdecl; external libelementary;
function elm_transit_effect_translation_add(transit: PElm_Transit; from_dx: TEvas_Coord; from_dy: TEvas_Coord; to_dx: TEvas_Coord; to_dy: TEvas_Coord): PElm_Transit_Effect; cdecl; external libelementary;
function elm_transit_effect_zoom_add(transit: PElm_Transit; from_rate: single; to_rate: single): PElm_Transit_Effect; cdecl; external libelementary;
function elm_transit_effect_flip_add(transit: PElm_Transit; axis: TElm_Transit_Effect_Flip_Axis; cw: TEina_Bool): PElm_Transit_Effect; cdecl; external libelementary;
function elm_transit_effect_resizable_flip_add(transit: PElm_Transit; axis: TElm_Transit_Effect_Flip_Axis; cw: TEina_Bool): PElm_Transit_Effect; cdecl; external libelementary;
function elm_transit_effect_wipe_add(transit: PElm_Transit; _type: TElm_Transit_Effect_Wipe_Type; dir: TElm_Transit_Effect_Wipe_Dir): PElm_Transit_Effect; cdecl; external libelementary;
function elm_transit_effect_color_add(transit: PElm_Transit; from_r: dword; from_g: dword; from_b: dword; from_a: dword;
  to_r: dword; to_g: dword; to_b: dword; to_a: dword): PElm_Transit_Effect; cdecl; external libelementary;
function elm_transit_effect_fade_add(transit: PElm_Transit): PElm_Transit_Effect; cdecl; external libelementary;
function elm_transit_effect_blend_add(transit: PElm_Transit): PElm_Transit_Effect; cdecl; external libelementary;
function elm_transit_effect_rotation_add(transit: PElm_Transit; from_degree: single; to_degree: single): PElm_Transit_Effect; cdecl; external libelementary;
function elm_transit_effect_image_animation_add(transit: PElm_Transit; images: PEina_List): PElm_Transit_Effect; cdecl; external libelementary;

// === Konventiert am: 25-5-25 18:43:51 ===


implementation



end.
