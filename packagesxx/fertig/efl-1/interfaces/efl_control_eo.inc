{$IFDEF read_interface}


type
  PEfl_Control = ^TEfl_Control;
  TEfl_Control = TEo;
{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CONTROL_INTERFACE: PEfl_Class;

function efl_control_interface_get: PEfl_Class; cdecl; external libefl;
procedure efl_control_priority_set(obj: PEo; priority: longint); cdecl; external libefl;
function efl_control_priority_get(obj: PEo): longint; cdecl; external libefl;
procedure efl_control_suspend_set(obj: PEo; suspend: TEina_Bool); cdecl; external libefl;
function efl_control_suspend_get(obj: PEo): TEina_Bool; cdecl; external libefl;
{$endif}

// === Konventiert am: 20-5-25 14:43:36 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CONTROL_INTERFACE: PEfl_Class;
begin
  EFL_CONTROL_INTERFACE := efl_control_interface_get;
end;
{$endif}


{$ENDIF read_implementation}
