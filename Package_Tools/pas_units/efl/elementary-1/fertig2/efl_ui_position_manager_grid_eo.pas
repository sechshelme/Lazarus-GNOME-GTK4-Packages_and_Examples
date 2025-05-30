unit efl_ui_position_manager_grid_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Position_Manager_Grid = ^TEfl_Ui_Position_Manager_Grid;
  TEfl_Ui_Position_Manager_Grid = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_POSITION_MANAGER_GRID_CLASS: PEfl_Class;

function efl_ui_position_manager_grid_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 30-5-25 14:20:06 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_POSITION_MANAGER_GRID_CLASS: PEfl_Class;
begin
  EFL_UI_POSITION_MANAGER_GRID_CLASS := efl_ui_position_manager_grid_class_get;
end;
{$endif}


end.
