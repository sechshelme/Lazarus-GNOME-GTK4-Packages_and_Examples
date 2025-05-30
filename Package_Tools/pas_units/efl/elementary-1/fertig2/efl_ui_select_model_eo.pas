unit efl_ui_select_model_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Select_Model = ^TEfl_Ui_Select_Model;
  TEfl_Ui_Select_Model = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SELECT_MODEL_CLASS: PEfl_Config;

function efl_ui_select_model_class_get: PEfl_Class; cdecl; external libelementary;

var
  _EFL_UI_SELECT_MODEL_EVENT_SELECTED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_SELECT_MODEL_EVENT_UNSELECTED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_SELECT_MODEL_EVENT_SELECTED: PEfl_Event_Description;
function EFL_UI_SELECT_MODEL_EVENT_UNSELECTED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 30-5-25 15:42:25 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_SELECT_MODEL_CLASS: PEfl_Config;
begin
  EFL_UI_SELECT_MODEL_CLASS := efl_ui_select_model_class_get;
end;

function EFL_UI_SELECT_MODEL_EVENT_SELECTED: PEfl_Event_Description;
begin
  EFL_UI_SELECT_MODEL_EVENT_SELECTED := @(_EFL_UI_SELECT_MODEL_EVENT_SELECTED);
end;

function EFL_UI_SELECT_MODEL_EVENT_UNSELECTED: PEfl_Event_Description;
begin
  EFL_UI_SELECT_MODEL_EVENT_UNSELECTED := @(_EFL_UI_SELECT_MODEL_EVENT_UNSELECTED);
end;
{$endif}


end.
