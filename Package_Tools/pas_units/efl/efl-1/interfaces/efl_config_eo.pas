unit efl_config_eo;

interface

uses
  efl, fp_eo, fp_eina;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Config = ^TEfl_Config;
  TEfl_Config = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CONFIG_INTERFACE: PEfl_Class;

function efl_config_interface_get: PEfl_Class; cdecl; external libefl;
function efl_config_set(obj: PEo; name: pchar; value: PEina_Value): TEina_Bool; cdecl; external libefl;
function efl_config_get(obj: PEo; name: pchar): PEina_Value; cdecl; external libefl;

var
  _EFL_CONFIG_EVENT_CONFIG_CHANGED: TEfl_Event_Description; cvar;external libefl;

function EFL_CONFIG_EVENT_CONFIG_CHANGED: PEfl_Event_Description;
{$endif}

// === Konventiert am: 18-5-25 19:12:06 ===


implementation


function EFL_CONFIG_INTERFACE: PEfl_Class;
begin
  EFL_CONFIG_INTERFACE := efl_config_interface_get;
end;

function EFL_CONFIG_EVENT_CONFIG_CHANGED: PEfl_Event_Description;
begin
  EFL_CONFIG_EVENT_CONFIG_CHANGED := @(_EFL_CONFIG_EVENT_CONFIG_CHANGED);
end;


end.
