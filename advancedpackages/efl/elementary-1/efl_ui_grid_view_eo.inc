{$IFDEF read_interface}


type
  PEfl_Ui_Grid_View = ^TEfl_Ui_Grid_View;
  TEfl_Ui_Grid_View = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_GRID_VIEW_CLASS: PEfl_Class;

function efl_ui_grid_view_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 15:27:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_GRID_VIEW_CLASS: PEfl_Class;
begin
  EFL_UI_GRID_VIEW_CLASS := efl_ui_grid_view_class_get;
end;
{$endif}


{$ENDIF read_implementation}
