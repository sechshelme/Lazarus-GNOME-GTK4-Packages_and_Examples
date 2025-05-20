{$IFDEF read_interface}


type
  PEfl_Canvas_Parallel_Group_Animation = ^TEfl_Canvas_Parallel_Group_Animation;
  TEfl_Canvas_Parallel_Group_Animation = TEo;

function EFL_CANVAS_PARALLEL_GROUP_ANIMATION_CLASS: PEfl_Class;

function efl_canvas_parallel_group_animation_class_get: PEfl_Class; cdecl; external libevas;

// === Konventiert am: 14-5-25 15:27:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_CANVAS_PARALLEL_GROUP_ANIMATION_CLASS: PEfl_Class;
begin
  EFL_CANVAS_PARALLEL_GROUP_ANIMATION_CLASS := efl_canvas_parallel_group_animation_class_get;
end;


{$ENDIF read_implementation}
