{$IFDEF read_interface}


type
  PEfl_Ui_Position_Manager_Grid = ^TEfl_Ui_Position_Manager_Grid;
  TEfl_Ui_Position_Manager_Grid = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_POSITION_MANAGER_GRID_CLASS: PEfl_Class;

function efl_ui_position_manager_grid_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 30-5-25 14:20:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_POSITION_MANAGER_GRID_CLASS: PEfl_Class;
begin
  EFL_UI_POSITION_MANAGER_GRID_CLASS := efl_ui_position_manager_grid_class_get;
end;
{$endif}


{$ENDIF read_implementation}
