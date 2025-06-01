unit efl_ui_list_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_List = ^TEfl_Ui_List;
  TEfl_Ui_List = TEo;

function EFL_UI_LIST_CLASS: PEfl_Class;

function efl_ui_list_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 15:50:08 ===


implementation


function EFL_UI_LIST_CLASS: PEfl_Class;
begin
  EFL_UI_LIST_CLASS := efl_ui_list_class_get;
end;


end.
