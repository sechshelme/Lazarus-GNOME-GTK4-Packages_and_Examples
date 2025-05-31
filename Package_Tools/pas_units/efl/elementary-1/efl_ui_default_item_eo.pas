unit efl_ui_default_item_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Default_Item = ^TEfl_Ui_Default_Item;
  TEfl_Ui_Default_Item = TEo;

function EFL_UI_DEFAULT_ITEM_CLASS: PEfl_Class;

function efl_ui_default_item_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 31-5-25 15:16:52 ===


implementation


function EFL_UI_DEFAULT_ITEM_CLASS: PEfl_Class;
begin
  EFL_UI_DEFAULT_ITEM_CLASS := efl_ui_default_item_class_get;
end;


end.
