unit efl_ui_action_connector_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Action_Connector = ^TEfl_Ui_Action_Connector;
  TEfl_Ui_Action_Connector = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_ACTION_CONNECTOR_CLASS: PEfl_Class;

function efl_ui_action_connector_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_action_connector_bind_clickable_to_theme(obj: PEfl_Canvas_Layout; clickable: PEfl_Input_Clickable); cdecl; external libelementary;
procedure efl_ui_action_connector_bind_clickable_to_object(obj: PEfl_Input_Interface; clickable: PEfl_Input_Clickable); cdecl; external libelementary;
{$endif}

// === Konventiert am: 31-5-25 13:08:58 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_ACTION_CONNECTOR_CLASS: PEfl_Class;
begin
  EFL_UI_ACTION_CONNECTOR_CLASS := efl_ui_action_connector_class_get;
end;
{$endif}


end.
