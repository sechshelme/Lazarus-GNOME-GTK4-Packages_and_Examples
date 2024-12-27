{$IFDEF read_interface}

function hb_glib_script_to_script(script: TGUnicodeScript): Thb_script_t; cdecl; external libharfbuzz;
function hb_glib_script_from_script(script: Thb_script_t): TGUnicodeScript; cdecl; external libharfbuzz;
function hb_glib_get_unicode_funcs: Phb_unicode_funcs_t; cdecl; external libharfbuzz;
function hb_glib_blob_create(gbytes: PGBytes): Phb_blob_t; cdecl; external libharfbuzz;

// === Konventiert am: 27-12-24 15:28:49 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
