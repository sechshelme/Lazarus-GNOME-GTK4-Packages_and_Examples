unit elm_widget_combobox;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PElm_Combobox_Data = ^TElm_Combobox_Data;
  TElm_Combobox_Data = record
  end;

function ELM_COMBOBOX_CLASS: PEfl_Class;

function elm_combobox_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 1-6-25 15:41:19 ===


implementation


function ELM_COMBOBOX_CLASS: PEfl_Class;
begin
  ELM_COMBOBOX_CLASS := elm_combobox_class_get;
end;


end.
