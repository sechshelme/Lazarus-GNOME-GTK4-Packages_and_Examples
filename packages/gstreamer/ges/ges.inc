{$IFDEF read_interface}

function ges_init: Tgboolean; cdecl; external libges;
function ges_init_check(argc: Plongint; argv: PPPchar; err: PPGError): Tgboolean; cdecl; external libges;
procedure ges_deinit; cdecl; external libges;
procedure ges_version(major: Pguint; minor: Pguint; micro: Pguint; nano: Pguint); cdecl; external libges;
function ges_init_get_option_group: PGOptionGroup; cdecl; external libges;
function ges_validate_register_action_types: Tgboolean; cdecl; external libges;
function ges_is_initialized: Tgboolean; cdecl; external libges;

// === Konventiert am: 12-12-24 15:04:24 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
