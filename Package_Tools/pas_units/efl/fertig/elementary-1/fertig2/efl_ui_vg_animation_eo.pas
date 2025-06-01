unit efl_ui_vg_animation_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Vg_Animation = ^TEfl_Ui_Vg_Animation;
  TEfl_Ui_Vg_Animation = TEo;

type
  PEfl_Ui_Vg_Animation_State = ^TEfl_Ui_Vg_Animation_State;
  TEfl_Ui_Vg_Animation_State = longint;

const
  EFL_UI_VG_ANIMATION_STATE_NOT_READY = 0;
  EFL_UI_VG_ANIMATION_STATE_PLAYING = 1;
  EFL_UI_VG_ANIMATION_STATE_PLAYING_BACKWARDS = 2;
  EFL_UI_VG_ANIMATION_STATE_PAUSED = 3;
  EFL_UI_VG_ANIMATION_STATE_STOPPED = 4;

function EFL_UI_VG_ANIMATION_CLASS: PEfl_Class;

function efl_ui_vg_animation_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_vg_animation_frame_set(obj: PEo; frame_num: longint); cdecl; external libelementary;
function efl_ui_vg_animation_frame_get(obj: PEo): longint; cdecl; external libelementary;
function efl_ui_vg_animation_default_view_size_get(obj: PEo): TEina_Size2D; cdecl; external libelementary;
function efl_ui_vg_animation_state_get(obj: PEo): TEfl_Ui_Vg_Animation_State; cdecl; external libelementary;
function efl_ui_vg_animation_frame_count_get(obj: PEo): longint; cdecl; external libelementary;
procedure efl_ui_vg_animation_min_progress_set(obj: PEo; min_progress: double); cdecl; external libelementary;
function efl_ui_vg_animation_min_progress_get(obj: PEo): double; cdecl; external libelementary;
procedure efl_ui_vg_animation_max_progress_set(obj: PEo; max_progress: double); cdecl; external libelementary;
function efl_ui_vg_animation_max_progress_get(obj: PEo): double; cdecl; external libelementary;
procedure efl_ui_vg_animation_min_frame_set(obj: PEo; min_frame: longint); cdecl; external libelementary;
function efl_ui_vg_animation_min_frame_get(obj: PEo): longint; cdecl; external libelementary;
procedure efl_ui_vg_animation_max_frame_set(obj: PEo; max_frame: longint); cdecl; external libelementary;
function efl_ui_vg_animation_max_frame_get(obj: PEo): longint; cdecl; external libelementary;

{$ifdef EFL_BETA_API_SUPPORT}
function efl_ui_vg_animation_playing_sector(obj: PEo; start: pchar; end_: pchar): TEina_Bool; cdecl; external libelementary;
{$endif}

{$ifdef EFL_BETA_API_SUPPORT}
procedure efl_ui_vg_animation_value_provider_override(obj: PEo; value_provider: PEfl_Gfx_Vg_Value_Provider); cdecl; external libelementary;
{$endif}

// === Konventiert am: 28-5-25 15:57:00 ===


implementation


function EFL_UI_VG_ANIMATION_CLASS: PEfl_Class;
begin
  EFL_UI_VG_ANIMATION_CLASS := efl_ui_vg_animation_class_get;
end;


end.
