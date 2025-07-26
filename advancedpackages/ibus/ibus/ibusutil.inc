{$IFDEF read_interface}


function ibus_get_untranslated_language_name(_locale: Pgchar): Pgchar; cdecl; external libibus;
function ibus_get_language_name(_locale: Pgchar): Pgchar; cdecl; external libibus;

// === Konventiert am: 26-7-25 16:17:41 ===


{$ENDIF read_interface}


{$IFDEF read_implementation}



{$ENDIF read_implementation}
