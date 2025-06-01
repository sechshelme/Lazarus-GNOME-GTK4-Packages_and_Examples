unit efl_ui_box_stack_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Box_Stack = ^TEfl_Ui_Box_Stack;
  TEfl_Ui_Box_Stack = TEo;

function EFL_UI_BOX_STACK_CLASS: PEfl_Class;

function efl_ui_box_stack_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 13:09:47 ===


implementation


function EFL_UI_BOX_STACK_CLASS: PEfl_Class;
begin
  EFL_UI_BOX_STACK_CLASS := efl_ui_box_stack_class_get;
end;


end.
