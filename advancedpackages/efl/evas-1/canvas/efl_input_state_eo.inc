{$IFDEF read_interface}

type
  PEfl_Input_State = ^TEfl_Input_State;
  TEfl_Input_State = TEo;

function EFL_INPUT_STATE_INTERFACE: PEfl_Class;

function efl_input_state_interface_get: PEfl_Class; cdecl; external libevas;
{$ifdef EFL_BETA_API_SUPPORT}
function efl_input_modifier_enabled_get(obj: PEo; mod_: TEfl_Input_Modifier; seat: PEfl_Input_Device): TEina_Bool; cdecl; external libevas;
{$endif}
{$ifdef EFL_BETA_API_SUPPORT}
function efl_input_lock_enabled_get(obj: PEo; lock: TEfl_Input_Lock; seat: PEfl_Input_Device): TEina_Bool; cdecl; external libevas;
{$endif}

// === Konventiert am: 14-5-25 14:53:25 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_INPUT_STATE_INTERFACE: PEfl_Class;
begin
  EFL_INPUT_STATE_INTERFACE := efl_input_state_interface_get;
end;


{$ENDIF read_implementation}
