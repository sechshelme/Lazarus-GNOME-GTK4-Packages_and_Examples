{$IFDEF read_interface}


type
  PEfl_Core_Proc_Env = ^TEfl_Core_Proc_Env;
  TEfl_Core_Proc_Env = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CORE_PROC_ENV_CLASS: PEfl_Class;

function efl_core_proc_env_class_get: PEfl_Class; cdecl; external libecore;
function efl_env_self: PEfl_Core_Env; cdecl; external libecore;
{$endif}

// === Konventiert am: 21-5-25 17:19:02 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CORE_PROC_ENV_CLASS: PEfl_Class;
begin
  EFL_CORE_PROC_ENV_CLASS := efl_core_proc_env_class_get;
end;
{$endif}


{$ENDIF read_implementation}
