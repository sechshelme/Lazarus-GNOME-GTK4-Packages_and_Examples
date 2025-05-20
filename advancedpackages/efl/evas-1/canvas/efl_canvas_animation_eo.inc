{$IFDEF read_interface}

type
  PEfl_Canvas_Animation = ^TEfl_Canvas_Animation;
  TEfl_Canvas_Animation = TEo;

function EFL_CANVAS_ANIMATION_CLASS: PEfl_Class;

function efl_canvas_animation_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_animation_final_state_keep_set(obj: PEo; keep: TEina_Bool); cdecl; external libevas;
function efl_animation_final_state_keep_get(obj: PEo): TEina_Bool; cdecl; external libevas;
procedure efl_animation_duration_set(obj: PEo; sec: double); cdecl; external libevas;
function efl_animation_duration_get(obj: PEo): double; cdecl; external libevas;
procedure efl_animation_repeat_mode_set(obj: PEo; mode: TEfl_Canvas_Animation_Repeat_Mode); cdecl; external libevas;
function efl_animation_repeat_mode_get(obj: PEo): TEfl_Canvas_Animation_Repeat_Mode; cdecl; external libevas;
procedure efl_animation_play_count_set(obj: PEo; count: longint); cdecl; external libevas;
function efl_animation_play_count_get(obj: PEo): longint; cdecl; external libevas;
procedure efl_animation_start_delay_set(obj: PEo; sec: double); cdecl; external libevas;
function efl_animation_start_delay_get(obj: PEo): double; cdecl; external libevas;
procedure efl_animation_interpolator_set(obj: PEo; interpolator: PEfl_Interpolator); cdecl; external libevas;
function efl_animation_interpolator_get(obj: PEo): PEfl_Interpolator; cdecl; external libevas;
function efl_animation_apply(obj: PEo; progress: double; target: PEfl_Canvas_Object): double; cdecl; external libevas;
procedure efl_animation_default_duration_set(animation_time: double); cdecl; external libevas;
function efl_animation_default_duration_get: double; cdecl; external libevas;

// === Konventiert am: 13-5-25 16:50:23 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_CANVAS_ANIMATION_CLASS: PEfl_Class;
begin
  EFL_CANVAS_ANIMATION_CLASS := efl_canvas_animation_class_get;
end;


{$ENDIF read_implementation}
