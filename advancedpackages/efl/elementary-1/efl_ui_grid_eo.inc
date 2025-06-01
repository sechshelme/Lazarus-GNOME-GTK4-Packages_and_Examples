{$IFDEF read_interface}


type
  PEfl_Ui_Grid = ^TEfl_Ui_Grid;
  TEfl_Ui_Grid = TEo;

function EFL_UI_GRID_CLASS: PEfl_Class;

function efl_ui_grid_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 15:27:06 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_UI_GRID_CLASS: PEfl_Class;
begin
  EFL_UI_GRID_CLASS := efl_ui_grid_class_get;
end;


{$ENDIF read_implementation}
