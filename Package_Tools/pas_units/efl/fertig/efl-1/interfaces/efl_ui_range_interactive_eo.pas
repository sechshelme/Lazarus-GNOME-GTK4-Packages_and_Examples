unit efl_ui_range_interactive_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Range_Interactive = ^TEfl_Ui_Range_Interactive;
  TEfl_Ui_Range_Interactive = TEo;

function EFL_UI_RANGE_INTERACTIVE_INTERFACE: PEfl_Class;

function efl_ui_range_interactive_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_ui_range_step_set(obj: PEo; step: double); cdecl; external libefl;
function efl_ui_range_step_get(obj: PEo): double; cdecl; external libefl;

var
  _EFL_UI_RANGE_EVENT_STEADY: TEfl_Event_Description; cvar;external libefl;

function EFL_UI_RANGE_EVENT_STEADY: PEfl_Event_Description;

// === Konventiert am: 20-5-25 13:30:51 ===


implementation


function EFL_UI_RANGE_INTERACTIVE_INTERFACE: PEfl_Class;
begin
  EFL_UI_RANGE_INTERACTIVE_INTERFACE := efl_ui_range_interactive_interface_get;
end;

function EFL_UI_RANGE_EVENT_STEADY: PEfl_Event_Description;
begin
  EFL_UI_RANGE_EVENT_STEADY := @(_EFL_UI_RANGE_EVENT_STEADY);
end;


end.
