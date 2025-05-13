unit efl_canvas_rotate_animation_eo;

interface

uses
  ctypes, elf, Evas_Common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}

type
  PEfl_Canvas_Rotate_Animation = ^TEfl_Canvas_Rotate_Animation;
  TEfl_Canvas_Rotate_Animation = TEo;

function EFL_CANVAS_ROTATE_ANIMATION_CLASS: PEfl_Class;

function efl_canvas_rotate_animation_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_animation_rotate_set(obj: PEo; from_degree: double; to_degree: double; pivot: PEfl_Canvas_Object; center_point: TEina_Vector2); cdecl; external libevas;
procedure efl_animation_rotate_get(obj: PEo; from_degree: Pdouble; to_degree: Pdouble; pivot: PPEfl_Canvas_Object; center_point: PEina_Vector2); cdecl; external libevas;
procedure efl_animation_rotate_absolute_set(obj: PEo; from_degree: double; to_degree: double; pivot_point: TEina_Position2D); cdecl; external libevas;
procedure efl_animation_rotate_absolute_get(obj: PEo; from_degree: Pdouble; to_degree: Pdouble; pivot_point: PEina_Position2D); cdecl; external libevas;

// === Konventiert am: 13-5-25 19:43:57 ===


implementation


function EFL_CANVAS_ROTATE_ANIMATION_CLASS: PEfl_Class;
begin
  EFL_CANVAS_ROTATE_ANIMATION_CLASS := efl_canvas_rotate_animation_class_get;
end;


end.
