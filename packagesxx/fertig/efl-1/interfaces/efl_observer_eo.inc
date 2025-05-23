{$IFDEF read_interface}


type
  PEfl_Observer = ^TEfl_Observer;
  TEfl_Observer = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_OBSERVER_INTERFACE: PEfl_Class;

function efl_observer_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_observer_update(obj: PEo; obs: PEfl_Object; key: pchar; data: pointer); cdecl; external libefl;
{$endif}

// === Konventiert am: 20-5-25 15:00:00 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_OBSERVER_INTERFACE: PEfl_Class;
begin
  EFL_OBSERVER_INTERFACE := efl_observer_interface_get;
end;
{$endif}


{$ENDIF read_implementation}
