unit efl_canvas_scale_animation_eo;

interface

uses
  ctypes, efl, fp_eina, Evas_Common;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Scale_Animation = ^TEfl_Canvas_Scale_Animation;
  TEfl_Canvas_Scale_Animation = TEo;

function EFL_CANVAS_SCALE_ANIMATION_CLASS: PEfl_Class;

function efl_canvas_scale_animation_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_animation_scale_set(obj: PEo; from_scale: TEina_Vector2; to_scale: TEina_Vector2; pivot: PEfl_Canvas_Object; center_point: TEina_Vector2); cdecl; external libevas;
procedure efl_animation_scale_get(obj: PEo; from_scale: PEina_Vector2; to_scale: PEina_Vector2; pivot: PPEfl_Canvas_Object; center_point: PEina_Vector2); cdecl; external libevas;
procedure efl_animation_scale_absolute_set(obj: PEo; from_scale: TEina_Vector2; to_scale: TEina_Vector2; pivot_point: TEina_Position2D); cdecl; external libevas;
procedure efl_animation_scale_absolute_get(obj: PEo; from_scale: PEina_Vector2; to_scale: PEina_Vector2; pivot_point: PEina_Position2D); cdecl; external libevas;

// === Konventiert am: 13-5-25 19:44:01 ===


implementation


function EFL_CANVAS_SCALE_ANIMATION_CLASS: PEfl_Class;
begin
  EFL_CANVAS_SCALE_ANIMATION_CLASS := efl_canvas_scale_animation_class_get;
end;


end.
