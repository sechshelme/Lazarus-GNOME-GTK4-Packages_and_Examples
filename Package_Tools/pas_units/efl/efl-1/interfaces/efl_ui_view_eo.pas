unit efl_ui_view_eo;

interface

uses
  efl, fp_eo, fp_eina, efl_model_eo;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_View = ^TEfl_Ui_View;
  TEfl_Ui_View = TEo;

type
  TEfl_Model_Changed_Event = record
    current: PEfl_Model;
    previous: PEfl_Model;
  end;
  PEfl_Model_Changed_Event = ^TEfl_Model_Changed_Event;

function EFL_UI_VIEW_INTERFACE: PEfl_Class;

function efl_ui_view_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_ui_view_model_set(obj: PEo; model: PEfl_Model); cdecl; external libefl;
function efl_ui_view_model_get(obj: PEo): PEfl_Model; cdecl; external libefl;

var
  _EFL_UI_VIEW_EVENT_MODEL_CHANGED: TEfl_Event_Description; cvar;external libefl;

function EFL_UI_VIEW_EVENT_MODEL_CHANGED: PEfl_Event_Description;


// === Konventiert am: 20-5-25 14:44:02 ===


implementation


function EFL_UI_VIEW_INTERFACE: PEfl_Class;
begin
  EFL_UI_VIEW_INTERFACE := efl_ui_view_interface_get;
end;

function EFL_UI_VIEW_EVENT_MODEL_CHANGED: PEfl_Event_Description;
begin
  EFL_UI_VIEW_EVENT_MODEL_CHANGED := @(_EFL_UI_VIEW_EVENT_MODEL_CHANGED);
end;


end.
