unit efl_ui_vg_animation_eo_legacy;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Animation_View = ^TElm_Animation_View;
  TElm_Animation_View = TEo;

type
  PElm_Animation_View_State = ^TElm_Animation_View_State;
  TElm_Animation_View_State = longint;

const
  ELM_ANIMATION_VIEW_STATE_NOT_READY = 0;
  ELM_ANIMATION_VIEW_STATE_PLAY = 1;
  ELM_ANIMATION_VIEW_STATE_PLAY_BACK = 2;
  ELM_ANIMATION_VIEW_STATE_PAUSE = 3;
  ELM_ANIMATION_VIEW_STATE_STOP = 4;

procedure elm_animation_view_auto_play_set(obj: PElm_Animation_View; auto_play: TEina_Bool); cdecl; external libelementary;
function elm_animation_view_auto_play_get(obj: PElm_Animation_View): TEina_Bool; cdecl; external libelementary;
procedure elm_animation_view_auto_repeat_set(obj: PElm_Animation_View; auto_repeat: TEina_Bool); cdecl; external libelementary;
function elm_animation_view_auto_repeat_get(obj: PElm_Animation_View): TEina_Bool; cdecl; external libelementary;
function elm_animation_view_speed_set(obj: PElm_Animation_View; speed: double): TEina_Bool; cdecl; external libelementary;
function elm_animation_view_speed_get(obj: PElm_Animation_View): double; cdecl; external libelementary;
function elm_animation_view_duration_time_get(obj: PElm_Animation_View): double; cdecl; external libelementary;
procedure elm_animation_view_progress_set(obj: PElm_Animation_View; progress: double); cdecl; external libelementary;
function elm_animation_view_progress_get(obj: PElm_Animation_View): double; cdecl; external libelementary;
procedure elm_animation_view_frame_set(obj: PElm_Animation_View; frame_num: longint); cdecl; external libelementary;
function elm_animation_view_frame_get(obj: PElm_Animation_View): longint; cdecl; external libelementary;
function elm_animation_view_play(obj: PElm_Animation_View): TEina_Bool; cdecl; external libelementary;
function elm_animation_view_play_back(obj: PElm_Animation_View): TEina_Bool; cdecl; external libelementary;
function elm_animation_view_pause(obj: PElm_Animation_View): TEina_Bool; cdecl; external libelementary;
function elm_animation_view_resume(obj: PElm_Animation_View): TEina_Bool; cdecl; external libelementary;
function elm_animation_view_stop(obj: PElm_Animation_View): TEina_Bool; cdecl; external libelementary;
function elm_animation_view_default_size_get(obj: PElm_Animation_View): TEina_Size2D; cdecl; external libelementary;
function elm_animation_view_is_playing_back(obj: PElm_Animation_View): TEina_Bool; cdecl; external libelementary;
function elm_animation_view_frame_count_get(obj: PElm_Animation_View): longint; cdecl; external libelementary;
procedure elm_animation_view_min_progress_set(obj: PElm_Animation_View; min_progress: double); cdecl; external libelementary;
function elm_animation_view_min_progress_get(obj: PElm_Animation_View): double; cdecl; external libelementary;
procedure elm_animation_view_max_progress_set(obj: PElm_Animation_View; max_progress: double); cdecl; external libelementary;
function elm_animation_view_max_progress_get(obj: PElm_Animation_View): double; cdecl; external libelementary;
procedure elm_animation_view_min_frame_set(obj: PElm_Animation_View; min_frame: longint); cdecl; external libelementary;
function elm_animation_view_min_frame_get(obj: PElm_Animation_View): longint; cdecl; external libelementary;
procedure elm_animation_view_max_frame_set(obj: PElm_Animation_View; max_frame: longint); cdecl; external libelementary;
function elm_animation_view_max_frame_get(obj: PElm_Animation_View): longint; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_VG_ANIMATION_LEGACY_CLASS: PEfl_Class;

function efl_ui_vg_animation_legacy_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 26-5-25 17:31:48 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_VG_ANIMATION_LEGACY_CLASS: PEfl_Class;
begin
  EFL_UI_VG_ANIMATION_LEGACY_CLASS := efl_ui_vg_animation_legacy_class_get;
end;
{$endif}


end.
