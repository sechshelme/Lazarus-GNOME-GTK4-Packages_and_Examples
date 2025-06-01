unit efl_ui_radio_group_impl_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Radio_Group_Impl = ^TEfl_Ui_Radio_Group_Impl;
  TEfl_Ui_Radio_Group_Impl = TEo;

function EFL_UI_RADIO_GROUP_IMPL_CLASS: PEfl_Config;

function efl_ui_radio_group_impl_class_get: PEfl_Class; cdecl; external libelementary;

// === Konventiert am: 30-5-25 15:52:14 ===


implementation


function EFL_UI_RADIO_GROUP_IMPL_CLASS: PEfl_Config;
begin
  EFL_UI_RADIO_GROUP_IMPL_CLASS := efl_ui_radio_group_impl_class_get;
end;


end.
