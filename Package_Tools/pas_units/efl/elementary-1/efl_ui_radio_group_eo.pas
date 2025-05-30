unit efl_ui_radio_group_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary, efl_ui_radio_eo_legacy;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Radio_Group = ^TEfl_Ui_Radio_Group;
  TEfl_Ui_Radio_Group = TEo;

function EFL_UI_RADIO_GROUP_INTERFACE: PEfl_Config;

function efl_ui_radio_group_interface_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_radio_group_selected_value_set(obj: PEo; selected_value: longint); cdecl; external libelementary;
function efl_ui_radio_group_selected_value_get(obj: PEo): longint; cdecl; external libelementary;
procedure efl_ui_radio_group_register(obj: PEo; radio: PEfl_Ui_Radio); cdecl; external libelementary;
procedure efl_ui_radio_group_unregister(obj: PEo; radio: PEfl_Ui_Radio); cdecl; external libelementary;

var
  _EFL_UI_RADIO_GROUP_EVENT_VALUE_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_RADIO_GROUP_EVENT_VALUE_CHANGED: PEfl_Event_Description;

// === Konventiert am: 30-5-25 15:25:50 ===


implementation


function EFL_UI_RADIO_GROUP_INTERFACE: PEfl_Config;
begin
  EFL_UI_RADIO_GROUP_INTERFACE := efl_ui_radio_group_interface_get;
end;

function EFL_UI_RADIO_GROUP_EVENT_VALUE_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_RADIO_GROUP_EVENT_VALUE_CHANGED := @(_EFL_UI_RADIO_GROUP_EVENT_VALUE_CHANGED);
end;


end.
