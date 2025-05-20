unit efl_canvas_sequential_group_animation_eo;

interface

uses
  ctypes, efl,fp_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Canvas_Sequential_Group_Animation = ^TEfl_Canvas_Sequential_Group_Animation;
  TEfl_Canvas_Sequential_Group_Animation = TEo;

function EFL_CANVAS_SEQUENTIAL_GROUP_ANIMATION_CLASS: PEfl_Class;

function efl_canvas_sequential_group_animation_class_get: PEfl_Class; cdecl; external libevas;

// === Konventiert am: 14-5-25 15:27:32 ===


implementation


function EFL_CANVAS_SEQUENTIAL_GROUP_ANIMATION_CLASS: PEfl_Class;
begin
  EFL_CANVAS_SEQUENTIAL_GROUP_ANIMATION_CLASS := efl_canvas_sequential_group_animation_class_get;
end;


end.
