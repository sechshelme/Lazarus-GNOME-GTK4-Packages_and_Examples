unit efl_ui_pan_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl, fp_evas, fp_ecore, fp_edje, fp_elementary;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Pan = ^TEfl_Ui_Pan;
  TEfl_Ui_Pan = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_PAN_CLASS: PEfl_Class;

function efl_ui_pan_class_get: PEfl_Class; cdecl; external libelementary;
procedure efl_ui_pan_position_set(obj: PEo; position: TEina_Position2D); cdecl; external libelementary;
function efl_ui_pan_position_get(obj: PEo): TEina_Position2D; cdecl; external libelementary;
function efl_ui_pan_content_size_get(obj: PEo): TEina_Size2D; cdecl; external libelementary;
function efl_ui_pan_position_min_get(obj: PEo): TEina_Position2D; cdecl; external libelementary;
function efl_ui_pan_position_max_get(obj: PEo): TEina_Position2D; cdecl; external libelementary;

var
  _EFL_UI_PAN_EVENT_PAN_CONTENT_POSITION_CHANGED: TEfl_Event_Description; cvar;external libelementary;
  _EFL_UI_PAN_EVENT_PAN_CONTENT_SIZE_CHANGED: TEfl_Event_Description; cvar;external libelementary;

function EFL_UI_PAN_EVENT_PAN_CONTENT_POSITION_CHANGED: PEfl_Event_Description;
function EFL_UI_PAN_EVENT_PAN_CONTENT_SIZE_CHANGED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 30-5-25 14:00:30 ===


implementation


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_UI_PAN_CLASS: PEfl_Class;
begin
  EFL_UI_PAN_CLASS := efl_ui_pan_class_get;
end;

function EFL_UI_PAN_EVENT_PAN_CONTENT_POSITION_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_PAN_EVENT_PAN_CONTENT_POSITION_CHANGED := @(_EFL_UI_PAN_EVENT_PAN_CONTENT_POSITION_CHANGED);
end;

function EFL_UI_PAN_EVENT_PAN_CONTENT_SIZE_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_PAN_EVENT_PAN_CONTENT_SIZE_CHANGED := @(_EFL_UI_PAN_EVENT_PAN_CONTENT_SIZE_CHANGED);
end;
{$endif}


end.
