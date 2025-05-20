unit efl_ui_autorepeat_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Ui_Autorepeat = ^TEfl_Ui_Autorepeat;
  TEfl_Ui_Autorepeat = TEo;

function EFL_UI_AUTOREPEAT_INTERFACE: PEfl_Class;

function efl_ui_autorepeat_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_ui_autorepeat_initial_timeout_set(obj: PEo; t: double); cdecl; external libefl;
function efl_ui_autorepeat_initial_timeout_get(obj: PEo): double; cdecl; external libefl;
procedure efl_ui_autorepeat_gap_timeout_set(obj: PEo; t: double); cdecl; external libefl;
function efl_ui_autorepeat_gap_timeout_get(obj: PEo): double; cdecl; external libefl;
procedure efl_ui_autorepeat_enabled_set(obj: PEo; on: TEina_Bool); cdecl; external libefl;
function efl_ui_autorepeat_enabled_get(obj: PEo): TEina_Bool; cdecl; external libefl;

var
  _EFL_UI_AUTOREPEAT_EVENT_REPEATED: TEfl_Event_Description; cvar;external libefl;

function EFL_UI_AUTOREPEAT_EVENT_REPEATED: PEfl_Event_Description;


// === Konventiert am: 20-5-25 13:05:44 ===


implementation


function EFL_UI_AUTOREPEAT_INTERFACE: PEfl_Class;
begin
  EFL_UI_AUTOREPEAT_INTERFACE := efl_ui_autorepeat_interface_get;
end;

function EFL_UI_AUTOREPEAT_EVENT_REPEATED: PEfl_Event_Description;
begin
  EFL_UI_AUTOREPEAT_EVENT_REPEATED := @(_EFL_UI_AUTOREPEAT_EVENT_REPEATED);
end;


end.
