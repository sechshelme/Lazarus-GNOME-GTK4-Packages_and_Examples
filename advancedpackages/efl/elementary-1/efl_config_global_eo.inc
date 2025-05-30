{$IFDEF read_interface}


type
  PEfl_Config_Global = ^TEfl_Config_Global;
  TEfl_Config_Global = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_CONFIG_GLOBAL_CLASS: PEfl_Class;

function efl_config_global_class_get: PEfl_Class; cdecl; external libelementary;
function efl_config_save(obj: PEo; profile: pchar): TEina_Bool; cdecl; external libelementary;
procedure efl_config_profile_set(obj: PEo; profile: pchar); cdecl; external libelementary;
function efl_config_profile_get(obj: PEo): pchar; cdecl; external libelementary;
function efl_config_profile_iterate(obj: PEo; hidden: TEina_Bool): PEina_Iterator; cdecl; external libelementary;
function efl_config_profile_exists(obj: PEo; profile: pchar): TEina_Bool; cdecl; external libelementary;
function efl_config_profile_dir_get(obj: PEo; profile: pchar; is_user: TEina_Bool): PEina_Stringshare; cdecl; external libelementary;
procedure efl_config_profile_derived_add(obj: PEo; profile: pchar; options: pchar); cdecl; external libelementary;
procedure efl_config_profile_derived_del(obj: PEo; profile: pchar); cdecl; external libelementary;
{$endif}

// === Konventiert am: 28-5-25 19:48:28 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


function EFL_CONFIG_GLOBAL_CLASS: PEfl_Class;
begin
  EFL_CONFIG_GLOBAL_CLASS := efl_config_global_class_get;
end;


{$ENDIF read_implementation}
