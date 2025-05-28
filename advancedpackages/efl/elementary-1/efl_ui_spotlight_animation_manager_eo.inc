{$IFDEF read_interface}


type
  PEfl_Ui_Spotlight_Animation_Manager = ^TEfl_Ui_Spotlight_Animation_Manager;
  TEfl_Ui_Spotlight_Animation_Manager = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SPOTLIGHT_ANIMATION_MANAGER_CLASS: PEfl_Class;

function efl_ui_spotlight_animation_manager_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_spotlight_manager_animation_push_setup_set(obj: PEo; in_: PEfl_Canvas_Animation; out_: PEfl_Canvas_Animation); cdecl; external libelementary;
procedure efl_ui_spotlight_manager_animation_pop_setup_set(obj: PEo; in_: PEfl_Canvas_Animation; out_: PEfl_Canvas_Animation); cdecl; external libelementary;
procedure efl_ui_spotlight_manager_animation_jump_setup_set(obj: PEo; in_: PEfl_Canvas_Animation; out_: PEfl_Canvas_Animation); cdecl; external libelementary;
{$endif}

// === Konventiert am: 27-5-25 19:41:17 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SPOTLIGHT_ANIMATION_MANAGER_CLASS: PEfl_Class;
begin
  EFL_UI_SPOTLIGHT_ANIMATION_MANAGER_CLASS := efl_ui_spotlight_animation_manager_class_get;
end;
{$endif}


{$ENDIF read_implementation}
