unit efl_ui_box_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Box = ^TEfl_Ui_Box;
  TEfl_Ui_Box = TEo;

function EFL_UI_BOX_CLASS: PEfl_Class;

function efl_ui_box_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_box_homogeneous_set(obj: PEo; homogeneous: TEina_Bool); cdecl; external libelementary;
function efl_ui_box_homogeneous_get(obj: PEo): TEina_Bool; cdecl; external libelementary;

// === Konventiert am: 31-5-25 13:09:40 ===


implementation


function EFL_UI_BOX_CLASS: PEfl_Class;
begin
  EFL_UI_BOX_CLASS := efl_ui_box_class_get;
end;


end.
