{$IFDEF read_interface}


type
  PEfl_Access_Action = ^TEfl_Access_Action;
  TEfl_Access_Action = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function EFL_ACCESS_ACTION_MIXIN: PEfl_Config;

function efl_access_action_mixin_get: PEfl_Class; cdecl; external libelementary;
function efl_access_action_name_get(obj: PEo; id: longint): pchar; cdecl; external libelementary;
function efl_access_action_localized_name_get(obj: PEo; id: longint): pchar; cdecl; external libelementary;
function efl_access_action_description_set(obj: PEo; id: longint; description: pchar): TEina_Bool; cdecl; external libelementary;
function efl_access_action_description_get(obj: PEo; id: longint): pchar; cdecl; external libelementary;
function efl_access_action_actions_get(obj: PEo): PEina_List; cdecl; external libelementary;
function efl_access_action_do(obj: PEo; id: longint): TEina_Bool; cdecl; external libelementary;
function efl_access_action_keybinding_get(obj: PEo; id: longint): pchar; cdecl; external libelementary;
{$endif}

// === Konventiert am: 30-5-25 17:16:29 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function EFL_ACCESS_ACTION_MIXIN: PEfl_Config;
begin
  EFL_ACCESS_ACTION_MIXIN := efl_access_action_mixin_get;
end;
{$endif}


{$ENDIF read_implementation}
