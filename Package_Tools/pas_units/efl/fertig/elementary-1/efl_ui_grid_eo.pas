unit efl_ui_grid_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Grid = ^TEfl_Ui_Grid;
  TEfl_Ui_Grid = TEo;

function EFL_UI_GRID_CLASS: PEfl_Class;

function efl_ui_grid_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 15:27:06 ===


implementation


function EFL_UI_GRID_CLASS: PEfl_Class;
begin
  EFL_UI_GRID_CLASS := efl_ui_grid_class_get;
end;


end.
