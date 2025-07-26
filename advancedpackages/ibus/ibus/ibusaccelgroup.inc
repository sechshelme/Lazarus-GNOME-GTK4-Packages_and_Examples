{$IFDEF read_interface}



function ibus_accelerator_valid(keyval: Tguint; modifiers: TIBusModifierType): Tgboolean; cdecl; external libibus;
procedure ibus_accelerator_parse(accelerator: Pgchar; accelerator_key: Pguint; accelerator_mods: PIBusModifierType); cdecl; external libibus;
function ibus_accelerator_name(accelerator_key: Tguint; accelerator_mods: TIBusModifierType): Pgchar; cdecl; external libibus;

// === Konventiert am: 26-7-25 16:17:56 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
