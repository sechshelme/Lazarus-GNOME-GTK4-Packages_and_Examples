{$IFDEF read_interface}

type
  PEfl_Canvas_Group_Animation = ^TEfl_Canvas_Group_Animation;
  TEfl_Canvas_Group_Animation = TEo;

function EFL_CANVAS_GROUP_ANIMATION_CLASS: PEfl_Class;

function efl_canvas_group_animation_class_get: PEfl_Class; cdecl; external libevas;
procedure efl_animation_group_animation_add(obj: PEo; animation: PEfl_Canvas_Animation); cdecl; external libevas;
procedure efl_animation_group_animation_del(obj: PEo; animation: PEfl_Canvas_Animation); cdecl; external libevas;
function efl_animation_group_animations_get(obj: PEo): PEina_Iterator; cdecl; external libevas;

// === Konventiert am: 14-5-25 15:08:38 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_CANVAS_GROUP_ANIMATION_CLASS: PEfl_Class;
begin
  EFL_CANVAS_GROUP_ANIMATION_CLASS := efl_canvas_group_animation_class_get;
end;


{$ENDIF read_implementation}
