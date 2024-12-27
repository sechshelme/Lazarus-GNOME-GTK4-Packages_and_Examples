{$IFDEF read_interface}

function hb_icu_script_to_script(script: TUScriptCode): Thb_script_t; cdecl; external libharfbuzzicu;
function hb_icu_script_from_script(script: Thb_script_t): TUScriptCode; cdecl; external libharfbuzzicu;
function hb_icu_get_unicode_funcs: Phb_unicode_funcs_t; cdecl; external libharfbuzzicu;

// === Konventiert am: 27-12-24 14:43:48 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
