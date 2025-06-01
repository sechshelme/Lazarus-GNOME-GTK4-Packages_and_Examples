{$IFDEF read_interface}


type
  PElm_Player_Part = ^TElm_Player_Part;
  TElm_Player_Part = TEo;

{$ifdef EFL_BETA_API_SUPPORT}
function ELM_PLAYER_PART_CLASS: PEfl_Class;

function elm_player_part_class_get: PEfl_Class; cdecl; external libelementary;
{$endif}

// === Konventiert am: 1-6-25 15:00:50 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}


{$ifdef EFL_BETA_API_SUPPORT}
function ELM_PLAYER_PART_CLASS: PEfl_Class;
begin
  ELM_PLAYER_PART_CLASS := elm_player_part_class_get;
end;
{$endif}


{$ENDIF read_implementation}
