unit efl_canvas_alpha_animation_eo;

interface

uses
  ctypes, efl,fp_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Alpha_Animation = ^TEfl_Canvas_Alpha_Animation;
  TEfl_Canvas_Alpha_Animation = TEo;

function EFL_CANVAS_ALPHA_ANIMATION_CLASS: PEfl_Class;

function efl_canvas_alpha_animation_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_animation_alpha_set(obj: PEo; from_alpha: double; to_alpha: double); cdecl; external libevas;
procedure efl_animation_alpha_get(obj: PEo; from_alpha: Pdouble; to_alpha: Pdouble); cdecl; external libevas;

// === Konventiert am: 14-5-25 15:08:31 ===


implementation


function EFL_CANVAS_ALPHA_ANIMATION_CLASS: PEfl_Class;
begin
  EFL_CANVAS_ALPHA_ANIMATION_CLASS := efl_canvas_alpha_animation_class_get;
end;


end.
