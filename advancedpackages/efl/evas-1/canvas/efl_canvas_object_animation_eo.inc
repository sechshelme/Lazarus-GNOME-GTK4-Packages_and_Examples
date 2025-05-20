{$IFDEF read_interface}

type
  PEfl_Canvas_Object_Animation = ^TEfl_Canvas_Object_Animation;
  TEfl_Canvas_Object_Animation = TEo;

function EFL_CANVAS_OBJECT_ANIMATION_MIXIN: PEfl_Class;

function efl_canvas_object_animation_mixin_get: PEfl_Class; cdecl; external libevas;
function efl_canvas_object_animation_get(obj: PEo): PEfl_Canvas_Animation; cdecl; external libevas;
function efl_canvas_object_animation_progress_get(obj: PEo): double; cdecl; external libevas;
procedure efl_canvas_object_animation_pause_set(obj: PEo; pause: TEina_Bool); cdecl; external libevas;
function efl_canvas_object_animation_pause_get(obj: PEo): TEina_Bool; cdecl; external libevas;
procedure efl_canvas_object_animation_start(obj: PEo; animation: PEfl_Canvas_Animation; speed: double; starting_progress: double); cdecl; external libevas;
procedure efl_canvas_object_animation_stop(obj: PEo); cdecl; external libevas;

var
  _EFL_CANVAS_OBJECT_ANIMATION_EVENT_ANIMATION_CHANGED: TEfl_Event_Description; cvar;external libevas;
  _EFL_CANVAS_OBJECT_ANIMATION_EVENT_ANIMATION_PROGRESS_UPDATED: TEfl_Event_Description; cvar;external libevas;

function EFL_CANVAS_OBJECT_ANIMATION_EVENT_ANIMATION_CHANGED: PEfl_Event_Description;
function EFL_CANVAS_OBJECT_ANIMATION_EVENT_ANIMATION_PROGRESS_UPDATED: PEfl_Event_Description;


// === Konventiert am: 13-5-25 19:43:51 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_CANVAS_OBJECT_ANIMATION_MIXIN: PEfl_Class;
begin
  EFL_CANVAS_OBJECT_ANIMATION_MIXIN := efl_canvas_object_animation_mixin_get;
end;

function EFL_CANVAS_OBJECT_ANIMATION_EVENT_ANIMATION_CHANGED: PEfl_Event_Description;
begin
  EFL_CANVAS_OBJECT_ANIMATION_EVENT_ANIMATION_CHANGED := @(_EFL_CANVAS_OBJECT_ANIMATION_EVENT_ANIMATION_CHANGED);
end;

function EFL_CANVAS_OBJECT_ANIMATION_EVENT_ANIMATION_PROGRESS_UPDATED: PEfl_Event_Description;
begin
  EFL_CANVAS_OBJECT_ANIMATION_EVENT_ANIMATION_PROGRESS_UPDATED := @(_EFL_CANVAS_OBJECT_ANIMATION_EVENT_ANIMATION_PROGRESS_UPDATED);
end;


{$ENDIF read_implementation}
