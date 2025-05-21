unit efl_core_env_eo;

interface

uses
  efl, fp_eo, fp_eina, fp_efl;

  {$IFDEF FPC}
  {$PACKRECORDS C}
  {$ENDIF}


type
  PEfl_Core_Env = ^TEfl_Core_Env;
  TEfl_Core_Env = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CORE_ENV_CLASS: PEfl_Class;

function efl_core_env_class_get: PEfl_Class; cdecl; external libecore;
procedure efl_core_env_set(obj: PEo; var_: pchar; value: pchar); cdecl; external libecore;
function efl_core_env_get(obj: PEo; var_: pchar): pchar; cdecl; external libecore;
procedure efl_core_env_unset(obj: PEo; var_: pchar); cdecl; external libecore;
procedure efl_core_env_clear(obj: PEo); cdecl; external libecore;
function efl_core_env_content_get(obj: PEo): PEina_Iterator; cdecl; external libecore;
{$endif}

// === Konventiert am: 21-5-25 15:36:00 ===


implementation


function EFL_CORE_ENV_CLASS: PEfl_Class;
begin
  EFL_CORE_ENV_CLASS := efl_core_env_class_get;
end;


end.
