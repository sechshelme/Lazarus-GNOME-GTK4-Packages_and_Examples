unit efl_ui_stack_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Stack = ^TEfl_Ui_Stack;
  TEfl_Ui_Stack = TEo;

function EFL_UI_STACK_CLASS: PEfl_Class;

function efl_ui_stack_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 17:37:51 ===


implementation


function EFL_UI_STACK_CLASS: PEfl_Class;
begin
  EFL_UI_STACK_CLASS := efl_ui_stack_class_get;
end;


end.
