{$IFDEF read_interface}


type
  PEfl_Canvas_Alpha_Animation = ^TEfl_Canvas_Alpha_Animation;
  TEfl_Canvas_Alpha_Animation = TEo;

function EFL_CANVAS_ALPHA_ANIMATION_CLASS: PEfl_Class;

function efl_canvas_alpha_animation_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_animation_alpha_set(obj: PEo; from_alpha: double; to_alpha: double); cdecl; external libevas;
procedure efl_animation_alpha_get(obj: PEo; from_alpha: Pdouble; to_alpha: Pdouble); cdecl; external libevas;

// === Konventiert am: 14-5-25 15:08:31 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_CANVAS_ALPHA_ANIMATION_CLASS: PEfl_Class;
begin
  EFL_CANVAS_ALPHA_ANIMATION_CLASS := efl_canvas_alpha_animation_class_get;
end;


{$ENDIF read_implementation}
