{$IFDEF read_interface}


function gtk_source_utils_unescape_search_text(Text: Pgchar): Pgchar; cdecl; external libgtksourceview5;
function gtk_source_utils_escape_search_text(Text: Pgchar): Pgchar; cdecl; external libgtksourceview5;

// === Konventiert am: 29-3-25 17:38:08 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
